#!/usr/bin/python3

import os
import subprocess
import socket

subprocess.run(["cp", "-a", "/home/ripytide/dotfiles/actual/.", "/home/ripytide"])

all_dotfiles = []
# traverse root directory, and list directories as dirs and files as files
for root, dirs, files in os.walk("/home/ripytide/dotfiles/actual"):
    # print(os.path.basename(root))
    for file in files:
        all_dotfiles.append(root + "/" + file)


def new_location(old):
    return old.replace("/home/ripytide/dotfiles/actual/", "/home/ripytide/")


hostname = socket.gethostname()

variables = {"muncher": {"$MONITOR": "eDP-1", "$UNDODIR": "~/sync/undodir"}, "nipper": {"$MONITOR": "HDMI-2", "$UNDODIR": "~/undodir"}}

for dotfile in all_dotfiles:
    with open(dotfile) as input:
        string = input.read()
        for (key, value) in variables[hostname].items():
            string = string.replace(key, value)

        with open(new_location(dotfile), "w") as output:
            output.write(string)

        print(f"Processed: {dotfile}->{new_location(dotfile)} Successfully!")

print(f"\n\nDotfiles Compiled Successfully!\nHostname={hostname}")
