#!/bin/bash
# A simple script to run all specs for all Rails version

# 5.1.7
RAILS_VERSION=5.1.7 bundle update && RAILS_VERSION=5.1.7 bundle exec rake

# Always end with the default version
# 5.2.3
bundle update && bundle exec rake
