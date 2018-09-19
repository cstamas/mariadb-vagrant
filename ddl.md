# DDL

Execute these step-by-step:

```sql
drop table if exists pwalk_fstat;

create table  pwalk_fstat (
    `repository` varchar(255) not null,
    `snapshot` varchar(255) not null,
    `inode` bigint(20) default NULL,
    `pinode` bigint(20) default NULL,
    `depth` int default NULL,
    `fname` text,
    `extension` text,
    `uid` bigint(20) default NULL,
    `gid` bigint(20) default NULL,
    `size` bigint(20) default NULL,
    `dev` bigint(20) default NULL,
    `blocks` bigint(20) default NULL,
    `nlink` bigint(20) default NULL,
    `mode` bigint(20) default NULL,
    `atime` bigint(10) default 0,
    `mtime` bigint(10) default 0,
    `ctime` bigint(10) default 0,
    `fileCnt` int default NULL,
    `dirSz` bigint(12) NULL
); 

-- LOADING: match repoId and timestamp in filename with that in last row!!!
load data local infile  '/path/to/pwalk/csv/<repoId>_<timestamp>.csv'  
   into table pwalk_fstat
   fields terminated by ',' OPTIONALLY enclosed by '"'
   lines terminated by '\n' 
   (inode, pinode, depth, fname, extension, uid, gid, size, dev, blocks, 
   nlink, mode, atime, mtime, ctime, fileCnt, dirSz )
   set repository = '<repoId>', snapshot='<timestamp>';
```

Loading may tike some 10-20ish minutes for huge reposes!

