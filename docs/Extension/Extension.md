# Extension

To list all available extensions:- 

```
select * from pg_available_extensions; 
```

To list installed extension of the selected database  

```
SELECT * FROM pg_extension;
```
OR 
```
\dx
```

## Install 

#### Syntax

```
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "btree_gist";
```