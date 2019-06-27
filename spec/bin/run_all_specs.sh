#!/bin/sh
# A simple script to run all specs for all supported Rails branches

# 5.1
RAILS_VERSION=5.1 bundle update && RAILS_VERSION=5.1 bundle exec rake

# 5.1
RAILS_VERSION=5.2 bundle update && RAILS_VERSION=5.2 bundle exec rake

# Always end with the default version
bundle update && bundle exec rake
