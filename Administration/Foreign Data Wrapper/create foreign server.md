

```bash
CREATE SERVER {server-name}	FOREIGN DATA WRAPPER postgres_fdw   OPTIONS (host '{ip-address}', dbname '{database-name}');
--- Example

CREATE SERVER resource-server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host '127.0.0.1', dbname 'audit');
```

### Generated from pgModeler

```SQL

- [ Created objects ] --
-- object: postgres_fdw | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgres_fdw CASCADE;
CREATE EXTENSION postgres_fdw
WITH SCHEMA public;
-- ddl-end --

-- object: postgres_fdw | type: FOREIGN DATA WRAPPER --
-- DROP FOREIGN DATA WRAPPER IF EXISTS postgres_fdw CASCADE;
CREATE FOREIGN DATA WRAPPER postgres_fdw
NO HANDLER
NO VALIDATOR;
-- ddl-end --
ALTER FOREIGN DATA WRAPPER postgres_fdw OWNER TO postgres;
-- ddl-end --

-- object: icms | type: SERVER --
-- DROP SERVER IF EXISTS icms CASCADE;
CREATE SERVER icms
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (dbname 'icms',host '127.0.0.1');
-- ddl-end --
ALTER SERVER icms OWNER TO postgres;
-- ddl-end --

-- object: postgres@icms | type: USER MAPPING --
-- DROP USER MAPPING IF EXISTS FOR postgres SERVER icms;
CREATE USER MAPPING FOR postgres
SERVER icms
OPTIONS (password 'thirumal',user 'fdw_user');
```