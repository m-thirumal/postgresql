# Postgis Installation

Install using `apt`

```shell
sudo apt install postgis
```

(OR)

```shell
sudo apt install postgis postgresql-15-postgis-3
```

# Enable PostGIS

```SQL
CREATE EXTENSION postgis SCHEMA public;
```

# Test

```SQL
SELECT postgis_full_version();
```