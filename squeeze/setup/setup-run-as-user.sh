cd

git clone git@github.com:svenkoenig/lokaler-vm.git

ln -s /mnt/hgfs/lokaler/ ~/repos # your lokaler shared folder
ln -s ~/repos/lokaler/virtual-squeeze ~/nuts-and-bolts
ln -s ~/nuts-and-bolts/.bashrc-extras
echo ". .bashrc-extras" >> .bashrc

virtualenv -p /usr/local/bin/python2.7 --distribute env
activate
pip install -r ~/repos/lokaler/requirements.txt
pip install ipython # must-have
