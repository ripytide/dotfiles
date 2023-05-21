function cu --wraps='cargo check 2>&1 | r --fixed-strings -- "-->"' --description 'alias cu cargo check 2>&1 | r --fixed-strings -- "-->"'
  cargo check 2>&1 | r --fixed-strings -- "-->" $argv
        
end
