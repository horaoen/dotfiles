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
# oh-my-zsh
if [[ ! -e ~/.oh-my-zsh ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ ! -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh sheme: p10k
if [[ ! -e ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]; then
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

set_soft_link "$BASEDIR/p10k.zsh" ~/.p10k.zsh

# neovim
set_soft_link "$BASEDIR/nvim" ~/.config/nvim

# gitconfig
set_soft_link "$BASEDIR/gitconfig" ~/.gitconfig

# ideavimrc
set_soft_link "$BASEDIR/ideavimrc" ~/.ideavimrc

# zed
set_soft_link "$BASEDIR/zed" ~/.config/zed

# yabai
set_soft_link "$BASEDIR/yabairc" ~/.yabairc

# skhd
set_soft_link "$BASEDIR/skhdrc" ~/.skhdrc

# tmux
set_soft_link "$BASEDIR/tmux.conf" ~/.tmux.conf
