## Physical location of table

`pg_relation_filepath` which returns the first heap file segment with a relative path to the environment variable `PGDATA`

    postgres=# SELECT pg_relation_filepath('table_name');
    
## The extension for Page

The `pageinspect` extension provides the functions that allow you to inspect the contents of database pages at a low level, which is very useful for debugging purposes. Here are the main functions provided by pageinspect. To use this extension, you have to install it first, and then add it to your PG server. For example,
    
    postgres=# create extension pageinspect;
    CREATE EXTENSION
    
