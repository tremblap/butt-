{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 2,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 38.0, 78.0, 516.0, 345.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.5, 191.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "reset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 344.5, 128.0, 73.0, 22.0 ],
					"style" : "default",
					"text" : "prepend bw"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 128.0, 79.0, 22.0 ],
					"style" : "default",
					"text" : "prepend freq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 344.5, 216.0, 75.0, 22.0 ],
					"style" : "default",
					"text" : "prepend dirt"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 481.5, 45.0, 20.0, 17.0 ],
					"style" : "",
					"text" : "pa"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 3,
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 12.5, 12.0, 143.0, 27.0 ],
					"style" : "",
					"text" : "butt~ in gen~",
					"textcolor" : [ 0.101961, 0.031373, 0.223529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 12.5, 40.0, 275.0, 19.0 ],
					"style" : "",
					"text" : "a port in gen~ of butt~, a dirty filter!"
				}

			}
, 			{
				"box" : 				{
					"angle" : 0.0,
					"bgcolor" : [ 0.414723, 0.45767, 0.577276, 1.0 ],
					"id" : "obj-25",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 7.5, 9.0, 494.0, 53.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"format" : 6,
					"id" : "obj-10",
					"maxclass" : "flonum",
					"maximum" : 100.0,
					"minimum" : 0.001,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 344.5, 106.0, 61.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "number[1]",
							"parameter_shortname" : "number[1]",
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.666 ],
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"triscale" : 0.9,
					"varname" : "number[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 106.0, 106.0, 48.0, 22.0 ],
					"style" : "default",
					"text" : "noise~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 38.0, 78.0, 839.0, 688.0 ],
						"editing_bgcolor" : [ 0.9, 0.9, 0.9, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"code" : "//\tButt~ - a dirty filter based on a basic biquad...\n//\tby Pierre Alexandre Tremblay\n//  v.2 - optimised at the University of Huddersfield,\r\n//\tthanks to the hints and discussions with Peter Castine, \r\n//\tAlex Harker, Kit Clayton and Apple Dev Website\n//  v.3 in gen~ (by PA but with tiny mods by pete)\n\r\n//  two-pole, two-zero biquad,\n// 'direct form 2' with added tremblay dirt (d0)\n//  y(n) = a0w(n) + a1w(n - 1) + a2w(n - 2), where w(n) = x(n) - b1w(n - 1) - b2w(n - 2)\ndirtyBiquadDf2(x0, a0, a1, a2, b1, b2, d0)\n{\n\tHistory x1(0), x2(0);\n\n\tb1w = x1 * b1;\n\tb2w = x2 * b2;\n\tw0 = x0 - b1w - b2w;\n\n\ta0w = w0 * a0;\n\ta1w = x1 * a1;\n\ta2w = x2 * a2;\n\ty0 = a0w + a1w + a2w;\n\n\tx2 = x1 * (1 - (d0 * noise()));\t// adding some dirty to the buffers!\n\tx1 = w0 * (1 - (d0 * noise()));\t// ...\n\n\treturn y0;\n}\r\n\n// the methods\n\nParam\tfreq(666, min=1, max=20000);\nParam\tbw(0.666, min=0.01, max=100);\nParam\tdirt(0, min=0, max=1);\t// 0.333 ??\nParam\ttype(3, min=1, max=4);\n\n// the delays\n\n//History\tb_in1(0), b_in2(0), b_ou1(0), b_ou2(0);\n//b_in0\t= in1;\r\n\n// constants\n\ntemp_ln\t= 0.34657359027997265471;\nb_piDsr\t= twopi / samplerate;\r\n\r\n// setup\n\r\ntyp\t\t= int(type);\r\ndrt\t\t= (dirt * dirt) * 0.333;\t// pete says: i prefer some scaling on my dirt ;) sorry this is cheeky ;)\r\n//drt\t= dirt * dirt;\t\t\t\t// ...\r\nb0, b1, b2, a0, a1, a2\t= 0;\n\n// process bandwidth\r\n\nomega\t= b_piDsr * freq;\ntsin\t= sin(omega);\t\t\t\t// pete says: you could approximate 'sin()' & 'cos()' for more efficiency\ntcos\t= cos(omega);\nalpha\t= tsin * sinh(temp_ln * bw * omega / tsin);\t\t// bandwidth\n\n// then process coefficients (at param rate)\r\n\nif (typ == 1) {\n\tb0 =  (1 - tcos) / 2;\n\tb1 =  1 - tcos;\n\tb2 =  b0;\n\ta0 =  1 + alpha;\n\ta1 = -2 * tcos;\n\ta2 =  1 - alpha;\n} else if (typ ==  2) {\r\n\tbb =  1 + tcos;\n\tb0 =  bb / 2;\n\tb1 = -bb;\n\tb2 =  b0;\n\ta0 =  1 + alpha;\n\ta1 = -2 * tcos;\n\ta2 =  1 - alpha;\n} else if (typ == 3) {\n\tb0 =  alpha;\n\tb1 =  0;\n\tb2 = -alpha;\n\ta0 =  1 + alpha;\n\ta1 = -2 * tcos;\n\ta2 =  1 - alpha;\n} else if (typ == 4) {\r\n    b0 =  1;\n\tb1 = -2 * tcos;\n    b2 =  1;\n\ta0 =  1 + alpha;\n\ta1 =  b1;\n    a2 =  1 - alpha;\n}\n\r\na0m\t\t= 1  / a0;\r\nb0a0\t= b0 * a0m;\nb1a0\t= b1 * a0m;\nb2a0\t= b2 * a0m;\na1a0\t= a1 * a0m;\na2a0\t= a2 * a0m;\n\r\n// biquad\r\n\n//y\t\t= b0a0*b_in0 + b1a0*b_in1 + b2a0*b_in2 - a1a0*b_ou1 - a2a0*b_ou2;\n//out1\t= y;\nout1\t= dirtyBiquadDf2(in1, b0a0, b1a0, b2a0, a1a0, a2a0, drt);\r\n\r\n/*\r\n// update & noise inject\r\n\r\nb_in2\t= b_in1\t*\t(1 - (drt * noise()));\t\t// adding some dirty to the buffers!\nb_in1\t= b_in0\t*\t(1 - (drt * noise()));\nb_ou2\t= b_ou1\t*\t(1 - (drt * noise()));\nb_ou1\t= y\t\t*\t(1 - (drt * noise()));\t\t// pete says: could use only one 'noise()' here (cheaper) ?\r\n\r\n// PA says: Yes 4 instances of noise. In the old C code I even vectorised the LC\r\n// random algorithm to get 4 numbers per call ;-)\r\n\r\n//tremblay\t= 1 - (drt\t*\tnoise());\t\t\t// adding some dirty to the buffers!\r\n//b_in2\t\t= b_in1\t\t*\ttremblay;\n//b_in1\t\t= b_in0\t\t*\ttremblay;\n//b_ou2\t\t= b_ou1\t\t*\ttremblay;\n//b_ou1\t\t= y\t\t\t*\ttremblay;\n*/\r\n",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 32.0, 57.0, 764.0, 569.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 32.0, 18.0, 75.0, 22.0 ],
									"style" : "",
									"text" : "in 1 audio in"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 32.0, 643.0, 83.0, 22.0 ],
									"style" : "",
									"text" : "out 1 dirty out"
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
					"patching_rect" : [ 106.0, 182.0, 80.0, 22.0 ],
					"style" : "",
					"text" : "gen~ @t butt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 9.5, 130.0, 85.0, 22.0 ],
					"style" : "default",
					"text" : "prepend type"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 9.5, 84.0, 70.0, 20.0 ],
					"style" : "default",
					"text" : "filter type"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"items" : [ "type", ",", "lowpass", ",", "highpass", ",", "bandpass", ",", "bandstop" ],
					"labelclick" : 1,
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 9.5, 106.0, 85.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "umenu",
							"parameter_shortname" : "umenu",
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 3 ],
							"parameter_invisible" : 1
						}

					}
