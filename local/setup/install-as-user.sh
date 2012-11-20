cd ~

PATH_SHARED_FOLDER="/mnt/hgfs/lokaler"
PATH_LOKALER_VM=$HOME/lokaler-vm/local

ln -s $PATH_SHARED_FOLDER/lokaler-vm/
# git clone git://github.com/svenkoenig/lokaler-vm.git

ln -s /mnt/hgfs/tmp/ tmp 2> /dev/null

if [ ! "`grep .bashrc-extras ~/.bashrc`" ]
then
	echo ". ~/lokaler-vm/local/.bashrc-extras" >> .bashrc
fi

virtualenv -p /usr/local/bin/python2.7 --distribute env
. ~/env/bin/activate
pip install -r ~/repositories/lokaler/requirements.txt
pip install ipython # must-have

# make completion wrapper
mkdir ~/.scripts
ln -s /home/lokaler/lokaler-vm/local/setup/files/make-completion-wrapper.sh ~/.scripts/make-completion-wrapper.sh

# django bash completion
mkdir -p /tmp/django && cd /tmp/django
wget https://www.djangoproject.com/download/1.4.2/tarball/ -O django.tar.gz
tar xzvf django.tar.gz
sudo cp Django*/extras/django_bash_completion /etc/bash_completion.d
sudo chmod 644 /etc/bash_completion.d/django_bash_completion
