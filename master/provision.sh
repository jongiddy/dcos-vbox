#!/bin/sh

bootstrap_ip=`cat /vagrant/bootstrap-ip | tr -d '[:space:]')`

curl -O http://${bootstrap_ip}:80/dcos_install.sh

bash dcos_install.sh master
