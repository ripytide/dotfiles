function check --wraps=cargo\ check\ --all-targets\ 2\>\&1\ \|\ rg\ -i\ --multiline\ \"\(^error.\*\\n.\*\)\|\(aborting\)\|\(warnings\)\" --description alias\ check=cargo\ check\ 2\>\&1\ \|\ rg\ -i\ --multiline\ \"\(^error.\*\\n.\*\)\|\(aborting\)\|\(warnings\)\"
  cargo check 2>&1 | rg -i --multiline "(^error.*\n.*)|(aborting)|(warnings)" $argv; 
end
