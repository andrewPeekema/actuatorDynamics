function sol = springMassDamperSim(X0,c)
% Simulates the time response of a spring mass damper
% Given
%   X0:  initial state [position velocity]
%   c.m: mass (kg)
%   c.c: damping coefficient (N*s/m)
%   c.k: spring coefficient (N/m)
%   c.F: constant force (N)
% Returns
%   sol.t: time vector
%   sol.X: state matrix (position and velocity)
% Author: Andrew Peekema

% Unpack constants
m = c.m;
k = c.k;
F = c.F;
c = c.c;

% Simulation tolerances
options = odeset(...
    'RelTol', 1e-9, ...
    'AbsTol', 1e-9);

% Simulate the dynamics over a time interval
[sol.t sol.X] = ode45(@dynamics,[0:0.01:5], X0, options);

function dX = dynamics(t,X)
    % t == time
    % X == the state
    x  = X(1); % Position
    dx = X(2); % Velocity

    % Return the state derivative
    dX = zeros(2,1);
    dX(1) = dx;                 % Velocity
    dX(2) = (F - c*dx - k*x)/m; % Acceleration
end % dynamics

end % springMassDamperSim
