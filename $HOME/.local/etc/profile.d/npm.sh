# for local node installation
if [ -d "$HOME/.npm-packages" ] ; then
	NPM_PACKAGES="$HOME/.npm-packages"
elif [ -d "$HOME/.npm-global" ] ; then
	NPM_PACKAGES="$HOME/.npm-global"
fi
if [ -n "$NPM_PACKAGES" ] ; then
	export PATH="$PATH:$NPM_PACKAGES/bin"
	export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
fi
