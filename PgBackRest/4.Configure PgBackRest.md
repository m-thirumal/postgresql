### Configure Cluster

    [main]
    pg1-path=/var/lib/postgresql/13/main

### Configure retention

    [main]
    pg1-path=/var/lib/postgresql/13/main

    [global]
    repo1-path=/var/lib/pgbackrest
    repo1-retention-full=2

    [global:archive-push]
    compress-level=3


### Configure S3:


    [main]
    pg1-path=/var/lib/postgresql/13/main

    [global]
    process-max=4
    repo1-cipher-pass=Thirumal
    repo1-cipher-type=aes-256-cbc
    repo1-path=/database/
    repo1-retention-diff=2
    repo1-retention-full=3
    repo1-s3-bucket=icms-pro-backup
    repo1-s3-endpoint=s3.ap-south-1.amazonaws.com
    repo1-s3-key={}
    repo1-s3-key-secret={}
    repo1-s3-region=ap-south-1
    repo1-type=s3 
    start-fast=y 
        
    [global:archive-push]
    compress-level=3
