--Drop schema
DROP SCHEMA public CASCADE;
--Create schema
CREATE SCHEMA public;
--Grant permission
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;