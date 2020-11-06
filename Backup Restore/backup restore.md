#### To take back up

    sudo -u postgres pg_dump indsolv > indsolv.sql

#### Restore (Login as postgres user)

For `Mac OS` go to `/Applications/Postgres.app/Contents/Versions/latest/Bin`

    ./psql indsolv< /Users/Thirumal/Documents/indsolv.sql 

For `Ubuntu`

    psql -U {userName} {databaseName} < {backup-file}.sql 

    psql -U postgres indsolv-dev < indsolv.sql



