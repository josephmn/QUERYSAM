
/**** CAMBIO DE PERIODO ****/

SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'IN'  AND batnbr IN ('000001','000004','000009')

--SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='000001'  --and refnbr like '%593%'

--SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='000001'
SELECT perpost,rlsed,refnbr,FiscYr, * FROM GLTRAN WHERE MODULE ='IN'  AND BATNBR IN ('000001','000004','000009')
SELECT BatNbr, PerPost, FiscYr, * FROM INTran WHERE batnbr IN ('000001','000004','000009')

--BEGIN TRAN
--UPDATE GLTRAN
--SET FiscYr  = '2017' WHERE MODULE ='IN'  AND BATNBR IN ('000001','000004','000009')
--COMMIT


--UPDATE INTran 
--PerPost = '201712'

--FiscYr
--2018

SELECT * FROM Batch WHERE BatNbr = '013918' AND MODULE