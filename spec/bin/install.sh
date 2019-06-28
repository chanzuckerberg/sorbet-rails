#!/bin/sh
# A simple script to run bundle install

case $RAILS_VERSION in
  4.2)
    RAILS_VERSION=4.2 bundle _1.17.3_ install --jobs=3 --retry=3
    ;;
  *)
    bundle install --jobs=3 --retry=3
    ;;
esac
