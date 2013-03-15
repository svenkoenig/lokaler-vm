#!/bin/bash

. ./db_settings.sh

if [ -n "$1" ]; then
    dump_file=$1
else
    echo "missing argument dump file."
    exit 1
fi

if [ -n "$2" ]; then
    dst_database_name=$2
else
    echo "missing argument destination database name."
    exit 1
fi

dump_file=$(echo ${dump_file%.tar.gz})
dump_file=$path_local_dumps/$dump_file

echo "------------------- using dump \"$dump_file\" -------------------"

if [ -f "$dump_file.tar.gz" ]; then
  echo "decompressing dump..."
  cmd="gzip -dc \"$dump_file.tar.gz\" > \"$dump_file.tar\""
  echo "cmd: $cmd"
  gzip -dc "$dump_file.tar.gz" > "$dump_file.tar"
fi

if [ -f "$dump_file.tar" ]
then
	activity=''
    if [ -n "$activity" ]; then
        echo "there are clients connected to the database. please disconnect them first."
    else
        echo "dropping and recreating database..."
		dropdb $dst_database_name
		createdb $dst_database_name -T template_postgis
        echo "restoring dump..."
        echo '*' pg_restore -d $dst_database_name $dump_file.tar
        pg_restore -d $dst_database_name $dump_file.tar
        date > db_restore-info.txt
        echo "cleaning up..."
        rm "$dump_file.tar"
        echo "done."
    fi
else
    echo "\"$dump_file.tar\" not found."
fi

