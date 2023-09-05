# for local node installation
if [ -d "$HOME/.nvm" ] ; then
	# nvm installed, load nvm and bash completion
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	# add node to path var
	NODE_BIN_DIR="$NVM_DIR/versions/node/$(nvm current || echo '_')/bin"
	if [ -d "$NODE_BIN_DIR" ] ; then
		export PATH="$PATH:$NODE_BIN_DIR"
	fi
else
	# nvm not detected, check for straight npm install
	if [ -d "$HOME/.npm-packages" ] ; then
		NPM_PACKAGES="$HOME/.npm-packages"
	elif [ -d "$HOME/.npm-global" ] ; then
		NPM_PACKAGES="$HOME/.npm-global"
	fi
	if [ -n "$NPM_PACKAGES" ] ; then
		export PATH="$PATH:$NPM_PACKAGES/bin"
		export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
	fi
fi
