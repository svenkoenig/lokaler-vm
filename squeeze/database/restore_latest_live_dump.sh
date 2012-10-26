#!/bin/sh

. ./db_settings.sh

dump_file=`ls -tr $path_local_dumps/*-remote.tar.gz | tail -1`
dump_file=`basename $dump_file | sed 's/\(.*\)\..*/\1/' | sed 's/\(.*\)\..*/\1/'`
echo "dumpfile: $dump_file"

./restore_dump.sh $dump_file

python ~/repos/lokaler/manage.py shell < ~/nuts-and-bolts/database/after_restore_dump.py