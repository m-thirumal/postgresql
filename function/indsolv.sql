CREATE OR REPLACE FUNCTION search_pp(pprcd integer, caseuid integer,data varchar) RETURNS table(table_names integer array) AS $$
DECLARE 
	party_uid_array integer array;
	row_count bigint;
	locale_value integer;
BEGIN 
	SELECT party_uid party_uid_array FROM indsolv.party_role WHERE party_role_uid IN (SELECT party_role_uid_related FROM indsolv.party_party_relationship
             WHERE party_relationship_type_cd=40 AND insolvency_case_uid = 163
             return party_uid_array;
	--IF row_count > 0 THEN 
		--SELECT INTO locale_value locale_cd FROM code.locale_cd WHERE code=locale;
		--IF locale_value IS NOT NULL THEN
			--return query SELECT locale_cd::varchar FROM code.locale_cd WHERE code=locale;
			--return query SELECT * FROM code.country_locales L LEFT JOIN code.country_cd C ON L.country_cd = C.country_cd WHERE Locale_Cd = 43 AND (L.Start_Date < current_date OR L.Start_Date IS NULL) AND (L.End_Date > current_date OR L.End_Date IS NULL);
		--ELSE
			--RAISE NOTICE 'Locale is not found in database';
		--END IF;
	--ELSE 
		--RAISE NOTICE 'Table not found in database';
	--END IF;
--END; 
$$ LANGUAGE 'plpgsql';
 

-- Usage
select * from search_pp(40, 163, 'th');