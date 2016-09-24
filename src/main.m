% Copyright Ben Hageneu and Jacob Killelea
clear all; clc;
addpath(genpath('.')); % add all subdirectories (./src, ./examples, ect) to path

INPUT_FILE  = 'data/Lab1_Input.txt'; % NOTE:: some of the files in data/ are only symlinks! this works fine on a mac/linux/*nix box, but windows is stupid and won't follow them.
% OUTPUT_FILE = 'output_file.txt'; % not used here, instead it's specified inside `truss3d`

truss3d(INPUT_FILE);
