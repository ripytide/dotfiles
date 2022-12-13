#!/usr/bin/env sh

# mindepth 2 so it doesn't delete any of the root folders for the
# different cameras
find /media/disk2/recordings/ -mindepth 2 -mtime +240 -delete
