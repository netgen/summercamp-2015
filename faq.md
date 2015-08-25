Frequently Asked Questions
==========================

1. My /var/www/summercamp is empty

    Do you have the nfs-kernel-server or equivalent installed and running?

2. My basebox is downloading slowly.

    Some people repored this, and we could not reproduce it.
    But you could do a 

    ```
    wget http://www.netgenlabs.com/ezsc/summercamp2015.box
    ```

    to download the base box, and once downloaded you can do
    
    ```
    vagrant box add netgen/summercamp2015 summercamp2015.box
    ```
    
    I am assuming that you are executing the command from the same directory where you downloaded the box.

3. run.sh is throwing exceptions and errors

    You should pull the latest master from the repo.
    You should ssh into your vm by executing

    ```
    vagrant ssh
    ```

    then change directory to summercamp by executing

    ```
    cd /var/www/summercamp
    ```

    and then run the run.sh by executing

    ```
    ./run.sh
    ```

    OR

    ```
    bash ./run.sh
    ```

4. Vagrant is provisioning my vm, this takes a long time

    Your base box has already been provisioned, and without some explicit need you should not have to do this.
    You should stop the provisioning process by stopping the vagrant (CTRL+c works), then destroy the vm by executing

    ```
    vagrant destroy
    ```

    and then start a new vm by executing, and this is **really important**

    ```
    vagrant up --no-provision
    ```

    That **--no-provision** will make sure that the provisioning is **NOT** done.

5. I am getting the connection timeout after adding of the private key, the error looks like
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
    
6. Vagrant is complaining about locales and crashes

    In ~/.bash_profile (or equivalent) add

    ```
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    ```
