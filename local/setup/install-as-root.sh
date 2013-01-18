############################## as user root ##############################

# postgres
apt-get install binutils gdal-bin postgresql-8.4-postgis postgresql-server-dev-8.4
pg_hba_conf="/etc/postgresql/8.4/main/pg_hba.conf"
mv $pg_hba_conf $pg_hba_conf~
echo "local   all         postgres                          trust" >> $pg_hba_conf
echo "local   all         all                               trust" >> $pg_hba_conf
echo "host    all         all         127.0.0.1/32          trust" >> $pg_hba_conf
echo "host    all         all         0.0.0.0/0             md5" >> $pg_hba_conf
echo "listen_addresses = '*'" >> /etc/postgresql/8.4/main/postgresql.conf
/etc/init.d/postgresql restart
echo "CREATE ROLE lokaler WITH SUPERUSER LOGIN;" | psql -U postgres

# git
apt-get install git

# python2.7 from source
apt-get install build-essential
apt-get install libreadline5-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
mkdir /tmp/py && cd /tmp/py
wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tgz
tar -xvf Python-2.7.3.tgz && cd Python-2.7.3/
./configure
make
make altinstall

# node.js
mkdir -p /tmp/node && cd /tmp/node
wget http://nodejs.org/dist/v0.8.12/node-v0.8.12.tar.gz
tar xfvz node-v0.8.12.tar.gz && cd node-v0.8.12
./configure
make -j4
make install

# lessc
mkdir -p /tmp/lessc && /tmp/lessc
wget --no-check-certificate https://github.com/cloudhead/less.js/tarball/master
tar xfvz master
mv `ls -d cloudhead-less.js-*` lesscss
mv lesscss/ /usr/local/
cd /usr/local/bin/
ln -s ../lesscss/bin/lessc

# for lxml
apt-get install libxml2-dev libxslt1-dev
# apt-get install python2.6-dev # ???

# qt4 
# sudo apt-get install python-qt4

# python
easy_install virtualenv

# clone lokaler-vm
cd /tmp
PATH_SHARED_FOLDER="/mnt/hgfs/lokaler"
ln -s $PATH_SHARED_FOLDER/lokaler-vm/ 
# git clone git://github.com/svenkoenig/lokaler-vm.git lokaler-vm
cd /tmp/lokaler-vm/local/setup/files/

# completion wrapper
cp wrap-alias.sh /usr/local/bin/wrap-alias
