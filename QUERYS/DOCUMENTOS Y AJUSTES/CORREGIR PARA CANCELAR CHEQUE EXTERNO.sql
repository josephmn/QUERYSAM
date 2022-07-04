
SELECT perpost,rlsed,DOCDATE,opendoc,* FROM APDOC  where batnbr ='028155'--correcto
SELECT perpost,rlsed,DOCDATE,opendoc,* FROM APDOC  where batnbr ='028174'--observado

update apdoc set applyamt = 0 ,applyrefnbr ='',curydocbal =78.65,docbal =78.65,opendoc =0
where batnbr ='014243' and refnbr ='008844'

UPDATE apdoc SET opendoc  = 1 WHERE BATNBR  ='028155'



use  [ca2016sys]
go


delete from custom2 where entityid ='MFSERCAN'


update apdoc set docbal =986.55,curydocbal =986.55
where batnbr ='004958' and refnbr ='003600'


SELECT perpost,rlsed,trandate,* FROM aptran  where batnbr ='022901'--correcto
SELECT perpost,rlsed,trandate,* FROM aptran  where batnbr ='022917'--observado

--- NO SE VERIFICÓ CAMBIOS PARA APTRAN


SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP' AND batnbr ='014245'  
SELECT perpost,rlsed,DOCDATE,* FROM APDOC  where batnbr ='014243'  --and refnbr like '%593%'
SELECT perpost,rlsed,* FROM APTRAN  where batnbr ='014243'
SELECT perpost,rlsed,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='014243'  
SELECT * from apadjust where adjbatnbr ='014243'