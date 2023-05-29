function ls --wraps='exa -l --icons' --description 'alias ls exa -l --icons'
  exa --long --icons --group-directories-first --git $argv
        
end
