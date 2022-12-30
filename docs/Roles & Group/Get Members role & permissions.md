### Preparing users and roles
```
CREATE USER a;
CREATE USER b;
CREATE ROLE c LOGIN;
CREATE ROLE d LOGIN;
CREATE ROLE e LOGIN;
CREATE ROLE f LOGIN;
```

The important thing to note here is that `users` and `roles` are basically the same thing.

The main difference is that a `role` is always `NOLOGIN` while a `user` is `LOGIN`. However, if you want a role to be able to log in, you can simply mark it as `login`.

Otherwise, there is no difference. Behind the scenes, roles and users are all the same.

We can now assign roles to other roles (= users), using simple GRANT statements:
```
GRANT c TO a;
GRANT d TO c;
GRANT e TO c;
GRANT f TO d;
```

##### Query to get all the Roles

In `PostgreSQL`, all object ids below `16384` are `reserved for system objects`

`pg_authid` contains a list of all roles, as well as some additional information (can log in, is superuser yes / no, etc.). What is noteworthy here is that each user has an internal number (= object id) which identifies the role.

`SELECT oid, rolname, rolcanlogin
FROM pg_authid
WHERE oid > 16384;`

`pg_auth_members` basically knows which role is assigned to which other role. It is a simple role / member list which contains object ids to identify our users

`SELECT *
FROM pg_auth_members
WHERE roleid > 16384;`

#### Resolving users and role membership in PostgreSQL

`WITH RECURSIVE x AS
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
