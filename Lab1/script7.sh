#!/bin/bash
grep -h -o "[a-zA-Z0-9_\.-]\+@[a-zA-Z0-9]\+\.[a-zA-Z0-9]\+" /etc/* 2> /dev/null | awk '{printf "%s, ",$1}' > emails.lst
