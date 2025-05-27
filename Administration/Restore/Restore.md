# Restore (Login as postgres user)

For `Mac OS` go to `/Applications/Postgres.app/Contents/Versions/latest/Bin`

```shell
./psql {database_name_to_backup} < /Users/Thirumal/Documents/{database_name_to_backup}.sql 
```

For `Ubuntu`, login with `postgres` user

``` shell
sudo su postgres
```
### Create database

```shell
psql
create {database_name};
\q
```

Syntax:-

```shell
psql -U {userName} {databaseName} < {backup-file}.sql
```

Example:-

```shell
psql -U postgres authorization-server < authorization-server.sql
```