


DECLARE  @lote VARCHAR(6)  
DECLARE @trandate datetime
declare @tot float

DECLARE cClientes CURSOR FOR
   SELECT distinct  batnbr,trandate ,SUM(curytranamt)tot FROM CATRAN WHERE  PERPOST ='201610' AND BATNBR NOT IN 
    (SELECT BATNBR FROM BATCH WHERE MODULE ='CA') and acct ='101000' --and batnbr  ='022054'
    group by batnbr,trandate 

OPEN cClientes 
FETCH cClientes INTO @lote,@trandate,@tot
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin 	  
	INSERT INTO BATCH (
	Acct ,AutoRev, AutoRevCopy ,BalanceType, BankAcct  , BankSub    ,BaseCuryID, BatNbr ,    BatType ,clearamt   ,Cleared, CpnyID ,Crtd_DateTime ,Crtd_Prog ,Crtd_User,CrTot,
	CtrlTot ,CuryCrTot  ,CuryCtrlTot ,CuryDepositAmt ,CuryDrTot,CuryEffDate ,CuryId ,CuryMultDiv ,CuryRate  ,CuryRateType, Cycle , DateClr ,DateEnt ,DepositAmt  ,Descr  ,
	DrTot ,EditScrnNbr, GLPostOpt, JrnlType ,LedgerID ,  LUpd_DateTime ,LUpd_Prog, LUpd_User , Module ,NbrCycle, NoteID ,OrigBatNbr, OrigCpnyID ,OrigScrnNbr, PerEnt ,PerPost,
	 Rlsed,  S4Future01 ,S4Future02,S4Future03 ,S4Future04 ,S4Future05 ,S4Future06,S4Future07 ,S4Future08 ,S4Future09 , S4Future10 , S4Future11 ,S4Future12, Status ,Sub  ,
	User1 ,User2,User3 ,User4,User5,User6  ,User7  ,User8    )              
	VALUES 
	('',0,0,'A','','','SOL',@lote,'N',0,0,'COFFEARTS',@trandate,'20020','SYSADMIN' ,@tot,@tot,@tot,@tot,@tot,@tot,@trandate,'SOL','M',1,'ACORD',0,'1900-01-01 00:00:00','1900-01-01 00:00:00',
	@tot,'Cash Management Transfers',@tot,'20020','D','CA','REAL',@trandate,'20020','SYSADMIN','CA',0,0,'','','','201610','201610',1,'','',0,0,0,0,'1900-01-01 00:00:00',
	'1900-01-01 00:00:00',0,0,'','','P','','','',0,0,'','13','1900-01-01 00:00:00','1900-01-01 00:00:00')	  	  
 end	
FETCH cClientes INTO @lote,@trandate,@tot
END
CLOSE cClientes
DEALLOCATE cClientes
go

SELECT D.BATNBR , D.STATUS , G.BATNBR , G.POSTED
--UPDATE D SET D.STATUS  =G.POSTED
FROM
BATCH D 
INNER JOIN 
(
SELECT DISTINCT BATNBR , POSTED ,MODULE FROM GLTRAN WHERE MODULE ='CA'
)
  G ON D.BATNBR  = G.BATNBR AND D.MODULE  = G.MODULE 
WHERE D.MODULE ='CA' AND D.PERPOST  ='201610'
AND  D.STATUS <> G.POSTED AND D.MODULE ='CA'




select * from cfm_detpago2 where exportadotr not in 
( select batnbr from batch where module ='ca' )
 




 SELECT batnbr, sum( FROM CATRAN WHERE refnbr ='VISA' AND PERPOST ='201610' AND BATNBR NOT IN 
    (SELECT BATNBR FROM BATCH WHERE MODULE ='CA') and acct ='101000'
    group by batnbr,refnbr,perpost,trandate 
    
   select * from catran where batnbr  ='022054' and acct  ='101000' and curyid ='DOL'


--- SE VERIFICA TRANSFERENCIA EN BATCH,CATRAN,GLTRAN (MASTERCARD)---
SELECT status,rlsed,* FROM BATCH WHERE BATNBR ='022054' AND MODULE ='CA'
SELECT tranamt,curytranamt,refnbr,trandate,* FROM CATRAN WHERE BATNBR='022054' 
SELECT posted,* FROM GLTRAN WHERE BATNBR='022054' AND MODULE  ='CA'














