%{
    Author: Pranav Bajoria
    https://github.com/git-Pranav/Mech140_Matlab
    
    This is the solution to the question Numbered 3/343 from the Textbook
    Engineering Mechanics Dynamics by Meriam/Kraige, Seventh Edition,
    (Publisher: Wiley) as a part of the Mech140 course at Santa Clara
    University conducted by Dr. Mohammed Ayoubi.

    This script outputs the range of theta for which a stationary  value of
    angular momentum is possible. 
    
    This script assumes that the free body analysis of forces is done and
    the eqn1 differential equation is derived. 
%}

warning('off','all'); %Switching off all warnings.

%....System Properties......%
r =  0.2;   % Radius in m
g = 9.81;   % Acceleration due to gravity in m/s^2
us = 0.2;   % Coefficient of friction
w = 6;      % Angular velocity in rad/s

%defining symbolic variable theta
syms theta;

%define the derviced equations for both the cases so that it can be solved
eqnForThetaMax = (sin(theta)-us*cos(theta))/(cos(theta)+us*sin(theta)) - (r/g)*(1+sin(theta))*(w^2) == 0;
eqnForThetaMin = (sin(theta)+us*cos(theta))/(cos(theta)-us*sin(theta)) - (r/g)*(1+sin(theta))*(w^2) == 0;

%use 'solve' to solve the equations. Note that it is being converted to
%double and then being converted to degrees. So the final answer is in
%degrees
theta_max = radtodeg(double(solve(eqnForThetaMax, theta, 'Real', true, 'PrincipalValue',true))); %Real, true is so that it returns only real values, Principal value is to ignore other values
theta_min = radtodeg(double(solve(eqnForThetaMin, theta, 'Real', true, 'PrincipalValue',true)));

%...Display answer...%
display(['Range is : ',num2str(theta_min), ' <= Theta <= ', num2str(theta_max), ' in degrees']); %answer in degrees
