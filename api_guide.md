# [API](https://en.wikipedia.org/wiki/Application_programming_interface) GUIDE:
### Styled in [markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/)
### Trouble viewing this file? See it at https://github.com/Jkillelea/asen2001-lab1/blob/master/api_guide.md
-------------
* **function**: `get_file_input`
  * **params**: `filepath`
    * type: string file path, either relative or absolute
  * **returns**: `[num_forces, force_application_coords, force_vector_coords, num_moments, moment_application_coords, moment_vector_coords, num_supports, support_coords, support_reaction_data]`
  * **description**: parses a file formatted like the one `data/`

|name                       |type            |size             |format|
|----                       |----            |----             |------|
|`num_forces`               |int             |n/a              |n/a|
|`force_application_coords` |cell of doubles |[num_forces, 3]  |(x, y, z)|
|`force_vector_coords`      |cell of doubles |[num_forces, 4]  |(magnitude, x, y, z)|
|`num_moments`              |int             |n/a              |n/a|
|`moment_application_coords`|cell of doubles |[num_moments, 3] |(x, y, z)|
|`moment_vector_coords`     |cell of doubles |[num_moments, 4] |(magnitude, x, y, z)|
|`num_supports`             |int             |n/a              |n/a
|`support_coords`           |cell of doubles |[num_supports, 3]|(x, y, z)|
|`support_reaction_data`    |cell of 2 types |[num_supports, 4]|1st col chars ('F'/'M'), rest doubles (x, y, z)|

-------------
* **function**: `truss3d`
  * **params**: `filepath`
    * type: string path to file containing valid input data
  * **returns**: `output_data`, a 2x6 Cell array containing the magnitude and type (force or moment) of the reaction generated at each support.
  * **description**: this function contains all of the main functionality of the program, and should be the only function called by the end user. It also writes this data, along with the input data, to the file `output.txt`.
  * **example:**
    ```matlab
    >> truss3d('data/Lab1_Input.txt')

    ans =

        'F'    [ -45.7217]
        'F'    [-112.1199]
        'F'    [  37.1298]
        'F'    [ 103.3686]
        'M'    [  93.8843]
        'M'    [  29.7894]
    ```


-------------
* **function**: `next_non_comment_line`
  * **params**: `fileID`
    * type: int file ID, from the matlab command `fopen`
  * **returns**: `line`, a string containing the next line that _doesn't_ begin with '#'
  * **description**: reads through a file and returns the next line that doesn't begin with '#'. Calling this function again will return the *next* line that doesn't begin with '#'.
  * **example:**
    ```matlab
    file = 'this is line 1'
           '# this is a comment line'
           'this is line 3'

    fileID = fopen('path/to/file', 'r'); % open file for reading

    next_non_comment_line(fileID);
      = 'this is line 1'
    next_non_comment_line(fileID); % the line that started with a '#' is skipped
      = 'this is line 3'  
    ```

-------------
* **function**: `magnitude`
  * **params**: `[x, y, z]`
    * type: 1x3 numeric vector
  * **returns**: `m`, a scalar
  * **description**: performs the operation sqrt(x^2 + y^2 + z^2)
  * **example**:
    ```matlab

    magnitude([3, 4, 0]) % => 5
    ```

-------------
* **function**: `to_force_vector`
  * **params**: `force`, which is composed of `[f, dx, dy, dz]`
    * type: 1x4 numeric vector *or* cell.
  * **returns**: `vector`, a 1x3 numeric vector of magnitude `f`, pointing in the direction of `[dx, dy, dz]`
  * **description**: Given a magnitude and direction, returns a 3D vector pointing in that direction, of the magnitude given.
  * **example**:
    ```matlab

    to_force_vector([10, 1, 2, 3]) % => [2.6726, 5.3452, 8.0178]
    ```

-------------
* **function**: `to_unit_vector`
  * **params**: `vector`, which composed of `[x, y, z]`
    * type: 1x3 numeric vector *or* cell.
  * **returns**: `unit_vector`, a 1x3 vector containing `x`, `y`, and `z`, all divided by the magnitude of the input vector.
  * **description**: returns `[x, y, z] ./ magnitude([x, y, z])`
  * **example**:
    ```matlab
    unit = to_unit_vector([1, 2, 3]) % => [0.2673 0.5345 0.8018]

    magnitude(unit)                  % => 1
    ```

-------------
* **function**: `output`
  * **params**: `outfile_path`, a text filepath, and `data_cell`, a [N, 2] cell array
    * type: `data_cell` should have the first column as chars, representing either forces or moments, and second column floats, representing magnitudes
  * **returns**: nothing
  * **description**: Writes the data in `data_cell` to the file `outfile_path`
  * **example**:
    ```matlab
    data_cell =
    'F'    [ -45.7217]
    'F'    [-112.1199]
    'F'    [  37.1298]
    'F'    [ 103.3686]
    'M'    [  93.8843]
    'M'    [  29.7894]

    outfile_path = 'output_file.txt'

    output(outfile_path, data_cell);
    ```
-------------
