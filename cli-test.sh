#!/bin/bash

set -e -x

if [ ! -f dcos ]
then
	curl https://downloads.dcos.io/binaries/cli/linux/x86-64/dcos-1.13/dcos -o dcos
fi

chmod +x dcos

./dcos cluster setup --username=admin --password=admin http://172.28.128.21

./dcos cluster list

./dcos node list

# Get a Windows diagnostics bundle
rm -f bundle.zip
bundle_id=$$
curl -XPUT -H "Authorization: token=$(dcos config show core.dcos_acs_token)" http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id}
status=$(curl -H "Authorization: token=$(dcos config show core.dcos_acs_token)" http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id} | jq '.status')
while [ $status != '"Done"' ]
do
	echo $status
	sleep 5
	status=$(curl -H "Authorization: token=$(dcos config show core.dcos_acs_token)" http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id} | jq '.status')
done
curl --output bundle-61001.zip -H "Authorization: token=$(dcos config show core.dcos_acs_token)" http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id}/file

curl --insecure --output bundle-61002.zip -H "Authorization: token=$(dcos config show core.dcos_acs_token)" https://172.28.128.31:61002/system/health/v1/node/diagnostics/${bundle_id}/file

curl --output bundle-1050.zip -H "Authorization: token=$(dcos config show core.dcos_acs_token)" http://172.28.128.31:1050/system/health/v1/node/diagnostics/${bundle_id}/file

# Getting bundle does not complete on master
diagnostics_id=$(./dcos diagnostics create)
status=$(./dcos diagnostics list --json | jq 'map(select(.id=="'"$diagnostics_id"'")) | .[0].status')
while [ $status != '"Done"' ]
do
	echo $status
	sleep 5
	status=$(./dcos diagnostics list --json | jq 'map(select(.id=="'"$diagnostics_id"'")) | .[0].status')
done
