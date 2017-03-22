CREATE OR REPLACE FUNCTION get_province_cd(province varchar) RETURNS setof integer AS $$
BEGIN 
	return query SELECT code.province_cd.province_cd FROM code.province_locales INNER JOIN code.province_cd ON (code.province_locales.province_cd = code.province_cd.province_cd) WHERE LOWER(code.province_locales.description) = LOWER(province);
END; 
$$
language 'plpgsql';
 


-- Useage
select * from get_province_cd('/*province_name*/');