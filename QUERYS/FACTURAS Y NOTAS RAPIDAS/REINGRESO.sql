

----------------------------------------------------------------------------------
-- REINGRESO DESDE UNA BASE ANTERIOR
----------------------------------------------------------------------------------

declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='014128' -- LOTE 
--set @refnbr ='F250001032' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,docdate,* from ardoc c where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr-- and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go


/*
---------------------------------------------------------------------------------------------------------------

insert into [ca2016app].[dbo].[ARTRAN] (Acct , AcctDist, BatNbr, CmmnPct, CnvFact, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryExtCost, CuryId , CuryMultDiv, CuryRate,
 CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTranAmt, CuryTxblAmt00 , CuryTxblAmt01, CuryTxblAmt02 ,CuryTxblAmt03 , CuryUnitPrice, CustId , DrCr,
  Excpt, ExtCost, ExtRefNbr, FiscYr, InstallNbr, InvtId, JobRate, JrnlType, LineId , LineNbr, LineRef,LUpd_DateTime , LUpd_Prog, LUpd_User, MasterDocNbr, NoteId,
   OrdNbr, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, ProjectID , Qty, RefNbr,Rlsed , S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07,
    S4Future08, S4Future09 , S4Future10, S4Future11, S4Future12, ServiceDate, SiteId, SlsperId, SpecificCostID, Sub, TaskID, TaxAmt00, TaxAmt01,  TaxAmt02 , TaxAmt03 ,
     TaxCalced, TaxCat, TaxId00, TaxId01, TaxId02, TaxId03, TaxIdDflt , TranAmt, TranClass, TranDate, TranDesc, TranType, TxblAmt00, TxblAmt01 , TxblAmt02, TxblAmt03,
      UnitDesc, UnitPrice,User1 , User2, User3, User4, User5, User6, User7, User8, WhseLoc)
 
 select     Acct , AcctDist, BatNbr, CmmnPct, CnvFact, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryExtCost, CuryId , CuryMultDiv, CuryRate,
 CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTranAmt, CuryTxblAmt00 , CuryTxblAmt01, CuryTxblAmt02 ,CuryTxblAmt03 , CuryUnitPrice, CustId , DrCr,
  Excpt, ExtCost, ExtRefNbr, FiscYr, InstallNbr, InvtId, JobRate, JrnlType, LineId , LineNbr, LineRef,LUpd_DateTime , LUpd_Prog, LUpd_User, MasterDocNbr, NoteId,
   OrdNbr, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, ProjectID , Qty, RefNbr,Rlsed , S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07,
    S4Future08, S4Future09 , S4Future10, S4Future11, S4Future12, ServiceDate, SiteId, SlsperId, SpecificCostID, Sub, TaskID, TaxAmt00, TaxAmt01,  TaxAmt02 , TaxAmt03 ,
     TaxCalced, TaxCat, TaxId00, TaxId01, TaxId02, TaxId03, TaxIdDflt , TranAmt, TranClass, TranDate, TranDesc, TranType, TxblAmt00, TxblAmt01 , TxblAmt02, TxblAmt03,
      UnitDesc, UnitPrice,User1 , User2, User3, User4, User5, User6, User7, User8, WhseLoc from [ERRORMAN].[dbo].[artran] where batnbr ='014128'
      
    --  select * from [ca2016app].[dbo].[ARTRAN] where batnbr  ='014128'
      
insert into [CA2016APP].[dbo].[ARDOC](AcctNbr , AgentID, ApplAmt, ApplBatNbr, ApplBatSeq, BankAcct, BankID, BankSub, BatNbr,BatSeq , Cleardate, CmmnAmt, CmmnPct, CpnyID, Crtd_DateTime, Crtd_Prog, 
Crtd_User, CurrentNbr,CuryApplAmt , CuryClearAmt, CuryCmmnAmt, CuryDiscApplAmt, CuryDiscBal, CuryDocBal, CuryEffDate,CuryId , CuryMultDiv, CuryOrigDocAmt, CuryRate, CuryRateType,
 CuryStmtBal, CuryTaxTot00, CuryTaxTot01,CuryTaxTot02 , CuryTaxTot03, CuryTxblTot00, CuryTxblTot01, CuryTxblTot02, CuryTxblTot03, CustId, CustOrdNbr,Cycle , DiscApplAmt, DiscBal,
  DiscDate, DocBal, DocClass, DocDate, DocDesc, DocType, DraftIssued, DueDate, InstallNbr,JobCntr , LineCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, MasterDocNbr, NbrCycle, NoPrtStmt, 
  NoteId, OpenDoc,OrdNbr , OrigDocAmt, OrigDocNbr, PC_Status, PerClosed, PerEnt, PerPost, PmtMethod, ProjectID, RefNbr, RGOLAmt, Rlsed,S4Future01 , S4Future02, S4Future03, S4Future04,
   S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10,S4Future11 , S4Future12, ShipmentNbr, SlsperId, Status,
    StmtBal, StmtDate, TaskID, TaxCntr00, TaxCntr01, TaxCntr02,TaxCntr03 , TaxId00, TaxId01, TaxId02, TaxId03, TaxTot00, TaxTot01,TaxTot02,TaxTot03,Terms, TxblTot00, TxblTot01, TxblTot02,
 TxblTot03,User1 , User2, User3, User4, User5, User6, User7, User8) 
 
 select AcctNbr , AgentID, ApplAmt, ApplBatNbr, ApplBatSeq, BankAcct, BankID, BankSub, BatNbr,BatSeq , Cleardate, CmmnAmt, CmmnPct, CpnyID, Crtd_DateTime, Crtd_Prog, 
Crtd_User, CurrentNbr,CuryApplAmt , CuryClearAmt, CuryCmmnAmt, CuryDiscApplAmt, CuryDiscBal, CuryDocBal, CuryEffDate,CuryId , CuryMultDiv, CuryOrigDocAmt, CuryRate, CuryRateType,
 CuryStmtBal, CuryTaxTot00, CuryTaxTot01,CuryTaxTot02 , CuryTaxTot03, CuryTxblTot00, CuryTxblTot01, CuryTxblTot02, CuryTxblTot03, CustId, CustOrdNbr,Cycle , DiscApplAmt, DiscBal,
  DiscDate, DocBal, DocClass, DocDate, DocDesc, DocType, DraftIssued, DueDate, InstallNbr,JobCntr , LineCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, MasterDocNbr, NbrCycle, NoPrtStmt, 
  NoteId, OpenDoc,OrdNbr , OrigDocAmt, OrigDocNbr, PC_Status, PerClosed, PerEnt, PerPost, PmtMethod, ProjectID, RefNbr, RGOLAmt, Rlsed,S4Future01 , S4Future02, S4Future03, S4Future04,
   S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10,S4Future11 , S4Future12, ShipmentNbr, SlsperId, Status, StmtBal, StmtDate, TaskID, TaxCntr00, TaxCntr01, TaxCntr02,TaxCntr03 , TaxId00, TaxId01, TaxId02, TaxId03, TaxTot00, TaxTot01,TaxTot02,TaxTot03,Terms, TxblTot00, TxblTot01, TxblTot02,
 TxblTot03,User1 , User2, User3, User4, User5, User6, User7, User8  from [ERRORMAN].[dbo].[ARDOC] where batnbr ='014128'

  --select   *  from [CA2016APP].[dbo].[ARDOC] where batnbr  ='014128'
 insert [ca2016app].[dbo].[batch] (acct,autorev,autorevcopy,balancetype,bankacct,banksub,basecuryid,batnbr,battype,clearamt,cleared,cpnyid,crtd_datetime,crtd_prog,crtd_user, 
 crtot,ctrltot,curycrtot,curyctrltot,curydepositamt,curydrtot,curyeffdate,curyid,curymultdiv,curyrate,curyratetype,cycle,dateclr,dateent,depositamt, 
 descr,drtot,editscrnnbr,glpostopt,jrnltype,ledgerid,lupd_datetime,lupd_prog,lupd_user,module,nbrcycle,noteid,origbatnbr,origcpnyid,origscrnnbr,
  perent,perpost,rlsed,s4future01,s4future02,s4future03,s4future04,s4future05,s4future06,s4future07,s4future08,s4future09,s4future10,s4future11,s4future12,
   status,sub,user1,user2,user3,user4,user5,user6,user7,user8) 
   
   select acct,autorev,autorevcopy,balancetype,bankacct,banksub,basecuryid,batnbr,battype,clearamt,cleared,cpnyid,crtd_datetime,crtd_prog,crtd_user, 
 crtot,ctrltot,curycrtot,curyctrltot,curydepositamt,curydrtot,curyeffdate,curyid,curymultdiv,curyrate,curyratetype,cycle,dateclr,dateent,depositamt, 
 descr,drtot,editscrnnbr,glpostopt,jrnltype,ledgerid,lupd_datetime,lupd_prog,lupd_user,module,nbrcycle,noteid,origbatnbr,origcpnyid,origscrnnbr,
  perent,perpost,rlsed,s4future01,s4future02,s4future03,s4future04,s4future05,s4future06,s4future07,s4future08,s4future09,s4future10,s4future11,s4future12,
   status,sub,user1,user2,user3,user4,user5,user6,user7,user8  from [ERRORMAN].[dbo].[batch] where batnbr  = '014128' and module  ='AR'

 insert into [ca2016app].[dbo].[GLTRAN] (
   Acct,AppliedDate,BalanceType, BaseCuryID, BatNbr,CpnyID,CrAmt,Crtd_DateTime,Crtd_Prog, Crtd_User , CuryCrAmt,CuryDrAmt,CuryEffDate,CuryId, CuryMultDiv, CuryRate ,CuryRateType ,
   DrAmt,EmployeeID, ExtRefNbr,FiscYr ,IC_Distribution, Id,JrnlType ,Labor_Class_Cd ,LedgerID,   LineId ,     LineNbr, LineRef, LUpd_DateTime,LUpd_Prog ,LUpd_User , Module, NoteID  ,
  OrigAcct,   OrigBatNbr, OrigCpnyID, OrigSub ,PC_Flag ,PC_ID  ,PC_Status ,PerEnt ,PerPost, Posted ,ProjectID  ,Qty   ,RefNbr ,RevEntryOption, Rlsed  ,S4Future01 ,S4Future02 ,
  S4Future03,S4Future04  ,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,  S4Future10 , S4Future11 ,S4Future12, ServiceDate,Sub,TaskID ,TranDate  ,TranDesc ,TranType, Units,
  User1 ,User2,User3 ,User4 ,User5,User6,User7,User8  )
  
  select  Acct,AppliedDate,BalanceType, BaseCuryID, BatNbr,CpnyID,CrAmt,Crtd_DateTime,Crtd_Prog, Crtd_User , CuryCrAmt,CuryDrAmt,CuryEffDate,CuryId, CuryMultDiv, CuryRate ,CuryRateType ,
   DrAmt,EmployeeID, ExtRefNbr,FiscYr ,IC_Distribution, Id,JrnlType ,Labor_Class_Cd ,LedgerID,   LineId ,     LineNbr, LineRef, LUpd_DateTime,LUpd_Prog ,LUpd_User , Module, NoteID  ,
  OrigAcct,   OrigBatNbr, OrigCpnyID, OrigSub ,PC_Flag ,PC_ID  ,PC_Status ,PerEnt ,PerPost, Posted ,ProjectID  ,Qty   ,RefNbr ,RevEntryOption, Rlsed  ,S4Future01 ,S4Future02 ,
  S4Future03,S4Future04  ,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,  S4Future10 , S4Future11 ,S4Future12, ServiceDate,Sub,TaskID ,TranDate  ,TranDesc ,TranType, Units,
  User1 ,User2,User3 ,User4 ,User5,User6,User7,User8 from  [ERRORMAN].[dbo].[GLTRAN] where batnbr  = '014128' and module  ='AR'
  
  
   SET IDENTITY_INSERT aradjust ON 
insert into [ca2016app].[dbo].[aradjust]   (
AdjAmt,AdjBatNbr,AdjdDocType, AdjDiscAmt,AdjdRefNbr, AdjgDocDate,AdjgDocType ,AdjgPerPost, AdjgRefNbr ,Crtd_DateTime,Crtd_Prog, Crtd_User,  CuryAdjdAmt,CuryAdjdCuryId, CuryAdjdDiscAmt ,
CuryAdjdMultDiv, CuryAdjdRate ,CuryAdjgAmt,CuryAdjgDiscAmt,CuryRGOLAmt ,CustId,DateAppl,LUpd_DateTime,LUpd_Prog, LUpd_User , PC_Status ,PerAppl, ProjectID ,RecordID,    S4Future01, 
S4Future02 ,S4Future03 ,S4Future04 ,S4Future05,S4Future06 ,S4Future07 ,S4Future08 ,S4Future09,  S4Future10,  S4Future11, S4Future12, TaskID,User1 ,User2,User3 ,User4 ,User5 ,User6,
User7 ,User8   
)
select    AdjAmt,AdjBatNbr,AdjdDocType, AdjDiscAmt,AdjdRefNbr, AdjgDocDate,AdjgDocType ,AdjgPerPost, AdjgRefNbr ,Crtd_DateTime,Crtd_Prog, Crtd_User,  CuryAdjdAmt,CuryAdjdCuryId, CuryAdjdDiscAmt ,
CuryAdjdMultDiv, CuryAdjdRate ,CuryAdjgAmt,CuryAdjgDiscAmt,CuryRGOLAmt ,CustId,DateAppl,LUpd_DateTime,LUpd_Prog, LUpd_User , PC_Status ,PerAppl, ProjectID ,RecordID,    S4Future01, 
S4Future02 ,S4Future03 ,S4Future04 ,S4Future05,S4Future06 ,S4Future07 ,S4Future08 ,S4Future09,  S4Future10,  S4Future11, S4Future12, TaskID,User1 ,User2,User3 ,User4 ,User5 ,User6,
User7 ,User8  from   [ERRORMAN].[dbo].[aradjust]  where adjbatnbr   ='014128'  
  
SET IDENTITY_INSERT aradjust OFF

 /* 
  
  SET IDENTITY_INSERT Table1 ON

INSERT INTO Table1
/*Note the column list is REQUIRED here, not optional*/
            (OperationID,
             OpDescription,
             FilterID)
VALUES      (20,
             'Hierachy Update',
             1)

SET IDENTITY_INSERT Table1 OFF
  
*/










