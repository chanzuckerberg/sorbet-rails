#!/bin/bash
# A simple script to reset test data for all rails versions

wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RESET_TEST_DATA=true sh $wd/run_all_specs.sh
