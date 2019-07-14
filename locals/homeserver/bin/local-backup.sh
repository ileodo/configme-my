#!/bin/sh
BACKUP_PATH="${BACKUP_PATH:-/Users/leodong/Dropbox/backup/homeserver}"
mkdir -p $BACKUP_PATH

echo "Starting backup config"
BACKUP_NAME=config_`date +%Y-%m-%d-%H-%M-%S`
mkdir -p /tmp/$BACKUP_NAME

backup_paths=(
/Users/leodong/www/root
/Users/leodong/.aria2/aria2.conf
/Users/leodong/.homeassistant
/Users/leodong/.homebridge
/Users/leodong/.webosTv
/Users/leodong/Library/LaunchAgents/
/usr/local/etc/nginx
)

for backup_path in ${backup_paths[@]}; do
    echo "Backup $backup_path"
    relative_path=$(dirname $backup_path)
    mkdir -p /tmp/$BACKUP_NAME/$relative_path
    /bin/cp -R $backup_path /tmp/$BACKUP_NAME/$relative_path
done

tar -zcPf $BACKUP_PATH/$BACKUP_NAME.tar.gz /tmp/$BACKUP_NAME

rm -rf /tmp/$BACKUP_NAME
echo "Config backup ends"

exit 0