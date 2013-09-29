# Actuator Dynamics Template Code
This is template code to simulate the response of a spring mass damper system.  It was created for Oregon State University's ME 536 (Actuator Dynamics) class.

## What can the code do?
This code uses MATLAB (specifically ode45) to simulate the dynamic response of the system.  It then plots the position response of the mass, and shows an animation of said system.
There is an option to export the animation to pngs.  For Linux users there is a bash script (png2avi.sh) to combine them into an avi using mencoder.  Use Google to see how to export video from MATLAB if you run a different operating system.

## How do I use the code?
Open MATLAB in the root folder of this code, and run main.m.  It should simulate the system, and then pop up a figure with a plot and a figure with an animation.