,
					"style" : "default",
					"varname" : "umenu"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"format" : 6,
					"id" : "obj-6",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 344.5, 191.0, 92.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "number",
							"parameter_shortname" : "number",
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"triscale" : 0.9,
					"varname" : "number"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.5, 164.0, 144.0, 33.0 ],
					"style" : "default",
					"text" : "dirtiness factor (float 0-1, or more but be careful)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 246.5, 250.0, 33.0, 22.0 ],
					"style" : "default",
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 169.0, 250.0, 74.0, 22.0 ],
					"style" : "default",
					"text" : "startwindow"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"format" : 6,
					"id" : "obj-11",
					"maxclass" : "flonum",
					"maximum" : 20000.0,
					"minimum" : 1.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.0, 106.0, 61.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "number[2]",
							"parameter_shortname" : "number[2]",
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 666.0 ],
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"triscale" : 0.9,
					"varname" : "number[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 106.0, 286.0, 37.0, 22.0 ],
					"style" : "default",
					"text" : "dac~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 106.0, 250.0, 42.0, 22.0 ],
					"style" : "default",
					"text" : "*~ 0.1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 195.0, 90.0, 128.0, 20.0 ],
					"style" : "default",
					"text" : "frequency in Hz (float)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 129.0, 140.0, 44.0, 20.0 ],
					"style" : "default",
					"text" : "input"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 344.5, 90.0, 157.0, 20.0 ],
					"style" : "default",
					"text" : "bandwidth in octaves (float)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 137.0, 226.0, 49.0, 20.0 ],
					"style" : "default",
					"text" : "output"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 162.0, 299.0, 324.0, 33.0 ],
					"style" : "default",
					"text" : "default filter values are bandpass, cutoff frequency 666 Hz, bandwidth 0.666 octave, and dirtiness 0.333"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 115.5, 276.0, 133.5, 276.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 256.0, 280.0, 115.5, 280.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 178.5, 280.0, 115.5, 280.0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-6" : [ "number", "number", 0 ],
			"obj-5" : [ "umenu", "umenu", 0 ],
			"obj-11" : [ "number[2]", "number[2]", 0 ],
			"obj-10" : [ "number[1]", "number[1]", 0 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
