#!/bin/sh

PATH_HERE="`dirname \"$0\"`"
. $PATH_HERE/db_settings.sh

DATABASE_NAME=$1
filename_date=$DUMP_DIR/dump-$DATABASE_NAME-`date +%Y-%m-%d-%H-%M-%S-%N`
echo "  filename: \"$filename_date\""
echo "  pg_dump..."
cmd="pg_dump -OFt $DATABASE_NAME > /tmp/db.tar"
sudo su - postgres -c "$cmd"
cmd="chown $OWNER /tmp/db.tar & mv /tmp/db.tar $filename_date.tar;"
sudo su -c "$cmd"
echo "  gzip..."
gzip $filename_date.tar
