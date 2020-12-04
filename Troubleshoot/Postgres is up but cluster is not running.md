# Failed to start PostgreSQL Cluster main when booting

1. Check the cluster Status

       pg_lsclusters

       Cluster Down:

       Ver Cluster Port Status Owner    Data directory              Log file
       13  main    5432 down   postgres /var/lib/postgresql/13/main /var/log/postgresql/postgresql-13-main.log

2. Check & change the permission if it's not `700`,

       sudo chmod 700 -R /var/lib/postgresql/13/main/

3. Then, restart PostgreSQL server

       sudo -i -u postgres

       /usr/lib/postgresql/13/bin/pg_ctl restart -D /var/lib/postgresql/13/main
