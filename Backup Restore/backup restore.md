#### To take back up

    sudo -u postgres pg_dump {database_name_to_backup} > {backup_file_name}.sql

#### Restore (Login as postgres user)

For `Mac OS` go to `/Applications/Postgres.app/Contents/Versions/latest/Bin`

    ./psql {database_name_to_backup} < /Users/Thirumal/Documents/{database_name_to_backup}.sql 

For `Ubuntu`, login with `postgres` user

    sudo su postgres
    
    # Create database
    psql
    create {database_name};
    \q

    psql -U {userName} {databaseName} < {backup-file}.sql 

    psql -U postgres {database_name_to_backup} < {database_name_to_backup}.sql



