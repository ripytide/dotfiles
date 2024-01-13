function c --wraps=check --description 'alias c=check'
	cargo check 2>&1 | rg -i --multiline "(^error.*\n.*)|(aborting)|(warnings)" $argv
end
