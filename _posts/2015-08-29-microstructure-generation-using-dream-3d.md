---
layout:     post
title:      Microstructure Generation using DREAM 3D
date:       2015-08-29
author:    David Montes de Oca Zapiain
tags: 		Microstructure generation
---

The goal of this blog post is to teach our followers how to generate a synthetic microstructure using the open source software DREAM 3D. 
DREAM 3D is software that allows its users to generate, reconstruct, instantiate, quantify and mesh microstructure digitally. This software can be obtained at the following link [http://dream3d.bluequartz.net] .
Our team will be using this software to generate various synthetic Microstructures that will be the input to SSPARKS which uses the kinetic Monte Carlo equations to model static recrystallization. An example of a generated microstructure can be observed below.

![Generated Micro-Structure](img\blogpostimages\bp 1\image1.jpg)


The first step in generating your own microstructure will be to generate the statistics of it, by this it is meant the average grain size, crystal structure, etc. 
This will be generate with an auxiliary program included in the DREAM 3D folder called STATSGENERATOR.
This auxiliary program has Graphic User Interface and it looks like this:

![Stats Generator App Screenshot](grain-growth\img\blogpostimages\bp 1\image2.jpg)

**A**: Add new Phase, Delete Phase and Edit Current Phase
**B**: This is the lognormal average value grain size. Since the grain size distribution follows a LogNormal distribution. (https://en.wikipedia.org/wiki/Log-normal_distribution)
**C**: This is the lognormal standard deviation of the grain size. 
**D**: This allows the user to establish cutoff values for the grain size, thus enabling to remove either too big or to small grains form the generated microstructure. They are represented on the plot as blue vertical lines. 
**E**: Allows the user to select either equiaxed or rolled shape grains. 

Click generate Data and bottom F will become available. This option allows you to match your generated microstructure to a specific ODF obtained by EBSD analysis of a material.
Please follow [this link](http://www.slideshare.net/mwpriddy/dream3d-tutorial) and observe slides 15 and 16 on how to do this. This option is extremely useful since it will allow DREAM 3D to generate a much more realistic microstructure, nevertheless all the data of that microstructure needs to be available to the user.

Important Note: the pipeline built in that tutorial was not built in the latest DREAM 3D update those it represents different steps that those that we will show after.     
 
Now that the statistics of the microstructure have been generated proceed to save it data as a DREAM 3D file. Now launch the actual DREAM 3D software. The main screen looks like this:
 
![User Interface of Dream 3D](grain-growth\img\blogpostimages\bp 1\image3.jpg)
 
As stated before DREAM 3D uses a conjunction of filters, called a pipeline, to analyze and manipulate microstructure data. Once the application is open please assemble the following pipeline, shown in the picture below, it is important to mention that the order of the filters must be exact in order to manipulate correctly the data. A filter is added by double clicking in it, and you can use the search option to find each of the requested filters. 
 
![Pipeline to generate a microstructure](grain-growth\img\blogpostimages\bp 1\image4.jpg)
 
This pipeline will not work since as observed the interface mentions that various errors prevent it from executing it. The reason for that is because no data has been inputted yet! 
The following steps will show screenshots of how you should fill the most right tab for the user to build an error free pipeline. Please notice that if one or several of the parameters that appear on the tab are not mentioned in the tutorial it means that the team used its default value. 
Start with Filter number 1, the user should input the directory of the statistical data that was created with the stats generator app. 

![Filter 1 screenshot](grain-growth\img\blogpostimages\bp 1\image5.jpg)
 
Notice how right after you added the data filters 2, 3 and 4 are now error free. 
Filter 2 allows the user to define the size of the sample. Click on the “Estimate Feature” check box to obtain an estimate of how many grain your microstructure will have, again you will need to input the data generated with the Stats Generator App. Finally the “resolution” text box allows the user to determine the edge length of the final microstructure, therefore a higher number represents a higher volume thus higher number of grains inside the microstructure.  
Filter 3 allows the user to determine the shape of the grain. Default is ellipsoid. 
Filter 4 allows the user to add periodic boundaries to the microstructure. This feature will be used by our team since it allows the usage of DFT’s when performing the PSP linkages analysis. The “Write Goals” checkbox allows the user to build a much more realistic database by adding the data of the Misorientation Angle Distribution obtained by EBSD analysis, this data must be in a CSV file.  
For Filter 5 please input the data to match the following screenshot:

![Filter 5 Screenshot](grain-growth\img\blogpostimages\bp 1\image6.jpg)

For Filter 6 please input the data to match the following screenshot:

![Filter 6 Screenshot](grain-growth\img\blogpostimages\bp 1\image7.jpg)

For Filter 7 please input the data to match the following screenshot:

![Filter 7 Screenshot](grain-growth\img\blogpostimages\bp 1\image7.jpg)

Filters 8 and 9 errors will disappear once an output path is added. If you want to see data in Paraview please check the “Write Xdmf file” check box. In order to view in Paraview, load the data, check all the check box underneath Cell arrays, include that one and finally select “Surface” representation. Important if it does not load select first “Slice” and then “Surface”. 
