function svim --wraps='sudo -E nvim ' --description 'alias svim=sudo -E nvim '
  sudo -E nvim  $argv; 
end
