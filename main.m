% Simulate, plot, and animate a spring mass damper
% Author: Andrew Peekema

% Cleanup
clc       % Clear the command prompt
clear all % Remove all workspace variables
close all % Close all figure windows

% Initial state conditions
X0 = [1 ... % position (m)
      0];   % velocity (m/s)

% Constants
c.m  = 1;  % mass (kg)
c.c  = 1;  % damper (N*s/m)
c.k  = 20; % spring (N/m)
c.F  = 0;  % force (N)
c.l0 = 1;  % Spring rest length (m)

% Simulate the system
sol = springMassDamperSim(X0,c);

% Plot the position of the mass
plot(sol.t,sol.X(:,1),'.');
title('Mass Response')
xlabel('Time (s)')
ylabel('Position (m)')

% Animate the mass
exportVideo = false;
animation(c,sol,exportVideo);
