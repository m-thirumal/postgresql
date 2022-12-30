CREATE OR REPLACE FUNCTION list_table(schema_name varchar) RETURNS table(table_names varchar) AS $$
BEGIN
	return query SELECT table_name::varchar FROM information_schema.tables WHERE table_schema = schema_name;
END;
$$ Language 'plpgsql';



-- Usage
select * list_table('/*schema_name*/');