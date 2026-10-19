//	Butt~ - a dirty filter based on a basic biquad...
//	by Pierre Alexandre Tremblay
//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website
//	v.3 - ported to java, with the optimisations from the gen~ version (Peter and Graham), and from the Cycling74 examples
//	v.3.1 - new RNG
//	v.3.1.1 - added allpass

import com.cycling74.max.*;
import com.cycling74.msp.*;
import java.lang.reflect.*;

public class butt extends MSPObject implements MSPPerformable
{
	private static final double temp_ln=0.34657359027997265471;
    private static final long jflone = 0x3f800000;
    private static final long jflmsk = 0x007fffff;

	// instances variables
	private double piDsr;			// variable : 2¹/sr
	private double b_in1;			// variable : filter buffer in1
	private double b_in2;			// variable : filter buffer in2
	private double b_ou1;			// variable : filter buffer ou1
	private double b_ou2;			// variable : filter buffer ou2
	private double b0a0;			// variable : filter coeff b0a0
	private double b1a0;			// variable : filter coeff b1a0
	private double b2a0;			// variable : filter coeff b2a0
	private double a1a0;			// variable : filter coeff a1a0
	private double a2a0;			// variable : filter coeff a2a0

	public double freq;			// variable : filter frequency
	public double largeur;		// variable : filter bandwidth
	public double dirt;			// variable : dirty factor * kOneOverMaxULong
	public int type;			// variable : filter type

	// shared random seed
	long semance;									// scalar PRNG seed
	
	//perform Methods
	private Method _butt_control = null;
	private Method _butt_signal = null;

	//assist messages
	private static final String[] INLET_ASSIST = 
		new String[]{"(signal) audio in","(float) filter frequency in Hz","(float) filter bandwidth in octave","(float) filter dirtiness (0...1...at your own risk!)"};
	private static final String[] OUTLET_ASSIST = 
		new String[]{"(signal) filtered output"};

	//overloaded constructors
	public butt()
	{
		this(2,666f,0.666,0f);  
	}

	public butt(double freq)
	{
		this(2,freq,0.666,0f);  
	}

	public butt(String type, double freq)
	{
		this(typeToInt(type),freq,0.666,0f);	
	}

	public butt(String type, double freq, double largeur)
	{
		this(typeToInt(type),freq,largeur,0f);	
	}	
	
	public butt(String type, double freq, double largeur, double dirt)
	{
		this(typeToInt(type),freq,largeur,dirt);	
	}

	public butt(int type, double freq, double largeur, double dirt)
	{
		declareInlets(new int[]{SIGNAL,SIGNAL,SIGNAL,SIGNAL});
		declareOutlets(new int[]{SIGNAL});

		setInletAssist(INLET_ASSIST);
		setOutletAssist(OUTLET_ASSIST);

		declareAttribute("type");
		declareAttribute("dirt");
		declareAttribute("largeur");
		declareAttribute("freq");
		
		if(type < 0 || type > 4)
		{
			type = 2;	
			post("(mxj butt) unknown type "+type+"defaulting to BANDPASS");	
		}	

		this.type = type;
		this.dirt = dirt;
		this.largeur = largeur;
		this.freq = freq;
		
		semance = System.currentTimeMillis();
		_butt_control = getPerformMethod("butt_control");
		_butt_signal = getPerformMethod("butt_signal");
		
		butt_coeff();
		butt_clear();
	}


	public void inlet(float f)
	{
		switch(getInlet())
		{
			case 1://freq
				if (f <= 0)
					post("mxj~ butt: frequency should be positive");
				else
					freq = (double)f;
				break;
			case 2://bw
				if (f < 0)
					post("mxj~ butt: bandwidth should be positive");
				else
					largeur = (double)f;
				break;
			case 3://dirt
				if (f < 0)
					post("mxj~ butt: dirtiness should be positive");
				else
					dirt = (double)f;
				break;
			default:
				return;
		}
		butt_coeff();
	}

	public Method dsp(MSPSignal[] ins, MSPSignal[] outs)
	{
		piDsr = (2. * Math.PI) / ins[0].sr;
		butt_coeff();	
	
		if(ins[1].connected || ins[2].connected || ins[3].connected)			
			return _butt_signal;//if signal input for cf,bw or dirt use signal perform routine
		else
			return _butt_control;//use control perform routine
	}

	public void butt_control(MSPSignal[] ins, MSPSignal[] outs)
	{
		int i;
		float[] entree = ins[0].vec;
		float[] sortie = outs[0].vec;
		double yn;
	
		for(i = 0; i < entree.length;i++)
		{
			yn = b0a0*entree[i] + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;
			sortie[i]= (float)yn;
			b_in2 = b_in1 * (1. + (butt_noise() * dirt)); // adding some dirty to the buffers!
			b_in1 = entree[i] * (1. + (butt_noise() * dirt));
			b_ou2 = b_ou1 * (1. + (butt_noise() * dirt));
			b_ou1 = yn * (1. + (butt_noise() * dirt));
		}	
	}

