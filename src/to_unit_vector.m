function [x, y, z] = to_unit_vector(dx, dy, dz)
  vector_magnitude = magnitude(dx, dy, dz);

  x = dx/vector_magnitude;
  y = dy/vector_magnitude;
  z = dz/vector_magnitude;
end
