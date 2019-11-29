#!/bin/sh

pr=$1

if [ -z "$pr" ]; then
	wget https://downloads.dcos.io/dcos/testing/master/dcos_generate_config.sh --output-document=dcos_generate_config.sh
else
	wget https://downloads.dcos.io/dcos/testing/pull/$pr/dcos_generate_config.sh --output-document=dcos_generate_config.sh
fi
