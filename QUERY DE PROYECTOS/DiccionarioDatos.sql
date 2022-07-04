declare @tabla as varchar(50)
--set @tabla=''''+'sjvresponsable'+''','''+'sjvresponsable'+''''
set @tabla='AMProdSemanalH'
--select @tabla
select 'Type ' + @tabla as col
union all
SELECT
--TABLE_NAME = convert(sysname,c.name),
--COLUMN_NAME = convert(sysname,c.name),
col = rtrim(convert(sysname,c.name))+ ' '+
case 
when convert (sysname,t.name) like 'int%' then 'as Long'
when convert (sysname,t.name) like 'smallint%' then 'as integer'
when convert (sysname,t.name) ='char' then 'as string *'
when convert (sysname,t.name) ='varchar' then 'as string *'
when convert (sysname,t.name) in ('float','numeric') then 'as double'
when convert (sysname,t.name) in ('smalldatetime','datetime') then 'as Sdate'
else convert (sysname,t.name) end
+
case
when convert (sysname,t.name) in ('char','varchar')  
 then convert(char,c.length) else '' end
FROM
sysobjects o inner join syscolumns c on c.id = o.id 
inner join systypes t on  c.xusertype = t.xusertype
WHERE rtrim(convert(sysname,c.name))<>'tstamp' and
o.name in (@tabla) --like 'sjvresponsable'
--and o.type='U'
--ORDER BY o.name,c.colid
union all
select 'end Type ' as col
union all
select 'global b' + @tabla +' as ' +@tabla +', n' + @tabla +' as ' +@tabla as col
union all
select 'global csr_' + @tabla +' as integer' as col