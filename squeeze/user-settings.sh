# edit hostname
nano /etc/hostname
invoke-rc.d hostname.sh start
invoke-rc.d networking force-reload
invoke-rc.d network-manager force-reload

# edit ip adress
nano /etc/network/interfaces
ifdown eth0 && ifup eth0

