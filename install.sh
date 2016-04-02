#!/bin/bash

set -e
BUILD_DEPS="gcc libc-dev pkgconfig git ruby bison"
MRUBY_VERSION='1.2.0'

# Install mruby build dependencies
apk add --update $BUILD_DEPS

# Download & build mruby
cd /tmp
mkdir -p /usr/local/mruby
curl https://codeload.github.com/mruby/mruby/tar.gz/$MRUBY_VERSION | tar xvz
cd /tmp/mruby-$MRUBY_VERSION
cp /tmp/build_config.rb ./
./minirake

# Move mruby and add links in /usr/local
mv build/host/* /usr/local/mruby/
ln -s /usr/local/mruby/bin/* /usr/local/bin/

# Clean up to keep container image small
apk del $BUILD_DEPS
cd /
rm -rf /tmp/mruby-$MRUBY_VERSION /var/cache/apk/*
rm -rf /usr/local/mruby/{lib,src}
