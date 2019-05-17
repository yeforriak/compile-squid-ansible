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

if [[ $EUID -eq 0 ]]; then
   echo "This script must NOT be run as root" 1>&2
   exit 1
fi

# set ecap version
source /tmp/squid/ecap.ver

# drop ecap build folder
rm -R /tmp/squid/build/libecap || true

# we will be working in a subfolder make it
mkdir -p /tmp/squid/build/libecap

# decend into working directory
pushd /tmp/squid/build/libecap

# get libecap from debian stretch
wget http://http.debian.net/debian/pool/main/libe/libecap/libecap_${ECAP_PKG}.dsc
wget http://http.debian.net/debian/pool/main/libe/libecap/libecap_${ECAP_VER}.orig.tar.gz
wget http://http.debian.net/debian/pool/main/libe/libecap/libecap_${ECAP_PKG}.debian.tar.xz

# unpack the source package
dpkg-source -x libecap_${ECAP_PKG}.dsc

# build the package
cd libecap-${ECAP_VER} && dpkg-buildpackage -rfakeroot -b

# and revert
popd
