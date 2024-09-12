# What Is PostgreSQL Replication?

PostgreSQL replication is defined as the process of copying data from a PostgreSQL database server to another server. The source database server is also known as the “primary” server, whereas the database server receiving the copied data is known as the “replica” server.

`Primary Server/Node` -> where all writes happens

`Replica Server/Node` -> read-only replica server, receives the primary node broadcast 
