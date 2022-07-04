


select FECHANEGOCIO,*  from cfm_regvtas where razonsocial1 like '%ZULY%'
AND CHK_NUM NOT IN (SELECT CHK_NUM FROM CF_REGVTAS WHERE MONTH(FECHANEGOCIO)=6)


select FECHANEGOCIO,exportadofn,*  from cf_regvtas where razonsocial1 like '%G Y %'
select FECHANEGOCIO,exportadofn,REFERENCIAFN,*  from cf_regvtas




where fecha  ='2015-11-28' and numtienda  ='29' and razonsocial1 like '%RIVERA%'
select* from batch where module ='AR' AND STATUS IN ('B','S','H') AND PERPOST ='201511'


-- MIGRAR LOS DOCUMENTOS QUE FUERON INGRESADOS SIN MONTO
SELECT FECHANEGOCIO,*  FROM CF_REGVTAS  cf WHERE NOMBEMPLEADO ='LAISSON' and exportadofn =''
order by cf.FECHANEGOCIO asc


select fechanegocio, *  from CFM_REGVTAS WHERE NUMTIENDA  ='33' and fechanegocio ='2016-07-06' and numdoc  ='20160706-01-00094974'
select fechanegocio,*  from CFM_REGVTAS WHERE fecha  ='2016-07-13' order by CFM_REGVTAS.fechanegocio asc

select fechanegocio,*  from CFM_REGVTAS WHERE numdoc like '%0006908%'

select*  from cf_regvtas where  chk_num ='CFCLINTE000000036888'
select exportadofn,*  from cf_regvtas WHERE fechanegocio ='2016-07-12' and numdoc   like '%0094973'
002230    

002278
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='002281' -- LOTE 
--set @refnbr ='F250001033' --DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr -- and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr = @batnbr --and adjdrefnbr =@refnbr
go 




liberarar '002276'


---------------------------------|       NOTAS DE CREDITO AUTOMATICO       |-----------------------------------------------------------------
select exportadopa from cf_regvtas where numdocanulacion <> '' and month(fechanegocio) = 11 
AND REFERENCIAFN  ='441F007262'


select exportadofn,referenciafn,exportadopa,referenciapa 
--UPDATE D SET exportadopa ='', referenciapa =''
FROM CF_REGVTAS WHERE EXPORTADOPA IN 
(
select distinct exportadopa from cf_regvtas where numdocanulacion <> '' and month(fechanegocio) = 11  AND EXPORTADOPA NOT IN (select adjbatnbr from aradjust)
) 


select * from batch where module ='AR' and batnbr in (
select distinct exportadopa from cf_regvtas where numdocanulacion <> '' and month(fechanegocio) = 11  AND EXPORTADOPA NOT IN (select adjbatnbr from aradjust)
)
--paso 1 sacar los lotes C del modulo AR que no tienen aradjust
delete from batch where module ='AR' and  batnbr in (
select distinct exportadopa from cf_regvtas where numdocanulacion <> '' and month(fechanegocio) = 11  AND EXPORTADOPA NOT IN (select adjbatnbr from aradjust) )
and perpost ='201611'


-- paso 2 limpiar ploma CF_REGVTAS 
select exportadofn,referenciafn,exportadopa,referenciapa ,fechanegocio
--UPDATE D SET exportadopa ='', referenciapa =''
FROM CF_REGVTAS D WHERE EXPORTADOPA IN 
(
select distinct exportadopa from cf_regvtas where numdocanulacion <> '' and month(fechanegocio) = 11  AND EXPORTADOPA NOT IN (select adjbatnbr from aradjust)
) and month(fechanegocio) = 11 
order by fechanegocio asc 


--PASO 3 volver a generar paso 2 migraciones 
select distinct invcnbr    from plcminvcnbr where refnbr =  '441F007208' 

select * from  cf_regvtas where numdocanulacion <> '' and month(fechanegocio) = 11  --AND EXPORTADOPA NOT IN (select adjbatnbr from aradjust)
and numdocanulacion ='441F007207'



select * from cf_regvtas where referenciafn ='441F007207'

select ardoc.* FROM CF_RVLotesPPagoNC CF_RVLotesPPago INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr 
where ardoc.rlsed=1  and user6 ='07' and applbatnbr = '' and NumTienda <> '99' and ardoc.docbal >0 and CF_RVLotesPPago.NumTienda = '44' and  cast(ardoc.user8 as smalldatetime) = '2016-11-21'




sp_helptext  CF_RVLotesPPagoNC



SELECT NumTienda,Fecha FechaNegocio, ExportadoFN,ReferenciaFN      
FROM CF_RegVtas        
where ExportadoFN<>'' AND  ReferenciaFN <>'' AND  ExportadoPA ='' AND  ReferenciaPA ='' AND  USER06='NOPAGO'  and C1 = 'AFECTIVO'      
GROUP BY NumTienda,Fecha, ExportadoFN,ReferenciaFN     




-- pendintes Aplicaciones -- 
select fechanegocio,fecha,ExportadoFN,referenciaFN,exportadopa,REFERENCIAPA,*  from CF_RegVtas cf  
inner join batch b on cf.exportadofn =b.batnbr
where ExportadoPA ='' 
and b.module ='AR'
and b.status   IN ('u','p')
--and b.module ='ar'
and CF.user06 ='' 
and CF.total <> 0 
and MONTH(CF.fechaNEGOCIO)=11
order by cf.EXPORTADOFN ASC 
go  
























