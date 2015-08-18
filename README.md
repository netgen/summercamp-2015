Summercamp 2015 Vagrant Box
===========================

Vagrant box, with Ansible provisioning to setup all that is required for Summercamp 2015.

## Authors

- [Srdjan Vranac]
- [Dinko Korunic]
- [Edi Modric]

## Prerequisites

You need to be using either OSX or linux as your OS.

If you are using Windows, let me know so I can take a look how to setup the ansible-pull (and if it is possible)

You need to have following installed:
- [Vagrant]
- [Ansible]
- [VirtualBox]

If you are on linux machine, preferred method of Ansible installation is
```
pip install ansible
```

If you are on an OS X machine, you can install Ansible with brew or pip
```
pip install ansible

or

brew install ansible
```

You should not be cloning the Ansible repo and running it like that.

The recommended version of Ansible at the time of writing is 1.8.4.

The minimum recommended version of vagrant at the time of writng is 1.7.3

With these versions you can use Virtualbox 4.x or 5.x

## Local development setup

The local development is meant to be used in a vagrant provisioned box.

The provisioner for the project is ansible.

Once you have the prerequisites setup, you can run the
```
vagrant up
```

from you terminal to start the process up.

If you do not see an error message, go get yourself a cup of coffee or your favorite beverage,
you deserve it.

If you start seeing the connection timeout after adding of the private key
```
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection timeout. Retrying...
    default: Warning: Connection timeout. Retrying...
```
You should open up the Virtualbox, click the vm running (name should be along the lines of 4cinc-thinkfasttoys....)
and reset it (on OSX it is cmd+t). This is due to some weird bug somewhere on intersection of vagrant, virtualbox and
this ubuntu cloud image.
After the initial virtual machine build, you will not need to use this.

***IMPORTANT***

If vagrant starts complaining about locale and crashes the provisioning, in
~/.bash_profile (or equivalent) add

```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

## Windows Support

Shell script will run from within the vm to provision the setup

## Hosts setup

You will need to add the following to your hosts file

```
172.21.12.10 ezsylius.ezsc
172.21.12.10 ezplatform.ezsc
172.21.12.10 ezplatformui.ezsc
172.21.12.10 ezmulticolors.ezsc
172.21.12.10 ez5perf.ezsc
172.21.12.10 ezbolt.ezsc
172.21.12.10 ezsolr.ezsc
172.21.12.10 ezobjwrapper.ezsc
172.21.12.10 doctrine.phpsc
172.21.12.10 ci.phpsc
172.21.12.10 oop.phpsc
172.21.12.10 modernising.phpsc
172.21.12.10 frontend.phpsc
172.21.12.10 loose.phpsc
172.21.12.10 lionframe.phpsc
172.21.12.10 httpcache.phpsc
172.21.12.10 puli.phpsc
172.21.12.10 modelling.phpsc
172.21.12.10 profiling.phpsc
172.21.12.10 symfony3.phpsc
172.21.12.10 apigility.phpsc
```

Linux/MacOS systems location of the hosts file is
```
/etc/hosts
```

Location on Windows systems is along the lines of
```
C:\Windows\System32\Drivers\etc\hosts
```

You may be required to use admin privileges to edit the hosts file.


[Vagrant]: http://www.vagrantup.com/downloads.html
[Ansible]: http://docs.ansible.com/intro_installation.html
[VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[Srdjan Vranac]: https://github.com/vranac
[Dinko Korunic]: https://github.com/dkorunic
[Edi Modric]: https://github.com/emodric
