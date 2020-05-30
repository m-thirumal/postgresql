--Alter sequence data type to bigint
ALTER SEQUENCE public.case_audit_case_audit_uid_seq AS bigint;
--Set max value
ALTER SEQUENCE public.case_audit_case_audit_uid_seq MAXVALUE 9223372036854775807;
--Alter table column from int(serial) to big int(bigSerial)
ALTER TABLE public.case_audit ALTER COLUMN case_audit_uid TYPE bigint; 