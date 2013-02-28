PATH_REPOS_ALL=$HOME/repositories
PATH_REPOS_LOCAL=$HOME/repositories/.local 
PATH_REPOS_REMOTE=$HOME/repositories/.remote
SETTING_LOKALER_ACTIVE_INSTANCE_FILE=$HOME/.active_instance

LOGIN=sven@89.238.64.39

# ---------- import local settings ----------

SETTINGS_LOCAL="`dirname \"$0\"`/settings_local.sh"
if [ -f $SETTINGS_LOCAL ]; then
	source $SETTINGS_LOCAL
fi
