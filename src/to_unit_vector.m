% DEPRECATED
% DO NOT USE

function [x, y, z] = to_unit_vector(dx, dy, dz)
  disp('WARNING:: to_unit_vector is a deprecated function');
  vector_magnitude = magnitude([dx, dy, dz]);

  x = dx/vector_magnitude;
  y = dy/vector_magnitude;
  z = dz/vector_magnitude;
end
