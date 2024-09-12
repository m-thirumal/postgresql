# Installation

##  Install dependencies

```bash
sudo apt-get install postgresql-client libxml2 libssh2-1
```

## Copy the build to `/usr/bin`

```bash
sudo scp build:/build/pgbackrest/src/pgbackrest /usr/bin

sudo chmod 755 /usr/bin/pgbackrest
```


## pgBackRest requires log and configuration directories and a configuration file.

```bash
sudo mkdir -p -m 770 /var/log/pgbackrest

sudo chown postgres:postgres /var/log/pgbackrest

sudo mkdir -p /etc/pgbackrest

sudo mkdir -p /etc/pgbackrest/conf.d

sudo touch /etc/pgbackrest/pgbackrest.conf

sudo chmod 640 /etc/pgbackrest/pgbackrest.conf

sudo chown postgres:postgres /etc/pgbackrest/pgbackrest.conf
```

## Make sure the installation worked


```bash
sudo -u postgres pgbackrest
````