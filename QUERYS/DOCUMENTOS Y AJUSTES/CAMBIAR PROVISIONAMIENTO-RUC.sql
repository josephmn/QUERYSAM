------------------------------------------------------------------------------
-- PROVISIONAMIENTO 

------------------------------------------------------------------------------


-- 1 CAMBIAR OC 
declare @RUC varchar(11)
set @RUC  = '20564347982'
  Select VENDID,VENDNAME,*
  --UPDATE P SET VENDID ='20564347982' , VENDNAME ='SUPERMERCADO LA CANASTA E.I.R.' 
   from PurchOrd  P where PONbr LIKE '000502' 
   
-- 2 CAMBIAR RCPT         
select *  from batch where batnbr ='011434' and module  ='po'
select *  from poreceipt where batnbr ='011434'

select VENDID,* 
--update P SET VENDID ='20564347982'
 FROM POTRAN P where batnbr ='011464'
 

select ID,* 
--UPDATE G SET ID = '20564347982'
FROM gltran G where refnbr in (select rcptnbr from poreceipt where batnbr ='011464')  and module ='po'
           

--- 3 CAMBIAR DOCUMENTO Y AJUSTES

--SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP'  AND batnbr ='001739'  

SELECT perpost,rlsed,DOCDATE,refnbr,VENDID,*
--UPDATE A SET VENDID ='20564347982'
 FROM APDOC  A  where batnbr ='001739' 
 

SELECT perpost,rlsed,refnbr,* 
--UPDATE A SET VENDID ='20564347982'
FROM APTRAN A where batnbr ='001739'

SELECT perpost,rlsed,refnbr,* 
--UPDATE A SET ID ='20564347982'
FROM GLTRAN A WHERE MODULE ='AP'  AND BATNBR ='001739'  

/*
SELECT * from apadjust where adjbatnbr ='001739'
select * from xapdettran where batnbr ='001739'   
*/

   
--- 4 CORREGIR VEND EN CHEQUE MANUAL


SELECT perpost,rlsed,DOCDATE,refnbr,VENDID,*
--UPDATE A SET VENDID ='20564347982'
 FROM APDOC  A  where batnbr ='001740' 
 

SELECT perpost,rlsed,refnbr,* 
--UPDATE A SET VENDID ='20564347982'
FROM APTRAN A where batnbr ='001740'

SELECT perpost,rlsed,refnbr,* 
--UPDATE A SET ID ='20564347982'
FROM GLTRAN A WHERE MODULE ='AP'  AND BATNBR ='001740'  


SELECT VENDID,*
--UPDATE A SET VENDID ='20564347982'
 from apadjust A where adjbatnbr ='001740'



   
   
   




 






