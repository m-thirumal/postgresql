##### List all cluster

    pg_lsclusters

#### Start cluster

    sudo pg_ctlcluster 13 main start

#### Stop cluster

    sudo pg_ctlcluster 13 main stop

#### Status of Cluster

    systemctl status postgresql@13-main.service

#### Drop Cluster

    pg_dropcluster

    Eg: sudo pg_dropcluster 13 main --stop

#### Upgrade cluster

    sudo pg_upgradecluster 13 main
