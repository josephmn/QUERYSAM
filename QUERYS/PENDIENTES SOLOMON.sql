---- PRUEBA DE PROCESOS




select fechanegocio,* from cfm_regvtas where fecha  ='2016-12-05' AND CHK_NUM NOT IN (SELECT CHK_NUM FROM CF_REGVTAS)

               
select fechanegocio,exportadofn,referenciafn,* from cfm_regvtas WHERE  numdoc  ='20160522-01-0148277'

select * from cf_regvtas
select * from refnbr where refnbr ='B110003171'


select  fechanegocio,exportadofn,referenciafn,EXPORTADOPA,REFERENCIAPA,* from cf_regvtas where C1 ='CREDITO' AND USER06 ='NOPAGO' AND MONTH(FECHANEGOCIO) =4
AND TIPODOC  ='12'



SELECT numero,BASEAFECTA,IGV ,TOTALMN,TOTALME, SALDO
FROM  [192.168.10.93].SGRP2016.VEN.VENTA where numero like '%'+right(@refnbr,6)
go


select FECHANEGOCIO,*  from cfm_regvtas where razonsocial1 like '%ZULY%'
AND CHK_NUM NOT IN (SELECT CHK_NUM FROM CF_REGVTAS WHERE MONTH(FECHANEGOCIO)=6)



select FECHANEGOCIO,exportadofn,*  from cf_regvtas where razonsocial1 like '%G Y %'
select FECHANEGOCIO,exportadofn,REFERENCIAFN,*  from cf_regvtas
where fecha  ='2015-11-28' and numtienda  ='29' and razonsocial1 like '%RIVERA%'
select* from batch where module ='AR' AND STATUS IN ('B','S','H') AND PERPOST ='201511'


-- MIGRAR LOS DOCUMENTOS QUE FUERON INGRESADOS SIN MONTO
SELECT FECHANEGOCIO,*  FROM CF_REGVTAS  cf WHERE NOMBEMPLEADO ='LAISSON' and exportadofn =''
order by cf.FECHANEGOCIO asc


0004817
0004816


select fechanegocio, *  from CFM_REGVTAS WHERE NUMTIENDA  ='33' and fechanegocio ='2016-07-06' and numdoc  ='20160706-01-00094974'
select fechanegocio,*  from CFM_REGVTAS WHERE fecha  ='2016-07-13' order by CFM_REGVTAS.fechanegocio asc

select fechanegocio,*  from CFM_REGVTAS WHERE numdoc like '%0006908%'

select*  from cf_regvtas where  chk_num ='CFCLINTE000000036888'
select exportadofn,*  from cf_regvtas WHERE fechanegocio ='2016-07-12' and numdoc   like '%0094973'


select cf.fechanegocio,cf.* from CFM_RegVtas cf 
inner join cf_tiendasite t on cf.numtienda  =t.numtienda 
where cf.Chk_Num  not in (select Chk_Num from CF_RegVtas)
and month(cf.fechanegocio)= 12
order by cf.fechanegocio asc, cf.numtienda asc



SELECT FECHANEGOCIO,*  FROM CF_REGVTAS  cf WHERE NOMBEMPLEADO ='LAISSON' and exportadofn =''
order by cf.FECHANEGOCIO asc











SELECT FECHANEGOCIO,*  FROM CF_REGVTAS  cf WHERE NOMBEMPLEADO ='LAISSON'




delete from cfm_regvtas where numdoc ='XXXXXXXXXXXXX'
select  distinct b.batnbr  from ardoc a inner join cf_regvtas cf 
on a.batnbr = cf.exportadofn
inner join batch b on a.batnbr =b.batnbr
where b.module ='ar' and b.status in ('b','h','s')




--pendientes AR
select fechanegocio,ExportadoFN,referenciaFN,exportadopa,referenciapa,*  from CF_RegVtas 
where ExportadoFN ='' and MONTH(FECHANEGOCIO) = 12 

select fechanegocio,ExportadoFN,referenciaFN,exportadopa,referenciapa,*  from CF_RegVtas 
where Exportadopa ='' and MONTH(FECHANEGOCIO) = 8 and user06 <> 'NOPAGO' ORDER BY CF_RegVtas.EXPORTADOFN ASC

