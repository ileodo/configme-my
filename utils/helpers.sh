#!/usr/bin/env bash
# utils/helpers.sh

COLOR_YELLOW="\033[1;33m"
COLOR_GREEN="\033[0;32m"
COLOR_RED="\033[0;31m"
COLOR_NO="\033[0m"

printYellow(){
    echo -e "${COLOR_YELLOW}$1${COLOR_NO}"
}

printGreen(){
    echo -e "${COLOR_GREEN}$1${COLOR_NO}"
}

printRed(){
    echo -e "${COLOR_RED}$1${COLOR_NO}"
}


# e.g
# path_without_prefix a a/b/c
# => c
path_without_prefix(){
    local prefix="$1/"
    shift
    local arg
    for arg in "$@"
    do
        echo "${arg#$prefix}"
    done
}

# valid_selection options_type options_path selection
# return 0 if selection is valid
valid_selection(){
    if [[ $# -ne 3 ]]; then
        return -1
    fi

    local options_type=$1
    local options_path=$2
    local selection=$3

    local valid_options=()
    for option in $options_path/*; do
        if [[ -d $option ]]; then
            option=$(basename $option)
            valid_options+=($option)
        fi
    done

    if [[ ${#valid_options[@]} -eq 0 ]];then
        printRed "No valid option for $options_type!"
        return -1
    fi

    for i in ${valid_options[@]}; do
        if [[ $i == $selection ]]; then
            return 0
        fi
    done

    printRed "Invalid selection, please choose one from (${LOCALS[@]})"
    return -1
}
