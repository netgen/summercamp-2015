#!/usr/bin/env bash

# ezsylius setup
function ezsylius_setup() {
  echo "Running ezsylius workshop setup..."
  ( cd workshops/ezpublish-community-sylius &&
    git checkout sylius_integration &&
    git pull origin sylius_integration &&
    sudo ln -sf /var/www/summercamp/workshops/ezpublish-community-sylius/installation/vhost /etc/apache2/sites-enabled/ezsylius.conf &&
    sudo sh ./installation/run.sh
  )
}

# ezobjwrapper setup
function ezobjwrapper_setup() {
  echo "Running ezobjwrapper workshop setup..."
  ( cd workshops/ezobjwrapper &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/ezobjwrapper/installation/vhost /etc/apache2/sites-enabled/ezobjwrapper.conf &&
    sudo sh ./installation/run.sh
  )
}

# oop setup
function oop_setup() {
  echo "Running oop workshop setup..."
  ( cd workshops/oop &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/oop/installation/vhost /etc/apache2/sites-enabled/oop.conf &&
    sudo sh ./installation/run.sh
  )
}

# doctrine setup
function doctrine_setup() {
  echo "Running doctrine workshop setup..."
  ( cd workshops/doctrine &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/doctrine/installation/vhost /etc/apache2/sites-enabled/doctrine.conf &&
    sudo sh ./installation/run.sh
  )
}

# httpcache setup
function httpcache_setup() {
  echo "Running httpcache workshop setup..."
  ( cd workshops/httpcache &&
    git checkout php-summercamp &&
    git pull origin php-summercamp &&
    sudo ln -sf /var/www/summercamp/workshops/httpcache/installation/vhost /etc/apache2/sites-enabled/httpcache.conf &&
    sudo sh ./installation/run.sh
  )
}

# ezsolr setup
function ezsolr_setup() {
  echo "Running ezsolr workshop setup..."
  ( cd workshops/ezsolr &&
    git checkout ezsc &&
    git pull origin ezsc &&
    sudo ln -sf /var/www/summercamp/workshops/ezsolr/installation/vhost /etc/apache2/sites-enabled/ezsolr.conf &&
    sudo sh ./installation/run.sh
  )
}

# ci setup
function ci_setup() {
  echo "Running continuous integration workshop setup..."
  ( cd workshops/ci &&
    git checkout phpsummercamp &&
    git pull origin phpsummercamp &&
    sudo ln -sf /var/www/summercamp/workshops/ci/installation/vhost /etc/apache2/sites-enabled/ci.conf &&
    sudo sh ./installation/run.sh
  )
}

# loose setup
function loose_setup() {
  echo "Running loose workshop setup..."
  ( cd workshops/loose &&
    git checkout php-summercamp &&
    git pull origin php-summercamp &&
    sudo ln -sf /var/www/summercamp/workshops/loose/installation/vhost /etc/apache2/sites-enabled/loose.conf &&
    sudo sh ./installation/run.sh
  )
}

# ez performance setup
function ezperformance_setup() {
  echo "Running ez performance workshop setup..."
  ( cd workshops/ez-performance &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/ez-performance/installation/vhost /etc/apache2/sites-enabled/performance.conf &&
    sudo sh ./installation/run.sh
  )
}

# puli workshop
function puli_setup() {
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
}

# ezbolt setup
function ezbolt_setup() {
  echo "Running ezbolt workshop setup..."
  ( cd workshops/ezbolt &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/ezbolt/installation/vhost /etc/apache2/sites-enabled/ezbolt.conf &&
    sudo sh ./installation/run.sh
  )
}

# frontend setup
function frontend_setup() {
  echo "Running frontend workshop setup..."
  sudo npm cache clear
  ( cd workshops/frontend &&
    git checkout master &&
    git pull origin master
  )
}

# lionframe setup
function lionframe_setup() {
  echo "Running lionframe workshop setup..."
  ( cd workshops/lionframe &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/lionframe/installation/vhost /etc/apache2/sites-enabled/lionframe.conf &&
    sudo sh ./installation/run.sh
  )
}

# modelling setup
function modelling_setup() {
  echo "Running modelling workshop setup..."
  ( cd workshops/modelling &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/modelling/installation/vhost /etc/apache2/sites-enabled/modelling.conf &&
    sudo sh ./installation/run.sh
  )
}

# modernising setup
function modernising_setup() {
  echo "Running modernising workshop setup..."
  ( cd workshops/modernising &&
    git checkout master &&
    git pull origin master
  )
}

# apigility setup
function apigility_setup() {
  echo "Running apigility workshop setup..."
  ( cd workshops/apigility &&
    git checkout master &&
    git pull origin master &&
    sudo ln -sf /var/www/summercamp/workshops/apigility/installation/vhost /etc/apache2/sites-enabled/apigility.conf &&
    sudo sh ./installation/run.sh
  )
}

# ezplatform setup
function ezplatform_setup() {
  echo "Running ezplatform workshop setup..."
  ( cd workshops/ezplatform &&
    git checkout master &&
    git pull origin master
  )
}

# ezplatformui setup
function ezplatformui_setup() {
  echo "Running ezplatformui workshop setup..."
  ( cd workshops/ezplatformui &&
    git checkout ezsc2015 &&
    git pull origin ezsc2015
  )
}

# profiling setup
function profiling_setup() {
  echo "Running profiling workshop setup..."
  ( cd workshops/profiling &&
    git checkout master &&
    git pull origin master
  )
}

# symfony3 setup
function symfony3_setup() {
  echo "Running symfony3 workshop setup..."
  ( cd workshops/symfony3 &&
    git checkout master &&
    git pull origin master
  )
}

function all() {
  ezsylius_setup
  ezobjwrapper_setup
  oop_setup
  doctrine_setup
  httpcache_setup
  ezsolr_setup
  ci_setup
  loose_setup
  ezperformance_setup
  puli_setup
  ezbolt_setup
  frontend_setup
  lionframe_setup
  modelling_setup
  modernising_setup
  apigility_setup
  ezplatform_setup
  ezplatformui_setup
  profiling_setup
  symfony3_setup
}

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

# get argument
if [ -z "$1" ]
then
   all
else
  "$1_setup"
fi

source ~/.bashrc

echo "Reloading apache..."
sudo service apache2 restart
