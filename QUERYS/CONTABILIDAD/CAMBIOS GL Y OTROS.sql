

------------ CAMBIAR CUENTAS ---------- 
/*
select * from ardoc where batnbr = '006786' and refnbr ='B580138600'
select * from ardoc where refnbr ='B580138600'
*/

---------------a trabajar piere-------------
select * from  batch where module='gl'
select * from  GLTran where module='gl'

update batch set  perpost ='201610'  where batnbr ='000970' AND MODULE ='GL' --and acct ='759101'
update gltran set perpost ='201610' where batnbr ='000970' AND MODULE ='GL' --and acct ='999999'
/*







select * from screen WHERE NAME LIKE '%PLA%'



DROP TABLE PANTALLASOL

DROP TABLE PANTALLASOL

create table PANTALLASOL
(
MODULO CHAR(2),
NOMBREPANTALLA VARCHAR(100) ,
NUMERO VARCHAR(50) , 
TIPOPANTALLA CHAR(1),
ACTIVO CHAR(1),
MASK CHAR(2)
)

INSERT INTO PANTALLASOL (MODULO,NOMBREPANTALLA,NUMERO,TIPOPANTALLA,ACTIVO,MASK)
SELECT MODULE,NAME,NUMBER,SCREENTYPE,'S' ,
 CASE 
 WHEN MODULE  ='AR' THEN '08'
 WHEN MODULE  ='AP' THEN '03' 
 WHEN MODULE  ='IN' THEN '10' 
 WHEN MODULE  ='CA' THEN '20'
 WHEN MODULE  ='GL' THEN '01'
 WHEN MODULE  ='OM' THEN '40'
 WHEN MODULE  ='PO' THEN '04'
 WHEN MODULE  ='PE' THEN 'PE'
 WHEN MODULE  ='CT' THEN 'CT' END MASK 
FROM SCREEN WHERE MODULE IN ('AR','AP','GL','CA','PE','OM','PO','IN','CT')

DROP TABLE NAMEMODULE
CREATE TABLE NAMEMODULE
(
IDMODULE CHAR(2),
NAME VARCHAR(50),
ORDEN INT
)

INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('AR','Cuentas x Cobrar',4)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('AP','Cuentas x Pagar',5)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('GL','Contabilidad',1)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('CA','Administracion de Efectivo',2)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('PE','Planillas',3)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('OM','Facturacion y Ventas',6)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('PO','Compras y Recepciones',8)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('IN','Inventarios',7)
INSERT INTO NAMEMODULE (IDMODULE,NAME,ORDEN) VALUES ('CT','Control',9)

ALTER view VMODULOS
AS
SELECT distinct S.MODULO,n.name ,N.ORDEN,S.MASK FROM PANTALLASOL S
inner join NAMEMODULE n on s.modulo  = n.idmodule 

SELECT MODULO,NAME,MASK FROM VMODULOS ORDER BY ORDEN  ASC 


select * from screen where MODULE ='AR'

DfltShipToId
          
select * from customer  where custid  ='72707896'

select DfltShipToId,* from customer where DfltShipToId <> ''
update customer set  DfltShipToId ='DEFAULT' WHERE CUSTID  ='72707896'

select * from screen where module  ='ar' and number  ='0801000'
update screen set name  ='Facturas y notas' WHERE module  ='ar' and number  ='0801000'
update screen set number  ='0801000' WHERE module  ='ar' and number  ='98855x'

select * from  VMODULOS

sp_helptex




SELECT * FROM SCREEN  WHERE MODULE ='AR'




















use [amcaf2015app]
go


use[ca2015app]
go


003713


SELECT * FROM GLTRAN WHERE MODULE ='GL' AND ACCT ='759101' AND PERPOST ='201510'


select * from batch where batnbr  ='010714' and module = 'GL'
SELECT cramt,dramt,* FROM GLTRAN WHERE BATNBR ='010714' AND MODULE ='GL' --AND ACCT ='411101'

update batch set  perpost ='201610'  where batnbr ='000970' AND MODULE ='GL' --and acct ='759101'
update gltran set perpost ='201610' where batnbr ='000970' AND MODULE ='GL' --and acct ='999999'

/*
update gltran set  cramt = 2,curycramt= 2 , dramt=0,curydramt=0 where batnbr ='010714' AND MODULE ='GL' and acct ='759101'
update gltran set  cramt = 0,curycramt= 0 , dramt=4644.06,curydramt=4644.06 where batnbr ='010714' AND MODULE ='GL' and acct ='335110'
update gltran set  cramt = 0,curycramt= 0 , dramt=4677.97,curydramt=4677.97 where batnbr ='010714' AND MODULE ='GL' and acct ='332111'

 LINEA 335110          6,779.66 CAMBIARLO POR  4,644.06
LINEA 332111           2,542.37 CAMBIARLO POR  4677.97   

GL4646   DA  4647
GL5141   DA  5142



AP12344
AP14008


select * from batch where batnbr  ='005135' and module = 'GL'
SELECT * FROM GLTRAN WHERE BATNBR ='005135' AND MODULE = 'GL'  --AND ACCT ='411101'

005371
006320
006358

delete from batch where batnbr  ='006294' and module = 'GL'
delete from gltran where batnbr  ='006294' and module = 'GL'


 SELECT * FROM ARDOC WHERE  REFNBR ='B050004108'
 
 SELECT * FROM CFM_REGVTAS WHERE NUMDOC LIKE '%004108%' AND FECHA ='2016-08-29'
 


SELECT * FROM GLTRAN WHERE BATNBR ='007374' AND MODULE ='GL' --AND ACCT ='411101'


SELECT* FROM ACCTHIST

  
007366    
007365      


DELETE FROM BATCH WHERE BATNBR ='007365' AND MODULE ='GL'
DELETE FROM GLTRAN WHERE BATNBR ='007365' AND MODULE ='GL'

--delete from gltran where batnbr = '003713' and module  ='GL' and acct  = '411501'

update gltran set curycramt =151783.91,cramt =151783.91 where batnbr ='003713' and module ='GL' and acct ='411101'
select * from batch where batnbr  ='004419' and module = 'GL'

select * from batch where batnbr  ='000161' and module = 'GL'
select * from batch where batnbr  ='000162' and module = 'GL'
SELECT * FROM GLTRAN WHERE BATNBR ='000161' AND MODULE ='GL'

SELECT * FROM GLTRAN WHERE BATNBR ='000162' AND MODULE ='GL'


----------------------------CORREGIR ---------------------------------------------------

--UPDATE GLTRAN SET TRANTYPE ='GL' WHERE BATNBR ='000161' AND MODULE ='GL'
--UPDATE GLTRAN SET BALANCETYPE='A' WHERE BATNBR ='000161' AND MODULE ='GL'
--UPDATE GLTRAN SET ID='06661964' WHERE BATNBR ='000161' AND MODULE ='GL'



UPDATE GLTRAN SET S4FUTURE11='C' WHERE BATNBR ='007367' AND MODULE ='GL' AND S4FUTURE11='N'
--UPDATE GLTRAN SET S4FUTURE11='N' WHERE BATNBR ='000161' AND MODULE ='GL'
--UPDATE GLTRAN SET ledgerid='REAL' WHERE BATNBR ='000161' AND MODULE ='GL'



SELECT* FROM GLTRAN WHERE MODULE ='GL'


 delete from gltran where batnbr  ='007369' and module  ='gl'
 delete from batch where batnbr  ='007369' and module  ='gl'


select * from glsetup

SELECT * FROM GLTRAN WHERE BATNBR='008669' AND MODULE ='GL' AND ACCT ='403201'
De:401730
A  :401710


update gltran set  ACCT='401710' where batnbr='008669' and module ='GL' AND ACCT ='401730'
update gltran set  ACCT='407101' where batnbr='003681' and module ='GL' AND ACCT ='403201'
update gltran set  ACCT='407101' where batnbr='003691' and module ='GL' AND ACCT ='403201'

-- VERIFICAR LOTES CON CUENTA 401720 QUE ESTAN ERRADOS (CRAMT,CURYCRAMT) SI ESTAN ERRADOS
select rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where trantype ='VO' AND ACCT='401720' and dramt <>0



------ ELIMINAR GL DE MODULO 'GL' ERRADOS ---------
--

--Eliminar lote GL 003877 , sin destino
select * from batch where batnbr ='003877' and module  ='GL' 
select batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,trantype,jrnltype,* from gltran  where BATNBR= '003877' and module ='GL'
--DELETE FROM BATCH WHERE BATNBR  ='003877'AND MODULE ='GL'
--DELETE FROM GLTRAN WHERE BATNBR ='003877'AND MODULE ='GL'


--Eliminar lote GL 003578 , con destino DA  003579
select * from batch where batnbr ='003578' and module  ='GL' 
select batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,trantype,jrnltype,* from gltran  where BATNBR= '003578' and module ='GL'
--DELETE FROM BATCH WHERE BATNBR  ='003578'AND MODULE ='GL'
--DELETE FROM GLTRAN WHERE BATNBR ='003578'AND MODULE ='GL'

select * from batch where batnbr ='003579' and module  ='GL' 
select batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,trantype,jrnltype,* from gltran  where BATNBR= '003579' and module ='GL'
--DELETE FROM BATCH WHERE BATNBR  ='003579'AND MODULE ='GL'
--DELETE FROM GLTRAN WHERE BATNBR ='003579' AND MODULE ='GL' 


select * from xamzonaventa




insert into xamzonaventa (zonaventaid,descripcion2,user06)
values ('CACU','CAFETERIA CUSCO','CA')



--DELETE FROM GLTRAN WHERE BATNBR ='003877'AND MODULE ='GL'



select * from batch where batnbr ='003722' and module  ='GL'
select batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,trantype,* from gltran  where BATNBR= '003722' and module ='GL'


--update gltran set sub ='0000000000' where batnbr ='003722' and module  ='GL' AND ACCT  ='101000'


--DELETE FROM GLTRAN WHERE BATNBR='004334' AND MODULE ='GL' -- LOTE DE PROVISION
--DELETE FROM GLTRAN WHERE BATNBR='004335' AND MODULE ='GL' -- LOTE DE DESTINO ( SE GENERA AUTOMATICAMENTE+1)
--DELETE FROM BATCH WHERE BATNBR IN ('004334','004335') AND MODULE ='GL'


use [ca2015app]
go

-- VERIFICAR GL EN MODULOS (ar,ap,in,etc)
select  GL.batnbr,GL.refnbr,GL.acct,GL.cramt,GL.curycramt,GL.dramt,GL.curydramt,GL.* from gltran GL  where module = 'AP'  
and acct = '949101' and batnbr  ='000462'   and extrefnbr like 'LIQ%' AND ID ='20202020000' and trantype='VO'  AND GL.REFNBR ='006712'
-- CAMBIAR DE CUENTA --
declare @batnbr char(6)
declare @refnbr char(10) 
set @batnbr ='010990'
set @refnbr ='006712'
--UPDATE GLTRAN SET ACCT ='419102' where batnbr=@batnbr and module ='AP' and  acct='421213' and  refnbr=@refnbr     

-- VERIFICAR AP EN CUENTAS
select BATNBR,* from apdoc where batnbr ='010914' and  vendid='20394862704' and acct ='471001' and refnbr ='006654'
select BATNBR,* from aptran where  batnbr ='010914' and refnbr ='006654' and acct ='471001'
select batnbr,* from gltran where batnbr ='010914' and module = 'AP' and acct ='471001' AND refnbr ='006654'
select * from apadjust where adjbatnbr  ='010914'
declare @batnbr char(6)
declare @refnbr char(10) 
set @batnbr ='010914'
set @refnbr ='006654'
--UPDATE APDOC set acct ='471001' where batnbr=@batnbr and acct='431201' and  refnbr=@refnbr
--UPDATE aptran SET ACCT ='471001' where batnbr=@batnbr and acct='431201' and  refnbr=@refnbr 
--UPDATE gltran set acct ='471001' where batnbr=@batnbr and MODULE ='AP' and acct ='431201' and refnbr = @refnbr      
   


--  CASO CAMBIAR FAC DE REFERENCIA (1)
select extrefnbr,* from gltran where batnbr ='008938' and acct in ('401110','471001','945201')
select invcnbr,* from apdoc where batnbr='008938'
select extrefnbr,* from aptran where batnbr ='008938'


--update gltran set extrefnbr = '0000000450' where batnbr='008938' and extrefnbr ='0000000040' 
--update apdoc set invcnbr = '0000000450' where batnbr = '008938' and invcnbr = '0000000040' 
--update aptran set extrefnbr ='0000000450' where batnbr ='008938' and extrefnbr ='0000000040'


select * from batch where batnbr = '006441' and module  ='GL'
select * from gltran WHERE batnbr = '006441' and module  ='GL' -- and acct ='411101' and REFNBR ='DEV 5TA.CA'
--UPDATE GLTRAN SET ACCT  ='401730' WHERE batnbr = '004706' and module  ='GL' and acct ='411101' and REFNBR ='DEV 5TA.CA'


select * from batch where batnbr = '004710' and module  ='GL'
select * from gltran WHERE batnbr = '004710' and module  ='GL' and acct ='411101' and REFNBR ='DEV 5TA.CA'
--UPDATE GLTRAN SET ACCT  ='401730' WHERE batnbr = '004710' and module  ='GL' and acct ='411101' and REFNBR ='DEV 5TA.CA'




--DELETE from batch where batnbr = '004662' and module  ='GL'
--DELETE from GLTRAN where batnbr = '004662' and module  ='GL'


select * from batch where batnbr = '006441' and module  ='GL'
SELECT * FROM GLTRAN WHERE batnbr = '006441' and module  ='GL'
select '                                '
select * from batch where batnbr = '006442' and module  ='GL'
SELECT * FROM GLTRAN WHERE batnbr = '006442' and module  ='GL'


select * from batch where  module  ='GL' and crtot =25.62
SELECT * FROM GLTRAN WHERE module  ='GL' and cramt =25.62 or dramt =25.62



select perpost,status,rlsed,* from batch where  MODULE  = 'AP' AND batnbr ='018795' 
SELECT perpost,rlsed,DOCDATE,sub,* FROM APDOC  where batnbr ='018795'
SELECT perpost,rlsed,sub,* FROM APTRAN  where batnbr ='018795'
SELECT perpost,rlsed,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='018795'  
SELECT * FROM APADJUST  where ADJbatnbr = '018795'
go



--DELETE from batch where batnbr = '004663' and module  ='GL'
--DELETE from GLTRAN where batnbr = '004663' and module  ='GL'




sp_helptext pp_01520








