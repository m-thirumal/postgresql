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


`Violation`: ProductName depends only on ProductID (part of the key).

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

`2NF Table:`

| EmpID | Name | DeptID | DeptName |
|-------|------|--------|----------|
| 1     | Sam  | D1     | Sales    |

`Violation:` `DeptName` depends on `DeptID`, which is not a key.

`DeptName` is transitively dependent on `EmpID`.

`Split into:`

`Employees:`

| EmpID | Name | DeptID |
|-------|------|--------|
| 1     | Sam  | D1     |

`Departments:`

| DeptID | DeptName |
|--------|----------|
| D1     | Sales    |

## bcnf to 5nf

### Boyce-Codd Normal Form (BCNF)

`Goal: `Handle remaining anomalies in 3NF.

* Table must be in 3NF.
* Every determinant must be a candidate key.

`3NF Table:`

| Student | Course  | Instructor |
|---------|---------|------------|
| Alice   | Math    | Smith      |
| Alice   | Physics | Smith      |

`If (Course → Instructor), but (Student, Course) is PK, Then Course is a determinant but not a candidate key.
Split into:`

StudentCourse:
| Student | Course  |
|---------|---------|
| Alice   | Math    |

CourseInstructor:
| Course  | Instructor |
|---------|------------|
| Math    | Smith      |

### Fourth Normal Form (4NF)

`Goal: `Eliminate multi-valued dependencies.

* Must be in BCNF.
* No table should contain two or more independent multi-valued facts.

`Not in 4NF:`

| Person | Skill   | Language |
|--------|---------|----------|
| John   | Java    | English  |
| John   | Java    | French   |
| John   | Python  | English  |
| John   | Python  | French   |

`Split into:`

`PersonSkill:`

| Person | Skill  |
|--------|--------|
| John   | Java   |
| John   | Python |

`PersonLanguage:`

| Person | Language |
|--------|----------|
| John   | English  |
| John   | French   |

### Fifth Normal Form (5NF or PJ/NF)

`Goal:` Eliminate join dependencies.

* Must be in 4NF.
* Every join dependency must be implied by candidate keys.