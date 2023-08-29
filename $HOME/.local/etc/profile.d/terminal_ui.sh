#!/bin/bash

# Options related to the terminal GUI experience

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
# and PS1 variable for terminal prompt interface
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
	export PS1="\[\033[00;35m\]\D{%Y-%m-%dT%H:%M:%S%z}\[\033[00m\] \[\033[01;32m\]\u@\H:\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\n\[\033[00;36m\]"'$(if [ -n "$CONDA_DEFAULT_ENV" ] ; then echo "(conda:$(basename "$CONDA_DEFAULT_ENV"))" ; fi)'"\[\033[00m\]\$ "
else
	export PS1="[\D{%Y-%m-%dT%H:%M:%S%z}] \u@\H:\w\n"'$(if [ -n "$CONDA_DEFAULT_ENV" ] ; then echo "(conda:$(basename "$CONDA_DEFAULT_ENV"))" ; fi)'"\$ "
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	export PS1="\[\e]0;\u@\h: \w\a\]$PS1"
	;;
*)
	;;
esac

# enable programmable completion features (if not already enabled)
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

