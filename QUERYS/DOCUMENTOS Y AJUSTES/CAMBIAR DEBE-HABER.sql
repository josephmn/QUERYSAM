






-- VERIFICAR CAMBIO DE MONTO SEGUN APTRAN -- 
select BATNBR,tranamt,curytranamt,trantype,* from aptran  where BATNBR= '003885' 

and batnbr in (select batnbr from batch where batnbr ='003885' and status  ='P')
select batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,* from gltran  where BATNBR= '003446' and module ='GL' 





-- PROCESO PARA EDITAR GLTRAN CON MONTOS A CAMBIAR
declare @batnbr char(6)
declare @monto float
set @batnbr ='003446' -- LOTE 
set @monto =0.05 --MONTO A CAMBIAR
update gltran set cramt = @monto,curycramt =@monto,dramt=0,curydramt=0 
where batnbr = @batnbr and acct='632107' and module ='GL' AND DRAMT  = -0.05



declare @batnbr char(6)
declare @monto float
set @batnbr ='003446' -- LOTE 
set @monto =0.05 --MONTO A CAMBIAR
update gltran set dramt = @monto,curydramt =@monto,cramt=0,curycramt=0 
where batnbr = @batnbr and acct='791101' and module ='GL' AND cRAMT  = -0.05









update gltran set dramt=-0.01,curydramt=-0.01 ,cramt =0 ,curycramt =0
where batnbr ='006850' and module ='AP' AND ACCT ='759202'


update gltran set cramt = 864.53,curycramt =266.666,dramt=0,curydramt=0 
where batnbr = '000230' and acct='401720' and module ='AP'



----------------------  ( 759101 , 759202 ) ------------------
update gltran set cramt = 0.04,curycramt = 0.04,dramt=0,curydramt=0 
where batnbr = '000293' and acct in ('759101','759202')   and module ='AP'

008378APA


-- VERIFICAR CAMBIO DE MONTO SEGUN APTRAN -- 
select BATNBR,tranamt,curytranamt,trantype,* from aptran  where BATNBR= '008378'
select batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,* from gltran  where BATNBR= '003446' and module ='GL'

632107    
791101    

/*
select cramt,curycramt,dramt,curydramt,*  
--update gltran set cramt = round( dramt * -1,2),curycramt =round (curydramt * -1,2),dramt =0,curydramt =0
--update gltran set dramt = round( cramt * -1,2),curydramt =round (curycramt * -1,2),cramt =0,curycramt =0
from gltran where module ='ap' and perpost ='201603'
and  acct in ('759101','759202') 
*/

select curytranamt,tranamt,* from aptran where acct  in ('759101','759202')  and perpost ='201603' and curytranamt <0 and tranamt <0


    
select AP.BATNBR,AP.ACCT,AP.TRANAMT,AP.CURYTRANAMT,GL.ACCT,GL.CRAMT,GL.CURYCRAMT,GL.DRAMT,GL.CURYDRAMT 
--UPDATE   GL SET GL.CRAMT =DRAMT * -1  , GL.CURYCRAMT =CURYDRAMT * -1   ,GL. DRAMT  = 0 ,GL. CURYDRAMT = 0
from 
APTRAN AP
INNER JOIN GLTRAN GL ON  AP.BATNBR = GL.BATNBR AND AP.ACCT = GL.ACCT AND AP.ACCT IN ('759101','759202','949403','791101','632107','999999','336910')
WHERE GL.MODULE = 'AP'  
AND AP.PERPOST IN ('201611')
AND AP.CURYTRANAMT < 0 AND AP.TRANAMT < 0
AND GL.DRAMT <0 AND CURYDRAMT <0
ORDER BY GL.BATNBR ASC
GO

946401
956401
791101
636401



SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='013134'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,* FROM APDOC  where batnbr ='013134'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,CURYTRANAMT,TRANAMT,* FROM APTRAN  where batnbr ='013134'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='013134'  
SELECT * from apadjust where adjbatnbr ='013134'
select * from xapdettran where batnbr ='013134'



select AP.BATNBR,AP.ACCT,AP.TRANAMT,AP.CURYTRANAMT,GL.ACCT,GL.CRAMT,GL.CURYCRAMT,GL.DRAMT,GL.CURYDRAMT 
-- UPDATE   GL SET GL.DRAMT = GL.CRAMT * -1  , GL.CURYDRAMT =GL.CURYCRAMT * -1   ,GL. CRAMT  = 0 ,GL. CURYCRAMT = 0
from 
APTRAN AP
INNER JOIN GLTRAN GL ON  AP.BATNBR = GL.BATNBR AND AP.ACCT = GL.ACCT AND AP.ACCT IN ('759101','759202','776101','949403','791101','632107','999999','956105','656105','336910')
WHERE GL.MODULE = 'AP'  
AND AP.PERPOST IN ('201611')
AND AP.CURYTRANAMT < 0 AND AP.TRANAMT < 0
AND GL.CRAMT < 0 AND GL.CURYCRAMT <0
ORDER BY GL.BATNBR ASC
GO

