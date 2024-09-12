# Introduction

[PgBackRest](https://pgbackrest.org/) aims to be a reliable, easy-to-use backup and restore solution that can seamlessly scale up to the largest databases and workloads by utilizing algorithms that are optimized for database-specific requirements.

## Features

* Parallel Backup & Restore
* Local or Remote Operation
* Full, Incremental, & Differential Backups
* Backup Rotation & Archive Expiration
* Backup Integrity
* Page Checksums
* Backup Resume
* Streaming Compression & Checksums
* Delta Restore
* Parallel, Asynchronous WAL Push & Get
* Tablespace & Link Support
* S3 and Azure Compatible Object Store Support
* Encryption

## Build, Install and Configure

* [Build](Backup/PgBackRest/build.md)
* [Installation](Backup/PgBackRest/Installation.md)
* [PostgreSQL Configuration](Backup/PgBackRest/Configure%20Postgres.md)
* [PgBackRest Configuration & Create Stanza & Test](Backup/PgBackRest/Configure%20PgBackRest.md)
* [Manual & Automate Backup](Backup/PgBackRest/Perform-Schedule-Backup.md)
* [Remote Backup and restore](Backup/PgBackRest/Remote%20Backup%20and%20Restore.md)


## Basic commands

| Purpose                                       | Command                                                                                |
|-----------------------------------------------|----------------------------------------------------------------------------------------|
| Get all backup info                           | sudo -u postgres pgbackrest info                                                       |
| Create Stanza                                 | sudo -u pgbackrest pgbackrest --stanza=demo stanza-create                              |
| Check whether congiurations are properly set  | sudo -u pgbackrest pgbackrest --stanza=demo check                                      |
| Backup                                        | sudo -u pgbackrest pgbackrest --stanza=demo backup                                     |
| Restore                                       | sudo -u postgres pgbackrest --stanza=demo --delta restore                              |
| To specify type of backup - `full` or `diff`  | sudo -u postgres pgbackrest --stanza=demo --type=diff  --log-level-console=info backup |