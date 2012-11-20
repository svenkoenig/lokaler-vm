#!/bin/sh

set -e

owner='sven'
dir='/home/sven/db/dumps'
dbname='lokaler_berlin'
filename_date=$dir/dump-$dbname-`date +%Y-%m-%d-%H-%M-%S-%N`
echo "  filename: \"$filename_date\""
echo "  pg_dump..."
cmd="pg_dump -OFt $dbname > /tmp/db.tar"
sudo su - postgres -c "$cmd"
cmd="chown $owner /tmp/db.tar & mv /tmp/db.tar $filename_date.tar;"
sudo su -c "$cmd"
echo "  gzip..."
gzip $filename_date.tar