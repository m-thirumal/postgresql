# How to Identify Duplicate Rows?

```
select * from (
  SELECT party_relationship_id,
  ROW_NUMBER() OVER(PARTITION BY icms_case_id, l_party_id, r_party_id, relationship_cd ORDER BY party_relationship_id asc) AS Row
  FROM icms.party_relationship
) dups
where 
dups.Row > 1
```

Delete the duplication rows

```
delete from icms.party_relationship where party_relationship_id in (select party_relationship_id from (
  SELECT party_relationship_id,
  ROW_NUMBER() OVER(PARTITION BY icms_case_id, l_party_id, r_party_id, relationship_cd ORDER BY party_relationship_id asc) AS Row
  FROM icms.party_relationship
) dups
where 
dups.Row > 1)
```
