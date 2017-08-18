---
layout:     post
title:      Ballbot project 
author:     Matthew Wilson
tags: 		riss robot project
subtitle:  	
category:  riss
---
<!-- Start Writing Below in Markdown -->


This summer I got to work with the ballbots at Carnegie Mellon University.

PICTURE GOES HERE

## A bit of background

Unlike most robots today that use multiple wheels to move around, Ballbot 
balances on a single ball.  The entire body rests on the ball, which is 
controlled by two pairs of steel rollers. These rollers are turned by motors
and allow the ball to be moved.  

In order to be able to balance, Ballbot must sense which direction is up.  For
this, it uses an [Inertial Measurement Unit (IMU)].  An IMU is a sensor widely
used in robotics, that gives you the linear acceleration of your system, so 
how much it is currenlty accelerating in the `x`, `y`, and `z` directions.

The ballbot just uses this to tell which was is down.  In a simplified sense,
it tries to align the force of gravity to point straight down.  If gravity is
pulling down on the exact center of mass of the robot, than it will stay 
balanced.


The result of all these nice tricks is that the ballbot is able to dynamically
balance, the same way that humans and animals do.  If you turn the ballbot off,
it will quickly tip over and fall.  Just as if we are not actively balancing 
when we stand up, so is ballbot.  If we were to turn off, we would fall.


#### So this is cool and all, but why would you want it?


It turns out this balancing like humans thing, called being dynamically stable,
as opposed to statically stable robots which rest on several wheels, makes the 
robot really easy to interact with.


> You can push the ballbot easily in any direction and it will not fall over.
> There is no other robot like this.




### My work

So a lot of work has been done with these robots by several PhD students, with
much more experience than I have.  They have done some cool stuff, like




The work I did was on adding simple speech and vision to the ballbot.





This is a complicated system. There are many different parts working togethr
I learned a lot from working on this system. 







[imu]: https://en.wikipedia.org/wiki/Inertial_measurement_unit
