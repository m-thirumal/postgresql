CREATE OR REPLACE FUNCTION list_code(input_table_name varchar, locale integer) RETURNS table(table_names varchar) AS $$
DECLARE 
	found_table varchar;
	row_count bigint;
BEGIN 
	SELECT INTO row_count count(*) FROM information_schema.tables WHERE table_schema = 'code' AND table_name like input_table_name;
	IF row_count > 0 THEN 
		return query SELECT table_name::varchar FROM information_schema.tables WHERE table_schema = 'code' AND table_name like input_table_name;
	ELSE 
		RAISE NOTICE 'Table not found';
	END IF;
END; 
$$ 
LANGUAGE 'plpgsql';
 