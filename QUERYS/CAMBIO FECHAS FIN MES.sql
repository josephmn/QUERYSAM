

--- MODULO AR ---
/*
update batch set dateent  ='2016-08-01',crtd_datetime ='2016-08-01' where batnbr ='001652' and module ='ar'

UPDATE ARDOC SET crtd_datetime ='2016-08-01',CURYEFFDATE ='2016-08-01' ,DOCDATE ='2016-08-01' where batnbr ='001652'
--and refnbr ='F670000375'
UPDATE ARTRAN SET crtd_datetime ='2016-08-01',TRANDATE ='2016-08-01' where batnbr ='001652'
--and refnbr ='F670000375'
UPDATE GLTRAN SET crtd_datetime  ='2016-08-01',TRANDATE ='2016-08-01'where batnbr ='001652' and module ='ar'
--and refnbr ='F670000375'
UPDATE ARADJUST SET ADJGDOCDATE ='2016-08-01',DATEAPPL='2016-08-01' WHERE ADJBATNBR ='001652'
--and adjdrefnbr  ='F670000375'

*/
-----------------




--- MODULO AP ---
/*
UPDATE APDOC SET DOCDATE  ='2016-08-31' WHERE BATNBR  ='003613'
UPDATE APTRAN SET TRANDATE  ='2016-08-31' WHERE BATNBR ='003613'
UPDATE GLTRAN SET TRANDATE  ='2016-08-31' WHERE BATNBR  ='003613' AND MODULE ='AP'
update apadjust set adjgdocdate ='2016-08-31',dateappl ='2016-08-31' where adjbatnbr  = '003613'
*/
-----------------



--- MODULO CA ---
/*
UPDATE CATRAN SET TRANDATE  ='2016-08-31' WHERE BATNBR='001518'
UPDATE GLTRAN SET TRANDATE  ='2016-08-31' WHERE BATNBR='001518' AND MODULE ='CA'
*/
-----------------





--- MODULO GL ---
/*
select * from batch where batnbr  ='005172' and module = 'GL'
SELECT cramt,dramt,* FROM GLTRAN WHERE BATNBR ='005172' AND MODULE ='GL'
update gltran set trandate  ='2016-08-31' where batnbr  ='004163' and module  ='GL'
*/


-----------------

036036

--- MODULO IN ---
/*
select perpost,s4future07,status,* from batch where batnbr  ='036036' and module = 'in'
select perent,perpost,trandate,* from intran where batnbr  ='036036' 
select perent,perpost,trandate,* from gltran where batnbr  ='036036' and module = 'in'

update batch set s4future07 ='2016-11-17' where batnbr ='036036' and module = 'in' 
update intran set trandate ='2016-11-17' where batnbr ='036036'
update gltran set trandate ='2016-11-17' where batnbr ='036036' and module = 'in'
*/
-----------------

































