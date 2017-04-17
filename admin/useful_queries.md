_Show database size_
> SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;
> SELECT pg_size_pretty(pg_database_size('ICMS'));

_Show size of table size_
> SELECT pg_size_pretty(pg_relation_size('code.address_type_cd'));

Reload configuration 
> select pg_reload_conf();
