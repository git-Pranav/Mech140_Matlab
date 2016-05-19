%{
    Author: Pranav Bajoria
    https://github.com/git-Pranav/Mech140_Matlab
    
    This is the solution to the question Numbered 3/354 from the Textbook
    Engineering Mechanics Dynamics by Meriam/Kraige, Seventh Edition,
    (Publisher: Wiley) as a part of the Mech140 course at Santa Clara
    University conducted by Dr. Mohammed Ayoubi.

    This script calculates the value of the time in seconds required for
    the angle of the pendulum to reach 90 degrees. It also plots the the
    time as a function of theta. Note that this time is not the linear time
    is the time taken to reach that value of theta. This is why time will
    be on the y-axis and theta on the x-axis. 

    This script assumes that the free body analysis of the forces is done
    and the equations are derived. This script is only meant as a solver
    and a demonstration of how to use the matlab built in integration function.
%}

%...System Properties...%
l  = 0.5;   % Length of pendulum in m
g  = 9.81;  % Acceleration due to gravity in m/s^2
v0 = 0.1;   % Initial velocity at theta = 0 in rad/s

fun = @(theta) (l./(sqrt(g.*sin(theta) + (v0^2))));%Attained from the free body diagram and then separating variables
t = integral(fun,0,pi/2);    % Evaluating the integral

%...Creating values for plotting
theta = 0:0.01:pi;
theta_deg = rad2deg(theta);

for i = 1:length(theta)
    time(i) = integral(fun,0,theta(i));
end
%...Output...%
disp([num2str(t),' seconds'])
plot(theta_deg,time)
xlabel('Angle (deg)');
ylabel('Time (seconds)');
