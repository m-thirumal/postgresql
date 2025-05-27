## Constraint on table size

* The maximum table size in PostgreSQL is `32TB`


### How Should The Table Be Partitioned?

* The keys for access patterns are in the `WHERE clause` and `JOIN` conditions. Any time a query specifies columns in the WHERE and JOIN clauses, it tells the database `This is the data I want`
