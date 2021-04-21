#!/bin/bash
#
# mount NAS
#
# mount_nas Inbox Videos

nas_password=`security find-internet-password -s "NAS.local" -w`

for dest in $@
do
	mount_point=/Volumes/op/$dest
	sudo mkdir -p $mount_point
	sudo chown op:staff $mount_point
	sudo chmod +rwx $mount_point
	mount -t afp afp://op:$nas_password@NAS.local/$dest $mount_point
done
