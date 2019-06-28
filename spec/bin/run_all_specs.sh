#!/bin/bash
# A simple script to run all specs for all supported Rails branches

wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 4.2
RAILS_VERSION=4.2 sh $wd/run_spec.sh

# 5.1
RAILS_VERSION=5.1 sh $wd/run_spec.sh

# 5.2
RAILS_VERSION=5.2 sh $wd/run_spec.sh

# Always end with the default version
sh $wd/run_spec.sh
