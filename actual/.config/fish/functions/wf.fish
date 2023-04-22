function wf --wraps='cargo check 2>&1 | r -F -- "-->"' --description 'alias wf cargo check 2>&1 | r -F -- "-->"'
  cargo check 2>&1 | r -F -- "-->" $argv; 
end
