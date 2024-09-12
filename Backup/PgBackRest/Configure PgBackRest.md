# PgBackRest Configuration

## Configure Cluster Stanza

A stanza is the configuration for a PostgreSQL database cluster that defines where it is located, how it will be backed up, archiving options, etc.

?> Most db servers will only have one PostgreSQL database cluster and therefore one stanza, whereas backup servers will have a stanza for every database cluster that needs to be backed up.

PostgerSQL cluster location : `/var/lib/postgresql/[version]/[cluster]`

Configure the PostgreSQL cluster data directory in the file `/etc/pgbackrest/pgbackrest.conf`


```bash
[main]
pg1-path=/var/lib/postgresql/16/main
```

## Configure repository

The repository is where pgBackRest stores backups and archives WAL segments.

```bash
[global]
repo1-path=/var/lib/pgbackrest
```

for `S3`

```bash
[global]
repo1-path=/open-project
```

after confgure repository

```bash
[main]
pg1-path=/var/lib/postgresql/16/main

[global]
repo1-path=/open-project
```

## Configure Archiving 

[Configure PostgreSQL](Configure%20Postgres.md)

```bash
[global:archive-push]
compress-level=3
```



## Configure retention

pgBackRest expires backups based on retention options. 

```bash
[main]
pg1-path=/var/lib/postgresql/17/main

[global]
repo1-path=/var/lib/pgbackrest
repo1-retention-full=2

[global:archive-push]
compress-level=3
```

## Configure Repository Encryption 


```bash
[global]
repo1-cipher-pass=zWaf6XtpjIVZC5444yXB+cgFDFl7MxGlgkZSaoPvTGirhPygu4jOKOXf9LO4vjfO
repo1-cipher-type=aes-256-cbc
```

## Configure S3:

```bash
[main]
pg1-path=/var/lib/postgresql/13/main

[global]
process-max=4
repo1-cipher-pass=Thirumal
repo1-cipher-type=aes-256-cbc
repo1-path=/database/
repo1-retention-diff=2
repo1-retention-full=3
repo1-s3-bucket=icms-pro-backup
repo1-s3-endpoint=s3.ap-south-1.amazonaws.com
repo1-s3-key={}
repo1-s3-key-secret={}
repo1-s3-region=ap-south-1
repo1-type=s3 
start-fast=y 
    
[global:archive-push]
compress-level=3
```

## Final configuration for S3.

```bash
[main]
pg1-path=/var/lib/postgresql/16/main

[global]
process-max=4
repo1-block=y
repo1-bundle=y
repo1-cipher-pass=Thirumal
repo1-cipher-type=aes-256-cbc
repo1-path=/database
repo1-retention-diff=3
repo1-retention-full=1
repo1-s3-bucket=production-backup
repo1-s3-endpoint=s3.ap-south-1.amazonaws.com
repo1-s3-key=AKXXXXXXXXXXXXXXX
repo1-s3-key-secret=r8I3zdaksjndjkansdjnasjdasdas
repo1-s3-region=ap-south-1
repo1-type=s3
start-fast=y

[global:archive-push]
compress-level=3
```

## Test

### Create the Stanza 

The stanza-create command must be run to initialize the stanza. It is recommended that the check command be run after stanza-create to ensure archiving and backups are properly configured. 

```bash
sudo -u postgres pgbackrest --stanza=main --log-level-console=info stanza-create
```

### Check the Configuration

The check command validates that pgBackRest and the archive_command setting are configured correctly for archiving and backups for the specified stanza. It will attempt to check all repositories and databases that are configured for the host on which the command is run. It detects misconfigurations, particularly in archiving, that result in incomplete backups because required WAL segments did not reach the archive. 

```bash
sudo -u postgres pgbackrest --stanza=main --log-level-console=info check
```