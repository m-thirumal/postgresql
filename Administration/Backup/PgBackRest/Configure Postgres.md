# Configure the PostgreSQL for the PgBackRest

## Listen Address

* Modify `listen address` with desired IP address

```bash
listen_addresses = '*'
```

## Configure `Archive`

Backing up a running PostgreSQL cluster requires WAL archiving to be enabled. Note that at least one WAL segment will be created during the backup process even if no explicit writes are made to the cluster.

In the below configuration `main` is a stanza name

```bash
archive_command = 'pgbackrest --stanza=main archive-push %p'
archive_mode = on
log_line_prefix = ''
max_wal_senders = 3
wal_level = replica
```