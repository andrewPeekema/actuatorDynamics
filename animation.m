function animation(c,sol,exportVideo)
% 3D Visualization Template
% Input
%   c: Simulation constants
%   sol: Simulation solution
%   exportVideo: Should the video be exported? (True/False)
% Output
%   An animation
% By Andrew Peekema

% For SE3
addpath('groupTheory')
% For 
addpath('visualization')

% Create objects
massSide = 0.1; % m
massObj = CubeClass(massSide);
wallObj = CubeClass(100);
springObj = SpringClass;

% Create a figure handle
h.figure = figure;

% Put the shapes into a plot
massObj.plot
wallObj.plot
springObj.plot

% The wall doesn't move over time
wallObj.globalMove(SE3([-50 0 0]));
wallObj.updatePlotData

% Figure properties
view(2)
title('Simulation')
xlabel('x Position (m)')
ylabel('y Position (m)')
zlabel('z Position (m)')

% Speed up if watching in realtime
if exportVideo
    frameStep = 3;
else
    frameStep = 8;
end

% Iterate over state data
for it = 1:frameStep:length(sol.t)
    x = sol.X(it,1);

    % Set axis limits
    axis([-0.1 1.9 ... % x
          -1.0 1.0 ... % y
          -1.0 1.0]);  % z

    % Mass position
    massObj.resetFrame
    massObj.globalMove(SE3([c.l0+x+massSide/2 0 0]));

    % Spring position
    springObj.updateState(SE3,c.l0+x);

    % Update data
    massObj.updatePlotData
    springObj.updatePlotData

    % Draw figure
    drawnow

    % Save the frames
    if exportVideo
        frame = getframe(h.figure);
        imwrite(frame.cdata, sprintf('./video/%04d.png',it));
    end
end % for it = ...

end % RobotAnimation
