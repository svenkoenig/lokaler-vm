cd ~

ln -s /mnt/hgfs/lokaler/lokaler-vm/
# git clone git://github.com/svenkoenig/lokaler-vm.git

ln -s /mnt/hgfs/tmp/ tmp 2> /dev/null

if [ ! "`grep .bashrc-extras ~/.bashrc`" ]
then
	echo ". ~/lokaler-vm/local/.bashrc-extras" >> .bashrc
fi

virtualenv -p /usr/local/bin/python2.7 --distribute env
activate
pip install -r ~/repos/lokaler/requirements.txt
pip install ipython # must-have
