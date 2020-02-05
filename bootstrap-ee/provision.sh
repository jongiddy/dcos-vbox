#!/bin/sh

set -ex

cd /vagrant

if [ -d genconf/serve ]; then
	rm -fr genconf/serve
fi

bash dcos_generate_config.ee.sh

bash dcos_generate_config_win.ee.sh

rm dcos-genconf.*.tar

cp ip-detect.ps1 genconf/serve/windows/ip-detect.ps1
cp ip-detect-public.ps1 genconf/serve/windows/ip-detect-public.ps1
cp fault-domain-detect-win.ps1 genconf/serve/windows/fault-domain-detect-win.ps1

docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html:ro nginx
