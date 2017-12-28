#!/usr/bin/env bash

# create and initialize a helm chart for Vivint Platform

set -e
chartname=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
pushd $DIR
git pull
popd

helm create -p vivint-starter $chartname
pushd $chartname
find . -type f -exec sed -i "s/__CHART__/$chartname/g" {} \;
find . -type f  -exec chmod 644 {} \;
git init

cat <<ENDSCRIPT > .git/hooks/pre-commit
#!/bin/sh
#
helm lint
ENDSCRIPT
chmod +x .git/hooks/pre-commit
