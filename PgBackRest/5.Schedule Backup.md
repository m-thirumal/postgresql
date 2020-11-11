### Create `cron` job using `postgres` user


    sudo -u postgres crontab -e

###


    30 06  *   *   0     pgbackrest --type=full --stanza=main backup
    30 06  *   *   1-6   pgbackrest --type=diff --stanza=main backup