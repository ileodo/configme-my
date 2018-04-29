#!/bin/sh
if [[ `tmux show-option -g | grep mouse.*on` ]]; then
    echo '+';
else
    echo '-';
fi;
