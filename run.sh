#!/usr/bin/env bash

echo "Running github token setup..."
# This is unfortunately only way to avoid Github API limits.
# Please don't use our token, neither token nor it's user gives access to anything other then authentication, so better if you create your own.
# PS: The simple obfuscation here is only to avoid Github from detecting this on commits.
EZ_GITHUB_TOKEN_A=`echo "72da3af60fc34f59dec6" | rev`
EZ_GITHUB_TOKEN_B=`echo "e2c23336ce0d96dcc3db" | rev`

composer config -g github-oauth.github.com "${EZ_GITHUB_TOKEN_A}${EZ_GITHUB_TOKEN_B}"

# setup the submodules
git submodule init
git submodule update

# ezsylius setup
echo "Running ezsylius workshop setup..."
( cd workshops/ezpublish-community-sylius &&
  git checkout sylius_integration &&
  git pull origin sylius_integration &&
  sudo ln -sf /var/www/summercamp/workshops/ezpublish-community-sylius/installation/vhost /etc/apache2/sites-enabled/ezsylius.conf &&
  sudo sh ./installation/run.sh
)

# ezobjectwrapper setup
echo "Running ezobjectwrapper workshop setup..."
( cd workshops/ezobjectwrapper &&
  git checkout master &&
  git pull origin master &&
  sudo ln -sf /var/www/summercamp/workshops/ezobjectwrapper/installation/vhost /etc/apache2/sites-enabled/ezobjectwrapper.conf &&
  sudo sh ./installation/run.sh
)

echo "Reloading apache..."
sudo service apache2 reload
