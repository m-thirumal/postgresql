# Extension

List all available extensions:- 

```SQL
select * from pg_available_extensions; 
```

List all installed extensions of the selected database  

```SQL
SELECT * FROM pg_extension;
```
OR 
```
\dx
```

## Install 

```SQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "btree_gist";
```