select * from ardoc   where  refnbr ='B270000513'

--update ardoc set applbatnbr ='' where batnbr ='012258' and refnbr ='051B224360'


select ardoc.* FROM CF_RVLotesPPago

 INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr
   where ardoc.rlsed=1 and NumTienda <> '99' and ardoc.docbal >0 and
    CF_RVLotesPPago.NumTienda =  '5'  and  cast(ardoc.user8 as smalldatetime) =  '04/13/2016' 



sp_helptext CF_RVLotesPPago
/*
CREATE  VIEW CF_RVLotesPPago      
as      
SELECT NumTienda,FechaNegocio , ExportadoFN,ReferenciaFN      
FROM CF_RegVtas      
where ExportadoFN<>'' AND  ReferenciaFN <>'' AND  ExportadoPA ='' AND  ReferenciaPA ='' AND  USER06<>'NOPAGO'    
--and NumTienda =  '31'      
GROUP BY NumTienda,FechaNegocio, ExportadoFN,ReferenciaFN   
*/
select fechanegocio,exportadofn,exportadopa,* from cf_regvtas where exportadofn ='001917' and referenciafn ='441b043051'


-- pendintes Aplicaciones -- 
select fechanegocio,fecha,ExportadoFN,referenciaFN,exportadopa,REFERENCIAPA,*  from CF_RegVtas cf  
inner join batch b on cf.exportadofn =b.batnbr
where ExportadoPA ='' 
and b.module ='AR'
and b.status   IN ('u','p')
--and b.module ='ar'
and CF.user06 ='' 
and CF.total <> 0 
and MONTH(CF.fechaNEGOCIO)=12
order by cf.EXPORTADOFN ASC 
go  





--('h','s','b')
exec ardebug '028223'    
liberarar '028223'


  

SELECT NUMTIENDA, EXPORTADOFN,REFERENCIAFN , EXPORTADOPA,REFERENCIAPA ,FECHANEGOCIO,NUMDOC FROM CF_REGVTAS  C
INNER JOIN ARDOC A ON C.EXPORTADOFN =A.BATNBR
where perpost ='201604' and doctype ='IN' and refnbr not in 
(select refnbr from ardoc where doctype ='PA')
AND EXPORTADOPA =''
order by fechanegocio asc




liberarar '006187'

select FECHANEGOCIO,EXPORTADOFN,REFERENCIAFN,EXPORTADOPA,* from cf_regvtas CF where exportadopa ='' and razonsocial1 <>'ANULADO'
AND USER06=''
ORDER BY CF.FECHANEGOCIO ASC


SELECT DISTINCT CF.EXPORTADOFN from CF_RegVtas cf  
inner join batch b on cf.exportadofn =b.batnbr
where ExportadoPA ='' 
and b.module ='AR'
and b.status   IN ('u','p')
--and b.module ='ar'
and CF.user06 ='' 
and CF.total <> 0 
and MONTH(CF.fechaNEGOCIO) = 11 
order by cf.EXPORTADOFN ASC 
go  


select distinct doctype  from apdoc where perpost ='201603'
SELECT DISTINCT CF.EXPORTADOFN,CF.FECHANEGOCIO from CF_RegVtas cf  
inner join batch b on cf.exportadofn =b.batnbr  where ExportadoPA ='' and b.module ='AR'  and b.status   IN ('B','H','S') 
and CF.user06 ='' and CF.total <> 0  and MONTH(CF.fechaNEGOCIO) =  month(CF.fechanegocio) order by cf.EXPORTADOFN ASC 


SELECT * FROM CF_REGVTAS WHERE CHK_NUM = 'EMTRUJIL000000020629'
--SELECT * FROM CFM_REGVTAS WHERE CHK_NUM = 'EMTRUJIL000000020593'


SELECT EXPORTADOFN,REFERENCIAFN,EXPORTADOPA,REFERENCIAPA,* FROM CF_REGVTAS WHERE CHK_NUM = 'EMTRUJIL000000020629'
--UPDATE CF_REGVTAS SET REFERENCIAFN = 'B04/004010',NUMDOC='/004010' WHERE CHK_NUM ='EMTRUJIL000000020629'


SELECT EXPORTADOFN,REFERENCIAFN,* FROM CF_REGVTAS WHERE CHK_NUM = 'EMTRUJIL000000020593'


