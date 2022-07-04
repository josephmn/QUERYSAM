



005945
-- CORREGIR SUB DOCUMENTOS Y AJUSTES
CACH000000	CACHCAF000


Laison,
Cambiar estos AP los centros de costos:  de CAIQ-MAR-000 por CAIQ-CAF-000
8348
6971
14430
12104

Finalmente inhabilitar el CC CAIQ-MAR-000



Laison,
Cambiar estos AP los centros de costos:  de CATC-MAR-000 por CATC-EMB-000
014430





Laison,
Cambiar estos AP los centros de costos:  de CATU-MAR-000 por CATU-EMB-000
014430
011890
009082


Finalmente inhabilitar el CC CATU-MAR-000



Laison,
Cambiar lo siguiente:
1.- Centro de costo de: CAIQ-MAR-000 a CAIQ-EMB-000
2.- Centro de costo de: CATC-MAR-000 a CATC-EMB-000
3.- Centro de costo de: CATU-MAR-000 a CATU-EMB-000


/*


18822
A las cuentas que dice 951401 con CC 0000000000 colocarle CC CAIQCAF000


SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='001173'
SELECT perpost,rlsed,DOCDATE,refnbr,sub,* FROM APDOC  where batnbr ='001173'  --and refnbr like '%593%'
SELECT perpost,rlsed,sub,refnbr,sub,* FROM APTRAN  where batnbr ='001173'
SELECT perpost,rlsed,sub,refnbr,SUB,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='001173'  
SELECT * from apadjust where adjbatnbr ='001173'
SELECT * from xapdettran where batnbr ='001173'







update apdoc set S4Future12  = '0001'  where batnbr  = '019262' 


S4Future12
001       



select exportadofn,referenciafn,* from cf_regvtas where numdoc  ='20160828-01-0012922'
UPDATE APTRAN SET SUB = 'CAIQCAF000' WHERE BATNBR  ='018822' AND  sub ='0000000000'  and  acct ='951401'
UPDATE GLTRAN SET SUB  = 'CAIQCAF000' WHERE BATNBR ='018822' AND MODULE ='AP' AND  SUB ='0000000000' and  acct ='951401'


*/


SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='001173'
SELECT perpost,rlsed,DOCDATE,refnbr,sub,* FROM APDOC  where batnbr ='001173'  --and refnbr like '%593%'
SELECT perpost,rlsed,sub,refnbr,sub,* FROM APTRAN  where batnbr ='001173'
SELECT perpost,rlsed,sub,refnbr,SUB,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='001173'  
SELECT * from apadjust where adjbatnbr ='001173'
SELECT * from xapdettran where batnbr ='001173'


0000000RE000            
UPDATE gltran SET SUB  = '0000000RE000' WHERE BATNBR = '001173' AND MODULE = 'AP'  AND SUB ='000000000000'  
UPDATE apdoc SET SUB  = '0000000RE000' WHERE BATNBR = '001173' AND SUB ='000000000000'  
UPDATE aptran SET SUB  = '0000000RE000' WHERE BATNBR = '001173'  AND SUB ='000000000000'  
UPDATE APADJUST SET ADJGSUB ='0000000RE000' WHERE ADJBATNBR ='001173' AND ADJGSUB  ='000000000000'

000000000000            
/*


select * from batch where batnbr ='004535' and module  ='GL' 
select batnbr,refnbr,acct,SUB,cramt,curycramt,dramt,curydramt,trantype,jrnltype,* from gltran  where BATNBR= '004535' and module ='GL'



UPDATE APTRAN SET SUB ='0000000000' WHERE BATNBR  ='007840' AND  sub ='CATACAF000' AND ACCT  ='943104'
UPDATE GLTRAN SET SUB  = '0000000000' WHERE BATNBR ='007840' AND MODULE ='AP' AND  SUB ='CATACAF000'AND  ACCT  ='943104'
UPDATE GLTRAN SET SUB  = 'CACHCAF000' WHERE BATNBR ='004535' AND MODULE ='GL' AND  SUB ='CACH000000' and acct  ='947101' and cramt  =750


--UPDATE APDOC SET DOCDATE  ='2015-09-30' WHERE BATNBR ='000'
--
------ CAMBIAR CUENTA

Laison,
Cambiar CC de CATUMAR000 por CATUEMB000
Tengo que presentar un reporte a gerencia.
SLS.
 
/*
UPDATE gltran SET ACCT  = '955201' WHERE BATNBR = '005768' AND MODULE = 'AP'  AND ACCT ='955301'  
UPDATE apdoc SET ACCT  = '955201' WHERE BATNBR = '005768'  AND ACCT ='955301'  
UPDATE aptran SET ACCT  = '955201' WHERE BATNBR = '005768'  AND ACCT ='955301'  
*/

select  * from apadjust 
-- CAMBIAR GLOSA  -----
/*
UPDATE aptran SET trandesc ='01/2016,02/2016 ALQUILER FIJO' WHERE BATNBR = '005768'  AND ACCT ='955201'  
UPDATE gltran SET trandesc ='01/2016,02/2016 ALQUILER FIJO' WHERE BATNBR = '005768' and module ='ap' AND ACCT ='955201'  
*/

-- CAMBIAR SUB CUENTA IGV (401110) POR RETAIL

CATUMAR000 por CATUEMB000
--UPDATE APTRAN SET SUB ='CATUEMB000' WHERE BATNBR  ='001683' AND  sub ='CATUMAR000'
--UPDATE GLTRAN SET SUB  = 'CATUEMB000' WHERE BATNBR ='001683' AND MODULE ='AP' AND  SUB ='CATUMAR000'
 
select perpost,status,rlsed,* from batch where  MODULE  = 'AP' AND batnbr ='007949' 
SELECT perpost,rlsed,sub,* FROM APTRAN  where batnbr ='007949'
SELECT perpost,rlsed,* FROM GLTRAN WHERE MODULE ='AP' AND BATNBR ='007950'  
SELECT * FROM APADJUST  where ADJbatnbr = '007949'
---REGULARIZAR CHEQUES DE SALDOS DIARIOS  ( VERIFICAR CENTRO DE COSTO 00000 CON CUENTA 421213)
--UPDATE APDOC SET SUB = 'CATUCAF000' WHERE BATNBR  ='007950' 
---- SE VERIFICA SUB POR CUENTA 
UPDATE APDOC SET cashSUB = 'CATUCAF000' WHERE BATNBR  ='007950' --AND acct not in ('401110','421213')  
UPDATE APTRAN SET SUB = 'CATUCAF000' WHERE BATNBR  ='007950' and  acct  in ('101000')
---- SE VERIFICA SUB POR CUENTA 
UPDATE GLTRAN SET SUB  = 'CATUCAF000' WHERE BATNBR ='007950' AND MODULE ='AP' and acct  IN ('101000')
--UPDATE GLTRAN SET SUB  = '0000000000' WHERE BATNBR ='005188' AND MODULE ='AP' AND ACCT ='421213' 
--UPDATE APADJUST SET ADJGSUB ='CATUCAF000' WHERE ADJBATNBR ='007950'

