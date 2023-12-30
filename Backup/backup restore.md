#### To take back up using `pg_dump`

Syntax:-

```shell
psql -U {userName} pg_dump {databaseName} > {backup-file}.sql

sudo -u postgres pg_dump {database_name_to_backup} > {backup_file_name}.sql
```




