
--SELECT perpost,status,rlsed,sub,* from batch where MODULE  = 'GL'  AND batnbr ='000101'  
--SELECT perpost,rlsed,doctype,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,opendoc,* FROM APDOC  where batnbr ='000101'  --and refnbr like '%593%'
--SELECT perpost,rlsed,refnbr,sub,tranamt,FiscYr ,* FROM APTRAN  where batnbr ='000101'
--SELECT perpost,rlsed,refnbr,FiscYr ,* FROM GLTRAN WHERE MODULE ='GL'  AND BATNBR ='000101'

SELECT * FROM Batch WHERE BatNbr = '000101' and Module = 'GL'

SELECT module, perpost, FiscYr, * FROM GLTRAN WHERE BatNbr = '000402' and Module = 'AP' 

--AND 

SELECT * FROM APDOC WHERE RefNbr = '001529'



--update GLTRAN
--set FiscYr = '2017'
--WHERE BatNbr = '000402' and Module = 'AP'


