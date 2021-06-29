# Defined via `source`
function cfg --wraps='/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME' --description 'alias cfg=/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME $argv; 
end
