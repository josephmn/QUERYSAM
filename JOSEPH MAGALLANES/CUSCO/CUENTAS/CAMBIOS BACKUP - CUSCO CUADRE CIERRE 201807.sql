
--'25461',
--'26265',
--'26784'

/****************** INTRAN VS GLTRAN ********************/

select TranType, InvtID, TranDesc, BatNbr, RefNbr, KitID, UnitPrice, qty, TranAmt, round((UnitPrice *qty),2) cal, (TranAmt - round((UnitPrice *qty),2)) dif, ExtCost, InvtID, JrnlType, PerPost, SiteID 
from INTran A where BatNbr in (
'026403'
) --And InvtID = 'I213690' --
--AND TranType = 'CG' 
AND InvtID LIKE  '%I212932%'
ORDER BY A.InvtID ASC

--026265
--026403
--026784


select Acct ,TranType, BatNbr, RefNbr, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, PerPost from GLTran where BatNbr in (
'026403'
) --and TranDesc like '%I213690%' --
--AND Acct = '211101' 
AND TranDesc LIKE '%I212932%'
ORDER BY TranDesc ASC


select TranType, InvtID, TranDesc, BatNbr, RefNbr, KitID, UnitPrice, qty, TranAmt, round((UnitPrice *qty),2) cal, (TranAmt - round((UnitPrice *qty),2)) dif, ExtCost, InvtID, JrnlType, PerPost, SiteID 
from AMCAF2018APP_0708..INTran A where BatNbr in (
'026403'
) --And InvtID = 'I213690' --
--AND TranType = 'CG' 
AND InvtID LIKE  '%I212932%'
ORDER BY A.InvtID ASC

select Acct ,TranType, BatNbr, RefNbr, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, PerPost from AMCAF2018APP_0708..GLTran where BatNbr in (
'026403'
) --and TranDesc like '%I213690%' --
--AND Acct = '211101' 
AND TranDesc LIKE '%I212932%'
ORDER BY TranDesc ASC




/*********** VALIDAR ERROR CON BACKUP ************/

SELECT *, SS.UnitPrice - X.F FROM (
select InvtID, TranDesc, O.BatNbr, RefNbr, UnitPrice, qty, TranAmt 
from INTran O where BatNbr in (
'025461')) SS
--AND InvtID = 'I213671'

INNER JOIN (
select InvtID A , TranDesc B , BatNbr C, RefNbr D, UnitPrice F, qty G, TranAmt H
from AMCAF2018APP_0708..INTran where BatNbr in (
'025461') ) X ON SS.InvtID = X.A AND SS.BatNbr = X.C
--AND InvtID = 'I213671'

--------- INTRAN
select InvtID, TranDesc, O.BatNbr, RefNbr, UnitPrice, qty, TranAmt 
from INTran O where BatNbr in (
'025461')
AND InvtID = 'I212932'

select InvtID A , TranDesc B , BatNbr C, RefNbr D, UnitPrice F, qty G, TranAmt H
from AMCAF2018APP_0708..INTran where BatNbr in (
'025461') AND TranDesc LIKE '%I212932%'

--------- GLTRAN

select 'GL' MODULO, TranDesc, '', BatNbr, RefNbr, CrAmt from GLTran where BatNbr in (
'026265'
) --and TranDesc like '%I213690%' --
--AND Acct = '211101' --AND REFNBR = '07272018'
--ORDER BY TranDesc ASC
union all
select 'BK' MODULO, TranDesc, '', BatNbr, RefNbr, CrAmt from AMCAF2018APP_0708..GLTran where BatNbr in (
'026265'
)
 --and TranDesc like '%I213690%' --
--AND Acct = '211101' --AND REFNBR = '07272018'
--ORDER BY TranDesc ASC

--025461
--026265

/******* REALIZAR EL CAMBIO SEGUN INFO CORRECTA *********/

--UPDATE INTran SET 
----ExtCost = '18.55'
--TranAmt = '26.52', UnitPrice = '26.52'
--where BatNbr in (
--'026403') 
--AND InvtID = 'I213671' AND DrCr = 'D'



/***************** MODIFICAR EN GLTRAN ************************/


--select Acct ,TranType, BatNbr, RefNbr, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, PerPost from GLTran where BatNbr in (
--'026403'
--) and TranDesc like '%I213671%' AND Acct = '692120'

--select Acct ,TranType, BatNbr, RefNbr, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, PerPost from GLTran where BatNbr in (
--'026403'
--) and TranDesc like '%I213671%' AND Acct = '211101'

--UPDATE GLTran SET CrAmt = '95.85', CuryCrAmt = '95.85'
--where BatNbr in (
--'026784'
--) and TranDesc like '%I213690%' AND Acct = '211101'


select Acct ,TranType, BatNbr, RefNbr, TranDesc, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, PerPost from GLTran where BatNbr in (
--'025461',
--'026265',
'026784'
) and TranDesc like '%I212932%'



/****** A DATA DINAMICA ******/

select 'IN' MODULO, InvtID, TranDesc, BatNbr, RefNbr, TranAmt
from INTran A where BatNbr in (
'026265'
) --And InvtID = 'I213690' --
AND TranType = 'CG' --AND REFNBR = '07272018'
AND Acct = '701110'
--ORDER BY A.InvtID ASC

--026265
--026403
--026784
UNION

select 'GL' MODULO, TranDesc, '', BatNbr, RefNbr, CrAmt from GLTran where BatNbr in (
'026265'
) --and TranDesc like '%I213690%' --
AND Acct = '211101' --AND REFNBR = '07272018'
--ORDER BY TranDesc ASC
