#!/bin/sh

pushd $PATH_LOKALER_VM/database > /dev/null

. ./db_settings.sh

dump_file=`ls -tr $path_local_dumps/*-remote.tar.gz | tail -1`
dump_file=`basename $dump_file | sed 's/\(.*\)\..*/\1/' | sed 's/\(.*\)\..*/\1/'`
echo "dumpfile: $dump_file"

./restore_dump.sh $dump_file 2> /dev/null
$MANAGE create_or_reset_admin
$MANAGE shell < after_restore_dump.py > /dev/null

popd > /dev/null