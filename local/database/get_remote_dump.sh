#!/bin/bash

. $PATH_LOKALER_VM/database/db_settings.sh


if [[ -z "$1" ]]; then echo "name of database needed!"; exit 1; fi 

DATABASE_NAME=$1
LOGIN="sven@89.238.64.39"
SCRIPT="/home/sven/lokaler-vm/remote/db_dump.sh"
LOG=remote_command.log

echo "--- remote script ---"
echo '*' ssh $LOGIN $SCRIPT $DATABASE_NAME | tee $LOG
ssh $LOGIN $SCRIPT $DATABASE_NAME | tee $LOG

remote_path=`cat remote_command.log | grep filename: | awk '{print $2}' | sed "s/^\([\"']\)\(.*\)\1\$/\2/g"`
remote_filename=`echo ${remote_path##*/}`

echo "--- download ---"
echo '*' scp $LOGIN:$remote_path.tar.gz "$path_local_dumps/$remote_filename-remote.tar.gz"
scp $LOGIN:$remote_path.tar.gz "$path_local_dumps/$remote_filename-remote.tar.gz"

echo "--- finished! ---"
echo filename: "$remote_filename-remote.tar.gz"
# rm $LOG
