#!/bin/sh

set -e

security=$1
case "${security}" in
	permissive | strict)
		;;
	*)
		echo "Usage: $0 [permissive|strict]"
		;;
esac

cp bootstrap-ee/config-${security}.yaml bootstrap-ee/config.yaml

(cd bootstrap-ee; vagrant up)

(cd master; vagrant up)

(cd windows; vagrant up)