select fechanegocio,* from CF_RegVtas cf
where Exportadofn ='' and MONTH(fechaNEGOCIO)=4
and user06 =''
and total <> 0 
and MONTH(fechaNEGOCIO)=1
go

-- pendiente targetas --


select * from cf_detpago where exportadotr=''
and month(fechanegocio) = 3
--and tipo <> 'EFECTIVO' 
order by fechanegocio desc
go


--- Pendientes depositos ---
select ss.fechanegocio,t.descripcion,ss.* from cfm_detpago2  ss
inner join cf_tiendasite T on ss.numtienda  =t.numtienda
where  exportadotr = '' 
and 
 
month(ss.fechanegocio)  in (11)  
--and nombrvc ='201602'
order by ss.fechanegocio desc
go


SELECT * FROM CFM_DETPAGO2 WHERE fechanegocio ='2016-11-21'


select * from catran where trandate  ='2016-11-19'


    
select ss.* from   cfm_detpago2  ss
inner join cf_tiendasite T on ss.numtienda  =t.numtienda
where  exportadotr = '' and
--and 
month(ss.fechanegocio)  in (12)  
--and nombrvc ='201602'
order by ss.fechanegocio desc
go

EXT24604       
     
select *  from cfm_detpago2 where Referencia like '%EXT24604%'and FechaNegocio  ='2016-12-15' and NombRVC  ='201612'
and Exportadotr not in (select batnbr from batch where Module  ='CA')
order by 


update CFM_DetPago2 set Exportadotr  ='' where FechaNegocio  ='2016-12-15' and Referencia  ='EXT24604'  and Exportadotr  IN ( '028544') and Chk_Num IN (  'DIM01CEN000000005754','DIM01CEN000000005756','DIM01CEN000000005759')

EXT24604            
select *  from cfm_detpago2 where Exportadotr  ='028544'

028544
028544


-- 028544

update CFM_DetPago2 set Exportadotr  ='' where FechaNegocio  ='2016-12-15' and Referencia  ='EXT24868'  and Exportadotr  ='028544' and Chk_Num  ='DIM01CEN000000005748'


028544


delete from cfm_detpago2 where Chk_Num   ='DMPTOMAL000000001650'

select * from vendor where vendid ='20550241464'


select ExportadoPA, ReferenciaPA,ExportadoFN,ReferenciaFN from CF_RegVtas where NumTienda =  '42'  and  cast(FechaNegocio as smalldatetime) =  '08/20/2016'   AND ExportadoFN<>'' 




select exportadotr,*  from  cfm_detpago2 where Referencia  = '23803'

Referencia
190317              
select  ss.*
--update ss set  nombrvc ='201605'

 from cfm_detpago2  ss
inner join cf_tiendasite T on ss.numtienda  =t.numtienda
--where  exportadotr = '' 
--and 
where 
month(ss.fechanegocio)  in (4)  and month( nombtendermedia) =5
--and nombrvc ='201602'
order by ss.exportadotr desc
go


select exportadotr,* from cfm_detpago2 where referencia ='EXT187628'



SELECT FECHANEGOCIO,* FROM CFM_DETPAGO2 WHERE  
  EXPORTADOTR <> '' AND EXPORTADOTR NOT IN ( SELECT BATNBR FROM  BATCH WHERE MODULE  ='CA' ) AND NOMBRVC <>''







select *from (
select distinct numtienda,fechanegocio,(select distinct numtienda from CF_DetPago where numtienda = C.numtienda and convert(varchar, fechanegocio, 112)=C.fechanegocio ) a
from CFM_DetPago C
) x where a is  null
order by fechanegocio


select rtrim(year(fechaNegocio))+ right('00'+rtrim(month(fechaNegocio)),2),*
--update CFM_DetPago2 set NombRVC= rtrim(year(fechaNegocio))+ right('00'+rtrim(month(fechaNegocio)),2)
from CFM_DetPago2 where exportadotr ='' and month(fechanegocio) = 1 and fechanegocio between '2015-02-21' and '2015-02-22'



use [ca2016sys]
--go
--
--select* from custom2 where entityid='bdurbcha'
--
delete from custom2 where entityid='bdurbcha'
--





