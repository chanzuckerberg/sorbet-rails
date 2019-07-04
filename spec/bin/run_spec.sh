#!/bin/bash
# A simple script to run spec for a single version of Rails

# need to use bash so that $wd returns the location of the script
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
current_dir=$(pwd)

if [[ -z $RAILS_VERSION ]]; then
  rails_dir="$wd/../support/v5.2"
else
  rails_dir="$wd/../support/v$RAILS_VERSION"
fi

echo $RAILS_VERSION
if [[ $RAILS_VERISON = 4.2 ]]; then
  bundle_version="_1.17.3_"
else
  bundle_version=""
fi
echo $bundle_version

# clean up & install gems
echo $rails_dir
rm $wd/../../Gemfile.lock 2>/dev/null # clean up Gemfile.lock first
rm $rails_dir/Gemfile.lock 2>/dev/null
cd $rails_dir
bundle $bundle_version install

# move back to current dir to run test
cd $current_dir

if [[ -z $RAILS_VERSION ]]; then
  echo "---- Run DEFAULT ----"
  bundle update && bundle exec rake
else
  echo "---- Run $RAILS_VERSION ----"
  echo $bundle_version
  RAILS_VERSION=$RAILS_VERSION bundle $bundle_version update
  RAILS_VERSION=$RAILS_VERSION bundle $bundle_version exec rake
fi
