%{
    Author: Pranav Bajoria
    https://github.com/git-Pranav/Mech140_Matlab
    
    This is the solution to the question Numbered 3/354 from the Textbook
    Engineering Mechanics Dynamics by Meriam/Kraige, Seventh Edition,
    (Publisher: Wiley) as a part of the Mech140 course at Santa Clara
    University conducted by Dr. Mohammed Ayoubi.

    This script outputs the maximum value of the Velocity and the Reaction
    force and the angles at which they occur. It also plots the reaction
    force (N) and Velocity (v) as a function of the angle (theta).
    
    Note that on the plot the angle is in radians and not degrees. This can
    be changed as per the requirement of the user. 

    This script assumes that the free body analysis of the forces is done
    and the equations are derived. This script is only meant as a solver
    and a demonstration of how to use the ode45 funtion as a method to
    solve first order differential equations.
%}

%....System Properties.....%
g  = 32.185; % Acceleration due to gravity in ft/s^2
m  = 1.8;    % Mass of the particle in lbs 
r  = 1.5;    % Radius of the circular path in ft
k  = 0.2;    % Drag parameter in lb-sec/ft

%...Conditions....%
theta_span = [0 (0.9*pi)];  % Range of angle we are interested in
v0 = 1;                     % Initial condition which is given

%...This is the main solver method used. Please see matlab api
%documentation for more information...%
[theta,v] = ode45(@(theta,v) (g*r*cos(theta)/v - k*r/m), theta_span, v0);

%This is the equation for the reaction force derived from the FBD%
N = m*g.*sin(theta) + m.*(v.^2)./r;

%...Output...%
theta_deg = rad2deg(theta)
plot(theta_deg,v,'color','red');
xlabel('Angle (deg)');
ylabel('Reaction Force (lb), Velocity (ft/sec)');
hold on                         % hold is a function that helps to plot 2 or more curves on the same graph.
plot(theta_deg,N,'color','blue');
hold off
[maxV, maxV_index] = max(v);    % Determines the max value and the index at which it occurs
[maxN, maxN_index] = max(N);
maxV_theta = rad2deg(theta(maxV_index)); %Using the index returned for the max value and converting that value of theta into degrees
maxN_theta = rad2deg(theta(maxN_index));

%...Output String construction...%
displayForVel = ['Max value of Velocity = ' , num2str(maxV) , ' ft/sec @ ' , num2str(maxV_theta) ,' degrees'];
displayForN = ['Max value of Reaction force = ' , num2str(maxN) , ' lb @ ' , num2str(maxN_theta) ,' degrees'];

%...Display Answers...%
disp(displayForVel)
disp(displayForN)