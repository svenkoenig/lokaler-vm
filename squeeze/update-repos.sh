repositories_txt="$HOME/repos/lokaler/repositories.txt"
lokaler_pth="$HOME/env/lib/python2.7/site-packages/lokaler.pth"

echo '' > $lokaler_pth
for repo in `cat ~/repos/lokaler/repositories.txt`
do
	if [[ $repo != git@github* ]]
	then
		echo $HOME/repos/$repo >> $lokaler_pth
	fi
done
