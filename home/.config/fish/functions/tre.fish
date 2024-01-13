function tre
  fd --type f --hidden --exclude .git | tree --fromfile $argv; 
end
