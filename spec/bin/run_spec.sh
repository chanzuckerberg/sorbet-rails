#!/bin/bash
# A simple script to run spec for a single version of Rails

# need to use bash so that $wd returns the location of the script
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case $RAILS_VERSION in
  4.2)
    echo 'run spec with Rails 4.2'
    rm $wd/../../Gemfile.lock 2>/dev/null # clean up Gemfile.lock first
    RAILS_VERSION=4.2 bundle _1.17.3_ update && RAILS_VERSION=4.2 bundle _1.17.3_ exec rake
    ;;
  5.0)
    echo 'run spec with Rails 5.0'
    rm $wd/../../Gemfile.lock 2>/dev/null
    RAILS_VERSION=5.0 bundle update && RAILS_VERSION=5.0 bundle exec rake
    ;;
  5.1)
    echo 'run spec with Rails 5.1'
    rm $wd/../../Gemfile.lock 2>/dev/null
    RAILS_VERSION=5.1 bundle update && RAILS_VERSION=5.1 bundle exec rake
    ;;
  5.2)
    echo 'run spec with Rails 5.2'
    rm $wd/../../Gemfile.lock 2>/dev/null
    RAILS_VERSION=5.2 bundle update && RAILS_VERSION=5.2 bundle exec rake
    ;;
  *)
    echo 'run default'
    bundle update && bundle exec rake
    ;;
esac
