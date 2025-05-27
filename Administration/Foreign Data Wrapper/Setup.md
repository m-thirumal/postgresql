# Set up

## Create the Extension

create the foreign data wrapper extension by running the following command

```bash
CREATE EXTENSION IF NOT EXISTS postgres_fdw;
```

## Set up / Configuration in Foreign DB

    * `source -` is the remote postgres server from where the tables are accessed by the destination database server as foreign tables.
    * `destination -` is another postgres server where the foreign tables are created which is referring tables in source database server.

### Create test tables

```SQL
postgres=> create table employee (id int, first_name varchar(20), last_name varchar(20));
CREATE TABLE

postgres=# insert into employee values (1,'Thirumal','M'),(2,'Jenny','T'),(3,'fernando','camargos');
INSERT 0 3
```

### Grant privileges to user
Here I am creating `READ-ONLY` user, of my choice in foreign database

`Syntax`
```bash
CREATE USER {user-name} WITH PASSWORD '{password}';
GRANT USAGE ON SCHEMA {schema-name} TO {user-name};
GRANT SELECT ON {table-name} TO {user-name};
```
`Example`
```bash
CREATE USER fdw_user WITH PASSWORD 'thirumal';
GRANT USAGE ON SCHEMA public TO fdw_user;
GRANT SELECT ON public.employee TO fdw_user;
```
### Modify ACL in pg_hba.conf

We need to ensure that the proper authentication is setup for accessing source server from the destination server.

Locate `pg_hba.conf` by following query

```sql
SHOW hba_file;
```

Add an entry into  `pg_hba.conf` as shown below, preferably at the beginning of the file.

```bash
host    all all     destination_server_ip/32          md5
```
### Test connectivity and privileges on source

```bash
psql -h {ip-address} -U {user-name} postgres

psql -h 127.0.0.1 -U fdw_user postgres
```