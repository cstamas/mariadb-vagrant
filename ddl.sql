drop table if exists dataTable;

create table  dataTable (
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
    `dirSz` bigint(12) NULL,
    KEY `uid` (`uid`),
    KEY `gid` (`gid`),
    KEY `inode` (`inode`)
); 

load data local infile  '/home/cstamas/tmp/wlabs-pwalk/thirdparty_20180919.csv'  
   into table dataTable
   fields terminated by ',' OPTIONALLY enclosed by '"'
   lines terminated by '\n' 
   (inode, pinode, depth, fname, extension, uid, gid, size, dev, blocks, 
   nlink, mode, atime, mtime, ctime, fileCnt, dirSz )
   set repository = 'thirdparty', set snapshot='20180919';
