#!/bin/sh

set -ex

cd /vagrant

if [ -d genconf ]; then
	rm -fr genconf
fi

mkdir genconf

cp config.yaml fault-domain-detect ip-detect license.txt genconf/

bash dcos_generate_config.ee.sh

bash dcos_generate_config_win.ee.sh

rm dcos-genconf.*.tar

cp ip-detect.ps1 ip-detect-public.ps1 fault-domain-detect-win.ps1 genconf/serve/windows/

docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html:ro nginx
