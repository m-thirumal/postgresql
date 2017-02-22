CREATE OR REPLACE FUNCTION list_code(input_table_name varchar, locale integer) RETURNS table(table_names varchar) AS $$
DECLARE 
	found_table varchar;
BEGIN 
	return query SELECT table_name::varchar FROM information_schema.tables WHERE table_schema = 'code' AND table_name like input_table_name;
END; 
 $$ 
LANGUAGE 'plpgsql';
 