

--I280001
--027273	I280001
--027359	I280001
--027645	I280001
--027790	I280001
--027996	I280001

--4.97000


--TRANSFERENCIA
--ACTU_COST_TR '007214','I250442',3.336405


--AJUSTE
--ACTU_COST_SI '011674','I250166', 16.50

--ENSAMBLE
--EXEC ACTU_COST_KIT '027996','I280001', '4.9700'


SELECT TranDate, * 
-- UPDATE T SET TranDate = '2018-09-30'
FROM INTran T WHERE BatNbr = '034812'


SELECT TranDate, * 
-- UPDATE T SET TranDate = '2018-09-30'
FROM GLTran T WHERE BatNbr = '034812'


  --I240137  2.596

--VENTA
--ACTU_COST_venta '028083','08082018','I210133', 3.473333

--027276 08032018

/*
SELECT *--'EXEC ACTU_COST_KIT',BatNbr,InvtID,'3.1707' 
FROM INTran a WHERE --KitID  <> '' 
--AND InvtID  ='I250006' 
 PERPOST  = '201808' 
AND TranDesc LIKE '%I280001%'
AND BATNBR  >'026098' 
AND UnitPrice = 500
ORDER BY a.BatNbr ASC 
*/


--ACTU_COST_KIT '026202','I250006',3.1707

--EXEC ACTU_COST_KIT '026203','I250006','3.1707'

--AJUSTE
--ACTU_COST_SI '028646','I250051', 46.222222


--ENSAMBLE
--EXEC ACTU_COST_KIT '028921','I219111', '0.034272'

028564
028920

I300006

0.0001


SELECT InvtID, SiteID, AvgCost, LastCost, QtyAvail, QtyOnHand, QtyInTransit, TotCost, * FROM ItemSite WHERE Invtid = 'I250051'
SELECT InvtID, siteid, QtyOnHand, * FROM Location WHERE invtid = 'I250051'

select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * from intran where batnbr = '028646' and invtid = 'I250051'

select TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- update t set DrAmt = 1, CuryDrAmt = 1
from GLTran t where batnbr = '028646' and TranDesc like '%LECHE CONDENSADA 395GR X 24 UN%'-- and LineRef = '00035'

/*

SELECT BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * FROM INTran WHERE BatNbr = '023664' and RefNbr = '07062018' and InvtID = 'I250619'

SELECT BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, LineID, LineNbr, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
-- UPDATE T SET UnitPrice = '7.67', tranamt = '-7.67', extcost = '-7.67'
FROM INTran T
WHERE BatNbr = '028647' and RefNbr = 'AI00000612' and InvtID = 'I250619'

SELECT LineId, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
--update t set 
--CrAmt = (case when CrAmt = 0 then 0 else round((qty*7.68),2) end),
--CuryCrAmt = (case when CuryCrAmt = 0 then 0 else round((qty*7.68),2) end)	,
--DrAmt = (case when DrAmt = 0 then 0 else round((qty*7.68),2) end),
--CuryDrAmt = (case when CuryDrAmt = 0 then 0 else round((qty*7.68),2) end)
FROM GLTran t WHERE BatNbr = '028647' AND TranDesc LIKE '%CERVEZA ARTESANAL CANDELARIA 3%' and LineRef in ('00019','00020')

select * from gltran where lineid  = '-32773'

---32773
---32774

--insert into GLTran 
--(Acct, AppliedDate, BalanceType, BaseCuryID, BatNbr, CpnyID, CrAmt, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt, CuryDrAmt, 
--CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, 
--Labor_Class_Cd, LedgerID, LineId, LineNbr, LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, 
--OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, ProjectID, Qty, RefNbr, RevEntryOption, Rlsed, S4Future01, 
--S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, 
--ServiceDate, Sub, TaskID, TranDate, TranDesc, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8)

--SELECT Acct, AppliedDate, BalanceType, BaseCuryID, BatNbr, CpnyID, 0, Crtd_DateTime, Crtd_Prog, Crtd_User, 0, '7.68', 
--CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, '768', EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, 
--Labor_Class_Cd, LedgerID, LineId, '20', '00020', LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, 
--OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, ProjectID, Qty, RefNbr, RevEntryOption, Rlsed, S4Future01, 
--S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, 
--ServiceDate, Sub, TaskID, TranDate, TranDesc, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8
--FROM GLTran t WHERE BatNbr = '028647' AND TranDesc LIKE '%CERVEZA ARTESANAL CANDELARIA 3%' and LineRef in ('00006') --,'00006')


--select lineid, * 
---- update G set lineid = '-32774'
--from GLTran G WHERE BatNbr = '028647' AND TranDesc LIKE '%CERVEZA ARTESANAL CANDELARIA 3%' and LineRef in ('00020') --,'00020') 
*/