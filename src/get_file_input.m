function [] = get_file_input(filepath)
  % handles file reading
  fileID = fopen(filepath);

  line = fgets(fileID);
  while line > -1 % fgets returns -1 for End Of File (EOF)
    if sum(line(1) == '#')
      % nothing
    else
      disp(line);
    end

    line = fgets(fileID);
  end


end
