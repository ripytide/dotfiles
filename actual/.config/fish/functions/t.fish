function t --wraps='cargo test' --description 'alias t=cargo test'
  cargo test $argv; 
end
