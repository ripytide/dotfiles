#!/usr/bin/python3

import os
import subprocess
import socket

subprocess.run(["cp", "-a", "/home/jamesforester/dotfiles/actual/.", "/home/jamesforester"])

all_dotfiles = []
# traverse root directory, and list directories as dirs and files as files
for root, dirs, files in os.walk("/home/jamesforester/dotfiles/actual"):
    # print(os.path.basename(root))
    for file in files:
        all_dotfiles.append(root + "/" + file)


def new_location(old):
    return old.replace("/home/jamesforester/dotfiles/actual/", "/home/jamesforester/")


hostname = socket.gethostname()
variables = {"muncher": {"$MONITOR": "eDP-1", "$UNDODIR": "~/sync/undodir", "$KEYBOARD": "AT Translated Set 2 keyboard"}, "nipper": {"$MONITOR": "HDMI-2", "$UNDODIR": "~/undodir", "$KEYBOARD": "Dell KB216 Wired Keyboard"}, "C273": {"$KEYBOARD": "Lenovo Lenovo Traditional USB Keyboard", "$UNDODIR": "~/undodir"}}

for dotfile in all_dotfiles:
    with open(dotfile) as input:
        print(f"Opening {dotfile}")
        string = input.read()
        for (key, value) in variables[hostname].items():
            string = string.replace(key, value)

        with open(new_location(dotfile), "w") as output:
            output.write(string)

        print(f"Processed: {dotfile}->{new_location(dotfile)} Successfully!")

print(f"\n\nDotfiles Compiled Successfully!\nHostname={hostname}")
