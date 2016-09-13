% Copyright Jacob Killelea
% MIT License
clear all; clc;
addpath(genpath('.')); % add all subdirectories (./src, ./examples, ect) to path

% all the data from the config file is received inline thusly. See API Guide for details. ----------
[num_forces, force_application_coords, force_vector_coords, num_moments, moment_application_coords, moment_vector_coords, num_supports, support_coords, support_reaction_data] = get_file_input('data/Lab1_Input.txt');

% Determine the sum of the external forces ---------------------------------------------------------
forces = zeros(num_forces, 3);
for i = 1:num_forces % each force
  force = cell2mat(force_vector_coords(i, 1:4)); % select a row of cells and convert to a matrix
  forces(i, :) = to_force_vector(force); % plug em all into a matrix for easy summing
end
external_force_sum = sum(forces); % find the sum of the external forces

% get the total moment caused by the external forces and couple moments ----------------------------
moments = zeros(num_moments + num_forces, 3);
for i = 1:num_moments % each moment
  moments(i,:) = to_force_vector(moment_vector_coords(i, :)); % add it (as a vector of [x, y, z] magnitudes) to the matrix
end
for i = (num_moments+1):(num_forces+num_moments)
    j = i - num_moments; % offset so that j = 1 at the start of this for-loop, so the values in the matrix `forces` can be eaily referenced

  r = cell2mat(force_application_coords(j, :)); % pick out a row from the force coords cell, cast as float matrix
  f = forces(j, :);                % retrieve the related forces
  moments(i,:) = cross(r, f);      % the resultant moment is the cross product, r x f.
end
external_moment_sum = sum(moments); % sum them up for the total moment caused by external forces

% Set up force and moment matricies ----------------------------------------------------------------
% We now have the external_force_sum, and the external_moment_sum.
% With those two and the position vectors of the supports, the magnitude of the reactions at the supports can be calculated


% solve?
