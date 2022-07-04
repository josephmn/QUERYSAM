

select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * from intran where batnbr = '031153' --and invtid = 'I216669'
select TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- update t set DrAmt = 1, CuryDrAmt = 1
from GLTran t where batnbr = '031153' and TranDesc like '%TAMAL DE ALCACHOFA            %'-- and LineRef = '00035'


select * from INTran where RefNbr = '11109181' and BatNbr = '031226'


select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * from intran where invtid = 'I210130' AND PERPOST = '201809' AND TRANTYPE = 'IN'
select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * from intran A where invtid = 'I280002' AND PERPOST = '201809' AND TRANTYPE = 'CG'
AND SiteID = 'CFCUSCO2' --AND UnitPrice > = 400
ORDER BY A.BatNbr ASC



select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * from intran where invtid = 'I250204' AND TRANTYPE = 'AJ' AND PERPOST = '201809' 
AND SiteID = 'CFCUSCO2'

select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * from intran A where invtid = 'I280002' AND TRANTYPE = 'AS' AND PERPOST = '201809' 
AND SiteID = 'CFCUSCO2' --AND UnitPrice > = 400
ORDER BY A.BatNbr ASC



  
--032234 i213436
--032305 i213436
--032376 i213436
--032443 i213436
--033451 i213436
--033652 i213436

--031972
--033597



select  BatNbr, RefNbr, PerPost, SITEID, InvtAcct, InvtID, TranDesc, TranDate, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
-- update a set lineref = '00010'
from intran A where batnbr = '031213' AND RefNbr = '00000097' --AND InvtAcct = '251101' ORDER BY A.TranDesc ASC
AND TranType = 'TR' ORDER BY LineNbr ASC 

select  BatNbr, RefNbr, PerPost, SITEID, InvtAcct, InvtID, TranDesc, TranDate, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
-- update a set lineref = '00010'
from intran A where batnbr = '031213' AND RefNbr = '00000097' --AND InvtAcct = '251101' ORDER BY A.TranDesc ASC
AND TranType = 'CT' ORDER BY LineNbr ASC 

select BatNbr, RefNbr, PerPost, '', ACCT, TranDesc, TranDate, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
from GLTran A where batnbr = '031213' AND RefNbr = '00000097'  --AND Acct = '251101' ORDER BY A.TranDesc ASC


-- 031213


select  BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
-- DELETE
from intran where batnbr = '031540' AND RefNbr = 'AI00000515' AND InvtID IN ('I210905')


--- INSERT A GLTRAN

INSERT INTO GLTran 
(Acct, AppliedDate, BalanceType, BaseCuryID, BatNbr, CpnyID, CrAmt, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt, CuryDrAmt, CuryEffDate, CuryId, 
CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, Labor_Class_Cd, LedgerID, LineId, LineNbr, 
LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, 
Posted, ProjectID, Qty, RefNbr, RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
S4Future09, S4Future10, S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, TranDesc, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8)

SELECT 
Acct, AppliedDate, BalanceType, BaseCuryID, BatNbr, CpnyID, '5.75', Crtd_DateTime, Crtd_Prog, Crtd_User, '5.75', CuryDrAmt, CuryEffDate, CuryId, 
CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, Labor_Class_Cd, LedgerID, (SELECT min(LineId)-1 FROM GLTran), '6', 
'00006', LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, 
Posted, ProjectID, '0.25', RefNbr, RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
S4Future09, S4Future10, S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, 'I250171', TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8 
FROM GLTran WHERE batnbr = '033597' AND RefNbr = 'I219062' AND TranDesc = 'I250174'

select  BatNbr, RefNbr, PerPost, SITEID, InvtAcct, InvtID, TranDesc, TranDate, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
from intran A where batnbr = '033597' AND RefNbr = 'I219062' --AND InvtAcct = '251101' ORDER BY A.TranDesc ASC
AND TranType = 'AS'
SELECT * FROM GLTran WHERE batnbr = '033597' AND RefNbr = 'I219062'

--(SELECT min(LineId)-1 FROM GLTran)

---INSERT Account INTRAN
     
