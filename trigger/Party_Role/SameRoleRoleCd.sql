CREATE OR REPLACE FUNCTION party_role_check() RETURNS TRIGGER AS $$                                             
BEGIN 
	IF NEW.row_creation_date IS NOT NULL THEN
		RAISE EXCEPTION 'Row_Creation_Date column should not be modified';
	END IF;
	RETURN NEW;
END;                
$$ LANGUAGE plpgsql;


/* It 's not completed
 * SELECT  party_uid, party_role_cd, start_date, count(*) FROM indsolv.party_role group by party_role_cd, party_uid, end_date IS NULL having count(*) > 1
 * select * from indsolv.party_role where party_uid = 8580;
 * update indsolv.party_role set end_date = current_date where party_uid = 8580;
 * 
 * */

