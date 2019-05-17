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

# drop squid build folder
rm -R /tmp/squid/build/squid || true

# we will be working in a subfolder make it
mkdir -p /tmp/squid/build/squid

# set squid version
source /tmp/squid/squid.ver

# copy the patches to the working folder
cp /tmp/squid/rules.patch /tmp/squid/build/squid/rules.patch
cp /tmp/squid/control.patch /tmp/squid/build/squid/control.patch

cp /tmp/squid/debian/squid_${SQUID_PKG}.dsc /tmp/squid/build/squid/
cp /tmp/squid/debian/squid_${SQUID_VER}.orig.tar.gz /tmp/squid/build/squid/
cp /tmp/squid/debian/squid_${SQUID_PKG}.debian.tar.xz /tmp/squid/build/squid/

# decend into working directory
pushd /tmp/squid/build/squid

# unpack the source package
dpkg-source -x squid_${SQUID_PKG}.dsc

# modify dependencies to match those of Ubuntu 16
patch squid-${SQUID_VER}/debian/control < ../../control.patch

# modify configure options in debian/rules, add --enable-ssl --enable-ssl-crtd
patch squid-${SQUID_VER}/debian/rules < ../../rules.patch

# build the package
export DEB_DH_SHLIBDEPS_ARGS_ALL=--dpkg-shlibdeps-params=--ignore-missing-info
cd squid-${SQUID_VER} && dpkg-buildpackage -rfakeroot -b

# and revert
popd
