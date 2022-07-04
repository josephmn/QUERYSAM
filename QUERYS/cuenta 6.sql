declare @batnbr varchar(6)

		DECLARE Cur1 CURSOR FOR 


select distinct batnbr from gltran g where acct like '953902%' and acct not like '9999%' and module ='AP' and batnbr not in(
select distinct right(left(trandesc,10),6) from gltran where acct like '6%' and module ='GL' and refnbr = g.refnbr
) and posted ='P' --and batnbr ='000720'


		OPEN Cur1
		FETCH NEXT FROM Cur1 INTO @batnbr
		WHILE ( @@fetch_status <> -1 )
		BEGIN 


BEGIN TRANSACTION -- O solo BEGIN TRAN


BEGIN TRY
declare @Lastbatnbr char(6)
set @Lastbatnbr = (select Lastbatnbr+1 from glsetup)
--select @LastPONbr
set @Lastbatnbr = right('0000'+ rtrim(@Lastbatnbr),6)
select @Lastbatnbr

insert into batch (Acct, AutoRev, AutoRevCopy, BalanceType, BankAcct, BankSub, BaseCuryID, BatNbr, BatType, clearamt, Cleared, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CrTot, 
CtrlTot, CuryCrTot, CuryCtrlTot, CuryDepositAmt, CuryDrTot, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, Cycle, DateClr, DateEnt, DepositAmt,
 Descr, DrTot, EditScrnNbr, GLPostOpt, JrnlType, LedgerID, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NbrCycle, NoteID, OrigBatNbr, OrigCpnyID, OrigScrnNbr,
  PerEnt, PerPost, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, 
  S4Future12, Status, Sub, User1, User2, User3, User4, User5, User6, User7, User8)

select Acct, AutoRev, AutoRevCopy, BalanceType, BankAcct, BankSub, BaseCuryID,@Lastbatnbr BatNbr, BatType, clearamt, Cleared, CpnyID, Crtd_DateTime, Crtd_Prog, 
Crtd_User, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDepositAmt, CuryDrTot, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, Cycle, DateClr, 
DateEnt, DepositAmt, Descr='Doble Asiento, Lote: '+ batnbr , DrTot, EditScrnNbr, GLPostOpt, JrnlType='DA', LedgerID, LUpd_DateTime, LUpd_Prog, LUpd_User, 
Module='GL', NbrCycle, NoteID, OrigBatNbr, OrigCpnyID, OrigScrnNbr, PerEnt, PerPost, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, 
S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Status, Sub, User1, User2, User3, User4, User5, User6, 
User7=Crtd_DateTime, User8=Crtd_DateTime
from batch where batnbr =@batnbr and module ='AP'


select @batnbr 

insert into gltran (Acct, AppliedDate, BalanceType, BaseCuryID, BatNbr, CpnyID, CrAmt, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt, CuryDrAmt, CuryEffDate, 
CuryId, CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, Labor_Class_Cd, LedgerID, LineId, LineNbr, 
LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, 
ProjectID, Qty, RefNbr, RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, 
S4Future10, S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, TranDesc, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8)

select *from (
select (select Acct9 from LAG_LOCAcctDis where acct = g.acct )Acct, AppliedDate, BalanceType, BaseCuryID, @Lastbatnbr BatNbr, CpnyID, CrAmt, 
Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt, CuryDrAmt, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, 
ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType='DA', Labor_Class_Cd, LedgerID, LineId, LineNbr, LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, 
Module='GL', NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, ProjectID, Qty, RefNbr, 
RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, TranDesc='Lot:'+rtrim(batnbr)+' Mod:AP Ref:'+refnbr, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8
from gltran g where  module ='AP' and acct like '9%'  and acct not like '9999%'and batnbr =@batnbr 
union all
select (select Acct9Eqv from LAG_LOCAcctDis where acct = g.acct )Acct, AppliedDate, BalanceType, BaseCuryID, @Lastbatnbr BatNbr, CpnyID, CrAmt=Dramt, 
Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt=CuryDrAmt, CuryDrAmt=CuryCrAmt, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, DrAmt=cramt, EmployeeID, 
ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType='DA', Labor_Class_Cd, LedgerID, LineId, LineNbr=LineNbr+500, LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, 
Module='GL', NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, ProjectID, Qty, RefNbr, 
RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, TranDesc='Lot:'+rtrim(batnbr)+' Mod:AP Ref:'+refnbr, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8
from gltran g where  module ='AP' and acct like '9%' and acct not like '9999%' and batnbr =@batnbr
) x

----select  CrTot,CtrlTot,DrTot,CuryCrTot,CuryCtrlTot,CuryDrTot,CuryRate,CrAmt,DrAmt,CuryCrAmt,CuryDrAmt,CuryId,X.CrAmt,X.DrAmt,*  
update B set CrTot=CrAmt,CtrlTot=CrAmt,DrTot=DrAmt,CuryCrTot=CuryCrAmt,CuryCtrlTot=CuryCrAmt,CuryDrTot=CuryDrAmt
from batch B inner join 
(
select batnbr,sum(CrAmt)CrAmt,sum(DrAmt)DrAmt,sum(CuryCrAmt)CuryCrAmt,sum(CuryDrAmt)CuryDrAmt
from gltran where batnbr =@Lastbatnbr   and module ='GL' --and CuryId ='DOL'
group by batnbr
) X 
on B.batnbr = X.batnbr
where B.batnbr =@Lastbatnbr and B.module ='GL'

update glsetup set  Lastbatnbr =@Lastbatnbr  from glsetup
		
PRINT 'Se genero con exito'
COMMIT TRANSACTION -- O solo COMMIT

END TRY

BEGIN CATCH

/* Hay un error, deshacemos los cambios*/ 

ROLLBACK TRANSACTION -- O solo ROLLBACK

PRINT 'Se ha producido un error!'
print @@error

END CATCH

			FETCH NEXT FROM Cur1 INTO @batnbr
		END

		CLOSE Cur1

		DEALLOCATE Cur1

		