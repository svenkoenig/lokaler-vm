#!/bin/sh

. ./db_settings.sh

if [ -n "$1" ]; then
    dump_file=$1
else
    echo "missing argument."
    exit 1
fi

dump_file=$(echo ${dump_file%.tar.gz})
dump_file=$path_local_dumps/$dump_file

echo "------------------- using dump \"$dump_file\" -------------------"

if [ -f "$dump_file.tar.gz" ]; then
  echo "decompressing dump..."
  cmd="gzip -dc \"$dump_file.tar.gz\" > \"$dump_file.tar\""
  echo "cmd: $cmd"
  # $cmd
  gzip -dc "$dump_file.tar.gz" > "$dump_file.tar"
fi

if [ -f "$dump_file.tar" ]; then
    args_user_pass="-U $database_user"
    if [ $database_authenticate -eq 1 ]; then args_user_pass="args_user_pass -W"; fi
    
    activity=`echo 'select * from pg_stat_activity;' | psql -U postgres | grep -v 'pg_stat_activity;' | grep '^ *[0-9]'`
	activity=''
    if [ -n "$activity" ]; then
        echo "there are clients connected to the database. please disconnect them first."
    else
        echo "dropping and recreating database..."
        echo "DROP DATABASE IF EXISTS \"$database_name\"; CREATE DATABASE \"$database_name\"" | psql $args_user_pass
        echo "restoring dump..."
        echo '*' pg_restore $args_user_pass -d $database_name $dump_file.tar
        pg_restore $args_user_pass -d $database_name $dump_file.tar
        date > db_restore-info.txt
        echo "cleaning up..."
        rm "$dump_file.tar"
        echo "done."
    fi
else
    echo "\"$dump_file.tar\" not found."
fi
