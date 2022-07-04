
USE [AM2015APP]
GO





select * from personal where perpaterno like '%quincho%'


Select batnbr from Batch, Currncy
           Where Batch.CuryId = Currncy.CuryId
             and Module   =   'AR'
             and CpnyId   =   'ALTOMAYO'
             and Batch.Status   IN ('B', 'S', 'I')
 order by module,batnbr

SELECT STATUS ,MODULE,* FROM BATCH WHERE BATNBR='006397'
-- FUERZA DIRECTA
SELECT * FROM VS_REPOT_FV1_JOB WHERE VEND='091' AND PERIODO ='201505'

select sum (vtaefect) from VS_REPOT_FV1_JOB where vend ='091' and periodo ='201505'


SP_HELPTEXT VS_REPOT_FV1_JOB



SP_HELPTEXT TEMPFV3


SELECT * FROM TEMPFV3 WHERE ID_SUP='091' AND PERIODO ='201505'


SELECT SUM (VTAEFECT) TOTAL_VENTAS FROM TEMPFV3 WHERE ID_SUP ='091' AND PERIODO='201505'

-- CXC INCENTIVO

SELECT * FROM XAM_INCENT_SUP WHERE SUPERVISOR='091' AND PERIODO='201505'

SP_HELPTEXT XAM_INCENT_SUP

select Linea_Negocio,periodo,zona, Supervisor, NombSup,s.marca,DESCR,valorVentaP,ValorventaV,avance,MontoInct,MontoInctMarca 
from tbxam_Incent_SupDet S inner join xamPorIncentD D on rtrim(D.marca) = rtrim(S.Supervisor) 
where  D.user1 = 1 --and s.marca in ('ALT','KIM','MON','')--Supervisor  in ('511') and periodo ='201408' and
/*viajeri*/



EXEC ARDEBUG '006397'


USE [CA2015APP]
GO






------------------------------------------------------------------------
declare @p1 int
set @p1=0
declare @p3 int
set @p3=2
declare @p5 int
set @p5=0
exec sp_cursoropen @cursor=@p1 output,@stmt='select loctable.whseloc,location.qtyonhand from loctable, location (FASTFIRSTROW)  where loctable.siteid *= location.siteid and loctable.whseloc *= location.whseloc and location.invtid like  ''20595''  and (loctable.invtidvalid = ''y'' and loctable.invtid like  ''20595''  or loctable.invtidvalid <> ''y'') and (location.qtyonhand - location.qtyshipnotinv) > 0 and loctable.salesvalid <> ''n'' and loctable.siteid like  ''LIMCEN''  and loctable.whseloc like  ''%''     order by location.qtyonhand desc, loctable.whseloc',@scrollopt=@p3 output,@ccopt=4,@rows=@p5 output
select @p1, @p3, @p5



select loctable.whseloc,location.qtyonhand from 
loctable, location (FASTFIRSTROW)  where loctable.siteid = location.siteid 
and loctable.whseloc = location.whseloc
and location.invtid like  '20595'
and (loctable.invtidvalid = 'y'
and loctable.invtid like  '20595'
or loctable.invtidvalid <> 'y')
and (location.qtyonhand - location.qtyshipnotinv) > 0
and loctable.salesvalid <> 'n'
and loctable.siteid like  'LIMCEN'
and loctable.whseloc like  '%'
order by location.qtyonhand desc, loctable.whseloc

select * from ItemSite where SiteId =  'LIMCEN'  and InvtID =  '20595' 

SELECT QtyAvail from xAMNewItemSite WHERE SiteID_Sol = 'LIMCEN' AND InvtID_Sol='20595'  


sp_helptext xAMComprometidoEnNextel

exec xAMComprometidoEnNextel 'LIMCEN    ','20595                         ',0 










