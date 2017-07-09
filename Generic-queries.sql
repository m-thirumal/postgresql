---To get all the details about postgresql (here to get total number of rows in all tables)
SELECT schemaname, relname, n_live_tup FROM pg_stat_user_tables where schemaname = 'code' ORDER BY n_live_tup DESC; 

-- Show database size_
SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;
SELECT pg_size_pretty(pg_database_size('indsolv'));

---Show size of table size_
SELECT pg_size_pretty(pg_relation_size('code.address_type_cd'));

---Reload configuration 
select pg_reload_conf();

-- To get last commit/transaction Date of table
select pg_xact_commit_timestamp(xmin), * from indsolv.address

-- To get last commit/transaction Date of column
SELECT pg_xact_commit_timestamp(xmin), * FROM YOUR_TABLE_NAME where COLUMN_NAME=VALUE;

-- Show default date style
SHOW datestyle;

--- Get current date
SELECT current_date;

--- Change date style (postgres, ISO, SQL)
SET datestyle TO postgres, dmy;
SET datestyle TO postgres, mdy;
SET datestyle TO ISO, dmy;
---Get all scehma name
select schema_name from information_schema.schemata
select nspname from pg_catalog.pg_namespace;
---list of schema with sizes 
SELECT schema_name, pg_size_pretty(sum(table_size)::bigint) as "disk space", (sum(table_size) / pg_database_size(current_database())) * 100 as "percent" FROM (SELECT pg_catalog.pg_namespace.nspname as schema_name, pg_relation_size(pg_catalog.pg_class.oid) as table_size FROM   pg_catalog.pg_class JOIN pg_catalog.pg_namespace ON relnamespace = pg_catalog.pg_namespace.oid) t GROUP BY schema_name ORDER BY schema_name
