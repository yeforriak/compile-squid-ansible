#!/bin/bash

# Based on a template by BASH3 Boilerplate v2.3.0
# http://bash3boilerplate.sh/#authors

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use dollar{VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# set squid version
source /tmp/squid/squid.ver

# decend into working directory
pushd /tmp/squid/build/squid

# install ecap packages
dpkg --install squid-common_${SQUID_PKG}_all.deb
dpkg --install squid_${SQUID_PKG}_amd64.deb
dpkg --install squidclient_${SQUID_PKG}_amd64.deb

# and revert
popd
