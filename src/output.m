% Copyright Ben Hageneu and Jacob Killelea
function [] = output(outfile_path, infile_path, data_cell)
  % fprintf(fileID,formatSpec,A1,...,An) writes to a file nicely

  infile  = fopen(infile_path,  'r');
  outfile = fopen(outfile_path, 'w'); % discard previous contents of file

  if(outfile == -1) % coudln't open file
    outfile = 1;    % redirect to STDOUT
  end

  fprintf(outfile, '# Output file for problem data in %s\n# Software and associated data is Copyright Ben Hagenau and Jacob Killelea 2016\n#####################\n', infile_path );

  line = fgets(infile);
  while line ~= -1
    fprintf(outfile, line);
    line = fgets(infile);
  end

  fprintf(outfile, '# type (F/M) and magnitude of reaction forces\n');
  fprintf(outfile, '# type  magnitude\n');

  num_lines = size(data_cell, 1);
  for i = 1:num_lines
    force_or_moment = data_cell{i, 1};
    magnitude       = data_cell{i, 2};
    fprintf(outfile, '%s       %f\n', force_or_moment, magnitude);
  end

  fclose(infile);
  fclose(outfile);
end