INSERT INTO INTran 
(Acct, AcctDist, ARLineID, ARLineRef, BatNbr, BMICuryID, BMIEffDate, BMIExtCost, BMIMultDiv, BMIRate, BMIRtTp, BMITranAmt, BMIUnitPrice, CmmnPct, 
CnvFact, COGSAcct, COGSSub, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DrCr, Excpt, ExtCost, ExtRefNbr, FiscYr, ID, InsuffQty, InvtAcct, 
InvtID, InvtMult, InvtSub, JrnlType, KitID, LineRef, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, OvrhdAmt, OvrhdFlag, 
PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, ProjectID, Qty, QtyUnCosted, RcptDate, RcptNbr, ReasonCd, RefNbr, Rlsed, S4Future01, S4Future02, 
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShortQty, SiteID, SlsperID, 
SpecificCostID, Sub, TaskID, ToSiteID, ToWhseLoc, TranAmt, TranDate, TranDesc, TranType, UnitDesc, UnitMultDiv, UnitPrice, User1, User2, User3, User4, 
User5, User6, User7, User8, WhseLoc)

select 
Acct, AcctDist, ARLineID, ARLineRef, BatNbr, BMICuryID, BMIEffDate, BMIExtCost, BMIMultDiv, BMIRate, BMIRtTp, BMITranAmt, BMIUnitPrice, CmmnPct, 
CnvFact, COGSAcct, COGSSub, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DrCr, Excpt, '5.92', ExtRefNbr, FiscYr, ID, InsuffQty, InvtAcct, 
'I253333', InvtMult, InvtSub, JrnlType, KitID, '00001', LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, OvrhdAmt, OvrhdFlag, 
PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, ProjectID, '0.6', QtyUnCosted, RcptDate, RcptNbr, ReasonCd, RefNbr, Rlsed, S4Future01, S4Future02, 
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShortQty, SiteID, SlsperID, 
SpecificCostID, Sub, TaskID, ToSiteID, ToWhseLoc, '5.92', TranDate, 'PULLPA SURTIDO EN TROZO (PAPAY', TranType, 'KG', UnitMultDiv, UnitPrice, User1, User2, User3, User4, 
User5, User6, User7, User8, WhseLoc
from intran where batnbr = '031213' AND RefNbr LIKE '%97' AND InvtAcct = '251101' and InvtID = 'I250043' AND TranType = 'TR'


select  BatNbr, RefNbr, PerPost, SITEID, InvtAcct, InvtID, TranDesc, TranDate, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, * 
from intran A where batnbr = '031213' AND RefNbr LIKE '%97' AND InvtAcct = '251101' AND InvtID IN ('I250043','I253333')

SELECT * FROM INTRAN WHERE InvtID IN ('I250043','I253333') AND TranType = 'TR' AND PerPost = '201809'
     

select * from intran where batnbr = '031213' AND RefNbr LIKE '%97' AND InvtAcct = '251101' and InvtID = 'I250043' and TranType = 'TR'
select * from intran where batnbr = '031213' AND RefNbr LIKE '%97' AND InvtAcct = '251101' and InvtID = 'I250043' and TranType = 'CT'





--BATNBR = '032514'
select TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * from GLTran t where batnbr = '032514'


--TRANSFERENCIA
--EXEC ACTU_COST_TR '007214','I250442',3.336405


--AJUSTE
--EXEC ACTU_COST_SI '031224','I256055', 0.7335712702702703

EXEC ACTU_COST_SI '031215','I250017',1.696
EXEC ACTU_COST_SI '031234','I250017',1.696
EXEC ACTU_COST_SI '031443','I250017',1.696

1.696


--ENSAMBLE
--EXEC ACTU_COST_KIT '034802','I216665', 1.3


--VENTA
--EXEC ACTU_COST_venta '031642','09012018','I213436', 2.6409



select TranDate,* 
-- update t set trandate = '2018-09-30'
from INTran t where BatNbr = '034850'

select * 
-- update t set trandate = '2018-09-30'
from GLTran t where BatNbr = '034850' and Module = 'IN'


SELECT * 
-- DELETE
FROM INTRAN WHERE BATNBR IN (
'034834'
) AND PERPOST = '201809'


SELECT * 
-- DELETE
FROM GLTRAN WHERE BATNBR IN (
'034834'
) AND PERPOST = '201809' AND Module = 'IN'

SELECT *
-- DELETE 
FROM BATCH WHERE BATNBR IN (
'034834'
) AND MODULE = 'IN'






--SELECT Qty, * FROM INTran WHERE BatNbr IN (
--'033828',    
--'033946',    
--'034060',    
--'034133',    
--'034202',    
--'034275',    
--'034416',    
--'034554',    
--'034619',    
--'034774' 
--) AND InvtID = 'I216669' AND TranType = 'AS'

