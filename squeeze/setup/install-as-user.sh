cd ~
. ~/settings.sh

ln -s /mnt/hgfs/lokaler/lokaler-vm/
# git clone git://github.com/svenkoenig/lokaler-vm.git

ln -s /mnt/hgfs/tmp/ tmp 2> /dev/null

echo ". ~/lokaler-vm/squeeze/.bashrc-extras" >> .bashrc

ln -s /mnt/hgfs/lokaler/ $PATH_REPOS_LOCAL # your lokaler shared folder - to be configured in vmware
mkdir $PATH_REPOS_REMOTE

virtualenv -p /usr/local/bin/python2.7 --distribute env
activate
pip install -r ~/repos/lokaler/requirements.txt
pip install ipython # must-have
