# envs-macos - .zshrc

stty erase '^?'

plugins+=(
  brew brew-cask osx battery
)

alias sudoedit="sudo vim"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
export NVM_DIR=/usr/local/var/nvm
 . $(brew --prefix nvm)/nvm.sh



function tabc() {
    # set the profile of iTerm2
    NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
    echo -e -n "\033]50;SetProfile=$NAME\a"
}

# qshell for qiniu cloud
if [ $commands[qshell] ]; then
  source <(qshell completion zsh)
fi



eval $(thefuck --alias)
