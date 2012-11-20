#!/bin/bash

. $PATH_LOKALER_VM/database/db_settings.sh

LOGIN="sven@89.238.64.39"
SCRIPT="/home/sven/db/db_dump.sh"
LOG=remote_command.log

echo "--- remote script ---"
echo '*' ssh $LOGIN $SCRIPT | tee $LOG
ssh $LOGIN $SCRIPT | tee $LOG

remote_path=`cat remote_command.log | grep filename: | awk '{print $2}' | sed "s/^\([\"']\)\(.*\)\1\$/\2/g"`
remote_filename=`echo ${remote_path##*/}`

echo "--- download ---"
echo '*' scp $LOGIN:$remote_path.tar.gz "$path_local_dumps/$remote_filename-remote.tar.gz"
scp $LOGIN:$remote_path.tar.gz "$path_local_dumps/$remote_filename-remote.tar.gz"

echo "--- finished! ---"
echo filename: "$remote_filename-remote.tar.gz"
# rm $LOG
