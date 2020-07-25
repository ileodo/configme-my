# share - .zshrc
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dracula"

DISABLE_AUTO_TITLE="true"

plugins=(
  git colorize sublime
  themes sudo
  python ruby node
  npm gem composer bower pip
  nvm rbenv
  laravel5 rails bundler gulp
  virtualenv virtualenvwrapper
  postgres
  zsh-autosuggestions zsh-syntax-highlighting
)

# ##################### #
#      Env Settings     #
# ##################### #

# notify of bg job completion immediately
set -o notify

export TERM=xterm-256color
# export LANG='en_US.UTF-8'
# export LC_ALL='en_US.UTF-8'

export EDITOR='vim'

# export GIT_SSL_CAINFO=$HOME/.ca/BBrootNEW.cer
export SSL_CERT_DIR=$HOME/.ca

# History
#---------------
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Paths
#---------------
export WORKSPACE=~/workspace

export PATH=$HOME/._share/bin:$PATH
export PATH=$HOME/._env/bin:$PATH
export PATH=$HOME/._local/bin:$PATH

export PATH=$HOME/.share/bin:$PATH
export PATH=$HOME/.env/bin:$PATH
export PATH=$HOME/.local/bin:$PATH



export PYTHONPATH=./:$PYTHONPATH



# ############ #
#    Aliases   #
# ############ #


# Overrides
#---------------
alias -s tex=vim


alias vi=vim

alias rm="rm -i"
alias clr='clear'
alias cls='clear && printf "\033[3J"'
alias ccat='pygmentize -g -O style=dracula,linenos=1'

alias grep='grep --color=auto'
alias vless='/usr/local/opt/vim/share/vim/vim80/macros/less.sh'
alias diff='diff -b -B -w -r --exclude=.svn -u'
alias tmux='tmux -u -2'


# Shortcuts/Scripts
#---------------
alias zsh-reload='source ~/.zshrc'
alias psme="ps -f -u $USER"

function echoproxy(){
  echo "HTTP_PROXY  = $HTTP_PROXY"
  echo "HTTPS_PROXY = $HTTPS_PROXY"
  echo "http_proxy  = $http_proxy"
  echo "https_proxy = $https_proxy"
}

function setproxy(){
  export HTTP_PROXY=$1
  export http_proxy=$1
  export HTTPS_PROXY=$1
  export https_proxy=$1
}

alias no_proxy='http_proxy="" https_proxy="" HTTP_PROXY="" HTTPS_PROXY=""'

# Applications
#---------------


# ######################## #
#   KEY Mapping Settings   #
# ######################## #
# map home and end keys
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# ######################## #
#   Custome & Cleanup      #
# ######################## #

# .envs override
if [[ -e ~/._env/.zshrc ]]
then
    source ~/._env/.zshrc
fi

#.local override
if [[ -e ~/._local/.zshrc ]]
then
    source ~/._local/.zshrc
fi

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

echo "~/.zshrc has run"
clear

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
