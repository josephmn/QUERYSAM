--------------------------------------------------------------------------------------------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
--------------------------------------------------------------------------------------------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<	

--- BACKUP VS BASE ORIGINAL (GLTRAN)

select 'GL' MODULO, TranDesc, '', BatNbr, RefNbr, CrAmt from GLTran where BatNbr in (
'026265'
) --and TranDesc like '%I213690%' --
--AND Acct = '211101' --AND REFNBR = '07272018'
--ORDER BY TranDesc ASC
union all
select 'BK' MODULO, TranDesc, '', BatNbr, RefNbr, CrAmt from AMCAF2018APP_0708..GLTran where BatNbr in (
'026265'
)




--------------------------------------------------------------------------------------------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
--------------------------------------------------------------------------------------------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

	----DATA DINAMICA PARA GLTRAN VS INTRAN EN MISMA BASE

	SELECT --LineRef, LineNbr, 
	'IN' MODULE, Invtid, TranDesc, ExtCost, --qty, tranamt, 
	PerPost FROM INTRAN WHERE 
	--InvtID   ='I210701' AND 
	--RefNbr  ='07272018' AND 
	BatNbr  ='026403' AND ExtCost > 0
	
	union all

	SELECT --CuryCrAmt, PerPost,
	'GL' MODULE, TranDesc, '', CuryCrAmt,PerPost
	FROM GLTRAN WHERE 
	--TranDesc   ='PASTEL DE ACELGA' AND 
	--RefNbr  ='07272018' AND 
	BatNbr  ='026403' AND CuryCrAmt >0


	------------------------------------------------------------------------------------<<<<<<<
	-- COMPARAR INTRAN VS GLTRAN
	
		SELECT LineRef, LineNbr, 
	'IN' MODULE, Invtid, TranDesc, ExtCost, --qty, tranamt, 
	PerPost FROM INTRAN WHERE 
	InvtID   ='I214035' AND 
	RefNbr  ='I215090' AND BatNbr  ='023508' AND ExtCost > 0 ---2.01
	
	--union all

	SELECT --CuryCrAmt, PerPost,
	'GL' MODULE, TranDesc, '', CuryCrAmt,PerPost
	FROM GLTRAN WHERE 
	TranDesc LIKE '%I214035%' AND 
	RefNbr  ='I215090' AND BatNbr  ='023508' AND CuryCrAmt >0

	----------------------------------------------------------------------------------------<<<<<<<
	
	--- PARA REALIZAR CAMBIOS EN GLTRAN
	
	SELECT * FROM GLTRAN WHERE 
	TranDesc LIKE '%I215090%' AND 
	--RefNbr  ='07202018' AND 
	BatNbr  ='023539'   --AND Acct = '692120' --AND CuryCrAmt >0



	--UPDATE  GLTRAN SET CuryCrAmt = 9.3  , CrAmt = 9.3  WHERE 
	--TranDesc LIKE '%I213690%' AND 
	--RefNbr  ='07272018' AND BatNbr  ='026265'   AND Acct = '211101' --AND CuryCrAmt >0
	

	--DECLARE @BATNBR CHAR(6)
	--DECLARE @PROD VARCHAR(10)
	--DECLARE @REF VARCHAR(10)
	--DECLARE @COSTO FLOAT
	

	--SET @BATNBR = ''
	--SET @PROD = ''
	--SET @REF = ''

	--SET @COSTO = (SELECT CuryCrAmt FROM GLTRAN WHERE TranDesc LIKE @PROD AND BatNbr = @BATNBR AND Acct = '2%')


	--UPDATE  GLTRAN SET CuryDrAmt = 26.24 , DrAmt = 26.24 WHERE TranDesc LIKE '%I215090%' AND 	--RefNbr  ='07202018' AND 
	--BatNbr = '023539' AND Acct = '695201'


I215090

023539	07072018

5.24800





