%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The purpose of this function is to read the number of variables,
% the coefficients of the equation and the constants, from an input .txt
% file required to solve a system of linear equations.
% The function takes in the file name to be read and returns the number of
% variables, the coefficients and the constants.
%
% Created: 08/29/16
% Modified: 08/29/16
% Jelliffe Jackson
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [NoVar,Coeff,Const] = readInput(input)

% Open the input file
fileID = fopen(input,'r');

% read in textline and ignore
textline = fgets(fileID);

% read in the number of variables
textline = fgets(fileID);
NoVar = str2num(textline);

% ignore the next line
textline = fgets(fileID);

% read in the coefficients of the equations
Coeff = zeros(NoVar);
textline = fgets(fileID);
ReadCoeff = str2num(textline);
Coeff(1,:) = ReadCoeff;
textline = fgets(fileID);
ReadCoeff = str2num(textline);
Coeff(2,:) = ReadCoeff;


% ingnore the next line
textline = fgets(fileID);

% read in the constants of the equations
Const = zeros(NoVar,1);
textline = fgets(fileID);
ReadConst = str2num(textline);
Const = ReadConst';

fclose(fileID);
end
