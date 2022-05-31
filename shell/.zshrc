export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-vi-mode
    colored-man-pages
)
ZSH_THEME="amuse"

source $ZSH/oh-my-zsh.sh

alias setproxy="export HTTPS_PROXY=http://127.0.0.1:7890; echo 'SET PROXY SUCCESS!!!'"
alias unsetproxy="unset ALL_PROXY; echo 'UNSET PROXY SUCCESS!!!'"

setproxy
export EDITOR=/usr/bin/nvim

alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cl='clear'
alias ex='exit'
