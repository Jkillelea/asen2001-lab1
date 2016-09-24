% Copyright Ben Hagenau and Jacob Killelea
function output_cell = truss3d(filepath)
  % Calculates support reaction forces based on the data provided in the input file
  % Returns support reaction data in the cell array output_cell
  % Also outputs data to the file output_file.txt
  %
  OUTPUT_FILE = 'output.txt';

  % all the data from the config file is received inline thusly. See API Guide for details. --------
  [num_forces, force_application_coords, force_vector_coords, num_moments, moment_application_coords, moment_vector_coords, num_supports, support_coords, support_reaction_data] = get_file_input(filepath);


  % Determine the sum of the external forces -------------------------------------------------------
  forces = zeros(num_forces, 3);
  for i = 1:num_forces % each force
    force = cell2mat(force_vector_coords(i, 1:4)); % select a row of cells and convert to a matrix
    forces(i, :) = to_force_vector(force); % plug em all into a matrix for easy summing
  end

  % find the sum of the external forces
  for i = 1:size(forces,2)
    external_force_sum(i) = sum(forces(:, i));
  end

  % Determine the total moment caused by the external forces and couple moments --------------------
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

  % external_moment_sum = sum(moments); % sum them up for the total moment caused by external forces
  for i = 1:size(moments,2)
    external_moment_sum(i) = sum(moments(:, i));
  end

  % We now have the external_force_sum, and the external_moment_sum.
  % With those two and the position vectors of the supports, the magnitude of the reactions at the supports can be calculated

  % Set up force and moment matricies --------------------------------------------------------------
  b = -1 .* [external_force_sum' ; external_moment_sum']; % vertical 1x6 vector. 3 force directions, 3 moment directions
  A = zeros(num_supports, 6); % always 6 columns.
  x = zeros(num_supports, 1); % solving for numer of supports

  % populate the A matrix
  for i = 1:num_supports    % each force/moment
    force_or_moment = support_reaction_data{i, 1};
    direction       = to_unit_vector(cell2mat(support_reaction_data(i, 2:4))); % get the direction into unit vector form
    support_location = cell2mat(support_coords(i, :));

    if force_or_moment == 'F'  % force
      A(1:3, i) = direction';  % note the apostrophe at the end of this call. `direction` is being transposed (so it's assigned to part of a column instead of a row)
      A(4:6, i) = cross(support_location, direction)';
    else                       % moment
      A(4:6, i) = direction';  % same apostrophe here
    end
  end

  % Solve for F1, F2 ... M1, M2 ....
  x = A\b;

  % Put resulting data into cell array so force/moment and magnitude data are in same place
  output_cell = cell(num_supports, 2);
  for i = 1:num_supports
    output_cell{i, 1} = support_reaction_data{i, 1};
    output_cell{i, 2} = x(i);
  end

  % Write data to text file at OUTPUT_FILE
  output(OUTPUT_FILE, filepath, output_cell);
end