	public void butt_signal(MSPSignal[] ins, MSPSignal[] outs)
	{
		int i;
		float[] entree = ins[0].vec;
		float[] sortie = outs[0].vec;
		double yn;
	
		for(i = 0; i < entree.length;i++)
		{
			yn = b0a0*entree[i] + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;
			sortie[i]= (float)yn;
			b_in2 = b_in1 * (1. + (butt_noise() * dirt)); // adding some dirty to the buffers!
			b_in1 = entree[i] * (1. + (butt_noise() * dirt));
			b_ou2 = b_ou1 * (1. + (butt_noise() * dirt));
			b_ou1 = yn * (1. + (butt_noise() * dirt));
		}	
	}

	// messages

	public void type(String t)
	{
		type = typeToInt(t);
		butt_coeff();
		butt_clear();
	}

	public void clear()
	{
		butt_clear();
	}

	//MSPPerformable Interface
	public void perform(MSPSignal[] ins, MSPSignal[] outs)
	{
		butt_control(ins,outs);
	}

	public void dspsetup(MSPSignal[] ins, MSPSignal[] outs)
	{	
		piDsr = (2. * Math.PI) / ins[0].sr;
		butt_coeff();
	}
	//End MSPPerformable Interface

	//Util functions
	
	private static int typeToInt(String type)
	{	
		int itype;

		String t = type.toUpperCase();
		if(t.equals("LOWPASS"))
			itype = 0;
		else if(t.equals("HIGHPASS"))
			itype = 1;
		else if(t.equals("BANDPASS"))
			itype = 2;
		else if(t.equals("BANDSTOP"))
			itype = 3;
		else if(t.equals("ALLPASS"))
			itype = 4;
		else
		{
			post("(mxj butt) unknown filter type: "+type+". Defaulting to BANDPASS.");
			itype = 2;
		} 
		return itype;	
	}

	private void butt_coeff()											// renders the coefficients on demand
	{
		double alpha, omega, tsin, tcos, a0, a1, a2, b0, b1, b2;

		a0 = 1f;
		a1 = a2 = b0 = b1 = b2 = 0;
		omega = piDsr * freq;

		tsin = Math.sin(omega);
		tcos = Math.cos(omega);
	
		alpha = tsin * Math.sinh(temp_ln * largeur * omega / tsin);		// bandwidth
	
		// alpha = tsin / (2.0 * largeur);							// q potential...
	
		switch (type) {
			case 0:							// lowpass
				b0=(1.0-tcos)/2.0;
				b1=1.0-tcos;
				b2=(1.0-tcos)/2.0;
				a0=1.0+alpha;
				a1=-2.0*tcos;
				a2=1.0-alpha;
				break;
			case 1:							// hipass
				b0 = (1.0 + tcos) /2.0;
				b1 = -(1.0 + tcos);
				b2 = (1.0 + tcos) /2.0;
				a0 = 1.0 + alpha;
				a1 = -2.0 * tcos;
				a2 = 1.0 - alpha;
				break;
			case 2:							// bandpass
				b0=alpha;
				b1=0.0;
				b2=-alpha;
				a0=1.0+alpha;
				a1=-2.0*tcos;
				a2=1.0-alpha;
				break;
			case 3:							// band stop
				b0 = 1.0;
				b1 = -2.0 * tcos;
				b2 = 1.0;
				a0 = 1.0 + alpha;
				a1 = -2.0 * tcos;
				a2 = 1.0 - alpha;
				break;
			case 4:							// allpass
                b0=1.0-alpha;
                b1=-2.0*tcos;
                b2=1.0+alpha;
                a0=1.0+alpha; 
                a1=-2.0*tcos; 
                a2=1.0-alpha;
				break;
		}
	
		a0 = 1f/a0;
		b0a0 = b0 * a0;													// write the rendered values
		b1a0 = b1 * a0;
		b2a0 = b2 * a0;
		a1a0 = a1 * a0;
		a2a0 = a2 * a0;		
	}

	private void butt_clear()
	{
		b_in1 = 0f;											
		b_in2 = 0f;
		b_ou1 = 0f;
		b_ou2 = 0f;
	}
	
	private float butt_noise()
	{
		int i;
		long itemp;
		
		semance = 1664525L * semance + 1013904223L;
		
		itemp = jflone  | (jflmsk & semance);
		
		return(Float.intBitsToFloat((int)itemp) - (float)2.0);
	}
}









