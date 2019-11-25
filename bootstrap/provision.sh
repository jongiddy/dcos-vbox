#!/bin/sh

cd /vagrant

cp genconf/config.yaml.in genconf/config.yaml

bash dcos_generate_config.sh

# https://downloads.dcos.io/dcos/testing/master/windows/dcos_generate_config_win.sh
# https://downloads.dcos.io/dcos/testing/pull/6561/windows/dcos_generate_config_win.sh
bash dcos_generate_config_win.sh

# need extra args to docker run command!
# cannot make first directory read-only as then we can't mount second
docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html -v /vagrant/genconf_win:/usr/share/nginx/html/2.1/genconf_win:ro nginx
