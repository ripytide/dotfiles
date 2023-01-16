#!/usr/bin/python3

import os
import subprocess

subprocess.run(["cp", "-a", "/home/ripytide/dotfiles/actual/.", "/home/ripytide"])

all_dotfiles = []
# traverse root directory, and list directories as dirs and files as files
for root, dirs, files in os.walk("/home/ripytide/dotfiles/actual"):
    # print(os.path.basename(root))
    for file in files:
        all_dotfiles.append(root + "/" + file)


def new_location(old):
    return old.replace("/home/ripytide/dotfiles/actual/", "/home/ripytide/")


for dotfile in all_dotfiles:
    command = (
        f'cat "{dotfile}" | sed \'s/\\$MONITOR/eDP1/g\' | tee "{new_location(dotfile)}"'
    )
    print(command)
    subprocess.getoutput(command)
