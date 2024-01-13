#!/bin/env python

from subprocess import Popen, PIPE, run

options = {
    "fish functions": "&HOME/dotfiles/actual/.config/fish/functions",
    "neovim": "&HOME/dotfiles/actual/.config/nvim/init.lua",
    "groups": "&HOME/dotfiles/actual/.config/pacdef/groups",
    "hyprland": "&HOME/dotfiles/actual/.config/hypr/hyprland.conf",
    ".config": "&HOME/dotfiles/actual/.config",
}

choices = "\n".join(options.keys())

p1 = Popen(["echo", choices], stdout=PIPE)
p2 = Popen(["rofi", "-dmenu", "-i"], stdin=p1.stdout, stdout=PIPE)
p1.stdout.close()

output = str(p2.communicate()[0])[2:-3]
selection = options[output]

directory = "/".join(selection.split("/")[:-1])

process = run(["wezterm", "-e", "--cwd", directory, "nvim", selection])
