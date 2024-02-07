# Back up using `pg_dump`

`pg_dump` is a PostgreSQL tool to take backup

## Backup Table

```shell
pg_dump -U postgres -t {table_name} {database_name} > {backup_file}.sql

pg_dump -U postgres -t students example_backups > {backup_file}.sql.
```

## Back up database

Syntax:-

```shell
psql -U {userName} pg_dump -d {databaseName} > {backup-file}.sql

sudo -u postgres pg_dump -d {database_name_to_backup} > {backup_file_name}.sql
```
