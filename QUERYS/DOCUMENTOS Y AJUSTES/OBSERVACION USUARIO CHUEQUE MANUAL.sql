
/*

SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='011976'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where batnbr ='011976'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='011976'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='011976'  
SELECT * from apadjust where adjbatnbr ='011976'
select * from xapdettran where batnbr ='011976'



update BATCH SET   Crtd_User ='ATTOVMEN',   LUpd_User ='ATTOVMEN'  WHERE BATNBR  ='011976' AND MODULE  ='AP'
update APDOC SET   Crtd_User ='ATTOVMEN',   LUpd_User ='ATTOVMEN'  WHERE BATNBR  ='011976' 
update APTRAN SET  Crtd_User ='ATTOVMEN',   LUpd_User ='ATTOVMEN' WHERE BATNBR  ='011976'   
update GLTRAN SET  Crtd_User ='ATTOVMEN',   LUpd_User ='ATTOVMEN' WHERE BATNBR  ='011976'   AND MODULE  ='AP'
UPDATE APADJUST SET Crtd_User ='ATTOVMEN',   LUpd_User ='ATTOVMEN' WHERE ADJBATNBR ='011976'



*/