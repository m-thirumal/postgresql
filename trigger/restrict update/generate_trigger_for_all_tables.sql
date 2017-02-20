SELECT 'CREATE TRIGGER row_cretaion_date_column_trigger BEFORE UPDATE OF row_creation_date ON ' || input_table_name || ' FOR EACH ROW EXECUTE PROCEDURE row_creation_date_column();' AS trigger_creation_query FROM(SELECT table_schema || '.' || table_name AS input_table_name FROM information_schema.tables WHERE table_schema NOT IN ('pg_catalog', 'information_schema') AND table_schema NOT LIKE 'pg_toast%') AS information;


 