#!/usr/bin/env bash
_FILE_PATH_=$(dirname "${BASH_SOURCE[0]}")
source $_FILE_PATH_/../../utils/config.sh
source $_FILE_PATH_/../../utils/helpers.sh

cd ~

ln -sfn $LOCAL_PATH/.qshell.json

ln -sfn $LOCAL_PATH/.mackup.cfg
ln -sfn $LOCAL_PATH/.mackup