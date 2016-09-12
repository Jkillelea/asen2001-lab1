% Copyright Jacob Killelea
% MIT License

addpath(genpath('.')); % add all subdirectories (./src, ./examples, ect) to path
clear all; clc;

[num_forces, force_application_coords, force_vector_coords, num_moments, moment_application_coords, moment_vector_coords, NUM_SUPPORTS, support_coords, support_reaction_data] = get_file_input('data/Lab1_Input.txt')
