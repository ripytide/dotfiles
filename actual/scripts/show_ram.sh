#! /bin/sh

free -h | head -n 2 | awk "{print \$1, \$2, \$3}"
