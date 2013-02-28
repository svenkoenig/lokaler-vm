database_user='postgres' 
database_name='lokaler'
path_local_dumps=~/dumps
LOGIN="sven@89.238.64.39"
SCRIPT="/home/sven/lokaler-vm/remote/db_dump.sh"

# ---------- import local settings ----------

SETTINGS_LOCAL="`dirname \"$0\"`/db_settings_local.sh"
if [ -f $SETTINGS_LOCAL ]; then
	source $SETTINGS_LOCAL
fi
