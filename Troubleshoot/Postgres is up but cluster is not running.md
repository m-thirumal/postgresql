# Failed to start PostgreSQL Cluster main when booting

1. Check the cluster Status

```shell
pg_lsclusters

Cluster Down:

Ver Cluster Port Status Owner    Data directory              Log file
16  main    5432 down   postgres /var/lib/postgresql/16/main /var/log/postgresql/postgresql-16-main.log
```

2. Check & change the permission if it's not `700`,

```shell
sudo chmod 700 -R /var/lib/postgresql/16/main/

$ ls -l /var/lib/postgresql/16/main/
drwx------ 19 postgres postgres
```

3. Then, restart PostgreSQL server

```shell
sudo -i -u postgres

/usr/lib/postgresql/13/bin/pg_ctl restart -D /var/lib/postgresql/16/main

```
       