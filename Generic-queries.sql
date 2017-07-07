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