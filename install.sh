#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "Installing home directory customizations..."
echo "... backing up existing profile files ..."
if [ -f "$HOME/.bash_profile" ] ; then
	mv "$HOME/.bash_profile" "$HOME/.bash_profile.backup$(date '+%Y%m%dT%H%M%S')"
fi
if [ -f "$HOME/.bashrc" ] ; then
	mv "$HOME/.bashrc" "$HOME/.bashrc.$(date '+%Y%m%dT%H%M%S').backup"
fi
if [ -f "$HOME/.profile" ] ; then
	mv "$HOME/.profile" "$HOME/.profile.$(date '+%Y%m%dT%H%M%S').backup"
fi
if [ -f "$HOME/.condarc" ] ; then
	mv "$HOME/.condarc" "$HOME/.condarc.$(date '+%Y%m%dT%H%M%S').backup"
fi
if [ -f "$HOME/.vimrc" ] ; then
	mv "$HOME/.vimrc" "$HOME/.vimrc.$(date '+%Y%m%dT%H%M%S').backup"
fi
if [ -d "$HOME/.local/profile.d"] ; then
	tar -czf "$HOME/.local_profile.d.$(date '+%Y%m%dT%H%M%S').backup.tar.gz" "$HOME/.local/profile.d"
fi
echo "... copying files ..."

# WARNING: `rsync -rav '$HOME/' "$HOME/"` it breaks SSH
rsync -rav '$HOME/' "$HOME/" || chmod 750 "$HOME"
chmod 750 "$HOME"
# done
source "$HOME/.bash_profile"
echo "...Done installing home directory customizations"

