CREATE OR REPLACE FUNCTION list_code(input_table_name varchar, locale varchar) RETURNS table(table_names varchar) AS $$
DECLARE 
	found_table varchar;
	row_count bigint;
	locale_value integer;
BEGIN 
	SELECT INTO row_count count(*) FROM information_schema.tables WHERE table_schema = 'code' AND table_name like input_table_name;
	IF row_count > 0 THEN 
		SELECT INTO locale_value locale_cd FROM code.locale_cd WHERE code=locale;
		IF locale_value IS NOT NULL THEN
			return query SELECT locale_cd::varchar FROM code.locale_cd WHERE code=locale;
			--return query SELECT * FROM code.country_locales L LEFT JOIN code.country_cd C ON L.country_cd = C.country_cd WHERE Locale_Cd = 43 AND (L.Start_Date < current_date OR L.Start_Date IS NULL) AND (L.End_Date > current_date OR L.End_Date IS NULL);
		ELSE
			RAISE NOTICE 'Locale is not found in database';
		END IF;
	ELSE 
		RAISE NOTICE 'Table not found in database';
	END IF;
END; 
$$ 
LANGUAGE 'plpgsql';
 