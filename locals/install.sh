#!/usr/bin/env bash
# locals/install.sh

_FILE_PATH_=$(dirname "${BASH_SOURCE[0]}")
source $_FILE_PATH_/../utils/config.sh
source $_FILE_PATH_/../utils/helpers.sh


CONFIGME_LOCALS_PATH=$( cd $_FILE_PATH_ && pwd )

if [[ $# -ne 1 ]]; then
    printRed "Please select local."
    exit -1
fi

select_local=$1
rc=$(valid_selection "local" $CONFIGME_LOCALS_PATH $select_local)

if [[ rc -ne 0 ]]; then
    exit rc
fi

printYellow "Applying ${select_local} ..."

# creat symbolic link for local
ln -sfn $CONFIGME_LOCALS_PATH/$select_local $LOCAL_PATH

# run init.sh script for that local config
[ -f $LOCAL_PATH/init.sh ] && . $LOCAL_PATH/init.sh

printGreen "Done"


#--------------------
# Other
#--------------------
cd ~

# TODO:
# Put the additional instructions you want to execute here
