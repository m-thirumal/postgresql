##### List all cluster

```sudo
pg_lsclusters
```

#### Start cluster

```sudo
sudo pg_ctlcluster 13 main start
```

#### Stop cluster

```sudo
sudo pg_ctlcluster 13 main stop
```

#### Status of Cluster

```sudo
systemctl status postgresql@13-main.service
```

#### Drop Cluster

```sudo
pg_dropcluster
```

Eg: sudo pg_dropcluster 13 main --stop

#### Upgrade cluster

```sudo
sudo pg_upgradecluster 13 main
```