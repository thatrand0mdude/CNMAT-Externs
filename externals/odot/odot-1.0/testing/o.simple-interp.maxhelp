{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 276.0, 44.0, 798.0, 729.0 ],
		"bglocked" : 0,
		"defrect" : [ 276.0, 44.0, 798.0, 729.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 12.",
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 18.0,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 456.0, 472.0, 51.0, 27.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "o.callpatch /foo /bar /bloo + 12.",
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 18.0,
					"outlettype" : [ "FullPacket", "", "FullPacket" ],
					"patching_rect" : [ 456.0, 400.0, 213.0, 27.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"id" : "obj-28",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 56.0, 37.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"id" : "obj-20",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 224.0, 464.0, 37.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl rev",
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 136.0, 464.0, 39.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t f f",
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 176.0, 296.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack 0. 0.",
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 136.0, 440.0, 63.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b clear",
					"id" : "obj-14",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "bang", "clear" ],
					"patching_rect" : [ 136.0, 248.0, 53.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "o.route /y",
					"id" : "obj-13",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 136.0, 400.0, 61.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "function",
					"id" : "obj-12",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"patching_rect" : [ 136.0, 496.0, 200.0, 100.0 ],
					"addpoints" : [ 1.0, 0.000276, 0, 2.0, 0.000555, 0, 3.0, 0.000838, 0, 4.0, 0.001123, 0, 5.0, 0.001411, 0, 6.0, 0.001703, 0, 7.0, 0.001998, 0, 8.0, 0.002296, 0, 9.0, 0.002598, 0, 10.0, 0.002903, 0, 11.0, 0.003213, 0, 12.0, 0.003526, 0, 13.0, 0.003843, 0, 14.0, 0.004164, 0, 15.0, 0.00449, 0, 16.0, 0.00482, 0, 17.0, 0.005154, 0, 18.0, 0.005493, 0, 19.0, 0.005838, 0, 20.0, 0.006187, 0, 21.0, 0.006541, 0, 22.0, 0.0069, 0, 23.0, 0.007266, 0, 24.0, 0.007636, 0, 25.0, 0.008013, 0, 26.0, 0.008397, 0, 27.0, 0.008786, 0, 28.0, 0.009183, 0, 29.0, 0.009586, 0, 30.0, 0.009996, 0, 31.0, 0.010415, 0, 32.0, 0.010841, 0, 33.0, 0.011275, 0, 34.0, 0.011718, 0, 35.0, 0.01217, 0, 36.0, 0.012631, 0, 37.0, 0.013102, 0, 38.0, 0.013583, 0, 39.0, 0.014075, 0, 40.0, 0.014578, 0, 41.0, 0.015093, 0, 42.0, 0.015621, 0, 43.0, 0.016161, 0, 44.0, 0.016715, 0, 45.0, 0.017284, 0, 46.0, 0.017868, 0, 47.0, 0.018468, 0, 48.0, 0.019086, 0, 49.0, 0.019721, 0, 50.0, 0.020376, 0, 51.0, 0.021051, 0, 52.0, 0.021747, 0, 53.0, 0.022467, 0, 54.0, 0.023211, 0, 55.0, 0.023981, 0, 56.0, 0.02478, 0, 57.0, 0.025608, 0, 58.0, 0.026469, 0, 59.0, 0.027365, 0, 60.0, 0.028298, 0, 61.0, 0.029271, 0, 62.0, 0.030288, 0, 63.0, 0.031353, 0, 64.0, 0.032469, 0, 65.0, 0.033642, 0, 66.0, 0.034877, 0, 67.0, 0.036178, 0, 68.0, 0.037555, 0, 69.0, 0.039013, 0, 70.0, 0.040563, 0, 71.0, 0.042213, 0, 72.0, 0.043977, 0, 73.0, 0.045867, 0, 74.0, 0.047901, 0, 75.0, 0.050096, 0, 76.0, 0.052476, 0, 77.0, 0.055068, 0, 78.0, 0.057904, 0, 79.0, 0.061024, 0, 80.0, 0.064477, 0, 81.0, 0.068324, 0, 82.0, 0.072643, 0, 83.0, 0.07753, 0, 84.0, 0.083116, 0, 85.0, 0.08957, 0, 86.0, 0.097121, 0, 87.0, 0.106091, 0, 88.0, 0.116936, 0, 89.0, 0.130334, 0, 90.0, 0.147338, 0, 91.0, 0.169668, 0, 92.0, 0.200347, 0, 93.0, 0.245225, 0, 94.0, 0.317283, 0, 95.0, 0.452262, 0, 96.0, 0.573488, 0, 97.0, 0.375219, 0, 98.0, 0.282821, 0, 99.0, 0.229438, 0, 100.0, 0.194716, 0, 101.0, 0.170365, 0, 102.0, 0.152371, 0, 103.0, 0.138556, 0, 104.0, 0.127635, 0, 105.0, 0.118802, 0, 106.0, 0.111524, 0, 107.0, 0.105436, 0, 108.0, 0.100281, 0, 109.0, 0.095867, 0, 110.0, 0.092057, 0, 111.0, 0.088741, 0, 112.0, 0.085837, 0, 113.0, 0.083281, 0, 114.0, 0.081019, 0, 115.0, 0.07901, 0, 116.0, 0.07722, 0, 117.0, 0.075621, 0, 118.0, 0.074189, 0, 119.0, 0.072905, 0, 120.0, 0.071752, 0, 121.0, 0.070716, 0, 122.0, 0.069785, 0, 123.0, 0.068948, 0, 124.0, 0.068198, 0, 125.0, 0.067526, 0, 126.0, 0.066926, 0, 127.0, 0.066391, 0, 128.0, 0.065917, 0, 129.0, 0.065498, 0, 130.0, 0.065132, 0, 131.0, 0.064814, 0, 132.0, 0.064542, 0, 133.0, 0.064312, 0, 134.0, 0.064122, 0, 135.0, 0.06397, 0, 136.0, 0.063854, 0, 137.0, 0.063773, 0, 138.0, 0.063724, 0, 139.0, 0.063706, 0, 140.0, 0.063718, 0, 141.0, 0.06376, 0, 142.0, 0.063829, 0, 143.0, 0.063926, 0, 144.0, 0.06405, 0, 145.0, 0.064199, 0, 146.0, 0.064374, 0, 147.0, 0.064573, 0, 148.0, 0.064798, 0, 149.0, 0.065047, 0, 150.0, 0.065319, 0, 151.0, 0.065616, 0, 152.0, 0.065937, 0, 153.0, 0.066282, 0, 154.0, 0.066651, 0, 155.0, 0.067044, 0, 156.0, 0.067461, 0, 157.0, 0.067903, 0, 158.0, 0.06837, 0, 159.0, 0.068862, 0, 160.0, 0.06938, 0, 161.0, 0.069924, 0, 162.0, 0.070496, 0, 163.0, 0.071094, 0, 164.0, 0.071722, 0, 165.0, 0.072378, 0, 166.0, 0.073064, 0, 167.0, 0.073782, 0, 168.0, 0.074531, 0, 169.0, 0.075314, 0, 170.0, 0.076132, 0, 171.0, 0.076986, 0, 172.0, 0.077878, 0, 173.0, 0.078808, 0, 174.0, 0.079781, 0, 175.0, 0.080796, 0, 176.0, 0.081857, 0, 177.0, 0.082965, 0, 178.0, 0.084124, 0, 179.0, 0.085336, 0, 180.0, 0.086604, 0, 181.0, 0.087933, 0, 182.0, 0.089324, 0, 183.0, 0.090783, 0, 184.0, 0.092313, 0, 185.0, 0.09392, 0, 186.0, 0.09561, 0, 187.0, 0.097387, 0, 188.0, 0.099259, 0, 189.0, 0.101233, 0, 190.0, 0.103317, 0, 191.0, 0.10552, 0, 192.0, 0.107851, 0, 193.0, 0.110324, 0, 194.0, 0.112949, 0, 195.0, 0.115741, 0, 196.0, 0.118718, 0, 197.0, 0.121896, 0, 198.0, 0.125297, 0, 199.0, 0.128946, 0, 200.0, 0.132869, 0, 201.0, 0.1371, 0, 202.0, 0.141676, 0, 203.0, 0.14664, 0, 204.0, 0.152045, 0, 205.0, 0.157952, 0, 206.0, 0.164435, 0, 207.0, 0.171582, 0, 208.0, 0.179502, 0, 209.0, 0.188328, 0, 210.0, 0.198226, 0, 211.0, 0.209404, 0, 212.0, 0.22213, 0, 213.0, 0.236751, 0, 214.0, 0.253726, 0, 215.0, 0.273677, 0, 216.0, 0.297466, 0, 217.0, 0.326321, 0, 218.0, 0.362064, 0, 219.0, 0.4075, 0, 220.0, 0.467205, 0, 221.0, 0.549174, 0, 222.0, 0.66874, 0, 223.0, 0.859524, 0, 224.0, 0.815154, 0, 225.0, 0.643927, 0, 226.0, 0.535049, 0, 227.0, 0.45972, 0, 228.0, 0.404514, 0, 229.0, 0.362323, 0, 230.0, 0.329037, 0, 231.0, 0.30211, 0, 232.0, 0.279883, 0, 233.0, 0.261229, 0, 234.0, 0.245353, 0, 235.0, 0.231681, 0, 236.0, 0.219787, 0, 237.0, 0.209348, 0, 238.0, 0.200114, 0, 239.0, 0.191891, 0, 240.0, 0.184522, 0, 241.0, 0.177885, 0, 242.0, 0.171876, 0, 243.0, 0.166412, 0, 244.0, 0.161424, 0, 245.0, 0.156854, 0, 246.0, 0.152653, 0, 247.0, 0.14878, 0, 248.0, 0.145199, 0, 249.0, 0.141879, 0, 250.0, 0.138794, 0, 251.0, 0.135922, 0, 252.0, 0.133242, 0, 253.0, 0.130737, 0, 254.0, 0.128391, 0, 255.0, 0.126191, 0, 256.0, 0.124125, 0, 257.0, 0.122181, 0, 258.0, 0.120351, 0, 259.0, 0.118626, 0, 260.0, 0.116998, 0, 261.0, 0.11546, 0, 262.0, 0.114005, 0, 263.0, 0.112629, 0, 264.0, 0.111326, 0, 265.0, 0.110091, 0, 266.0, 0.10892, 0, 267.0, 0.107809, 0, 268.0, 0.106755, 0, 269.0, 0.105754, 0, 270.0, 0.104804, 0, 271.0, 0.103901, 0, 272.0, 0.103043, 0, 273.0, 0.102227, 0, 274.0, 0.101453, 0, 275.0, 0.100716, 0, 276.0, 0.100017, 0, 277.0, 0.099353, 0, 278.0, 0.098722, 0, 279.0, 0.098123, 0, 280.0, 0.097555, 0, 281.0, 0.097017, 0, 282.0, 0.096506, 0, 283.0, 0.096023, 0, 284.0, 0.095566, 0, 285.0, 0.095135, 0, 286.0, 0.094728, 0, 287.0, 0.094345, 0, 288.0, 0.093984, 0, 289.0, 0.093646, 0, 290.0, 0.093329, 0, 291.0, 0.093034, 0, 292.0, 0.092759, 0, 293.0, 0.092504, 0, 294.0, 0.092268, 0, 295.0, 0.092052, 0, 296.0, 0.091854, 0, 297.0, 0.091675, 0, 298.0, 0.091514, 0, 299.0, 0.091371, 0, 300.0, 0.091245, 0, 301.0, 0.091137, 0, 302.0, 0.091046, 0, 303.0, 0.090972, 0, 304.0, 0.090915, 0, 305.0, 0.090875, 0, 306.0, 0.090852, 0, 307.0, 0.090845, 0, 308.0, 0.090855, 0, 309.0, 0.090882, 0, 310.0, 0.090925, 0, 311.0, 0.090986, 0, 312.0, 0.091063, 0, 313.0, 0.091158, 0, 314.0, 0.091269, 0, 315.0, 0.091399, 0, 316.0, 0.091545, 0, 317.0, 0.09171, 0, 318.0, 0.091893, 0, 319.0, 0.092095, 0, 320.0, 0.092315, 0, 321.0, 0.092555, 0, 322.0, 0.092815, 0, 323.0, 0.093095, 0, 324.0, 0.093396, 0, 325.0, 0.093718, 0, 326.0, 0.094062, 0, 327.0, 0.094429, 0, 328.0, 0.094819, 0, 329.0, 0.095234, 0, 330.0, 0.095674, 0, 331.0, 0.096141, 0, 332.0, 0.096634, 0, 333.0, 0.097156, 0, 334.0, 0.097708, 0, 335.0, 0.098291, 0, 336.0, 0.098906, 0, 337.0, 0.099555, 0, 338.0, 0.100241, 0, 339.0, 0.100964, 0, 340.0, 0.101727, 0, 341.0, 0.102532, 0, 342.0, 0.103381, 0, 343.0, 0.104278, 0, 344.0, 0.105225, 0, 345.0, 0.106226, 0, 346.0, 0.107284, 0, 347.0, 0.108402, 0, 348.0, 0.109587, 0, 349.0, 0.110841, 0, 350.0, 0.112172, 0, 351.0, 0.113584, 0, 352.0, 0.115084, 0, 353.0, 0.11668, 0, 354.0, 0.11838, 0, 355.0, 0.120194, 0, 356.0, 0.122132, 0, 357.0, 0.124207, 0, 358.0, 0.126432, 0, 359.0, 0.128822, 0, 360.0, 0.131398, 0, 361.0, 0.134178, 0, 362.0, 0.137187, 0, 363.0, 0.140455, 0, 364.0, 0.144013, 0, 365.0, 0.147903, 0, 366.0, 0.15217, 0, 367.0, 0.156871, 0, 368.0, 0.162075, 0, 369.0, 0.167866, 0, 370.0, 0.174347, 0, 371.0, 0.181647, 0, 372.0, 0.189933, 0, 373.0, 0.199415, 0, 374.0, 0.210371, 0, 375.0, 0.223174, 0, 376.0, 0.238331, 0, 377.0, 0.256554, 0, 378.0, 0.27888, 0, 379.0, 0.306866, 0, 380.0, 0.342977, 0, 381.0, 0.391353, 0, 382.0, 0.459518, 0, 383.0, 0.557284, 0, 384.0, 0.456214, 0, 385.0, 0.389393, 0, 386.0, 0.341937, 0, 387.0, 0.306495, 0, 388.0, 0.279019, 0, 389.0, 0.257097, 0, 390.0, 0.2392, 0, 391.0, 0.224316, 0, 392.0, 0.211744, 0, 393.0, 0.200986, 0, 394.0, 0.191677, 0, 395.0, 0.183544, 0, 396.0, 0.17638, 0, 397.0, 0.170022, 0, 398.0, 0.164342, 0, 399.0, 0.15924, 0, 400.0, 0.154632, 0, 401.0, 0.150452, 0, 402.0, 0.146643, 0, 403.0, 0.14316, 0, 404.0, 0.139963, 0, 405.0, 0.13702, 0, 406.0, 0.134302, 0, 407.0, 0.131787, 0, 408.0, 0.129453, 0, 409.0, 0.127282, 0, 410.0, 0.125259, 0, 411.0, 0.12337, 0, 412.0, 0.121603, 0, 413.0, 0.119949, 0, 414.0, 0.118397, 0, 415.0, 0.116939, 0, 416.0, 0.115568, 0, 417.0, 0.114277, 0, 418.0, 0.113061, 0, 419.0, 0.111913, 0, 420.0, 0.110831, 0, 421.0, 0.109808, 0, 422.0, 0.108841, 0, 423.0, 0.107927, 0, 424.0, 0.107062, 0, 425.0, 0.106243, 0, 426.0, 0.105469, 0, 427.0, 0.104735, 0, 428.0, 0.104041, 0, 429.0, 0.103383, 0, 430.0, 0.102761, 0, 431.0, 0.102172, 0, 432.0, 0.101615, 0, 433.0, 0.101088, 0, 434.0, 0.10059, 0, 435.0, 0.10012, 0, 436.0, 0.099677, 0, 437.0, 0.099259, 0, 438.0, 0.098865, 0, 439.0, 0.098495, 0, 440.0, 0.098148, 0, 441.0, 0.097823, 0, 442.0, 0.097519, 0, 443.0, 0.097236, 0, 444.0, 0.096973, 0, 445.0, 0.096729, 0, 446.0, 0.096504, 0, 447.0, 0.096298, 0, 448.0, 0.096109, 0, 449.0, 0.095939, 0, 450.0, 0.095786, 0, 451.0, 0.095649, 0, 452.0, 0.095529, 0, 453.0, 0.095426, 0, 454.0, 0.095339, 0, 455.0, 0.095268, 0, 456.0, 0.095212, 0, 457.0, 0.095172, 0, 458.0, 0.095148, 0, 459.0, 0.095139, 0, 460.0, 0.095145, 0, 461.0, 0.095167, 0, 462.0, 0.095204, 0, 463.0, 0.095256, 0, 464.0, 0.095323, 0, 465.0, 0.095405, 0, 466.0, 0.095503, 0, 467.0, 0.095616, 0, 468.0, 0.095744, 0, 469.0, 0.095888, 0, 470.0, 0.096048, 0, 471.0, 0.096223, 0, 472.0, 0.096415, 0, 473.0, 0.096622, 0, 474.0, 0.096847, 0, 475.0, 0.097088, 0, 476.0, 0.097346, 0, 477.0, 0.097621, 0, 478.0, 0.097915, 0, 479.0, 0.098226, 0, 480.0, 0.098556, 0, 481.0, 0.098905, 0, 482.0, 0.099273, 0, 483.0, 0.099661, 0, 484.0, 0.100069, 0, 485.0, 0.100499, 0, 486.0, 0.10095, 0, 487.0, 0.101424, 0, 488.0, 0.10192, 0, 489.0, 0.102441, 0, 490.0, 0.102986, 0, 491.0, 0.103557, 0, 492.0, 0.104154, 0, 493.0, 0.104779, 0, 494.0, 0.105432, 0, 495.0, 0.106115, 0, 496.0, 0.106829, 0, 497.0, 0.107575, 0, 498.0, 0.108355, 0, 499.0, 0.10917, 0, 500.0, 0.110022, 0, 501.0, 0.110913, 0, 502.0, 0.111845, 0, 503.0, 0.112819, 0, 504.0, 0.113837, 0, 505.0, 0.114903, 0, 506.0, 0.116019, 0, 507.0, 0.117188, 0, 508.0, 0.118411, 0, 509.0, 0.119694, 0, 510.0, 0.121039, 0, 511.0, 0.122451, 0, 512.0, 0.123933, 0, 513.0, 0.125489, 0, 514.0, 0.127126, 0, 515.0, 0.128849, 0, 516.0, 0.130663, 0, 517.0, 0.132575, 0, 518.0, 0.134593, 0, 519.0, 0.136725, 0, 520.0, 0.138979, 0, 521.0, 0.141366, 0, 522.0, 0.143896, 0, 523.0, 0.146583, 0, 524.0, 0.149439, 0, 525.0, 0.152482, 0, 526.0, 0.155727, 0, 527.0, 0.159196, 0, 528.0, 0.162911, 0, 529.0, 0.166897, 0, 530.0, 0.171186, 0, 531.0, 0.17581, 0, 532.0, 0.18081, 0, 533.0, 0.186231, 0, 534.0, 0.192129, 0, 535.0, 0.198567, 0, 536.0, 0.205622, 0, 537.0, 0.213383, 0, 538.0, 0.221963, 0, 539.0, 0.231494, 0, 540.0, 0.242142, 0, 541.0, 0.254114, 0, 542.0, 0.267669, 0, 543.0, 0.283142, 0, 544.0, 0.300966, 0, 545.0, 0.321719, 0, 546.0, 0.346182, 0, 547.0, 0.375443, 0, 548.0, 0.41106, 0, 549.0, 0.45535, 0, 550.0, 0.511912, 0, 551.0, 0.586654, 0, 552.0, 0.690003, 0, 553.0, 0.842247, 0, 554.0, 0.740769, 0, 555.0, 0.621663, 0, 556.0, 0.537242, 0, 557.0, 0.474272, 0, 558.0, 0.425492, 0, 559.0, 0.386585, 0, 560.0, 0.354824, 0, 561.0, 0.328404, 0, 562.0, 0.306078, 0, 563.0, 0.286961, 0, 564.0, 0.270405, 0, 565.0, 0.255926, 0, 566.0, 0.243155, 0, 567.0, 0.231805, 0, 568.0, 0.22165, 0, 569.0, 0.212511, 0, 570.0, 0.204241, 0, 571.0, 0.196721, 0, 572.0, 0.189852, 0, 573.0, 0.183554, 0, 574.0, 0.177758, 0, 575.0, 0.172405, 0, 576.0, 0.167445, 0, 577.0, 0.162838, 0, 578.0, 0.158546, 0, 579.0, 0.154538, 0, 580.0, 0.150786, 0, 581.0, 0.147267, 0, 582.0, 0.143959, 0, 583.0, 0.140844, 0, 584.0, 0.137905, 0, 585.0, 0.135127, 0, 586.0, 0.132499, 0, 587.0, 0.130007, 0, 588.0, 0.127641, 0, 589.0, 0.125393, 0, 590.0, 0.123254, 0, 591.0, 0.121215, 0, 592.0, 0.11927, 0, 593.0, 0.117413, 0, 594.0, 0.115638, 0, 595.0, 0.11394, 0, 596.0, 0.112314, 0, 597.0, 0.110755, 0, 598.0, 0.10926, 0, 599.0, 0.107824, 0, 600.0, 0.106445, 0, 601.0, 0.105119, 0, 602.0, 0.103844, 0, 603.0, 0.102616, 0, 604.0, 0.101434, 0, 605.0, 0.100294, 0, 606.0, 0.099195, 0, 607.0, 0.098135, 0, 608.0, 0.097112, 0, 609.0, 0.096124, 0, 610.0, 0.095169, 0, 611.0, 0.094247, 0, 612.0, 0.093356, 0, 613.0, 0.092494, 0, 614.0, 0.09166, 0, 615.0, 0.090853, 0, 616.0, 0.090073, 0, 617.0, 0.089317, 0, 618.0, 0.088586, 0, 619.0, 0.087878, 0, 620.0, 0.087192, 0, 621.0, 0.086528, 0, 622.0, 0.085885, 0, 623.0, 0.085263, 0, 624.0, 0.08466, 0, 625.0, 0.084076, 0, 626.0, 0.083511, 0, 627.0, 0.082964, 0, 628.0, 0.082435, 0, 629.0, 0.081923, 0, 630.0, 0.081428, 0, 631.0, 0.08095, 0, 632.0, 0.080487, 0, 633.0, 0.080041, 0, 634.0, 0.07961, 0, 635.0, 0.079195, 0, 636.0, 0.078795, 0, 637.0, 0.07841, 0, 638.0, 0.07804, 0, 639.0, 0.077685, 0, 640.0, 0.077345, 0, 641.0, 0.077019, 0, 642.0, 0.076709, 0, 643.0, 0.076413, 0, 644.0, 0.076131, 0, 645.0, 0.075865, 0, 646.0, 0.075614, 0, 647.0, 0.075378, 0, 648.0, 0.075158, 0, 649.0, 0.074953, 0, 650.0, 0.074765, 0, 651.0, 0.074593, 0, 652.0, 0.074438, 0, 653.0, 0.0743, 0, 654.0, 0.074181, 0, 655.0, 0.07408, 0, 656.0, 0.073999, 0, 657.0, 0.073938, 0, 658.0, 0.073899, 0, 659.0, 0.073882, 0, 660.0, 0.073889, 0, 661.0, 0.073922, 0, 662.0, 0.073981, 0, 663.0, 0.074069, 0, 664.0, 0.074189, 0, 665.0, 0.074341, 0, 666.0, 0.07453, 0, 667.0, 0.074758, 0, 668.0, 0.07503, 0, 669.0, 0.075349, 0, 670.0, 0.075721, 0, 671.0, 0.076151, 0, 672.0, 0.076646, 0, 673.0, 0.077215, 0, 674.0, 0.077868, 0, 675.0, 0.078615, 0, 676.0, 0.079472, 0, 677.0, 0.080456, 0, 678.0, 0.081588, 0, 679.0, 0.082896, 0, 680.0, 0.084413, 0, 681.0, 0.086184, 0, 682.0, 0.088266, 0, 683.0, 0.090735, 0, 684.0, 0.093697, 0, 685.0, 0.097298, 0, 686.0, 0.101748, 0, 687.0, 0.107365, 0, 688.0, 0.114645, 0, 689.0, 0.124418, 0, 690.0, 0.138171, 0, 691.0, 0.158878, 0, 692.0, 0.158283, 0, 693.0, 0.137523, 0, 694.0, 0.123532, 0, 695.0, 0.113442, 0, 696.0, 0.105804, 0, 697.0, 0.09981, 0, 698.0, 0.09497, 0, 699.0, 0.090974, 0, 700.0, 0.087611, 0, 701.0, 0.084738, 0, 702.0, 0.08225, 0, 703.0, 0.080073, 0, 704.0, 0.078147, 0, 705.0, 0.07643, 0, 706.0, 0.074888, 0, 707.0, 0.073493, 0, 708.0, 0.072224, 0, 709.0, 0.071063, 0, 710.0, 0.069996, 0, 711.0, 0.069012, 0, 712.0, 0.068099, 0, 713.0, 0.067251, 0, 714.0, 0.06646, 0, 715.0, 0.06572, 0, 716.0, 0.065025, 0, 717.0, 0.064372, 0, 718.0, 0.063757, 0, 719.0, 0.063176, 0, 720.0, 0.062626, 0, 721.0, 0.062105, 0, 722.0, 0.06161, 0, 723.0, 0.06114, 0, 724.0, 0.060693, 0, 725.0, 0.060267, 0, 726.0, 0.059861, 0, 727.0, 0.059473, 0, 728.0, 0.059102, 0, 729.0, 0.058748, 0, 730.0, 0.058409, 0, 731.0, 0.058084, 0, 732.0, 0.057774, 0, 733.0, 0.057476, 0, 734.0, 0.057191, 0, 735.0, 0.056918, 0, 736.0, 0.056657, 0, 737.0, 0.056406, 0, 738.0, 0.056166, 0, 739.0, 0.055936, 0, 740.0, 0.055716, 0, 741.0, 0.055506, 0, 742.0, 0.055304, 0, 743.0, 0.055112, 0, 744.0, 0.054929, 0, 745.0, 0.054754, 0, 746.0, 0.054587, 0, 747.0, 0.054429, 0, 748.0, 0.054278, 0, 749.0, 0.054136, 0, 750.0, 0.054002, 0, 751.0, 0.053875, 0, 752.0, 0.053756, 0, 753.0, 0.053644, 0, 754.0, 0.05354, 0, 755.0, 0.053444, 0, 756.0, 0.053355, 0, 757.0, 0.053274, 0, 758.0, 0.0532, 0, 759.0, 0.053133, 0, 760.0, 0.053074, 0, 761.0, 0.053023, 0, 762.0, 0.05298, 0, 763.0, 0.052944, 0, 764.0, 0.052916, 0, 765.0, 0.052896, 0, 766.0, 0.052884, 0, 767.0, 0.052881, 0, 768.0, 0.052885, 0, 769.0, 0.052898, 0, 770.0, 0.05292, 0, 771.0, 0.052951, 0, 772.0, 0.052991, 0, 773.0, 0.05304, 0, 774.0, 0.053099, 0, 775.0, 0.053167, 0, 776.0, 0.053246, 0, 777.0, 0.053335, 0, 778.0, 0.053435, 0, 779.0, 0.053546, 0, 780.0, 0.053669, 0, 781.0, 0.053804, 0, 782.0, 0.053951, 0, 783.0, 0.054111, 0, 784.0, 0.054285, 0, 785.0, 0.054472, 0, 786.0, 0.054675, 0, 787.0, 0.054893, 0, 788.0, 0.055127, 0, 789.0, 0.055377, 0, 790.0, 0.055646, 0, 791.0, 0.055933, 0, 792.0, 0.05624, 0, 793.0, 0.056567, 0, 794.0, 0.056917, 0, 795.0, 0.057289, 0, 796.0, 0.057686, 0, 797.0, 0.058109, 0, 798.0, 0.058559, 0, 799.0, 0.059039, 0, 800.0, 0.059551, 0, 801.0, 0.060096, 0, 802.0, 0.060676, 0, 803.0, 0.061295, 0, 804.0, 0.061956, 0, 805.0, 0.062661, 0, 806.0, 0.063414, 0, 807.0, 0.064219, 0, 808.0, 0.065081, 0, 809.0, 0.066004, 0, 810.0, 0.066994, 0, 811.0, 0.068056, 0, 812.0, 0.069199, 0, 813.0, 0.07043, 0, 814.0, 0.071758, 0, 815.0, 0.073193, 0, 816.0, 0.074748, 0, 817.0, 0.076436, 0, 818.0, 0.078273, 0, 819.0, 0.080279, 0, 820.0, 0.082474, 0, 821.0, 0.084886, 0, 822.0, 0.087545, 0, 823.0, 0.090489, 0, 824.0, 0.093764, 0, 825.0, 0.097424, 0, 826.0, 0.101541, 0, 827.0, 0.106199, 0, 828.0, 0.11151, 0, 829.0, 0.117615, 0, 830.0, 0.124703, 0, 831.0, 0.133024, 0, 832.0, 0.142923, 0, 833.0, 0.154888, 0, 834.0, 0.169627, 0, 835.0, 0.188219, 0, 836.0, 0.212383, 0, 837.0, 0.245039, 0, 838.0, 0.291583, 0, 839.0, 0.363206, 0, 840.0, 0.487546, 0, 841.0, 0.46302, 0, 842.0, 0.34801, 0, 843.0, 0.279665, 0, 844.0, 0.234348, 0, 845.0, 0.202078, 0, 846.0, 0.177915, 0, 847.0, 0.159134, 0, 848.0, 0.144107, 0, 849.0, 0.131804, 0, 850.0, 0.121539, 0, 851.0, 0.112839, 0, 852.0, 0.105367, 0, 853.0, 0.098877, 0, 854.0, 0.093183, 0, 855.0, 0.088145, 0, 856.0, 0.083652, 0, 857.0, 0.079619, 0, 858.0, 0.075975, 0, 859.0, 0.072667, 0, 860.0, 0.069646, 0, 861.0, 0.066877, 0, 862.0, 0.064328, 0, 863.0, 0.061971, 0, 864.0, 0.059786, 0, 865.0, 0.057752, 0, 866.0, 0.055854, 0, 867.0, 0.054077, 0, 868.0, 0.05241, 0, 869.0, 0.050842, 0, 870.0, 0.049363, 0, 871.0, 0.047966, 0, 872.0, 0.046643, 0, 873.0, 0.045388, 0, 874.0, 0.044195, 0, 875.0, 0.04306, 0, 876.0, 0.041977, 0, 877.0, 0.040943, 0, 878.0, 0.039955, 0, 879.0, 0.039008, 0, 880.0, 0.0381, 0, 881.0, 0.037228, 0, 882.0, 0.036389, 0, 883.0, 0.035583, 0, 884.0, 0.034806, 0, 885.0, 0.034056, 0, 886.0, 0.033332, 0, 887.0, 0.032633, 0, 888.0, 0.031956, 0, 889.0, 0.031301, 0, 890.0, 0.030666, 0, 891.0, 0.030051, 0, 892.0, 0.029453, 0, 893.0, 0.028873, 0, 894.0, 0.028309, 0, 895.0, 0.02776, 0, 896.0, 0.027226, 0, 897.0, 0.026706, 0, 898.0, 0.026199, 0, 899.0, 0.025705, 0, 900.0, 0.025223, 0, 901.0, 0.024752, 0, 902.0, 0.024292, 0, 903.0, 0.023842, 0, 904.0, 0.023403, 0, 905.0, 0.022973, 0, 906.0, 0.022552, 0, 907.0, 0.022139, 0, 908.0, 0.021735, 0, 909.0, 0.021339, 0, 910.0, 0.020951, 0, 911.0, 0.02057, 0, 912.0, 0.020196, 0, 913.0, 0.019829, 0, 914.0, 0.019469, 0, 915.0, 0.019115, 0, 916.0, 0.018766, 0, 917.0, 0.018424, 0, 918.0, 0.018088, 0, 919.0, 0.017756, 0, 920.0, 0.01743, 0, 921.0, 0.01711, 0, 922.0, 0.016794, 0, 923.0, 0.016482, 0, 924.0, 0.016176, 0, 925.0, 0.015873, 0, 926.0, 0.015575, 0, 927.0, 0.015281, 0, 928.0, 0.014991, 0, 929.0, 0.014705, 0, 930.0, 0.014423, 0, 931.0, 0.014144, 0, 932.0, 0.013869, 0, 933.0, 0.013598, 0, 934.0, 0.013329, 0, 935.0, 0.013064, 0, 936.0, 0.012802, 0, 937.0, 0.012543, 0, 938.0, 0.012287, 0, 939.0, 0.012034, 0, 940.0, 0.011783, 0, 941.0, 0.011536, 0, 942.0, 0.01129, 0, 943.0, 0.011048, 0, 944.0, 0.010808, 0, 945.0, 0.01057, 0, 946.0, 0.010335, 0, 947.0, 0.010102, 0, 948.0, 0.009872, 0, 949.0, 0.009643, 0, 950.0, 0.009417, 0, 951.0, 0.009193, 0, 952.0, 0.00897, 0, 953.0, 0.00875, 0, 954.0, 0.008532, 0, 955.0, 0.008316, 0, 956.0, 0.008101, 0, 957.0, 0.007888, 0, 958.0, 0.007677, 0, 959.0, 0.007468, 0, 960.0, 0.00726, 0, 961.0, 0.007054, 0, 962.0, 0.00685, 0, 963.0, 0.006647, 0, 964.0, 0.006446, 0, 965.0, 0.006246, 0, 966.0, 0.006048, 0, 967.0, 0.005851, 0, 968.0, 0.005656, 0, 969.0, 0.005462, 0, 970.0, 0.005269, 0, 971.0, 0.005078, 0, 972.0, 0.004887, 0, 973.0, 0.004699, 0, 974.0, 0.004511, 0, 975.0, 0.004325, 0, 976.0, 0.00414, 0, 977.0, 0.003955, 0, 978.0, 0.003773, 0, 979.0, 0.003591, 0, 980.0, 0.00341, 0, 981.0, 0.003231, 0, 982.0, 0.003052, 0, 983.0, 0.002875, 0, 984.0, 0.002698, 0, 985.0, 0.002523, 0, 986.0, 0.002348, 0, 987.0, 0.002175, 0, 988.0, 0.002002, 0, 989.0, 0.001831, 0, 990.0, 0.00166, 0, 991.0, 0.00149, 0, 992.0, 0.001321, 0, 993.0, 0.001153, 0, 994.0, 0.000986, 0, 995.0, 0.00082, 0, 996.0, 0.000654, 0, 997.0, 0.000489, 0, 998.0, 0.000326, 0, 999.0, 0.000162, 0, 1000.0, 0.000162, 0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"id" : "obj-11",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 136.0, 224.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "uzi 1000",
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 3,
					"fontsize" : 12.0,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 136.0, 272.0, 56.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b dump",
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "bang", "dump" ],
					"patching_rect" : [ 136.0, 56.0, 57.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "dump",
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 136.0, 32.0, 41.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl 2000 group",
					"id" : "obj-5",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 352.0, 240.0, 83.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl 2000 group",
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 264.0, 240.0, 83.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0.",
					"id" : "obj-3",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 264.0, 208.0, 76.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "function",
					"id" : "obj-2",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"patching_rect" : [ 136.0, 96.0, 200.0, 100.0 ],
					"addpoints" : [ 0.0, 0.0, 2, 95.744682, 0.666667, 2, 223.404251, 0.973333, 0, 382.978729, 0.56, 2, 553.191467, 0.88, 0, 691.48938, 0.173333, 2, 840.425537, 0.573333, 0, 1000.0, 0.0, 2 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"id" : "obj-52",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 376.0, 296.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"id" : "obj-51",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 456.0, 296.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "o.build 2000 /x 0. /xx 0. 0.25 0.75 1. /yy 0. 0.5 0.5 0. /a 1. /w0 500",
					"id" : "obj-50",
					"fontname" : "Arial",
					"numinlets" : 5,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 136.0, 328.0, 358.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "o.simple-interp",
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 136.0, 368.0, 89.0, 20.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-50", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-50", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-50", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-50", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 2 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 1 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 1 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 2 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 1 ],
					"destination" : [ "obj-15", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
