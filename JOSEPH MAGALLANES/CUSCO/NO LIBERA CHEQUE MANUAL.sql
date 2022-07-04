
/***** CASO NO LIBERA CHEQUE MANUAL ******/

SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='001327'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,opendoc,* FROM APDOC  where batnbr ='001327'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='001327'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='001327'  
SELECT * from apadjust where adjbatnbr ='001327'
select * from xapdettran where batnbr ='001327'


---DELETE NO TIENE COMPANY, MONEDA, CURYTAX
