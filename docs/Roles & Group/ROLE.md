# Roles

`PostgreSQL` uses roles to represent user accounts. It doesn’t use the user concept like other database systems.

Typically, `roles` can log in are called `login roles`. They are equivalent to users in other database systems.

Role’s are the other way to manage database access permissions.

* It can be standard database users (Role).
* It can be database user group (Group Role).
* A role can be a member of another role (Role Membership).

When `roles` contain `other roles`, they are call `group roles`

#### CREATE ROLE

		CREATE ROLE role_name;

When you create a role, it is valid in all databases in the database server (or cluster).

Eg:

		CREATE ROLE Thirumal;

OR

With more than one Membership

		CREATE ROLE role1 WITH superuser login password 'thirumal';

#### RENAME ROLE

		ALTER USER {Existing_role} RENAME TO "{New Role name}";

		ALTER USER Thirumal RENAME TO "Thirumal M";


#### LIST Roles


		> \du

		OR

		SELECT rolname FROM pg_roles;

####

With `grant`, access privileges are determined. There are two types.

* Privileges in database objects
* Membership with privilege

SELECT, INSERT, UPDATE, DELETE, TRUNCATE, ALL PRIVILEGES etc. privileges can be grant.

List all privilege

		> \dp


### Role attributes

	The attributes of a role define privileges for that role including `login`, `superuser`, `database creation`, `role creation`, `password`, etc

		CREATE ROLE name WITH option;


	`option` can be `SUPER, CREATEDB, CREATEROLE, etc`.

Example:-

	CREATE ROLE Thirumal;

	GRANT SELECT, etc. ON ALL TABLES IN SCHEMA public TO "Thirumal";

### Revoke

	REVOKE writeaccess FROM Thirumal;

	REVOKE ALL ON accommodation_transaction FROM PUBLIC;