select cf.* from cfm_detpago2 cf
inner join  catran  c on cf.exportadotr =c.batnbr
inner join batch b on c.batnbr = b.batnbr
where b.status  ='c'
and cf.numtienda  in ('99','41')



select * from batch where batnbr in(
select distinct b.batnbr from ardoc a 
inner join cf_regvtas cf on a.batnbr = cf.exportadofn 
inner join batch b on a.batnbr =b.batnbr 
where b.module ='ar' and b.status in ('b','h','s')
)


 select   b.batnbr  from ardoc a
 inner join cf_regvtas cf on a.batnbr = cf.exportadofn 
 inner join batch b on a.batnbr =b.batnbr  where b.module ='ar'
 and b.status in ('b','h','s')





select * from cfm_detpago2 where  month(fechanegocio) =6 and exportadotr <>'NULL'and month(fechanegocio) =6
AND REFERENCIA IN (select referencia from 
cfm_detpago2 where  month(fechanegocio) =6 AND EXPORTADOTR ='NULL')


select exportadotr,* from cfm_detpago2 where  EXPORTADOTR  LIKE 'null%' and month(fechanegocio) =6
and referencia in (select referencia from 
cfm_detpago2 where  month(fechanegocio) =6)



SELECT  adjbatnbr,adjdrefnbr,count(*)  FROM aradjust where perappl ='201608' and adjgdoctype ='PA'
 group by adjbatnbr,adjdrefnbr having count (*) >1

select * from aradjust where adjbatnbr ='001009' and adjdrefnbr ='B119003171'

select  batnbr,docbal,curydocbal,refnbr,origdocamt,* from   ardoc where doctype ='IN' and refnbr ='161F074873'


insert into ARTRAN(Acct , AcctDist, BatNbr, CmmnPct, CnvFact, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryExtCost, CuryId , CuryMultDiv, CuryRate, CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTranAmt, CuryTxblAmt00 , CuryTxblAmt01, CuryTxblAmt02 ,CuryTxblAmt03 , CuryUnitPrice, CustId , DrCr, Excpt, ExtCost, ExtRefNbr, FiscYr, InstallNbr, InvtId, JobRate, JrnlType, LineId , LineNbr, LineRef,LUpd_DateTime , LUpd_Prog, LUpd_User, MasterDocNbr, NoteId, OrdNbr, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, ProjectID , Qty, RefNbr,Rlsed , S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09 , S4Future10, S4Future11, S4Future12, ServiceDate, SiteId, SlsperId, SpecificCostID, Sub, TaskID, TaxAmt00, TaxAmt01,  TaxAmt02 , TaxAmt03 , TaxCalced, TaxCat, TaxId00, TaxId01, TaxId02, TaxId03, TaxIdDflt , TranAmt, TranClass, TranDate, TranDesc, TranType, TxblAmt00, TxblAmt01 , TxblAmt02, TxblAmt03, UnitDesc, UnitPrice,User1 , User2, User3, User
4, User5, User6, User7, User8, WhseLoc)
 Values ( '401110' ,0, '002368' ,0,1,'', 'ALTOMAYO' ,convert (smalldatetime, getdate()),'08010', 'SYSADMIN' ,0, 'SOL' ,'M',1,0,0,0,0,0,0,0,0,0,0, '20492107957' , 'C' ,0,0,'',  '2016' ,0, '' ,0,'AR',1,1, '' ,convert (smalldatetime, getdate()),'08010', 'SYSADMIN' ,'',0,'','','', '' , '201612' , '201612' ,'',0, 'F140000179' ,0,'','',0,0,0,0,'01/01/1900','01/01/1900',0,0, 'IGV1' ,'','01/01/1900', '' , '552' ,'', 'CAC2000RE000' ,'',0,0,0,0,'', '' , 'IGV1' ,'','','', '' ,0, 'T' , '12/10/2016' , 'IGV1' , 'IN' ,0,0,0,0, '' ,0,'','',0,0,'','','01/01/1900','01/01/1900','' )


select * from artran where batnbr not in (select batnbr from batch where module  ='AR' AND PERPOST  ='201612') AND PERPOST ='201612'



select  c.batnbr,c.refnbr,c.* from ardoc c where custid  ='20492107957' and perpost ='201612' order by c.batnbr desc 

