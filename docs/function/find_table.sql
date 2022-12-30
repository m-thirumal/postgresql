CREATE OR REPLACE FUNCTION find_table(input_table_name varchar) RETURNS table(table_names varchar) AS $$
BEGIN 
	return query SELECT table_name::varchar FROM information_schema.tables WHERE table_name like input_table_name;
END; 
$$
language 'plpgsql';
 


-- Useage
select * find_table('/*table_name*/');