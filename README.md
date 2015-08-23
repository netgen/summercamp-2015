Summercamp 2015 Vagrant Base Box
================================

Vagrant base box, with Ansible pull based provisioning to setup all that is required for Summercamp 2015.

## Authors

- [Srdjan Vranac]
- [Dinko Korunic]
- [Edi Modric]

## Prerequisites

You need to have following installed:
- [Vagrant]
- [VirtualBox]

The minimum recommended version of vagrant at the time of writng is 1.7.3

With these versions you can use Virtualbox 4.x or 5.x

## Local development setup

The local development is meant to be used in a vagrant provisioned box.

The provisioner for the project is ansible.

Once you have the prerequisites setup, clone the repo, and from the cloned repo directory run the
```
vagrant up --no-provision
```

from you terminal to start the process up.

***IMPORTANT***
note the `--no-provision` switch

This will download the basebox and start it up, as everything is already installed, there is no need for provisioning
hence the `--no-provision` switch

If you do not see an error message, go get yourself a cup of coffee or your favorite beverage,
you deserve it.

If you start seeing the connection timeout after adding of the private key
```
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection timeout. Retrying...
    default: Warning: Connection timeout. Retrying...
```
You should open up the Virtualbox, click the vm running (name should be along the lines of netgen-summercamp2015....)
and reset it (on OSX it is cmd+t). This is due to some weird bug somewhere on intersection of vagrant, virtualbox and
this ubuntu cloud image.
After the initial virtual machine build, you will not need to use this.

If for any reason you need to reprovision the vm, you will need to run

```
vagrant provision
```

Be carefull with this one, as it takes a LOT of time on slow connection.

***IMPORTANT***

If vagrant starts complaining about locale and crashes the provisioning, in
~/.bash_profile (or equivalent) add

```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

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

## Workshop setup

For your convenience there is a `run.sh` script available in the root of the summercamp vm
```
/var/www/summercamp/
```

You can run it without an argument which will in turn setup all the workshops, or you can run it with workshop name
as argument, and it will only run setup for that workshop. Possible arguments are

```
ezsylius
ezobjwrapper
oop
doctrine
httpcache
ezsolr
ci
loose
ezperformance
puli
ezbolt
frontend
lionframe
modelling
modernising
apigility
ezplatform
ezplatformui
profiling
symfony3
```

so you could run

```
./run.sh ezsylius
```

and only the ezsylius workshop would be installed


[Vagrant]: http://www.vagrantup.com/downloads.html
[Ansible]: http://docs.ansible.com/intro_installation.html
[VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[Srdjan Vranac]: https://github.com/vranac
[Dinko Korunic]: https://github.com/dkorunic
[Edi Modric]: https://github.com/emodric
