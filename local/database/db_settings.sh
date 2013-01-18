#!/bin/bash

database_user='postgres' 
database_name='lokaler'
path_local_dumps=~/dumps
LOGIN="sven@89.238.64.39"
SCRIPT="/home/sven/lokaler-vm/remote/db_dump.sh"

if [ -f db_settings_local.sh ]; then
. ./db_settings_local.sh
fi
