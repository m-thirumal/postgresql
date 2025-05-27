# Normalization

## 1nf to 3nf

### First Normal Form (1NF)

`Goal:` Eliminate repeating groups and ensure atomicity.

    * All table columns must contain atomic (indivisible) values.
    * Each record must be unique.
    * There should be no arrays or lists in any field.
Example:

`Bad (Not in 1NF):`

| StudentID | Name   | Courses         |
|-----------|--------|-----------------|
| 1         | Alice  | Math, Physics   |

`Good (1NF):`

| StudentID | Name   | Course  |
|-----------|--------|---------|
| 1         | Alice  | Math    |
| 1         | Alice  | Physics |

### Second Normal Form (2NF)

`Goal:` Remove partial dependencies.

* Table must be in 1NF.
* All non-key columns must depend on the entire primary key.

`1NF Table`:

| OrderID | ProductID | ProductName | Qty |
|---------|-----------|-------------|-----|
| 101     | P1        | Apple       | 3   |


`Violation:` ProductName depends only on ProductID.

`Split into 2 tables (2NF):`

`Orders:`

| OrderID | ProductID | Qty |
|---------|-----------|-----|
| 101     | P1        | 3   |

`Products:`

| ProductID | ProductName |
|-----------|-------------|
| P1        | Apple       |

### Third Normal Form (3NF)

`Goal:` Remove transitive dependencies.

* Table must be in 2NF.
* No non-key attribute should depend on another non-key attribute.



## bcnf to 5nf