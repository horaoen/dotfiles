#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# submodule init
git submodule update --init

set_soft_link() {
	left_file=$1
	right_file=$2

	if [[ -e $right_file ]]; then
		echo "File $right_file already exists."
		read -p "Do you want to delete it? (y/n) " choice
		if [[ "$choice" == "y" ]]; then
			rm -rf $right_file
			ln -s $left_file $right_file
			echo "$right_file Symbolic link created."
		else
			echo "Aborted."
		fi
	else
		ln -s $left_file $right_file
		echo "$right_file Symbolic link created."
	fi
}

# zshrc
set_soft_link "$BASEDIR/zshrc" ~/.zshrc

# zsh sheme: p10k
set_soft_link "$BASEDIR/p10k.zsh" ~/.p10k.zsh

# neovim
set_soft_link "$BASEDIR/nvim" ~/.config/nvim

# gitconfig
set_soft_link "$BASEDIR/gitconfig" ~/.gitconfig

# ideavimrc
set_soft_link "$BASEDIR/ideavimrc" ~/.ideavimrc

# zed
set_soft_link "$BASEDIR/zed" ~/.config/zed
