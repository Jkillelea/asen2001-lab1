# [API](https://en.wikipedia.org/wiki/Application_programming_interface) GUIDE:
### styled in [markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/)
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
|`support_coords`           |cell of doubles |[num_supports, 3]|(x, y, z)|
|`support_reaction_data`    |cell of 2 types |[num_supports, 4]|1st col chars ('F'/'M'), rest doubles (x, y, z)|

-------------
* **function**: `next_non_comment_line`
  * **params**: `fileID`
    * type: int file ID, from the matlab command `fopen`
  * **returns**: `line`, a string containing the next line that _doesn't_ begin with '#'
  * **description**: reads through a file and returns the next line that doesn't begin with '#'. Calling this function again will return the *next* line that doesn't begin with '#'.

-------------
