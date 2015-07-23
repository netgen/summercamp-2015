#!/usr/bin/env bash

# setup the submodules
git submodule init
git submodule update

# ezsylius setup
( cd workshops/ezpublish-community-sylius &&
  git checkout sylius_integration &&
  git pull origin sylius_integration
)

( cd workshops/ezpublish-community-sylius/installation &&
  sudo ln -sf /var/www/ezpublish/workshops/ezpublish-community-sylius/installation/vhost /etc/apache2/sites-enabled/ezsylius.conf &&
  sudo sh ./run.sh
)

sudo service apache2 reload
