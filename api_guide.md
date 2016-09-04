# API GUIDE:
### styled in markdown
-------------
* function: `get_file_input`
  * params: `filepath`
      * type: string file path, either relative or absolute


  * returns: `[num_forces, force_application_coords, force_vector_coords, num_moments, moment_application_coords, moment_vector_coords, num_supports, support_coords, support_reaction_data]`
    * `num_forces`                : int
    * `force_application_coords`  : matrix, doubles, size = [num_forces, 3], (format:: x, y, z)
    * `force_vector_coords`       : matrix, doubles, size = [num_forces, 4] (format:: magnitude, x, y, z)
    * `num_moments`               : int
    * `moment_application_coords` : matrix, doubles, size = [num_moments, 3],(format:: x, y, z)
    * `moment_vector_coords`      : matrix, doubles, size = [num_moments, 4], (format:: magnitude, x, y, z)
    * `num_supports`              : int
    * `support_coords`            : matrix, doubles, size = [num_supports, 3], (format:: x, y, z)
    * `support_reaction_data`     : cell, 1st column chars, all others doubles, size = [num_supports, 4] (format:: type(F/M), x, y, z)
