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
git init
