#!/bin/bash
# A simple script to reset test data for all Rails versions

wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

RESET_TEST_DATA=true bash $wd/run_all_specs.sh
