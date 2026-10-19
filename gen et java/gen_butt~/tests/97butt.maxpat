{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 10,
			"architecture" : "x86"
		}
,
		"rect" : [ 56.0, 264.0, 897.0, 669.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 333.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 333.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 333.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 333.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 333.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 333.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 302.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 302.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 302.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 302.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 302.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 302.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 262.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 262.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 262.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 262.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 262.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 262.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 231.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 231.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 231.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 231.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 231.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 231.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 188.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 188.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 188.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 188.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 188.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 188.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 157.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 157.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 157.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 157.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 157.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 157.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 727.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 122.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 689.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 122.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 651.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 122.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 613.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 122.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 575.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 122.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 537.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 122.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 731.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 730.0, 91.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 693.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 692.0, 91.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 655.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 654.0, 91.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 617.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 616.0, 91.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 579.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 578.0, 91.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 541.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 540.0, 91.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 500.0, 342.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 462.0, 342.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 424.0, 342.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 386.0, 342.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 348.0, 342.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 337.0, 38.0, 20.0 ],
					"presentation_rect" : [ 310.0, 342.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 500.0, 311.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 462.0, 311.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 424.0, 311.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 386.0, 311.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 348.0, 311.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 306.0, 38.0, 20.0 ],
					"presentation_rect" : [ 310.0, 311.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 500.0, 271.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 462.0, 271.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 424.0, 271.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 386.0, 271.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 348.0, 271.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 266.0, 38.0, 20.0 ],
					"presentation_rect" : [ 310.0, 271.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 500.0, 240.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 462.0, 240.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 424.0, 240.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 386.0, 240.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 348.0, 240.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 235.0, 38.0, 20.0 ],
					"presentation_rect" : [ 310.0, 240.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 494.0, 197.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 456.0, 197.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 418.0, 197.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 380.0, 197.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 342.0, 197.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 192.0, 38.0, 20.0 ],
					"presentation_rect" : [ 304.0, 197.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 494.0, 166.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 456.0, 166.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 418.0, 166.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 380.0, 166.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 342.0, 166.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 161.0, 38.0, 20.0 ],
					"presentation_rect" : [ 304.0, 166.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 497.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 497.0, 126.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 459.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 459.0, 126.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 421.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 421.0, 126.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 383.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 383.0, 126.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 345.0, 126.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 307.0, 126.0, 38.0, 20.0 ],
					"presentation_rect" : [ 307.0, 126.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 501.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 492.0, 95.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 463.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 454.0, 95.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 425.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 416.0, 95.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 387.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 380.0, 92.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 349.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 349.0, 95.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 311.0, 94.0, 38.0, 20.0 ],
					"presentation_rect" : [ 307.0, 95.0, 0.0, 0.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 34.0, 78.0, 1011.0, 1084.0 ],
						"bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield, thanks to the hints and discussions with Peter Castine, Alex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~\n\n\n// the methods\n\nParam freq(666,min=1,max=20000);\nParam bw(1,min=0.01,max=100);\nParam dirt(0,min=0,max=1);\nParam type(3, min=1, max=4);\n\n// the delays\n\nHistory b_in1, b_in2, b_ou1, b_ou2;\nb_in0 = in1;\r\n\n// constants\n\ntemp_ln=0.34657359027997265471;\nb_piDsr=(2. * pi) / samplerate;\n\r\nb0 = 0;\nb1 = 0;\nb2 = 0;\na0 = 0;\na1 = 0;\na2 = 0;\n\n// process bandwidth\nomega = (b_piDsr) * (freq);\ntsin = sin(omega);\ntcos = cos(omega);\nalpha = tsin * sinh(temp_ln * (bw) * omega / tsin);\t\t// bandwidth\n\n// then process coefficients\nif(type == 1) {\n\tb0=(1.0-tcos)/2.0;\n\tb1=1.0-tcos;\n\tb2=(1.0-tcos)/2.0;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if(type ==  2) {\n\tb0 = (1.0 + tcos) /2.0;\n\tb1 = -(1.0 + tcos);\n\tb2 = (1.0 + tcos) /2.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n\ta2 = 1.0 - alpha;\n}\nelse if (type == 3) {\n\tb0=alpha;\n\tb1=0.0;\n\tb2=-alpha;\n\ta0=1.0+alpha;\n\ta1=-2.0*tcos;\n\ta2=1.0-alpha;\n}\nelse if (type == 4) {\n    b0 = 1.0;\n\tb1 = -2.0 * tcos;\n    b2 = 1.0;\n\ta0 = 1.0 + alpha;\n\ta1 = -2.0 * tcos;\n    a2 = 1.0 - alpha;\n}\n\t\t\t\nb0a0 = b0/a0;\t\t\t\t\t\t\t\t\t\t\t\t\t\nb1a0 = b1/a0;\nb2a0 = b2/a0;\na1a0 = a1/a0;\na2a0 = a2/a0;\t\t\n\n\nout1 = b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n\n\nb_in2 = b_in1 * (1. - (dirt * noise())); // adding some dirty to the buffers!\nb_in1 = b_in0 * (1. - (dirt * noise()));\nb_ou2 = b_ou1 * (1. - (dirt * noise()));\nb_ou1 = out1 * (1. - (dirt * noise()));",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 42.0, 834.0, 1003.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 30.0, 20.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 1052.0, 37.0, 20.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 187.0, 465.0, 38.0, 20.0 ],
					"text" : "gen~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-7",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 242.0, 478.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"local" : 1,
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 542.0, 45.0, 45.0 ],
					"varname" : "autohelp_dac"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 187.0, 506.0, 74.0, 19.0 ],
					"text" : "*~ 0.2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-5",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 146.0, 548.0, 38.0, 32.0 ],
					"text" : "start audio",
					"varname" : "autohelp_dac_text"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.392157, 0.792157, 0.117647, 1.0 ],
					"id" : "obj-6",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 537.0, 100.0, 55.0 ],
					"varname" : "startwinwdow_panel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 187.0, 44.0, 60.0, 19.0 ],
					"text" : "saw~ 110"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 196.5, 531.0, 222.5, 531.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "vtimes~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
