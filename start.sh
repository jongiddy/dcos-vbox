#!/bin/sh

set -e

(cd bootstrap; vagrant up)

cp bootstrap/bootstrap-ip master/bootstrap-ip

(cd master; vagrant up)

