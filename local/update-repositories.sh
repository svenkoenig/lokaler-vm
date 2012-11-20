. $PATH_LOKALER_VM/settings.sh

escape() { echo "\033[$1m"; }
CB_BLUE=`escape 44`
CB_GREEN=`escape 42`
CB=$CB_BLUE
C_RESET=`escape 0`
echo_blue() { printf "$CB - - - %s - - - $C_RESET\n" $1; }

_lokaler_pth="$HOME/env/lib/python2.7/site-packages/lokaler.pth"

softlink ()
# ln -s $_directory $_target if $_target doesnt exist
{
	_directory=$1
	_target=$2
	if [ ! -d $_target ]
	then
		ln -s $_directory $_target
	fi
}

update_repository ()
{
	_name=$1
	_path=$2

	echo_blue $_name
	if [ -d $PATH_REPOS_LOCAL/$_name ]
	then
		echo "local: $_name (\"$PATH_REPOS_LOCAL/$_name\" exists.)"
		softlink $PATH_REPOS_LOCAL/$_name $PATH_REPOS_ALL/$_name
	else
		echo "remote: $_name $_path"
		if [ ! -d $PATH_REPOS_REMOTE/$_name ]
		then
			echo \"$PATH_REPOS_REMOTE/$_name\" does not exist. cloning remote repository...
			cd $PATH_REPOS_REMOTE
			git clone $_path $_name
		else
			cd $PATH_REPOS_REMOTE/$_name
			git pull
		fi
		softlink $PATH_REPOS_REMOTE/$_name $PATH_REPOS_ALL/$_name
		cd - > /dev/null
	fi
	echo $PATH_REPOS_ALL/$_name >> $_lokaler_pth
	echo
}

mkdir -p $PATH_REPOS_ALL
mkdir -p $PATH_REPOS_REMOTE
# link to local repositories (your shared folder to be configured in vmware)
softlink $PATH_SHARED_FOLDER $PATH_REPOS_LOCAL

update_repository lokaler git@github.com:lokaler/lokaler.git
repositories_txt="$PATH_REPOS_ALL/lokaler/repositories.txt"
	
echo '' > $_lokaler_pth
while read _name _path
do
	update_repository $_name $_path
done < $repositories_txt
