# Roles

`PostgreSQL` uses roles to represent user accounts. It doesn’t use the user concept like other database systems.

Typically, `roles` can log in are called `login roles`. They are equivalent to users in other database systems.

!> The important thing to note here is that `users` and `roles` are basically the same thing.

The main difference is that a `role` is always `NOLOGIN` while a `user` is `LOGIN`. However, if you want a role to be able to log in, you can simply mark it as `login`.

Otherwise, there is no difference. Behind the scenes, roles and users are all the same.


Role’s are the other way to manage database access permissions.

* `Role`       - It can be standard database users (Role).
* `Group`      - It can be database user group (Group Role).
* `Membership` - A role can be a `member` of another role (Role Membership).

When `roles` contain `other roles`, they are call `group roles`

## Principle of Least Privilege

`Principle of Least Privilege (PoLP)`, an information security methodology that states users should only be granted access to the least amount of information needed to do their job or task. Any access beyond files or data that they own must be specifically granted to them.

#### CREATE ROLE

```sql
CREATE ROLE role_name;
```

When you create a role, it is valid in all databases in the database server (or cluster).

Eg:

```sql
CREATE ROLE Thirumal;
```

OR

With more than one Membership

```sql
CREATE ROLE role1 WITH superuser login password 'thirumal';
```

#### RENAME ROLE

```shell
ALTER USER {Existing_role} RENAME TO "{New Role name}";

ALTER USER Thirumal RENAME TO "Thirumal M";
```

#### LIST Roles

```shell

> \du

OR

SELECT rolname FROM pg_roles;
```
##### Query to get all the Roles

In `PostgreSQL`, all object ids below `16384` are `reserved for system objects`

`pg_authid` contains a list of all roles, as well as some additional information (can log in, is superuser yes / no, etc.). What is noteworthy here is that each user has an internal number (= object id) which identifies the role.

```sql
SELECT oid, rolname, rolcanlogin FROM pg_authid WHERE oid > 16384;
```

`pg_auth_members` basically knows which role is assigned to which other role. It is a simple role / member list which contains object ids to identify our users

```sql
SELECT * FROM pg_auth_members WHERE roleid > 16384;
```
##### Resolving users and role membership in PostgreSQL

```sql
WITH RECURSIVE x AS
(
  SELECT member::regrole,
         roleid::regrole AS role,
         member::regrole || ' -> ' || roleid::regrole AS path
  FROM pg_auth_members AS m
  WHERE roleid > 16384
  UNION ALL
  SELECT x.member::regrole,
         m.roleid::regrole,
         x.path || ' -> ' || m.roleid::regrole
 FROM pg_auth_members AS m
    JOIN x ON m.member = x.role
  )
  SELECT member, role, path
  FROM x
  ORDER BY member::text, role::text;`
```

####
We can now assign roles to other roles (= users), using simple GRANT statements:

```sql
GRANT {role_name} TO {role_name};
GRANT thirumal TO developer;
```
With `grant`, access privileges are determined. There are two types.

* `Privileges` in database objects
* `Membership` with privilege

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


