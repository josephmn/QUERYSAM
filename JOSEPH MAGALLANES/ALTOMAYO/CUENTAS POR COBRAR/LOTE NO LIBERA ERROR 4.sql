
--ESTADOS DEL BATCH

--SELECT Status, * FROM Batch WHERE PerPost = '201901' AND BatNbr = '000002'

SELECT perpost,STATUS,module,rlsed,* 
-- update BATCH set BaseCuryID = 'DOL'
FROM BATCH WHERE BATNBR='001994' AND MODULE = 'AR'

select  Rlsed ,  bankacct, perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* 
-- update c set CuryId = 'DOL'
from ardoc c where batnbr= '001994'

select Acct, perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc, Slsperid, * 
-- update artran set tranamt = round(curytranamt * curyrate,3)
from artran c
where batnbr= '001994' --and refnbr like @refnbr 

/************ PRIMERO VERIFICAR LOTE DE CxC ************/
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='001994' -- LOTE 
--set @refnbr ='F030020451' --DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select  Rlsed ,  bankacct, perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where 
batnbr= @batnbr --and refnbr = @refnbr
select Acct, perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc, Slsperid, * from artran c
where batnbr= @batnbr --and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select 'GLTRAN' perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR'--- and refnbr like @refnbr 

select 'aradjust' ,  * from aradjust where adjbatnbr = @batnbr ---and adjdrefnbr =@refnbr

--select * 
---- update ARSetup set CurrPerNbr = '202201', PerNbr = '202201'
--from ARSetup

-- delete from  Batch    WHERE BATNBR= @batnbr AND MODULE = 'AR'  
-- delete from  ardoc   where  batnbr= @batnbr 
--  delete from   artran  where batnbr= @batnbr 
-- delete from GLTran    where batnbr = @batnbr and module = 'AR'--- and refnbr like @refnbr  
--delete from aradjust  where     adjbatnbr = @batnbr

select  * from  xAMPeriodosActivos   WHERE UsuarioID  = 'SYSADMIN'


select distinct RefNbr   from  artran     where  BatNbr  = '000968'

select  * from  CATran    where batnbr = '000968'



/***** SI NO LIBERA PARA APLICAR PAGOS *****/

--1.-
-- UPDATE AL BATCH PARA LIBERAR
 update batch set status ='B' where batnbr  ='005128' and module ='AR'

--2.- LIBERAR POR AQUI O POR PANTALLA
ARDEBUG '005128'


SELECT  * FROM WrkRelease 

LIBERARAR '005128'


--3.- delete a las tablas  ----> AQUI TIENES QUE PONER EL LOTE

delete from artran where batnbr  ='001994' and rlsed  ='0' and acct ='121301'
delete from RefNbr where RefNbr in (select refnbr from ardoc where batnbr = '001994')
delete from wrkrelease
delete from wrkreleasebad
delete from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  = '001994')
update   artran   set  rlsed = '0' where batnbr  ='001994' -- and rlsed  ='0' and acct ='121301'
update   artran   set  rlsed = '0' where batnbr  ='001994' -- and rlsed  ='0' and acct ='121301'



 



select DISTINCT C.CustId, C.RefNbr, A.Name from ardoc c LEFT JOIN Customer A ON c.CustId = A.CustId
where C.batnbr= '000615' --and refnbr = @refnbr



select * 
-- update ARDoc set custid = '10166367439'
from ARDoc where BatNbr = '000615' and RefNbr = 'F030020451'



SELECT * FROM Customer WHERE CustId = '10166367430'


SELECT * FROM [ALTOMAYO-TEMP].[AM2018APP].DBO.CUSTOMER WHERE CUSTID = '10166367430'

SELECT * FROM SOAddress WHERE CustId = '10166367430'



SELECT * FROM SOShipHeader WHERE CUSTID = '10166367430'



--APPTABLE
--USETHISSYNTAX


CREATE  VIEW [dbo].[vp_08400Exception2] AS 
/********************************************************************************
*             Copyright Solomon Software, Inc. 1994-1999 All Rights Reserved
*
*    View Name: vp_08400Exception2
*
*++* Narrative: This view will remove Batches where Customer does not exist 
*++*            or Sales Tax ID does not exist.               
*
*
*   Called by: pp_08400prepwork
* 
*/


/***** Customer does not exist *****/
SELECT DISTINCT d.BatNbr, Module = 'AR', MsgID = -1, w.UserAddress 
  FROM WrkRelease w INNER JOIN ARDoc d 
                          ON w.Module = 'AR' AND w.BatNbr = d.BatNbr
                     LEFT OUTER JOIN customer c
                          ON c.CustID = d.CustID
 WHERE d.CustID = ' ' OR  c.CustID IS null
	

UNION

/***** Sales Tax ID does not exist *****/
SELECT DISTINCT d.BatNbr, Module = 'AR', MsgID = -2, w.UserAddress
  FROM wrkrelease w INNER JOIN ARdoc d 
                          ON w.Module = 'AR' AND w.BatNbr = d.BatNbr 
                     LEFT OUTER JOIN salestax s1 
                          ON taxid00 = s1.taxid
                     LEFT OUTER JOIN salestax s2 
                          ON taxid01 = s2.taxid
                     LEFT OUTER JOIN salestax s3 
                          ON taxid02 = s3.taxid
                     LEFT OUTER JOIN salestax s4 
                          ON taxid03 = s4.taxid
  WHERE ((taxid00 <> ' ' AND s1.taxid IS null) 
      OR (taxid01 <> ' ' AND s2.taxid IS null) 
      OR (taxid02 <> ' ' AND s3.taxid IS null) 
      OR (taxid03 <> ' ' AND s4.taxid IS null))
