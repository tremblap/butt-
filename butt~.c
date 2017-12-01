//    Butt~ - a dirty filter based on a basic biquad...
//    by Pierre Alexandre Tremblay
//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website
//  v3 - remove altivec, change RGN and inline it, typecasted all the variables with bit depths certainty, add the optimisation from the JAVA and gen~. This was made possible within the FluCoMa project, funded by the ERC

static uint32_t jflone = 0x3f800000;
static uint32_t jflmsk = 0x007fffff;
double const temp_ln=0.34657359027997265471;

#include "math.h"
#include "ext.h"
#include "z_dsp.h"

// struct to represent the object's state
typedef struct butt {
    t_pxobject b_ob;            // MSP object structure
    t_double b_freq;            // non-local variable : filter frequency
    t_double b_largeur;         // non-local variable : filter bandwidth
    t_float b_sale;             // non-local variable : dirty factor
    short b_type;               // non-local variable : filter type
    t_double b_piDsr;           // non-local variable : 2π/sr
    t_double b_in1;             // non-local variable : filter buffer in1
    t_double b_in2;             // non-local variable : filter buffer in2
    t_double b_ou1;             // non-local variable : filter buffer ou1
    t_double b_ou2;             // non-local variable : filter buffer ou2
    t_double b_b0a0;            // non-local variable : filter coeff b0a0
    t_double b_b1a0;            // non-local variable : filter coeff b1a0
    t_double b_b2a0;            // non-local variable : filter coeff b2a0
    t_double b_a1a0;            // non-local variable : filter coeff a1a0
    t_double b_a2a0;            // non-local variable : filter coeff a2a0
} t_butt;


// method prototypes
void *butt_creation(t_symbol *s, long argc, t_atom *argv);      // creation call
void *butt_liberation(t_butt *x);                                // free call

void butt_assist(t_butt *x, void *b, long msg, long arg, char *contenu); // assist strings
void butt_freq(t_butt *x, double f);                            // filter freq
void butt_q(t_butt *x, double q);                                // filter bandwidth
void butt_sale(t_butt *x, double s);                            // filter dirtiness
void butt_type(t_butt *x, t_symbol *s);                            // filter type
void butt_clear(t_butt *x);                                        // clear buffers

