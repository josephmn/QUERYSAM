select siteid,invcnbr,invcdate,*  from newsh where crtd_datetime >= '2015-10-30 00:00:00'  and crtd_datetime <= '2015-10-30 23:59:59'
order by crtd_datetime 



select siteid,invcnbr,invcdate,*  from newsh S where siteid='HUAPT' ORDER BY S.CURYEFFDATE DESC

select siteid,invcnbr,invcdate,*  from newsh where crtd_datetime >= '2015-10-31 00:00:00'  and crtd_datetime <= '2015-10-31 23:59:59'


SELECT * from  FROM NEWSH where invcdate >= '2016-10-14 00:00:00'  and invcdate <= '2016-10-14 23:59:59'


select * from cab_movi where dt_fecinici <= '2016-10-14 00:00:00'  and dt_fecinici >= '2016-10-14 23:59:59'


select * from cab_movi where  dt_fecinici >= '2015-10-31 00:00:00'  and dt_fecinici <= '2015-10-31 23:59:59'


select s.dt_fecinici,* from cab_movi s order by s.dt_fecinici desc4


select * from cab_movi 
select * from DET_MOVI 



select shipperid,* from soshipline   where cpnyid =''

select invcnbr,INVCDATE,* from soshipheader where shipperid ='BLI0000469'

select shipperid,* from soshipline  where shipperid ='BLI0000469' and cpnyid =''

select invcnbr B570003437     

sp_helptext xAMPasarCAByDET_MOVI