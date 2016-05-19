%{
    Author: Pranav Bajoria
    https://github.com/git-Pranav/Mech140_Matlab
    
    This is the solution to the question Numbered 3/350 from the Textbook
    Engineering Mechanics Dynamics by Meriam/Kraige, Seventh Edition,
    Publisher: Wiley as a part of the Mech140 course at Santa Clara
    University conducted by Dr. Mohammad Ayoubi.

    This script outputs the two answers as:
    theta (the angle at which the ball comes out from the tube) in degrees
    time_exit (the time at which the ball comes out from the tube) in seconds

    It also outputs the graph of time vs distance of the ball in the tube.
    Information after time_exit is inaccurate and should be ignored as such
    because the trajectory of the ball is not determined after it leaves
    the tube and 'r' for which the equation is set up does not make sense
    after r=1m. as such r=1m is our boundary condition of sorts.
    
    This script assumes that the free body analysis of forces is done and
    the eqn1 differential equation is derived. This script is only meant as
    a solver and is made to demonstrate the use of the solve function of
    MATLAB to solve 2nd order differential equations.
%}

function Q3_350

%   This function solves the question. It uses 'dsolve' as the primary
%   function to solve the equation.

%.....System Properties....%
    g = 9.81; %acceleration due to gravite in m/sec^2
    w = 0.5;  %applied constant angular velocity of the tube in rad/sec

%....Time range, chosen arbitrarily, can be increased or decreased according to requirement.....%   
    t = linspace(0,3,100); %Arbitrarily chosen size of the t values matrix for plotting
   
%....Obtained equations and derived initial conditions.....%
    eqn1 = 'D2r = (0.5^2)*r + 9.81*sin(0.5*t)'; %Giving in the equation obtained from the FBD
    
    inits2 = 'r(0)=0, Dr(0)=0'; %Putting in the INITIAL CONDITIONS

%...Solving the differential equation  ...%
    r = dsolve(eqn1,inits2,'t'); %invokes the dsolve method. Solves eqn1 with ICs as inits2, independent variable as t
    
    eqn2 = 'r=1';               %substituting the value of r = 1 m. This is the value of the tube length and the value of r at which the ball just exits the tube
    eqn2 = subs(eqn2);          %update eqn2 with new substitution
    z = eval(vectorize(r));     %Make a vector of y from vector x to be able to plot
    
    time_exit = double(solve(eqn2,'t')); %solve the new updated eqn2 for t and call the solution as time_exit which is the required answer 
    theta = rad2deg(w*time_exit);%convert from radian to degree the final answer 'theta'
    
%...Outputs...%

    disp(['The time the ball will exit the tube = ' , num2str(time_exit) , ' seconds'])
    disp(['The angle at exit of the ball = ' , num2str(theta) , ' degrees'])
   
    plot(t,z);                  %Plot the graph of position vs time
    xlabel('Time (seconds)');
    ylabel('Length of tube at which the ball is (m)');
end