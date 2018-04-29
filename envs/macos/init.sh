#!/usr/bin/env bash
_FILE_PATH_=$(dirname "${BASH_SOURCE[0]}")
source $_FILE_PATH_/../../utils/config.sh
source $_FILE_PATH_/../../utils/helpers.sh

cd ~

ln -sfn $ENV_PATH/.mackup.cfg
ln -sfn $ENV_PATH/.mackup
