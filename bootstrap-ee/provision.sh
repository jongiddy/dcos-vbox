#!/bin/sh

set -e

cd /vagrant

bash dcos_generate_config.ee.sh

bash dcos_generate_config_win.ee.sh

# need extra args to docker run command!
# cannot make first directory read-only as then we can't mount second
docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html -v /vagrant/genconf_win:/usr/share/nginx/html/2.1/genconf_win:ro nginx
