--- Drop Database
DROP DATABASE DEMO;
---The above command will work when there is no active connection
DROP DATABASE DEMO WITH (FORCE);
---The above DDL will work only from PostgreSQL 13.
