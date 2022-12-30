Drop function get_province(integer, varchar);
CREATE OR REPLACE FUNCTION get_province(countrycd integer, locale varchar) RETURNS TABLE(province_cd integer, locale_cd integer, 
	description varchar, start_date date, end_date date,	row_creation_date timestamp, row_created_by varchar, row_updated_by varchar,
	row_update_info varchar) AS $$
DECLARE 
	is_country_cd_exsits boolean;
	is_locale_exsits boolean;
	localecd integer;
BEGIN 
	SELECT INTO is_locale_exsits exists(SELECT * FROM code.locale_cd WHERE code = locale);
	IF is_locale_exsits THEN 
    	SELECT INTO localecd code.locale_cd.locale_cd FROM code.locale_cd WHERE code = locale;
		SELECT INTO is_country_cd_exsits exists(SELECT * FROM code.country_cd WHERE country_cd = countrycd);
		IF is_country_cd_exsits THEN
			--RAISE NOTICE 'locale % and localCd % and is_locale_exists % and is_country_cd_exsits % :', locale, localecd, is_locale_exsits, is_country_cd_exsits;
			return query SELECT 
  code.province_locales.province_cd,
  code.province_locales.locale_cd,
  code.province_locales.description,
  code.province_locales.start_date,
  code.province_locales.end_date,
  code.province_locales.row_creation_date,
  code.province_locales.row_created_by,
  code.province_locales.row_updated_by,
  code.province_locales.row_update_info
FROM
  code.province_cd
  INNER JOIN code.province_locales ON (code.province_cd.province_cd = code.province_locales.province_cd)
WHERE
  code.province_cd.country_cd = countrycd AND 
  code.province_cd.start_date <= current_date AND 
  code.province_cd.end_date IS NULL AND 
  code.province_locales.start_date <= current_date AND 
  code.province_locales.end_date IS NULL AND 
  code.province_locales.locale_cd = localecd;
		ELSE
			RAISE NOTICE 'Country is not found in database';
		END IF;
	ELSE 
		RAISE NOTICE 'Locale not found in database';
	END IF;
END;  
$$
language 'plpgsql' IMMUTABLE;


-- usage
-- select * from get_province(/* country_Cd */ , /* locale */); 
-- Eg: select * from get_province(99, 'en_IN');
 
 