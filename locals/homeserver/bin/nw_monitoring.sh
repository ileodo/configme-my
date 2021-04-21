#!/bin/sh
target_path=nw_monitoring`date +%Y%m%d_%H%M%S`
mkdir -p $target_path
echo "Logging in $target_path"
pingwithlog(){
    local host=$1
    ping $host | while read pong; do echo "$host $(date): $pong"; done >> ./$target_path/$host
}

pids_ping=()
for host in $@
do
	pingwithlog $host &
done

cd $target_path
tail -f -q $@ | grep -v "bytes from" --line-buffered  | tee monitor

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT