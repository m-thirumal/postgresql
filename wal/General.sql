--To list number of WAL files 
SELECT COUNT(*) FROM pg_ls_dir('pg_wal') WHERE pg_ls_dir ~ '^[0-9A-F]{24}';