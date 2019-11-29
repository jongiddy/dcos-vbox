#!/bin/sh

pr=$1

if [ -z "$pr" ]; then
	wget https://downloads.dcos.io/dcos/testing/master/windows/dcos_generate_config_win.sh --output-document=dcos_generate_config_win.sh
else
	wget https://downloads.dcos.io/dcos/testing/pull/$pr/windows/dcos_generate_config_win.sh --output-document=dcos_generate_config_win.sh
fi
