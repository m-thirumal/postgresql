# Foreign Data Wrapper (FDW)

`Foreign Data Wrapper (FDW)` is an extension available in PostgreSQL that allows you to `access a table or schema` in one database from another.

Postgres now has a lot of (foreign data wrappers)[https://wiki.postgresql.org/wiki/Foreign_data_wrappers] available and they work with plenty of different source types: `NoSQL databases, platforms like Twitter and Facebook, geospatial data formats, etc`.


## Why FWD?

* Your data may be segregated across databases, but still related in ways that makes being able to combine or aggregate it desirable.
    * Eg: Authorization server :family_man_man_boy: user details compare it with resourece server


* [Prepare & install FWD extention](Foreign%20Data%20Wrapper/Setup.md)
* [Create a foreign server](Foreign%20Data%20Wrapper/create%20foreign%20server.md)
