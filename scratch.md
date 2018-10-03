select repository, snapshot, count(*) from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' group by repository, snapshot;

select repository, snapshot, sum(size) from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' group by repository, snapshot;

select fname, size from pwalk_fstat where repository='pangaea_releases' and snapshot='20180919' and fileCnt=-1 order by size desc limit 10;

select fname, dirSz, fileCnt from pwalk_fstat where repository='pangaea_releases' and snapshot='20180919' and fileCnt>-1 and fname not like '%/.nexus/%' order by fileCnt desc limit 10;

select fname, size from (select * from pwalk_fstat where repository = 'pangaea_releases' and snapshot = '20180919' ) s


select child.*
  from pwalk_fstat child
  left join pwalk_fstat parent on child.repository = parent.repository and child.inode = parent.inode
  where child.snapshot='20180919' and parent.snapshot='20180808' and child.fileCnt=-1 and parent.inode is null;




select repository, snapshot, fname, depth from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' order by depth desc

select repository, snapshot, fname, size from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' order by size desc;

select * from pwalk_fstat where fname = '/build1/warm/storage/pangaea_releases/com'

select snapshot, count(*) from pwalk_fstat where pinode=84854152 group by snapshot

select repository, snapshot, fname, dirSz, fileCnt from pwalk_fstat where fileCnt!=-1 and fname not like '%/.nexus/%' group by repository, snapshot, fname order by fileCnt desc;

select s.* from (
select a.inode, a.repository, a.fname, a.fileCnt afc, c.fileCnt cfc, d.fileCnt dfc, e.fileCnt efc, a.fileCnt-c.fileCnt d1, c.fileCnt-d.fileCnt d2, d.fileCnt-e.fileCnt d3 from pwalk_fstat a
  left outer join pwalk_fstat c on (a.inode = c.inode and c.snapshot='20180919')
  left outer join pwalk_fstat d on (a.inode = d.inode and d.snapshot='20180808')
  left outer join pwalk_fstat e on (a.inode = e.inode and e.snapshot='20180604')
  where a.repository='pangaea_releases' and a.snapshot = '20180930' and a.fname not like '%/.nexus/%' and a.fileCnt!=-1
) s order by s.d1+s.d2+s.d3 desc

select a.inode, a.repository, a.snapshot, a.fname, sum(v.size) totalSize, count(*) totalFiles from pwalk_fstat a
  left join pwalk_fstat v on (a.inode = v.pinode and a.snapshot = v.snapshot and v.fileCnt > -1)
  left join pwalk_fstat f on (v.inode = f.pinode and v.snapshot = f.snapshot and v.fileCnt = -1)
  where a.repository='pangaea_releases' and a.snapshot = '20180930' and a.fname not like '%/.nexus/%' and a.fileCnt > -1

select a.inode, a.repository, a.snapshot, a.fname, sum(f.size) totalSize, count(*) totalFiles from pwalk_fstat f
  left join pwalk_fstat v on (f.pinode = v.inode and f.snapshot = v.snapshot)
  left join pwalk_fstat a on (v.pinode = a.inode and v.snapshot = a.snapshot)
  where f.repository='pangaea_releases' and f.snapshot = '20180930' and f.fname not like '%/.nexus/%' and f.fileCnt = -1
  group by a.inode, a.repository, a.snapshot, a.fname
  order by totalSize desc
  
select repository, snapshot, fname, fileCnt from pwalk_fstat where inode = 91960372

  ALTER TABLE pwalk_fstat
  ADD INDEX pwalk_fstat_inode
    (inode);

  ALTER TABLE pwalk_fstat
  ADD INDEX pwalk_fstat_fname
    (fname);

select repository, snapshot, fname, fileCnt from pwalk_fstat where repository='pangaea_releases' and snapshot='20180930' and fname not like '%/.nexus/%' and fileCnt>-1 order by fileCnt desc;

select repository, snapshot, fname, from_unixtime(mtime), from_unixtime(atime) from pwalk_fstat where repository='pangaea_releases' and snapshot='20180930' and fileCnt=-1 and fname not like '%/.nexus/%' order by atime asc

