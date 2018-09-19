All the files (exclude px attributes and meta stuff) by repo/snapshot

```sql
select repository, snapshot, count(*) from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' group by repository, snapshot;
```

Total size by repo/snapshot

```sql
select repository, snapshot, sum(size) from pwalk_fstat where fileCnt=-1 and fname not like '%/.nexus/%' group by repository, snapshot;
```

Top 10 biggest files in given repo/snap
```sql
select fname, size from pwalk_fstat where repository='pangaea_releases' and snapshot='20180919' and fileCnt=-1 order by size desc limit 10;
```

Top 10 biggest directories in given repo/snap
```sql
select fname, dirSz, fileCnt from pwalk_fstat where repository='pangaea_releases' and snapshot='20180919' and fileCnt>-1 order by dirSz desc limit 10;
```
