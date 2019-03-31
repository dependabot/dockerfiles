#!/bin/bash
apt-get source "git=1:${GIT_VERSION}"

cd "git-${GIT_VERSION}"

# swap out gnutls for openssl
sed -i -- 's/libcurl4-gnutls-dev/libcurl4-openssl-dev/' ./debian/control
# skip tests to speed things up
sed -i -- '/TEST\s*=\s*test/d' ./debian/rules
# build the .deb
dpkg-buildpackage -rfakeroot -b

cd ..
cp "git_${GIT_VERSION}-1ubuntu0.4_amd64.deb" "../git-openssl.deb"
