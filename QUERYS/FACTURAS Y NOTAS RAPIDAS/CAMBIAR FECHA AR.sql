012495ARA
012495ARA
012496ARA
012496ARA

/*

009351
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='012495' -- LOTE 
--set @refnbr ='F670000375' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr-- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr-- and refnbr like @refnbr

select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR'-- and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr  =@refnbr
go




select refnbr,* from ardoc where batnbr ='000159'






F020002107 


/****************************cambio de periodo AR*************************************
update batch set  perpost='201607' where batnbr ='019083' and module ='ar'

UPDATE ARDOC SET perpost='201607' where batnbr ='019083'
--and refnbr ='F670000375'
UPDATE ARTRAN SET perpost='201607' where batnbr ='019083'
--and refnbr ='F670000375'
UPDATE GLTRAN SET perpost='201607' where batnbr ='019083' and module ='ar'
--and refnbr ='F670000375'
UPDATE ARADJUST SET ADJGPERPOST ='201604' ,PERAPPL ='201604' WHERE ADJBATNBR ='011427'
--and adjdrefnbr  ='F670000375'







******************************************************************/
*/

008556ARA
008556ARA
008556ARA
008556ARA
008556ARA
008556ARA


Estos lotes son de tesorería, por favor, corregir fechas,  ponerle 30/11/2016; no te olvides cambiemos módulo y libros: 

20161100	013513ARA	M0040	101000	 	 	PEN	 	 	0	0	0	 	 	02/12/2016	CAJA CENTRAL	46.69	0	140100&20161100&013513ARA&M0040
20161100	013513ARA	M0063	121301	 	 	PEN	 	 	0	0	0	 	 	02/12/2016	FACTURAS, BOLETAS NACIONAL	0	49.06	140100&20161100&013513ARA&M0063
20161100	013513ARA	M0070	121301	 	 	PEN	 	 	0	0	0	 	 	02/12/2016	FACTURAS, BOLETAS NACIONAL	0	46.69	140100&20161100&013513ARA&M0070


declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='013513' -- LOTE 
--set @refnbr ='F670000375' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr-- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr-- and refnbr like @refnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR'-- and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr  =@refnbr
go


013513    


select * from ARDoc where  batnbr ='013513' and BatSeq  = 3
UPDATE ARDOC SET crtd_datetime ='2016-11-30',CURYEFFDATE ='2016-11-30' ,DOCDATE ='2016-11-30' where batnbr ='014658' and BatSeq  = 3

UPDATE ARTRAN SET crtd_datetime ='2016-11-30',TRANDATE ='2016-11-30' where batnbr ='014658' and RecordID  in (571244,571308)



UPDATE  GLTran  SET TranDate  ='2016-11-30', crtd_datetime  ='2016-11-30'  where Module  = 'AR' and BatNbr  ='014658' and TranDesc  ='45976369 BAUTISTA BRIONES NELS'

UPDATE ARADJUST SET ADJGDOCDATE ='2016-11-30',DATEAPPL='2016-11-30' WHERE ADJBATNBR = '014658' and AdjdRefNbr  ='B660126157' and AdjAmt  = 46.69


select * from aradjust where adjbatnbr ='013513'


B660126157

571244
571308

RecordID
571244

update batch set dateent  ='2016-12-30',crtd_datetime ='2016-12-30' where batnbr ='014658' and module ='ar'

UPDATE ARDOC SET crtd_datetime ='2016-12-30',CURYEFFDATE ='2016-12-30' ,DOCDATE ='2016-12-30' where batnbr ='014658'
--and refnbr ='F670000375'
UPDATE ARTRAN SET crtd_datetime ='2016-12-30',TRANDATE ='2016-12-30' where batnbr ='014658'
--and refnbr ='F670000375'
UPDATE GLTRAN SET crtd_datetime  ='2016-12-30',TRANDATE ='2016-12-30'where batnbr ='014658' and module ='ar'
--and refnbr ='F670000375'
UPDATE ARADJUST SET ADJGDOCDATE ='2016-12-30',DATEAPPL='2016-12-30' WHERE ADJBATNBR ='014658'
--and adjdrefnbr  ='F670000375'



update batch set dateent  ='2015-10-21',crtd_datetime ='2015-10-21',perpost='201511' where batnbr ='030371' and module ='AR'

UPDATE ARDOC SET crtd_datetime ='2015-10-21',CURYEFFDATE ='2015-10-21' ,DOCDATE ='2015-10-21',perpost='201511' where batnbr ='030371'
--and refnbr ='F110001517'
UPDATE ARTRAN SET crtd_datetime ='2015-10-21',TRANDATE ='2015-10-21',perpost='201511' where batnbr ='030371'
--and refnbr ='F110001517'
UPDATE GLTRAN SET crtd_datetime  ='2015-10-21',TRANDATE ='2015-10-21',perpost='201511'where batnbr ='030371' and module ='ar'
--and refnbr ='F110001517'
UPDATE ARADJUST SET ADJGDOCDATE ='2015-10-21',DATEAPPL='2015-10-21', ADJGPERPOST ='201511' ,PERAPPL ='201511' WHERE ADJBATNBR ='030371'



use [ca2015sys]
go


select*  from custom2

delete from custom2 where entityid=''

insert into  [ca2015sys].[dbo].[custom2] (description,entityid,recordindex,screenid,sequence,propdata)
select description,entityid,recordindex,screenid,sequence,propdata from  [am2015sys].[dbo].[custom2]
