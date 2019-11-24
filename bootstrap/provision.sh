#!/bin/sh

cd /vagrant

cp genconf/config.yaml.in genconf/config.yaml

bash dcos_generate_config.sh

docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html:ro nginx
