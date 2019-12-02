#!/bin/sh

set -e

cd /vagrant

bash dcos_generate_config.sh

bash dcos_generate_config_win.sh

cp ip-detect.ps1 genconf/serve/windows/ip-detect.ps1
cp ip-detect-public.ps1 genconf/serve/windows/ip-detect-public.ps1

# Duplicate server at 2.1/genconf/serve
rm -fr genconf/serve/2.1
mkdir -p genconf/serve/2.1/genconf
cp -r genconf/serve servetmp
mv servetmp genconf/serve/2.1/genconf/serve

docker run -d -p 80:80 -v /vagrant/genconf/serve:/usr/share/nginx/html:ro nginx
