#!/usr/bin/env bash
# share/install.sh

_FILE_PATH_=$(dirname "${BASH_SOURCE[0]}")
source $_FILE_PATH_/../utils/config.sh
source $_FILE_PATH_/../utils/helpers.sh

cd ~

CONFIGME_SHARE_PATH=$( cd $_FILE_PATH_ && pwd )
# creat symbolic link for share
ln -sfn $CONFIGME_SHARE_PATH $SHARE_PATH

#--------------------------------
# .dotfiles
#--------------------------------
printYellow "Installing dotfiles ..."
SHARE_DOTFILES_PATH=$SHARE_PATH/dotfiles

# for each file in $SHARE_DOTFILES_PATH (recursively)
for file in $(find $SHARE_DOTFILES_PATH -type f); do
    relative_file=$(path_without_prefix $SHARE_DOTFILES_PATH $file)
    relative_path=$(dirname $relative_file)
    if [[ $relative_path != "." ]]; then
        # create the path
        (set -x ; mkdir -p $relative_path)
    fi
    # link the dotfile
    (set -x ; ln -snf $SHARE_DOTFILES_PATH/$relative_file $relative_path)
done

printGreen "Done"

#--------------------------------
# .dotfolders
#--------------------------------
printYellow "Installing dotfolders ..."
SHARE_DOTFOLDERS_PATH=$SHARE_PATH/dotfolders

# for each directory(start with .) in $SHARE_DOTFOLDERS_PATH
for directory in $SHARE_DOTFOLDERS_PATH/.*; do
    if [[ -d $directory ]]; then
        # the foldername of the dot directory
        folername=$(basename $directory)
        if [[ $folername != "." ]] && [[ $folername != ".." ]]; then
            # link the dotfile
            (set -x ; ln -snf $directory)
        fi
    fi
done

printGreen "Done"


#--------------------
# Other
#--------------------
cd ~
# TODO:
# Put the instructions you want to execute for all
# environments/machines here.

# oh-my-zsh
printYellow "Installing oh-my-zsh ..."
ZSH_CUSTOM=~/.oh-my-zsh/custom
# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# oh-my-zsh themes
mkdir -p $ZSH_CUSTOM/themes
(cd $ZSH_CUSTOM/themes && git clone https://github.com/ileodo/dracula-zsh.git && ln -sfn dracula-zsh/dracula.zsh-theme)
printGreen "Done"



# Install Vundle for vim
printYellow "Installing Vundle for vim ..."
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
printGreen "Done"
