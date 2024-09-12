# Configure the PostgreSQL for the PgBackRest

## Listen Address

* Modify `listen address` with desired IP address

```bash
listen_addresses = '*'
```

## Configure `Archive`

```bash
archive_command = 'pgbackrest --stanza=main archive-push %p'
archive_mode = on
listen_addresses = '*'
log_line_prefix = ''
max_wal_senders = 3
wal_level = replica
```