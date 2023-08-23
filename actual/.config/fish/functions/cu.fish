function cu
  cargo check 2>&1 | r --fixed-strings -- "-->" $argv
end
