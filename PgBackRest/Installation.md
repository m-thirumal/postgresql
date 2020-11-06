###  Install dependencies

    sudo apt-get install postgresql-client libxml2

### Copy the build to `/usr/bin`

    sudo scp build:/build/pgbackrest-release-2.30/src/pgbackrest /usr/bin

    sudo chmod 755 /usr/bin/pgbackrest


### pgBackRest requires log and configuration directories and a configuration file.

    sudo mkdir -p -m 770 /var/log/pgbackrest

    sudo chown postgres:postgres /var/log/pgbackrest

    sudo mkdir -p /etc/pgbackrest

    sudo mkdir -p /etc/pgbackrest/conf.d

    sudo touch /etc/pgbackrest/pgbackrest.conf

    sudo chmod 640 /etc/pgbackrest/pgbackrest.conf

    sudo chown postgres:postgres /etc/pgbackrest/pgbackrest.conf


#### Make sure the installation worked


    sudo -u postgres pgbackrest