Summer Camp workshop preparation
================================

In order to use the time dedicated to the workshops efficiently as possible, it is vital to have a virtual appliance
ready with all workshop code available to participants before the camp starts. A multirepo vagrant box is the basis for
this task. Each speaker should prepare his workshop repo so it is easy to automate building of the appliance.

## Concept

This repo is the main point of assembly with the Vagrant and Ansible configuration and script for merging all the
workshops repos. Workshop repos are merged via git submodule feature. Once the appliance is provisioned and all the
submodule repos are cloned, the main script executes the specific installation script on each repo. That specific
installation script should execute everyting that needs to configured for the workshop. Lastly, the main script symlinks
the prepared vhost file from the repo to apache configuration and reloads the server. The specific installation script
and the vhost file need to be implemented by the speaker.

## Prerequisites

- A git repo should be created for the purpose of showing the examples at the camp. Best is to add it to the speaker's
public Github profile.
- The repo should have the main application installed (e.g. Symfony, eZ Platform, etc), but without running the
"composer install". So all installation procedures that are not simply automated via shell should be executed beforehand
(e.g. the eZ Publish legay installer). Generated configuration files, database dump and similar should stored for
simpler restoring.
- As we don't want interaction during assembly, all configuration should have deafult parameters in parameters.yml.dist
file. The database name, username and password should be set too
- Workshop specific code can be added later, it will be updated before the camp (and at the beginning of the workshop).
For the preparations it is important to establish the base application to work on top of the appliance.

## Preparations

Follow these steps to make the repo according to the concept:

1. Create the "installation" folder in the repo.
2. Put the apache virtual host file inside the installation folder and name it vhost (use the provided domain name and path)
3. Put all the files that are necessary for the installation in the installation folder (database dumps, generated configuraion files, etc.)
4. If you need the database, set the provided database name in the parameters.yml.dist . Mysql username/password is summer/camp
5. Create the "run.sh" bash script in the installation folder that will load the database (no need to create the database),
copy necessary files, run the "composer install -n" (non-interactive mode) and execute any other script.
6. Send us the repo link and the branch you are using

## Testing

Once we get the workshop repo we will configure the main repo and test the scripts. Once it is installed correctly the
speaker can continue with testing and workhop preparation.




