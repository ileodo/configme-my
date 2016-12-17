#!/usr/bin/env bash
# envs/install.sh

_FILE_PATH_=$(dirname "${BASH_SOURCE[0]}")
source $_FILE_PATH_/../utils/config.sh
source $_FILE_PATH_/../utils/helpers.sh


CONFIGME_ENVS_PATH=$( cd $_FILE_PATH_ && pwd )

if [[ $# -ne 1 ]]; then
    printRed "Please select env."
    exit -1
fi

select_env=$1
rc=$(valid_selection "env" $CONFIGME_ENVS_PATH $select_env)

if [[ rc -ne 0 ]]; then
    exit rc
fi

printYellow "Applying ${select_env} ..."

# creat symbolic link for local
ln -sfn $CONFIGME_ENVS_PATH/$select_env $ENV_PATH

# run init.sh script for that local config
[ -f $ENV_PATH/init.sh ] && . $ENV_PATH/init.sh

printGreen "Done"


#--------------------
# Other
#--------------------
cd ~
# TODO:
# Put the additional instructions you want to execute here
