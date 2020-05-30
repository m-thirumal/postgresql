--- Alter boolean type column to int

    ALTER TABLE users ALTER "bDeleted" SET DEFAULT null;

    ALTER TABLE users
    ALTER "bDeleted" TYPE INTEGER
    USING
    CASE
    WHEN 'f' THEN 0 ELSE 1
    END;

    ALTER TABLE users RENAME "bDeleted" TO "iDeleted";

    ALTER TABLE users ALTER "iDeleted" SET DEFAULT 0;

--Alter
    ALTER TABLE indsolv.case_audit
    ALTER new_entry TYPE SMALLINT
    USING
    CASE
	WHEN NULL THEN 3
	WHEN 'true' THEN 1
    WHEN 'false' THEN 2 	
	ELSE 0
    END;