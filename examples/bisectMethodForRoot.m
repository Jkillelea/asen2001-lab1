%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The purpose of this program is to find the value of x for a single 
% nonlinear function where f(x)=0.
% The user will provide the equation for f(x); the interval [a,b] within 
% which the root lies; the convergence tolerance i.e. how close do we want 
% to be to the answer.
% The program determines the value of x where f(x)=0 and prints x and f(x).
% In computing the root the program assumes the function is continuous and
% that only one root exist within the given interval [a,b].
% 
% Created: 08/28/16
% Modified: 08/28/16
% Jelliffe Jackson, 08/28/16
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Housekeeping: clear all variables and close all plots
clear all; 
close all;



% Specify the function for f(x).
f=@(x) 0.5*x-2;

% Set the input variables
% Interval a,b; convergence tolerance; maximum number of iterations
a = 0.0;
b = 6.0;
tol = 10^-6;
max_iter = 1000;


% Begin iterative procedure.
for i = 1:1:max_iter
    % Calculate the mid-point, p
    p = (a+b)/2;
    
    % If f(p) has the same sign as f(b) set b=p, otherwise, set a=p
    if f(p)*f(b) > 0 
        b = p;
    else
        a = p;
    end
    
    % If the absolute value of (b-a) is less than the convergence 
    % tolerance, print the solution and end the program
    if abs(a-b) <= tol
        fprintf('The converged root of the function is %f\n',p)
        fprintf('The function value at the converged root is %f\n',f(p))
        break
    end   
    
    % If the number of iterations is less than the maximum number of 
    % iterations go back step 4
end

% If the number of iterations is equal to the maximum number of iterations,
% print Mmaximum number of iterations exceeded? and end the program
if i==max_iter
    fprintf('Maximum number of iterations, %d exceeded\n',i)
end