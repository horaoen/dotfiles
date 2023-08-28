#!/bin/bash
# submodule init
git submodule init
git submodule update

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -e ~/.zshrc ]]; then
	ln -s "$BASEDIR/zshrc" ~/\.zshrc
	echo "~/.zshrc created."
else
	echo "File .zshrc already exists. Skipping symbolic link creation."
fi
