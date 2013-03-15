#!/bin/sh

if [ -z "$1" ]
then
	echo "missing argument destination database name."
    exit 1
else
	dst_db_name=$1
fi

SETTINGS="`dirname \"$0\"`/db_settings.sh"
source $SETTINGS

RESTORE_DUMP="`dirname \"$0\"`/restore_dump.sh"

dump_file=`ls -tr $path_local_dumps/*-remote.tar.gz | tail -1`
dump_file=`basename $dump_file | sed 's/\(.*\)\..*/\1/' | sed 's/\(.*\)\..*/\1/'`
echo "dumpfile: $dump_file"

source $RESTORE_DUMP $dump_file $dst_db_name 2> /dev/null

$MANAGE migrate
$MANAGE create_or_reset_admin
$MANAGE shell < after_restore_dump.py > /dev/null
