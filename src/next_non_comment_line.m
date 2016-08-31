function line = next_non_comment_line(fileID)
  line = fgets(fileID);
  while (line(1) == '#')
    line = fgets(fileID);
  end
end