956105
656105
--DR
select AP.BATNBR,AP.ACCT,AP.TRANAMT,AP.CURYTRANAMT,GL.ACCT,GL.CRAMT,GL.CURYCRAMT,GL.DRAMT,GL.CURYDRAMT 
-- UPDATE   GL SET GL.CRAMT = GL.DRAMT * -1  , GL.CURYCRAMT =GL.CURYDRAMT * -1   ,GL. DRAMT  = 0 ,GL. CURYDRAMT = 0
from 
APTRAN AP
INNER JOIN GLTRAN GL ON  AP.BATNBR = GL.BATNBR AND AP.ACCT = GL.ACCT AND AP.ACCT IN ('759101','759202','776101','949403','791101','632107','956105','656105','336910')
WHERE GL.MODULE = 'AP'  
AND AP.PERPOST IN ('201611')
AND AP.CURYTRANAMT < 0 AND AP.TRANAMT < 0
AND GL.DRAMT < 0 AND GL.CURYDRAMT <0
ORDER BY GL.BATNBR ASC
GO

946401
946401
946401
946401
956401
956401

------------------------------------------------------------------------

select AP.BATNBR,AP.ACCT,AP.TRANAMT,AP.CURYTRANAMT,GL.ACCT,GL.CRAMT,GL.CURYCRAMT,GL.DRAMT,GL.CURYDRAMT 
--UPDATE   GL SET GL.CRAMT =DRAMT * -1  , GL.CURYCRAMT =CURYDRAMT * -1   ,GL. DRAMT  = 0 ,GL. CURYDRAMT = 0
from 
APTRAN AP
INNER JOIN GLTRAN GL ON  AP.BATNBR = GL.BATNBR  and GL.ACCT in ('401720','421101','421213','421214','949403','791101','632107','946401','956401','956105','656105','336910')
WHERE GL.MODULE = 'AP'  
AND AP.PERPOST IN ('201611')
AND AP.CURYTRANAMT < 0 AND AP.TRANAMT < 0
AND GL.DRAMT <0 AND CURYDRAMT <0
ORDER BY GL.BATNBR ASC
GO


select AP.BATNBR,AP.ACCT,AP.TRANAMT,AP.CURYTRANAMT,GL.ACCT,GL.CRAMT,GL.CURYCRAMT,GL.DRAMT,GL.CURYDRAMT 
-- UPDATE   GL SET GL.DRAMT = CRAMT * -1  , GL.CURYDRAMT =CURYCRAMT * -1   ,GL. CRAMT  = 0 ,GL. CURYCRAMT = 0
from 
APTRAN AP
INNER JOIN GLTRAN GL ON  AP.BATNBR = GL.BATNBR AND AP.ACCT = GL.ACCT AND AP.ACCT IN ('401720','421101','421213','949403','791101','632107','946401','956401','956105','656105','336910')
WHERE GL.MODULE = 'AP'  
AND AP.PERPOST IN ('201611')
AND AP.CURYTRANAMT < 0 AND AP.TRANAMT < 0
AND GL.CRAMT <0 AND CURYCRAMT <0
ORDER BY GL.BATNBR ASC
GO

--- GL TO DR 
select GL.BATNBR , GL.ACCT , GL.DRAMT , GL.CURYDRAMT ,GL.CRAMT,GL.CURYCRAMT 
-- UPDATE   GL SET GL.DRAMT = CRAMT * -1  , GL.CURYDRAMT =CURYCRAMT * -1   ,GL. CRAMT  = 0 ,GL. CURYCRAMT = 0
FROM GLTRAN GL
WHERE GL.MODULE = 'GL'  
AND GL.PERPOST IN ('201612')
AND GL.CRAMT <0 AND CURYCRAMT <0 --AND BATNBR ='008196'
ORDER BY GL.BATNBR ASC


--- GL TO CR 
select GL.BATNBR , GL.ACCT , GL.CRAMT , GL.CURYCRAMT ,GL.DRAMT,GL.CURYDRAMT 
-- UPDATE   GL SET GL.CRAMT = DRAMT * -1  , GL.CURYCRAMT =CURYDRAMT * -1   ,GL. DRAMT  = 0 ,GL. CURYDRAMT = 0
FROM GLTRAN GL
WHERE GL.MODULE = 'GL'  
AND GL.PERPOST IN ('201612')
AND GL.DRAMT <0 AND CURYDRAMT <0
ORDER BY GL.BATNBR ASC


