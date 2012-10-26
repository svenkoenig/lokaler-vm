echo ". ~/lokaler-vm/squeeze/.bashrc-extras" >> .bashrc
ln -s /mnt/hgfs/lokaler/ ~/repos # your lokaler shared folder - to be configured in vmware
virtualenv -p /usr/local/bin/python2.7 --distribute env
activate
pip install -r ~/repos/lokaler/requirements.txt
pip install ipython # must-have
