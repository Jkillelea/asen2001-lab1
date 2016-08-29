function [] = get_file_input(filepath)
  % handles file reading
  fileID = fopen(filepath);

  line = 0;
  while line > -1 % fgets returns -1 for End Of File (EOF)
    line = fgets(fileID);
    disp(line);
  end


end
