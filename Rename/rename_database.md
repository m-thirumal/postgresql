### Terminate all the connections to the database
```
	SELECT
	    pg_terminate_backend (pid)
	FROM
	    pg_stat_activity
	WHERE
	    datname = 'db';
```
### Rename database

```
ALTER DATABASE db RENAME TO newdb;
```
