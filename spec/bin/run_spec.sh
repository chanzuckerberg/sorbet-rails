#!/bin/bash
# A simple script to run spec for a single version of Rails

# need to use bash so that $wd returns the location of the script
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
current_dir=$(pwd)

if [[ -z $RAILS_VERSION ]]; then
  rails_dir="$wd/../support/v6.0"
else
  rails_dir="$wd/../support/v$RAILS_VERSION"
fi

# clean up & install gems
rm $wd/../../Gemfile.lock 2>/dev/null # clean up Gemfile.lock first
bundle install

echo "===================================================================="
echo "Run test for folder:"
echo $rails_dir
echo "===================================================================="

# update gems in rails_dir
cd $rails_dir
bundle install

# move back to current dir to run test
cd $current_dir

if [[ -z $RAILS_VERSION ]]; then
  echo "---- Run DEFAULT ----"
  bundle update && DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake
else
  echo "---- Run $RAILS_VERSION ----"
  RAILS_VERSION=$RAILS_VERSION bundle update
  RAILS_VERSION=$RAILS_VERSION DISABLE_DATABASE_ENVIRONMENT_CHECK=1 SBR_DEBUG_MODE=true bundle exec rake
fi
