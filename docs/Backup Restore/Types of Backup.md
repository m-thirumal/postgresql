 1. Difference between `physical and logical backup`?
   
    `Logical backup` is using SQL statements. Export using exp tool is logical.

    `Physical backup` is copying the data files either when the database is up and running `(HOT BACKUP)` or when the database is shutdown `(COLD BACKUP)`

    * In other words,

        `Physical backup` is to copy for backing up all the physical files that belongs to database.(like data files,control files,log files, executables etc).
        `Logical backup`, you don't take the copies of any physical things,you only extract the data from the data files into dump files.(ex : using export )
    


## Backups:-


 ![Types of Backup](full_incremental_differential_backup.png)
 ![benefits_and_drawbacks_backup_types](storage-benefits_and_drawbacks_backup_types.png)