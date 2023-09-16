#!/usr/bin/python3

import os
import subprocess
import socket

subprocess.run(["mkdir", "/home/ripytide/undodir"])

subprocess.run(["cp", "-a", "/home/ripytide/dotfiles/actual/.", "/home/ripytide"])

all_dotfiles = []
# traverse root directory, and list directories as dirs and files as files
for root, dirs, files in os.walk("/home/ripytide/dotfiles/actual"):
    # print(os.path.basename(root))
    for file in files:
        all_dotfiles.append(root + "/" + file)


def new_location(old):
    return old.replace("/home/ripytide/dotfiles/actual/", "/home/ripytide/")


variables = {
    "sipper": {
        "$MONITOR": "eDP-1",
        "$KEYBOARD": "AT Translated Set 2 keyboard",
        "&HOME": "/home/ripytide",
    },
    "nipper": {
        "$MONITOR": "HDMI-A-2",
        "$KEYBOARD": "Dell KB216 Wired Keyboard",
        "&HOME": "/home/ripytide",
    },
    "devourer": {
        "$MONITOR": "DP-1",
        "$KEYBOARD": "Razer Razer BlackWidow Chroma",
        "&HOME": "/home/ripytide",
    },
    "spooner": {
        "$MONITOR": "NOT_APPLICABLE",
        "$KEYBOARD": "NOT_APPLICABLE",
        "&HOME": "/home/ripytide",
    },
}

hostname = socket.gethostname()

for dotfile in all_dotfiles:
    with open(dotfile) as input:
        try:
            string = input.read()
            for key, value in variables[hostname].items():
                string = string.replace(key, value)

            with open(new_location(dotfile), "w") as output:
                output.write(string)

            print(f"Processed: {dotfile}->{new_location(dotfile)} Successfully!")
        except:
            print(f"Non-Text File, Ignoring!")

print(f"\n\nDotfiles Compiled Successfully!\nHostname={hostname}")
