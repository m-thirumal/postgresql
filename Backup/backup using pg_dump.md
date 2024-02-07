# Back up using `pg_dump`

`pg_dump` is a PostgreSQL tool to take backup

## Backing up a database

Syntax:-

```shell
psql -U {userName} pg_dump -d {databaseName} > {backup-file}.sql

sudo -u postgres pg_dump -d {database_name_to_backup} > {backup_file_name}.sql
```
