select repository, snapshot, count(*) from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' group by repository, snapshot;

select repository, snapshot, sum(size) from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' group by repository, snapshot;

select fname, size from pwalk_fstat where repository='pangaea_releases' and snapshot='20180919' and fileCnt=-1 order by size desc limit 10;

select fname, dirSz, fileCnt from pwalk_fstat where repository='pangaea_releases' and snapshot='20180919' and fileCnt>-1 and fname not like '%/.nexus/%' order by fileCnt desc limit 10;

select fname, size from (select * from pwalk_fstat where repository = 'pangaea_releases' and snapshot = '20180919' ) s


select child.*
  from pwalk_fstat child
  left join pwalk_fstat parent on child.repository = parent.repository and child.inode = parent.inode
  where child.snapshot='20180919' and parent.snapshot='20180808' and child.fileCnt=-1 and parent.inode is null;

