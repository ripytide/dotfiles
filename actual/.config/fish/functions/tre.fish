function tre --wraps='fd --type f --hidden --exclude .git | tree --fromfile' --description 'alias tre=fd --type f --hidden --exclude .git | tree --fromfile'
  fd --type f --hidden --exclude .git | tree --fromfile $argv; 
end
