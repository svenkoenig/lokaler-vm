#!/bin/sh

database_user='postgres' 
database_name='lokaler'
path_local_dumps="$HOME/nuts-and-bolts/database/dumps"

if [ -f db_settings_local.sh ]; then
. ./db_settings_local.sh
fi
