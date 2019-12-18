#!/bin/sh

set -e

cd /vagrant

if [ -d genconf/serve ]; then
	rm -fr genconf/serve
fi

bash dcos_generate_config.sh

bash dcos_generate_config_win.sh

rm dcos-genconf.*.tar

cp ip-detect.ps1 genconf/serve/windows/ip-detect.ps1
cp ip-detect-public.ps1 genconf/serve/windows/ip-detect-public.ps1

docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html:ro nginx
