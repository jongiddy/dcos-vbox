#!/bin/sh

set -e

(cd bootstrap-ee; vagrant up)

(cd master; vagrant up)

(cd windows; vagrant up)

