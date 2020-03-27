#!/bin/bash

set -e -x

# Get a Windows diagnostics bundle
rm -f bundle.zip
bundle_id=$$
curl -XPUT http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id}
status=$(curl http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id} | jq '.status')
while [ $status != '"Done"' ]
do
	echo $status
	sleep 5
	status=$(curl http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id} | jq '.status')
done
curl --output bundle-61001.zip http://172.28.128.31:61001/system/health/v1/node/diagnostics/${bundle_id}/file

curl --insecure --output bundle-61002.zip https://172.28.128.31:61002/system/health/v1/node/diagnostics/${bundle_id}/file

curl --output bundle-1050.zip http://172.28.128.31:1050/system/health/v1/node/diagnostics/${bundle_id}/file
