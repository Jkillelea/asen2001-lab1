%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The purpose of this program is to solve a linear system of equations.
% Given the number of variables, the coefficients and the constant in a
% .txt file, the program computes the solution and prints the solutions to
% the screen.
% 
% Created: 08/29/16
% Modified: 08/29/16
% Jelliffe Jackson
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Housekeeping
clear all;
close all;
clc;

% Read input
[NoVar,Coeff,Const] = readInput('solve_linear_example.txt')

% Formulate matrices and solve system
Soln = formulateAndSolve(NoVar,Coeff,Const)

% Print output
printOutput(Soln)