void butt_dsp(t_butt *x, t_signal **sp);                        // dsp call
t_int *butt_perf_const(t_int *w);                                // scalar dsp perf routine
void butt_dsp64(t_butt *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void butt_perf_const64(t_butt *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

void butt_coeff(t_butt *x);                                        // coeff rendering
inline t_float butt_noise();
static uint32_t semance;                                            // scalar PRNG seed

// global class pointer variable
static t_class *butt_class = NULL;


//***********************************************************************************************

int C74_EXPORT main()
{
    // create the object in the Max world
	t_class *c = class_new("butt~", (method)butt_creation, (method)butt_liberation, (long)sizeof(t_butt), 0L, A_GIMME, 0);

    // definies my object inputs and behaviour
	class_addmethod(c, (method)butt_type, "type", A_SYM, 0);        // type message
    class_addmethod(c, (method)butt_clear, "clear", 0);             // clear message
	class_addmethod(c, (method)butt_assist,	"assist", A_CANT, 0);   // assist message
 
    class_addmethod(c, (method)butt_dsp, "dsp", A_CANT, 0);         // dsp 32bit
    class_addmethod(c, (method)butt_dsp64, "dsp64", A_CANT, 0);     // dsp 64 bit
    class_addmethod(c, (method)butt_sale, "ft1", A_FLOAT, 0);       // fourth inlet is float (dirtiness)
    class_addmethod(c, (method)butt_q, "ft2", A_FLOAT, 0);          // third inlet is float (bandwidth)
    class_addmethod(c, (method)butt_freq, "ft3", A_FLOAT, 0);       // second inlet is float (freq)
 
	class_dspinit(c);                                               // initialise the dsp class
	class_register(CLASS_BOX, c);
	butt_class = c;
    
    semance = (unsigned int)butt_creation;                          // set the scalar seed
}


void *butt_creation(t_symbol *s, long argc, t_atom *argv)
{
    t_butt *x = (t_butt *)object_alloc(butt_class);                 // define an object pointer
    
    dsp_setup((t_pxobject *)x, 1);                            // create an audio in proxy
    floatin((t_object *)x, 1);                                // create all 3 float inlets
    floatin((t_object *)x, 2);
    floatin((t_object *)x, 3);
    outlet_new((t_pxobject *)x, "signal");                    // create an audio outlet

    
    // check and assign the arguments
    if (argc == 0)
    {
        x->b_type = 2;
        x->b_freq = 666.0;
        x->b_largeur = 0.666;
        butt_sale(x, 0.);
    }
    else
    {
        // assigne the initial filter type
        
        switch (argv[0].a_type)
        {
            case A_LONG:
                post("butt~: wrong type for argument #1");
                x->b_type = 2;
                break;
            case A_FLOAT:
                post("butt~: wrong type for argument #1");
                x->b_type = 2;
                break;
            case A_SYM:
                if (argv[0].a_w.w_sym == gensym("lowpass"))
                    x->b_type = 0;
                else if (argv[0].a_w.w_sym == gensym("highpass"))
                    x->b_type = 1;
                else if (argv[0].a_w.w_sym == gensym("bandpass"))
                    x->b_type = 2;
                else if (argv[0].a_w.w_sym == gensym("bandstop"))
                    x->b_type = 3;
                else
                {
                    post("butt~: unknown filter type, set to bandpass");
                    x->b_type = 2;
                }
                break;
        }
        
        if (argc == 1)
        {
            x->b_freq = 666.0;
            x->b_largeur = 0.666;
            butt_sale(x, 0.);
        }
        else
        {
            
            // assign the initial frequency
            
            switch (argv[1].a_type)
            {
                case A_LONG:
                    x->b_freq = (double)argv[1].a_w.w_long;
                    break;
                case A_FLOAT:
                    x->b_freq = (double)argv[1].a_w.w_float;
                    break;
                case A_SYM:
                    post("butt~: wrong type for argument #2");
                    x->b_freq = 666.0;
                    break;
            }
            
            if (argc == 2)
            {
                x->b_largeur = 0.666;
                butt_sale(x, 0.);
            }
            else
            {
                
                // assign the initial bandwidth
                
                switch (argv[2].a_type)
                {
                    case A_LONG:
                        x->b_largeur = (double)argv[2].a_w.w_long;
                        break;
                    case A_FLOAT:
                        x->b_largeur = (double)argv[2].a_w.w_float;
                        break;
                    case A_SYM:
                        post("butt~: wrong type for argument #3");
                        x->b_largeur = 0.666;
                        break;
                }
                
                if (argc == 3)
                    butt_sale(x, 0.);
                else
                {
                    // assign the initial dirtiness
                    
                    switch (argv[3].a_type)
                    {
                        case A_LONG:
                            butt_sale(x, (double)argv[3].a_w.w_long);
                            break;
                        case A_FLOAT:
                            butt_sale(x, (double)argv[3].a_w.w_float);
                            break;
                        case A_SYM:
                            post("butt~: wrong type for argument #4");
                            butt_sale(x, 0.);
                            break;
                    }
                    
                    if (argc > 4)
                        post("butt~: fifth argument and over will be ignored.");
                }
            }
        }
    }
    
    return (x);        // return the new object pointer

}


// NOT CALLED!, we use dsp_free for a generic free function
void *butt_liberation(t_butt *x)
{
    dsp_free((t_pxobject *)x);
}


void butt_assist(t_butt *x, void *b, long msg, long arg, char *contenu)
{
    if (msg == ASSIST_OUTLET)
        sprintf(contenu,"(signal) filtered output");
    else {
        switch (arg) {
            case 0:
                sprintf(contenu,"(signal) audio in");
                break;
            case 1:
                sprintf(contenu,"(float) filter frequency in Hz");
                break;
            case 2:
                sprintf(contenu,"(float) filter bandwidth in octave");
                break;
            case 3:
                sprintf(contenu,"(float) filter dirtiness (0...1...at your own risk!)");
                break;
        }
    }
}

void butt_type(t_butt *x, t_symbol *s)
{
    if (s == gensym("lowpass"))
    {
        x->b_type = 0;
        butt_coeff(x);
    }
    else if (s == gensym("highpass"))
    {
        x->b_type = 1;
        butt_coeff(x);
    }
    else if (s == gensym("bandpass"))
    {
        x->b_type = 2;
        butt_coeff(x);
    }
    else if (s == gensym("bandstop"))
    {
        x->b_type = 3;
        butt_coeff(x);
    }
    else if (s == gensym("allpass"))
    {
        x->b_type = 4;
        butt_coeff(x);
    }
    else
        post("butt~: unknown filter type");
}

void butt_freq(t_butt *x, double f)
{
    if (f <= 0)
        post("butt~: frequency should be positive");
    else
    {
        x->b_freq = (double)f;
        butt_coeff(x);
    }
}


void butt_q(t_butt *x, double q)
{
    if (q < 0)
        post("butt~: bandwidth should be positive");
    else
    {
        x->b_largeur = (double)q;
        butt_coeff(x);
    }
}

void butt_sale(t_butt *x, double s)
{
    if (s < 0.)
    {
        post("butt~: dirtiness should be positive");
        butt_sale(x, 0.);
    } else
    {
        x->b_sale = (t_float)s;
    }
}

void butt_coeff(t_butt *x)                                            // renders the coefficients on demand
{
    double alpha, omega, tsin, tcos, a0, a1, a2, b0, b1, b2;
    
    omega = (x->b_piDsr) * (x->b_freq);
    
    tsin = sin(omega);
    tcos = cos(omega);
    
    alpha = tsin * sinh(temp_ln * (x->b_largeur) * omega / tsin);        // bandwidth
    
    // alpha = tsin / (2.0 * (x->b_largeur));                            // q potential...
    
    switch (x->b_type) {
        case 0:                            // lowpass
            b0=(1.0-tcos)/2.0;
            b1=1.0-tcos;
            b2=(1.0-tcos)/2.0;
            a0=1.0+alpha;
            a1=-2.0*tcos;
            a2=1.0-alpha;
            break;
        case 1:                            // hipass
            b0 = (1.0 + tcos) /2.0;
            b1 = -(1.0 + tcos);
            b2 = (1.0 + tcos) /2.0;
            a0 = 1.0 + alpha;
            a1 = -2.0 * tcos;
            a2 = 1.0 - alpha;
            break;
        case 2:                            // bandpass
            b0=alpha;
            b1=0.0;
            b2=-alpha;
            a0=1.0+alpha;
            a1=-2.0*tcos;
            a2=1.0-alpha;
            break;
        case 3:                            // band stop
            b0 = 1.0;
            b1 = -2.0 * tcos;
            b2 = 1.0;
            a0 = 1.0 + alpha;
            a1 = -2.0 * tcos;
            a2 = 1.0 - alpha;
            break;
        case 4:                            // allpass
            b0=1.0-alpha;
            b1=-2.0*tcos;
            b2=1.0+alpha;
            a0=1.0+alpha;
            a1=-2.0*tcos;
            a2=1.0-alpha;
            break;
    }
    
    a0 = 1.0/a0;
    x->b_b0a0 = b0 * a0;                                                    // write the rendered values
    x->b_b1a0 = b1 * a0;
    x->b_b2a0 = b2 * a0;
    x->b_a1a0 = a1 * a0;
    x->b_a2a0 = a2 * a0;
}

void butt_clear(t_butt *x)
{
    x->b_in1 = 0.;
    x->b_in2 = 0.;
    x->b_ou1 = 0.;
    x->b_ou2 = 0.;
}


// registers a function for the 32 bit signal chain in Max
void butt_dsp(t_butt *x, t_signal **sp)
{
    x->b_piDsr = (2. * PI) / sp[0]->s_sr;                // sets the  2 π / sampling_rate constant for this instantiation of the dsp chain
    butt_coeff(x);                                        // renders the coefficients
    butt_clear(x);                                        // clears the audio buffers

    dsp_add(butt_perf_const, 4, x, sp[0]->s_vec, sp[1]->s_vec, sp[0]->s_n);
    post("dsp32");
}

// registers a function for the signal chain in Max
void butt_dsp64(t_butt *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
    x->b_piDsr = (2. * PI) / samplerate;                // sets the  2 π / sampling_rate constant for this instantiation of the dsp chain
    butt_coeff(x);                                        // renders the coefficients
    butt_clear(x);                                        // clears the audio buffers

    object_method(dsp64, gensym("dsp_add64"), x, butt_perf_const64, 0, NULL);
    post("dsp64");
}

// perform 32bit
t_int *butt_perf_const(t_int *w)
{
    // transfer values from the object to local variables
    t_butt *x = (t_butt *)(w[1]);        // object pointer
    
    t_float *entree = (float *)(w[2]);    // input pointer
    t_float *sortie = (float *)(w[3]);    // output pointer
    long n = w[4];                        // vector size
    
    if (x->b_ob.z_disabled)                // if the object is muted, bypass everything!
        goto out;
    
    t_float sale = x->b_sale;            // dirtiness
    double in1 = x->b_in1;                // filter buffer in1 and so on...
    double in2 = x->b_in2;
    double ou1 = x->b_ou1;
    double ou2 = x->b_ou2;
    double b0a0 = x->b_b0a0;
    double b1a0 = x->b_b1a0;
    double b2a0 = x->b_b2a0;
    double a1a0 = x->b_a1a0;
    double a2a0 = x->b_a2a0;
    
    double in0, yn;
    
    // going through the samples
    
    while (n--)
    {
        in0 = *entree++;
        yn = b0a0*in0 + b1a0*in1 + b2a0*in2 - a1a0*ou1 - a2a0*ou2;
        *sortie++ = yn;
        in2 = in1 * (1. + (butt_noise() * sale)); // adding some dirty to the buffers!
        in1 = in0 * (1. + (butt_noise() * sale));
        ou2 = ou1 * (1. + (butt_noise() * sale));
        ou1 = yn * (1. + (butt_noise() * sale));
    }
    
    x->b_in1 = in1;                // write back in1 and so on...
    x->b_in2 = in2;
    x->b_ou1 = ou1;
    x->b_ou2 = ou2;
    
out:
    return (w + 5);                // return the next pointer
}

// perform 64bit
void butt_perf_const64(t_butt *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
    t_double *entree = ins[0];    // input pointer
    t_double *sortie = outs[0];    // output pointer
    int n = sampleframes;                        // vector size
    
    t_float sale = x->b_sale;            // dirtiness
    double in1 = x->b_in1;                // filter buffer in1 and so on...
    double in2 = x->b_in2;
    double ou1 = x->b_ou1;
    double ou2 = x->b_ou2;
    double b0a0 = x->b_b0a0;
    double b1a0 = x->b_b1a0;
    double b2a0 = x->b_b2a0;
    double a1a0 = x->b_a1a0;
    double a2a0 = x->b_a2a0;
    
    double in0, yn;
    
    // going through the samples
    
    while (n--)
    {
        in0 = *entree++;
        yn = b0a0*in0 + b1a0*in1 + b2a0*in2 - a1a0*ou1 - a2a0*ou2;
        *sortie++ = yn;
        in2 = in1 * (1. + (butt_noise() * sale)); // adding some dirty to the buffers!
        in1 = in0 * (1. + (butt_noise() * sale));
        ou2 = ou1 * (1. + (butt_noise() * sale));
        ou1 = yn * (1. + (butt_noise() * sale));
    }
    
    x->b_in1 = in1;                // write back in1 and so on...
    x->b_in2 = in2;
    x->b_ou1 = ou1;
    x->b_ou2 = ou2;
}

inline t_float butt_noise()
{
    union  {
        uint32_t thelong;
        t_float thefloat;
    } itemp;
    
    semance = 1664525L * semance + 1013904223L;
    
    itemp.thelong = jflone | (jflmsk & semance);
    
    return(itemp.thefloat - 2);
}

