# set PATH so it includes user's private bin if it exists

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Source all files in ~/.local/etc/profile.d
SRC_FILES="$(find $HOME/.local/etc/profile.d -type f -not -name '.*')"
for PROFILE_SRC in $SRC_FILES
do
	# note: source command does not work in for-loops in bash
	. "$PROFILE_SRC"
done

