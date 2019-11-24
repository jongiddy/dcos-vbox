#!/bin/sh

set -ex

curl -O http://172.28.128.20:80/dcos_install.sh

bash dcos_install.sh master
