function r --wraps='rg --smart-case' --description 'alias r=rg --smart-case'
  rg --smart-case $argv; 
end
