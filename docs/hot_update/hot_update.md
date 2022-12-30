## Hot (Heap Only Tuple) Update

Update the row - where there is no update on index column.

 ![Hot Update](hot_update.png)
 
 #### How to Track?
 
    select n_tup_upd, n_tup_hot_upd from pg_stat_all_tables where relname = 'table_name'
 
 ### How to improve High write workload
 
 Avoid updating indexed column.
 
 
 
    
  
 