



select * from imporLibroDiario_xls where (Acct IS NOT NULL OR Start<>0) and perpost= '201608'  order by right(module,1), module,BatNbr  asc


sp_helptext  imporLibroDiario_xls
-------------------------------------------------------------

alter view imporLibroDiario_xls          
as          
select  CAST( PerPost AS CHAR(6))PerPost, CAST( BatNbr AS CHAR(6))BatNbr, CAST( module AS CHAR(3))module, CAST( Acct AS CHAR(6))Acct, CAST( Moneda AS CHAR(3))Moneda,   
CAST(TipoDocIdent AS CHAR(1))TipoDocIdent, CAST(id AS CHAR(15))id,   
  
CAST((case when TipoDoc in('CH','OD','LE','PR','RG','ND','NC','') then '00' else TipoDoc end) AS CHAR(2))TipoDoc  
  
, CAST((case when TipoDoc in('CH','OD','LE','PR','RG','ND','NC','') then '0' when TipoDoc in('05') then '3' else Serie end ) AS CHAR(10))Serie, CAST((case when TipoDoc in('CH','OD','LE','PR','RG','ND','NC','') then '0' else Numero end ) AS CHAR(10))Numero
  
,   
CAST(FechaContable AS CHAR(10))FechaContable, CAST(FechaVence AS CHAR(10))FechaVence, CAST(FechaEmision AS CHAR(10))FechaEmision, CAST(Descr AS CHAR(30))Descr, CAST(Campo17 AS CHAR(1))Campo17, CAST(Codigo AS CHAR(25)) Codigo, CAST(dbo.FormatearDecimal(CrAmt,2, 0, 12)AS CHAR(20)) DrAmt, CAST(dbo.FormatearDecimal(DrAmt,2, 0, 12)AS CHAR(20)) CrAmt, dbo.FormatearDecimal(Start,2, 0, 12)Start  
from (  
SELECT t.PerPost, t.BatNbr,CAST( t.module+'A' AS CHAR(3)) AS module,v.Acct,      
( case when t.curyid ='DOL' then 'USD' else 'PEN' end )Moneda ,  
(case when len(ltrim(t.id ))  = 8 then  '1' when  (len(ltrim(t.id)) = 11 and (left(ltrim(t.id ),2) ='10' or left(ltrim(t.id ),2) = '20' or left(ltrim(t.id),2) ='15')) then '6'         
when t.id  ='00000000000' then '0' else '1' end) TipoDocIdent,  id,   
isnull((case when module ='AR' then (select top 1 user6 from ardoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   
      when module ='AP' then (select top 1 user6 from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )  else '' end ),'') TipoDoc,  
isnull((case when module ='AR' then '00'+(right(LEFT(refnbr,3),2) )  
   when module ='AP' then (select top 1 S4FUTURE12 from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   else '' end ),'') Serie,  
isnull((case when module ='AR' then '0'+(right(rtrim(refnbr),6) )  
   when module ='AP' then (select top 1 (case when user6 in('01','02','03','07','08','27','30')then right(rtrim(ltrim(invcnbr)),6) else invcnbr end)  from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   else '' end ),'') Numero,  
convert(varchar,t.TranDate, 103) FechaContable,  
isnull(convert(varchar,(case when module ='AR' then (select top 1 duedate from ardoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   
   when module ='AP' then (select top 1 duedate from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   else '' end ), 103) ,  
convert(varchar,t.TranDate, 103) ) FechaVence,  
convert(varchar,t.TranDate, 103) FechaEmision,v.Descr,'' Campo17,  
cast(isnull((case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.DrAmt*-1 as decimal(10,2)) as varchar) when (v.Acct ='401720' and (t.CrAmt) < 0) then cast(cast(0 as decimal(10,2)) as varchar)  else cast(cast(t.CrAmt as decimal(10,2)) as varchar) end),0.00)as decimal(10,2))  CrAmt,      
cast(isnull((case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(0 as decimal(10,2)) as varchar) when (v.Acct ='401720' and (t.CrAmt) < 0) then cast(cast(t.CrAmt*-1  as decimal(10,2)) as varchar)  else cast(cast(t.DrAmt as decimal(10,2)) as varchar) end),0.00)as decimal(10,2))  DrAmt,      
(case when module in('AR')  and batnbr in (select batnbr from ardoc where user6 In ('01','03','07','08','12','29') )then '140100&'+t.PerPost+'00&'+rtrim(t.BatNbr)+CAST( t.module+'A' AS CHAR(3))   
      when module in('AP')  and batnbr in (select batnbr from apdoc where user6 in ('01','03','05','06','07','08','12','13','14','50','91','27','30') or (user6 in ('OD') and User5 =1 ) )  then '080100&'+t.PerPost+'00&'+rtrim(t.BatNbr)+CAST( t.module+'A' AS CHAR(3))
 else '' end ) Codigo,  
v.Start        
FROM  stc_vr_ShareGLPeriodBal v        
 LEFT OUTER JOIN GLTran t WITH(INDEX(GLTran6)) ON v.Acct = t.Acct AND        
 v.BalanceType = t.BalanceType AND v.LedgerID = t.LedgerID AND        
     v.Period = t.PerPost AND v.Sub = t.Sub AND t.Posted = 'P' AND        
 v.Fiscyr = t.Fiscyr AND v.curyid = t.curyid AND v.CpnyID = t.CpnyId       
where  t.refnbr is not null  )x  
  
--select batnbr,* from apdoc where batnbr ='001293' user6 in ('01','03','05','06','07','08','12','13','14','50','91')  
--select batnbr from ardoc where user6 In ('01','03','07','08','12','29')  
  
--select *from gltran where acct ='401720'  
  
  
----select  CAST( PerPost AS CHAR(6))PerPost, CAST( BatNbr AS CHAR(6))BatNbr, CAST( module AS CHAR(3))module, CAST( Acct AS CHAR(6))Acct, CAST( Moneda AS CHAR(3))Moneda,   
----CAST(TipoDocIdent AS CHAR(1))TipoDocIdent, CAST(id AS CHAR(15))id, CAST(TipoDoc AS CHAR(2))TipoDoc, CAST(Serie AS CHAR(10))Serie, CAST(Numero AS CHAR(10))Numero,   
----CAST(FechaContable AS CHAR(10))FechaContable, CAST(FechaVence AS CHAR(10))FechaVence, CAST(FechaEmision AS CHAR(10))FechaEmision, CAST(Descr AS CHAR(30))Descr, CAST(Campo17 AS CHAR(1))Campo17, CAST(Codigo AS CHAR(25)) Codigo, CAST(dbo.FormatearDecimal(D  
--rA  
----mt,2, 0, 12)AS CHAR(20)) DrAmt, CAST(dbo.FormatearDecimal(CrAmt,2, 0, 12)AS CHAR(20)) CrAmt,   
----dbo.FormatearDecimal(Start,2, 0, 12)Start  
--select  CAST( PerPost AS CHAR(6))PerPost, CAST( BatNbr AS CHAR(6))BatNbr, CAST( module AS CHAR(3))module, CAST( Acct AS CHAR(6))Acct, CAST( Moneda AS CHAR(3))Moneda,   
--CAST(TipoDocIdent AS CHAR(1))TipoDocIdent, CAST(id AS CHAR(15))id,   
  
--CAST((case when TipoDoc in('CH','OD','LE','PR','RG','ND','NC','') then '00' else TipoDoc end) AS CHAR(2))TipoDoc  
  
  
--, CAST((case when TipoDoc in('CH','OD','LE','PR','RG','ND','NC','') then '0' when TipoDoc in('05') then '3' else Serie end ) AS CHAR(10))Serie, CAST((case when TipoDoc in('CH','OD','LE','PR','RG','ND','NC','') then '0' else Numero end ) AS CHAR(10))Numero  
  
--,   
--CAST(FechaContable AS CHAR(10))FechaContable, CAST(FechaVence AS CHAR(10))FechaVence, CAST(FechaEmision AS CHAR(10))FechaEmision, CAST(Descr AS CHAR(30))Descr, CAST(Campo17 AS CHAR(1))Campo17, CAST(Codigo AS CHAR(25)) Codigo, CAST(dbo.FormatearDecimal(DrA  
--mt,2, 0, 12)AS CHAR(20)) DrAmt, CAST(dbo.FormatearDecimal(CrAmt,2, 0, 12)AS CHAR(20)) CrAmt,   
--dbo.FormatearDecimal(Start,2, 0, 12)Start  
--from (  
  
--SELECT t.PerPost, t.BatNbr,CAST( t.module+'A' AS CHAR(3)) AS module,v.Acct,      
--( case when t.curyid ='DOL' then 'USD' else 'PEN' end )Moneda ,  
--(case when len(ltrim(t.id ))  = 8 then  '1' when  (len(ltrim(t.id)) = 11 and (left(ltrim(t.id ),2) ='10' or left(ltrim(t.id ),2) = '20' or left(ltrim(t.id),2) ='15')) then '6'         
--when t.id  ='00000000000' then '0' else '1' end) TipoDocIdent,  id,   
--isnull((case when module ='AR' then (select top 1 user6 from ardoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   
--      when module ='AP' then (select top 1 user6 from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )  else '' end ),'') TipoDoc,  
--(case when module ='AR' then '00'+(right(LEFT(refnbr,3),2) )  
--   when module ='AP' then (select top 1 S4FUTURE12 from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   else '' end ) Serie,  
--(case when module ='AR' then '0'+(right(rtrim(refnbr),6) )  
--   when module ='AP' then (select top 1 S4FUTURE12 from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   else '' end ) Numero,  
--convert(varchar,t.TranDate, 103) FechaContable,  
--isnull(convert(varchar,(case when module ='AR' then (select top 1 duedate from ardoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   
--   when module ='AP' then (select top 1 duedate from apdoc where batnbr =t.batnbr and refnbr = t.refnbr and user6<>'' )   else '' end ), 103) ,  
--convert(varchar,t.TranDate, 103) ) FechaVence,  
--convert(varchar,t.TranDate, 103) FechaEmision,v.Descr,'' Campo17,  
--cast(isnull((case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.CrAmt*-1 as decimal(10,2)) as varchar)  else cast(cast(t.DrAmt as decimal(10,2)) as varchar) end),0.00)as decimal(10,2))  DrAmt,      
--cast(isnull((case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.DrAmt*-1 as decimal(10,2)) as varchar)  else cast(cast(t.CrAmt as decimal(10,2)) as varchar) end),0.00)as decimal(10,2))  CrAmt,      
--(case when module in('AR','AP') then t.module+'&'+t.PerPost+'00&'+rtrim(t.BatNbr)+CAST( t.module+'A' AS CHAR(3))  else '' end ) Codigo,  
--v.Start        
--FROM  stc_vr_ShareGLPeriodBal v        
-- LEFT OUTER JOIN GLTran t WITH(INDEX(GLTran6)) ON v.Acct = t.Acct AND        
-- v.BalanceType = t.BalanceType AND v.LedgerID = t.LedgerID AND        
--     v.Period = t.PerPost AND v.Sub = t.Sub AND t.Posted = 'P' AND        
-- v.Fiscyr = t.Fiscyr AND v.curyid = t.curyid AND v.CpnyID = t.CpnyId       
--where  t.refnbr is not null  
  
--)x  
  
  
  
----SELECT t.PerPost, t.BatNbr,  CAST( t.module+' ' AS CHAR(3))AS module,v.Acct,convert(varchar,t.TranDate, 103) TranDate,v.Descr,cast(cast(t.CrAmt as decimal(10,2)) as varchar) CrAmt,cast(cast(t.DrAmt as decimal(10,2)) as varchar) DrAmt,v.Start          
----FROM  stc_vr_ShareGLPeriodBal v          
---- LEFT OUTER JOIN GLTran t WITH(INDEX(GLTran6)) ON v.Acct = t.Acct AND          
---- v.BalanceType = t.BalanceType AND v.LedgerID = t.LedgerID AND          
----     v.Period = t.PerPost AND v.Sub = t.Sub AND t.Posted = 'P' AND          
---- v.Fiscyr = t.Fiscyr AND v.curyid = t.curyid AND v.CpnyID = t.CpnyId   
  
  go
  
  