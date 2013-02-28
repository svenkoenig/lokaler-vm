OWNER='sven'
DUMP_DIR='/home/sven/db/dumps'

# ---------- import local settings ----------

SETTINGS_LOCAL="`dirname \"$0\"`/db_settings_local.sh"
if [ -f $SETTINGS_LOCAL ]; then
	source $SETTINGS_LOCAL
fi

