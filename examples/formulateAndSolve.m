%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The purpose of this function is to formaulate the system of linear 
% equations so that they can be solved with matrix methods. 
% The program takes in the number of variables, the coefficients and
% constants and return the solution to the linear system of equations
% 
% Created: 08/29/16
% Modified: 08/29/16
% Jelliffe Jackson
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function solution = formulateAndSolve(Vars,Coeffs,Consts)

% set up LHS coefficient matrix
A = Coeffs;

% set up RHS constants matrix
b = Consts;

% solution of the linear system
solution = A\b;

end

