1. Whether a DDL is going to rewrite the table (and in some cases may need ~ 2x disk space)?

  For a brief background, each regular table in Postgres stores data in one or more files, each of which is referenced in the postgres catalog with a `relfilenode`.

	It depends on the following

	* Postgresql Version
	* Data type of column

2. What DDLs would block concurrent workload?

3. What is precision  & Scale?

Precision refers to the amount of information that is conveyed by a number in terms of its digits.

!> i.e Precision is the total number of significant digits in a number.

Scale is the number of digits to the right of the decimal point.

```SQL
DECIMAL(M, D) 
M - Stands for maximum number of digits
D - Stands for number of decimal places available

Example:-
DECIMAL(6,4)
45.8239

```
