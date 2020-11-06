## Changes required in PostgreSQL

##### Listen Address

* listen address

        listen_addresses = '*'

##### Configure `Archive`

    archive_command = 'pgbackrest --stanza=main archive-push %p'
    archive_mode = on
    listen_addresses = '*'
    log_line_prefix = ''
    max_wal_senders = 3
    wal_level = replica