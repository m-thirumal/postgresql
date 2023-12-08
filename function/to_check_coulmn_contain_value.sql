-- This fuction has error
CREATE OR REPLACE FUNCTION is_column_empty(input_table_name varchar, column_name varchar, input_column_value integer) RETURNS boolean AS $$
DECLARE 
	value_found boolean;
	column_value integer;
BEGIN 
	SELECT INTO column_value FROM input_table_name where column_name = input_column_value;
	IF column_value IS NOT NULL THEN
		return true;
	ELSE
		RAISE NOTICE 'Column is Null/Empty';
	END IF;
END; 
$$ 
LANGUAGE 'plpgsql';
 