
---------|| CAMBIAR CUENTA CXP ||-------------------------------------------------------
SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='003026'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,docbal,curydocbal,* FROM APDOC  where batnbr ='003025' -- and refnbr like '%000199%'
SELECT perpost,rlsed,refnbr,sub,tranamt,curytranamt,* FROM APTRAN  where batnbr ='003025'   --and refnbr like '%001332%'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='003025' -- and refnbr like '%001332%'
SELECT * from apadjust where adjbatnbr ='003025'
select * from xapdettran where batnbr ='003025'
/*

UPDATE gltran SET ACCT  ='104110' WHERE BATNBR = '003025' AND MODULE = 'AP'  AND ACCT ='104104' 
UPDATE aptran SET ACCT  ='104110' WHERE BATNBR = '003025' AND ACCT ='104104' 
UPDATE apdoc SET ACCT  ='104110' WHERE BATNBR  = '003025'  AND ACCT ='104104'
UPDATE APAdjust SET AdjgAcct  ='104110' WHERE  AdjBatNbr  ='003025'  
----------------------------------------------------------------------------------------
001856

999999

401140

*/

    
    

SELECT BatNbr, RefNbr, * FROM gltran WHERE BATNBR = '000395' AND MODULE = 'AP'  AND ACCT ='424101' --AND RefNbr IN ('001285','001286','001287','001288','001289')
SELECT BatNbr, RefNbr, * FROM aptran WHERE BATNBR = '000395' AND ACCT ='424101'  --AND RefNbr IN ('001285','001286','001287','001288','001289')
SELECT BatNbr, RefNbr, * FROM apdoc WHERE BATNBR  = '000395'  AND ACCT ='424101' --AND RefNbr IN ('001285','001286','001287','001288','001289')
--SELECT * FROM APAdjust WHERE  AdjBatNbr  ='000363'  

/*
UPDATE gltran SET ACCT ='421101' WHERE BATNBR = '000395' AND MODULE = 'AP'  AND ACCT ='424101' --AND RefNbr IN ('001214','001215')
UPDATE aptran SET ACCT ='421101' WHERE BATNBR = '000395' AND ACCT ='424101' -- AND RefNbr IN ('001214','001215')
UPDATE apdoc SET ACCT ='421101' WHERE BATNBR  = '000395'  AND ACCT ='424101' --AND RefNbr IN ('001214','001215')
*/



