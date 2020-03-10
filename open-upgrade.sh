#!/bin/bash

set -e -x

(cd bootstrap; bash ./dcos_generate_config.sh --generate-node-upgrade-script 2.1.0-beta2-dev > upgrade.out)
cat bootstrap/upgrade.out
url=$(grep 'Node upgrade script URL:' bootstrap/upgrade.out | sed -e 's#Node upgrade script URL: \(http.\+/dcos_node_upgrade.sh\)#\1#')

(cd master; vagrant ssh -c "curl $url --output dcos_upgrade.sh")
(cd master; vagrant ssh -c "sudo bash ./dcos_upgrade.sh")

(cd bootstrap; bash ./dcos_generate_config.sh --generate-node-upgrade-win-script 2.1.0-beta2-dev > upgrade.out)
cat bootstrap/upgrade.out
url=$(grep 'Windows agent upgrade script URL:' bootstrap/upgrade.out | sed -e 's#Windows agent upgrade script URL: \(http.\+/dcos_node_upgrade.ps1\)#\1#')

(cd windows; vagrant winrm -c "Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile C:\Users\vagrant\Downloads\dcos_node_upgrade.ps1")
(cd windows; vagrant winrm -c "& C:\Users\vagrant\Downloads\dcos_node_upgrade.ps1")
