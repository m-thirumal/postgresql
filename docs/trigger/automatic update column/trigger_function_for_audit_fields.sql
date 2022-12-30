CREATE OR REPLACE FUNCTION row_update_date_column() RETURNS TRIGGER AS $$
BEGIN 
	NEW.row_updated_date = now();
	RETURN NEW; 
END;
$$ language 'plpgsql';
