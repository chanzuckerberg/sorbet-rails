#!/bin/bash
# A simple script to run all specs for all supported Rails branches

wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

RAILS_VERSION=4.2 bash $wd/run_spec.sh
RAILS_VERSION=5.0 bash $wd/run_spec.sh
RAILS_VERSION=5.1 bash $wd/run_spec.sh
RAILS_VERSION=6.0 bash $wd/run_spec.sh

# Always end with the default version, which is Rails 5.2
sh $wd/run_spec.sh
