#!/bin/bash

# This script changes the terminal bindings so that you can set ctrl+C and
# ctrl+V to copy and paste respectively
# Note: process interrupt is rebound to ctrl+X and escaped char (aka lnext) is 
# rebound to ctrl+L
# use `stty -a` to see current settings and `stty -g` to generate stty hex
# code, and `stty <hex code>` to load complete stty settings
# Note: binding anything to ^I breaks tab completion, reason unknown

if [ ! -z $(echo "$-" | grep -o i) ]
then
# interactive shells only
	stty intr ^X lnext ^L
fi
