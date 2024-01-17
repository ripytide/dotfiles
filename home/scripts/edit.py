#!/bin/env python

from subprocess import Popen, PIPE, run

options = {
    "fish functions": "{{home_dir}}/dotfiles/home/.config/fish/functions",
    "neovim": "{{home_dir}}/dotfiles/home/.config/nvim/init.lua",
    "groups": "{{home_dir}}/dotfiles/home/.config/pacdef/groups",
    "hyprland": "{{home_dir}}/dotfiles/home/.config/hypr/hyprland.conf",
    ".config": "{{home_dir}}/dotfiles/home/.config",
}

choices = "\n".join(options.keys())

p1 = Popen(["echo", choices], stdout=PIPE)
p2 = Popen(["rofi", "-dmenu", "-i"], stdin=p1.stdout, stdout=PIPE)
p1.stdout.close()

output = str(p2.communicate()[0])[2:-3]
selection = options[output]

directory = "/".join(selection.split("/")[:-1])

process = run(["wezterm", "-e", "--cwd", directory, "nvim", selection])
