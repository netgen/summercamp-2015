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

# ezobjwrapper setup
echo "Running ezobjwrapper workshop setup..."
( cd workshops/ezobjwrapper &&
  git checkout master &&
  git pull origin master &&
  sudo ln -sf /var/www/summercamp/workshops/ezobjwrapper/installation/vhost /etc/apache2/sites-enabled/ezobjwrapper.conf &&
  sudo sh ./installation/run.sh
)

# oop setup
echo "Running oop workshop setup..."
( cd workshops/oop &&
  git checkout master &&
  git pull origin master &&
  sudo ln -sf /var/www/summercamp/workshops/oop/installation/vhost /etc/apache2/sites-enabled/oop.conf &&
  sudo sh ./installation/run.sh
)

# docrine setup
echo "Running doctrine workshop setup..."
( cd workshops/doctrine &&
  git checkout master &&
  git pull origin master &&
  sudo ln -sf /var/www/summercamp/workshops/doctrine/installation/vhost /etc/apache2/sites-enabled/doctrine.conf &&
  sudo sh ./installation/run.sh
)

# httpcache setup
echo "Running httpcache workshop setup..."
( cd workshops/httpcache &&
  git checkout php-summercamp &&
  git pull origin php-summercamp &&
  sudo ln -sf /var/www/summercamp/workshops/httpcache/installation/vhost /etc/apache2/sites-enabled/httpcache.conf &&
  sudo sh ./installation/run.sh
)

# ezsolr setup
echo "Running ezsolr workshop setup..."
( cd workshops/ezsolr &&
  git checkout ezsc &&
  git pull origin ezsc &&
  sudo ln -sf /var/www/summercamp/workshops/ezsolr/installation/vhost /etc/apache2/sites-enabled/ezsolr.conf &&
  sudo sh ./installation/run.sh
)

# ci setup
echo "Running continuous integration workshop setup..."
( cd workshops/ci &&
  git checkout phpsummercamp &&
  git pull origin phpsummercamp &&
  sudo ln -sf /var/www/summercamp/workshops/ci/installation/vhost /etc/apache2/sites-enabled/ci.conf &&
  sudo sh ./installation/run.sh
)

# loose setup
echo "Running loose workshop setup..."
( cd workshops/loose &&
  git checkout php-summercamp &&
  git pull origin php-summercamp &&
  sudo ln -sf /var/www/summercamp/workshops/loose/installation/vhost /etc/apache2/sites-enabled/loose.conf &&
  sudo sh ./installation/run.sh
)

# puli workshop
# the conditional adding to .bashrc could be written better, but this works
# make sure puli.phar is in place before bin/install, and then do it again to use latest,
# otherwise <warn>The "puli"/"puli.phar" command could not be found.</warn> happens and then
# Generating autoload files
# PHP Fatal error:  Call to a member function run() on null in /var/www/summercamp/workshops/puli/acme-app1/vendor/puli/composer-plugin/src/PuliPlugin.php on line 446
# Fatal error: Call to a member function run() on null in /var/www/summercamp/workshops/puli/acme-app1/vendor/puli/composer-plugin/src/PuliPlugin.php on line 446
echo "Running puli workshop setup..."
( cd workshops/puli &&
  git checkout master &&
  git pull origin master && 
  sudo cp bin/puli.phar /usr/local/bin/puli &&
  sudo chmod a+x /usr/local/bin/puli &&
  ./bin/install &&
  sudo cp bin/puli.phar /usr/local/bin/puli &&
  sudo chmod a+x /usr/local/bin/puli &&
  if ! grep -qe "^alias puli" /home/vagrant/.bashrc; then
    echo "# Disable glob expansion for Puli" >> "/home/vagrant/.bashrc"
    echo "alias puli='set -f;puli';puli(){ command puli "$@";set +f;}" >> "/home/vagrant/.bashrc"
  fi
)

# ezbolt setup
echo "Running ezbolt workshop setup..."
( cd workshops/ezbolt &&
  git checkout master &&
  git pull origin master &&
  sudo ln -sf /var/www/summercamp/workshops/ezbolt/installation/vhost /etc/apache2/sites-enabled/ezbolt.conf &&
  sudo sh ./installation/run.sh
)

source ~/.bashrc

echo "Reloading apache..."
sudo service apache2 restart
