#!/bin/sh
BACKUP_PATH="${BACKUP_PATH:-/Users/op/Dropbox/backup/homeserver}"
mkdir -p $BACKUP_PATH

echo "Starting backup config"
BACKUP_NAME=config_`date +%Y-%m-%d-%H-%M-%S`
mkdir -p /tmp/$BACKUP_NAME

backup_paths=(
/Library/LaunchDaemons
/Users/op/www/root
/Users/op/Library/LaunchAgents
/usr/local/etc/nginx
/usr/local/etc/aria2
/usr/local/etc/surge
/usr/local/etc/homebridge
/Applications/tinyMediaManager.app/Contents/Resources/Java/data/tmm.json
/Applications/tinyMediaManager.app/Contents/Resources/Java/data/movies.json
/Applications/tinyMediaManager.app/Contents/Resources/Java/data/tvShows.json
/Applications/tinyMediaManager.app/Contents/Resources/Java/data/scraper_opensubtitles.conf
/Applications/tinyMediaManager.app/Contents/Resources/Java/data/scraper_tmdb.conf
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