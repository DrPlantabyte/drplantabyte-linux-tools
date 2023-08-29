#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "Installing home directory customizations..."
echo "... backing up existing profile files ..."
if [ -f "$HOME/.bash_profile" ] ; then
	mv "$HOME/.bash_profile" "$HOME/.bash_profile.backup$(date '+%Y%m%dT%H%M%S')"
fi
if [ -f "$HOME/.bashrc" ] ; then
	mv "$HOME/.bashrc" "$HOME/.bashrc.backup$(date '+%Y%m%dT%H%M%S')"
fi
if [ -f "$HOME/.profile" ] ; then
	mv "$HOME/.profile" "$HOME/.profile.backup$(date '+%Y%m%dT%H%M%S')"
fi
if [ -f "$HOME/.condarc" ] ; then
	mv "$HOME/.condarc" "$HOME/.condarc.backup$(date '+%Y%m%dT%H%M%S')"
fi
echo "... copying files ..."

# WARNING: DO NOT RUN `rsync -rav '$HOME/' "$HOME/"` (it breaks SSH)
mkdir -p "$HOME/.local"
rsync -rav '$HOME/.local' "$HOME/.local"
# done
source "$HOME/.bash_profile"
echo "...Done installing home directory customizations"

