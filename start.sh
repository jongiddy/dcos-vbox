#!/bin/sh

set -e

(cd bootstrap; vagrant up)

(cd master; vagrant up)

(cd windows; vagrant up)

