function wf
  cargo check 2>&1 | r -F -- "-->" $argv; 
end
