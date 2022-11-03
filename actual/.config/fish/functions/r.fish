function r --wraps='rg --smart-case' --description 'alias r=rg --smart-case'
  rg --smart-case --sort path $argv; 
end
