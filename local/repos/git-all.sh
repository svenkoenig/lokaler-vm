. $PATH_LOKALER_VM/settings.sh
. $PATH_LOKALER_VM/repos/colors.sh

repositories_txt="$PATH_REPOS_ALL/lokaler/repositories.txt"

pushd `pwd` > /dev/null

for name in `ls $PATH_REPOS_ALL`
do
	echo_blue $name
	cd $PATH_REPOS_ALL/$name
	git $1
	echo
done

popd