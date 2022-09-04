function logisim --description 'alias logisim export _JAVA_AWT_WM_NONREPARENTING=1 && logisim'
  export _JAVA_AWT_WM_NONREPARENTING=1 && /bin/logisim $argv & && disown; 
end
