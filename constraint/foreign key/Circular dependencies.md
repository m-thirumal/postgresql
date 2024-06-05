# Foreign keys in Circular dependencies 

However, there is a corner case many people are not aware of: circular dependencies. Now, how can that ever happen? Consider the following example which has been tested in PostgreSQL:

```SQL

CREATE TABLE department (
   id 		bigint 	GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   name 		text 		NOT NULL UNIQUE,
   leader 		bigint 	NOT NULL
);
 
CREATE TABLE employee (
   id 		bigint 	GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   name 		text 		NOT NULL,
   department 	bigint 	REFERENCES department NOT NULL
);
 
ALTER TABLE department
   ADD FOREIGN KEY (leader) REFERENCES employee;
```

In this case, we want to store departments and employees. Every department will need a leader, and every employee will need a department. We cannot have a department without a department leader - but we cannot have an employee without a department either.

The problem which arises is that we cannot insert into those two tables anymore without violating the foreign keys. The next listing shows what happens:

## INITIALLY DEFERRED coming to the rescue

The solution to the problem is to use “INITIALLY DEFERRED”. The idea is simple. Consider the following constraint instead of the one we created above:

```SQL

ALTER TABLE department
     ADD FOREIGN KEY (leader) 
     REFERENCES employee DEFERRABLE INITIALLY DEFERRED;
```

The purpose of INITIALLY DEFERRED is to tell PostgreSQL to NOT perform the constraint check immediately while the write operation is happening, but to delay it until COMMIT. The advantage is that within the transaction, we can perform operations in any order and just make sure that all constraints are satisfied when COMMIT happens.

If we create the foreign key constraint om department like above, we can insert data nicely in a single transaction without violating any constraints at all. Here is how it works:

```SQL

BEGIN;
INSERT INTO department (name, leader) 
      VALUES ('hq', 0) RETURNING id;
INSERT INTO employee (name, department) 
      VALUES ('hans', 1);
UPDATE department SET leader = 1 WHERE id = 1;
COMMIT;
```

As you can see, this transaction works just fine and can be used to handle complex dependencies without having to worry about insertion order.