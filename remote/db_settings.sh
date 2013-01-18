OWNER='sven'
DUMP_DIR='/home/sven/db/dumps'

# ---------- import local settings ----------

PATH_HERE="`dirname \"$0\"`"
if [ -f $PATH_HERE/db_settings_local.sh ]; then
. $PATH_HERE/db_settings_local.sh
fi

