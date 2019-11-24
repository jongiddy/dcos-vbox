#!/bin/sh

cd /vagrant

bash dcos_generate_config.sh

docker run -d -p 80:80 -v $PWD/genconf/serve:/usr/share/nginx/html:ro nginx

genconf/ip-detect > bootstrap-ip

