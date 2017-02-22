-- Atleast one Foreign key must not be null
ALTER TABLE /*table_name*/ ADD CONSTRAINT /*constraint_name*/ CHECK (/*FK_Column_1*/ is not null or /*FK_Column_2*/ is not null);

-- Two column should not be equal
ALTER TABLE /*table_name*/ ADD CONSTRAINT /*constraint_name*/ CHECK (/*Column_1*/ <> /*Column_2*/);