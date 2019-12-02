#!/bin/sh

(cd windows; vagrant destroy -f)

(cd master; vagrant destroy -f)

(cd bootstrap; vagrant destroy -f; rm -fr genconf/serve)

(cd bootstrap-ee; vagrant destroy -f; rm -fr genconf/serve)
