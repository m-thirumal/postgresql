As of version 9.5, you cannot drop a Postgres database while clients are connected to it, using only [`dropdb`][1] utility - which is a simple wrapper around [`DROP DATABASE`][2] server query.

Quite robust workaround follows:

Connect to your server as *superuser*, using `psql` or other client. Do *not* use the database you want to drop.

    psql -h localhost postgres postgres

Now using plain database client you can force drop database using three simple steps:

1.  Make sure no one can connect to this database. You can use one of following methods (the second seems safer, but works only for non-superusers).

        /* Method 1: update system catalog */
        UPDATE pg_database SET datallowconn = 'false' WHERE datname = 'mydb';

        /* Method 2: use ALTER DATABASE. Superusers still can connect! */
        ALTER DATABASE mydb CONNECTION LIMIT 1;

2. Force disconnection of all clients connected to this database, using [`pg_terminate_backend`][3].

 For Postgres versions >= 9.2 change `procpid` to `pid`:

        SELECT pg_terminate_backend(pid)
        FROM pg_stat_activity
        WHERE datname = 'mydb';

3. Drop it.

        DROP DATABASE mydb;

Step 1 requires *superuser* privileges for the 1st method, and *db owner* privileges for the 2nd one. Step 2 requires *superuser* privileges. Step 3 requires *database owner* privilege.

------
  [1]: https://www.postgresql.org/docs/9.5/static/app-dropdb.html
  [2]: https://www.postgresql.org/docs/9.5/static/sql-dropdatabase.html
  [3]: https://www.postgresql.org/docs/current/static/functions-admin.html#FUNCTIONS-ADMIN-SIGNAL-TABLE