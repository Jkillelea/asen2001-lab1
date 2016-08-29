%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The purpose of this function is to print the solution to the system of
% linear equations to the screen.
% This program takes in the solutions and prints it to the screen
% 
% Created: 08/29/16
% Modified: 08/29/16
% Jelliffe Jackson
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function printOutput(soln)

% print the variables to the screen

for i = 1:length(soln)
fprintf('Variable %i = %f\n',i,soln(i))
end

end