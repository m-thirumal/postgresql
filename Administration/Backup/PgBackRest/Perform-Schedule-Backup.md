# Perform Manual Backup
By default pgBackRest will wait for the next regularly scheduled checkpoint before starting a backup. Depending on the checkpoint_timeout and checkpoint_segments settings in PostgreSQL it may be quite some time before a checkpoint completes and the backup can begin

```bash
sudo -u postgres pgbackrest --stanza=main --log-level-console=info backup
```
### Differntial backup

By default pgBackRest will attempt to perform an incremental backup. However, an incremental backup must be based on a full backup and since no full backup existed pgBackRest ran a full backup instead. 

The type option can be used to specify a full or differential backup. 

```bash
sudo -u postgres pgbackrest --stanza=main --type=diff --log-level-console=info backup
```

!> For full `--type=full`
!> For diff `--type=diff`

# Schedule Backup - Automate

* Create `cron` job using `postgres` user

Open cron file

```bash
sudo -u postgres crontab -e
```

or, for remote backup server

```bash
sudo -u pgbackrest crontab -e
```

then, add the scheduler.

!> The below command will take `full` backup on everyday morning `6:30` and `incremental` backup on every `30` mintues

```shell
30 06  *   *   0     pgbackrest --type=full --stanza=main backup
*/30 *  *   *   1-6   pgbackrest --type=diff --stanza=main backup
```

# Backup Information 

To Get the backup information, 

```bash
sudo -u postgres pgbackrest info
```