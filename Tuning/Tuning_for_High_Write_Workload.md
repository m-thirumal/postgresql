### Tuning PostgreSQL for High Write workload
1. Use `WAL` Compression
2. Increase `max_wal_size`
3. Remove Randomness 

    Example: UUID is randomness reduces the write performance in `B-Tree`
    
    What to do if  `PRIMARY KEY` is UUID?
    
        Prefix UUID with date. YYYYMMDDHH24
4. Vacuuming  

