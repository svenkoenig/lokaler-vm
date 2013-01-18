PATH_REPOS_ALL=$HOME/repositories
PATH_REPOS_LOCAL=$HOME/repositories/.local 
PATH_REPOS_REMOTE=$HOME/repositories/.remote

LOGIN=sven@89.238.64.39

PATH_HERE="`dirname \"$0\"`"
if [ -f $PATH_HERE/settings_local.sh ]; then
. $PATH_HERE/settings_local.sh
fi

