CREATE OR REPLACE FUNCTION row_creation_date_column() RETURNS TRIGGER AS $$                                             
BEGIN 
	IF NEW.row_creation_date IS NOT NULL THEN
		RAISE EXCEPTION 'Row_Creation_Date column should not be modified';
	END IF;
	RETURN NEW;
END;                
$$ LANGUAGE plpgsql;




