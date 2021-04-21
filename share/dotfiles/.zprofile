emulate sh

[ -f ~/.profile ] && . ~/.profile

emulate zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
