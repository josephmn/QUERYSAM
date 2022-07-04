
--SP_HELPTEXT ASP_GENERATEAPERTURA_AP

--002543     70263.67 VO INTE       9600024869       
--002543     298148.01 VO INTE       9600024869       
--002544     42245.89 VO INTE       9600024877       
--002544     178888.82 VO INTE       9600024877       
--012164     57411.36 VO INTE       0020112548       
--012164     67833.68 VO INTE       0020112548       
 
--select BatNbr ,RefNbr,DocType,User6,OrigDocAmt,DocBal, * from  AM2021APP..apdoc where InvcNbr ='9600024869'  
--select*  from aptran where Acct ='467701' and PerPost ='202112'      
--select * from AST_MIGRAR    
--000142    
--DELETE FROM Batch WHERE BatNbr ='000143' AND Module ='AP'  
--DELETE FROM APDOC WHERE BatNbr ='000143'  
--DELETE FROM APTran WHERE BatNbr ='000143'  
--DELETE FROM GLTran WHERE BatNbr ='000143' AND Module ='AP'  
  
  
  
----000142  
  
--select *  FROM Batch WHERE BatNbr ='000143' AND Module ='AP'  
--select *  FROM APDOC WHERE BatNbr ='000143'  
--select *  FROM APTran WHERE BatNbr ='000143'  
--select *  FROM GLTran WHERE BatNbr ='000143' AND Module ='AP'  
  
--select  vendid,InvcNbr, count(*)  FROM APDOC WHERE PerPost ='202112'  
--group by VendId,InvcNbr having count(*) > 1   
  
--0000000384         
--select * from apdoc where PerPost  = '202112' and acct ='421213' and InvcNbr = '0000000384'    
--select SUM(OrigDocAmt) from apdoc where PerPost  = '202112' and acct ='421213' and BatNbr ='000139'    
--select SUM(OrigDocAmt) from apdoc where PerPost  = '202112' and acct ='421213' and BatNbr ='000143'    
--select SUM(( CASE  WHEN DocType in ('AD') THEN TOTAL * - 1  ELSE TOTAL  END)) MONTO  from AST_MIGRAR      
-- SELECT*  FROM AST_MIGRAR    
--1312861  



--select *
-- --delete 
-- from apdoc where RefNbr  ='002518    ' and InvcNbr  ='T.00000555     '


--select RefNbr,OrigDocAmt , CuryOrigDocAmt , DocBal , CuryDocBal ,InvcNbr , user6  from apdoc where BatNbr  ='000940'  and RefNbr not in 
--(select RefNbr   from APTran where BatNbr  ='000940' )

--select *  from APTran where BatNbr  ='000940'  and ExtRefNbr  ='T.00000555'

--select SUM(( CASE  WHEN DocType in ('AD') THEN TOTAL * - 1  ELSE TOTAL  END)) MONTO  from AST_MIGRAR   


--CREATE  PROC ASP_GENERATEAPERTURA_AP    
----Funcion : Generar Apertura por cuenta     
----Sistema : Solomon IV    
----Usuario : Gasla Baudat Laisson    
----Fecha   : 06/01/2019    
--AS    
BEGIN    
declare @refnbr char(10)    
declare @Doctype char(2)    
declare @Monto float    
declare @NewBatnbr char(6)    
DECLARE @NewRefnbr char(10)    
DECLARE @Acct char(6)    
DECLARE @CuryID char(3)    
DECLARE @CuryRate float    
SELECT  @NewBatnbr  = ( select  right('000000' + cast(isnull( max(lastbatnbr),0) + 1 as varchar),6) from APSetup)
DECLARE @S4FUTURE12 char(4)
declare @Invcnbr  char(10)
declare @VendId char(11)
-------------------------------------------------------------------------------------------------------------------    
PRINT ' LOTE A INSERTAR : '  + CAST(@NewBatnbr AS VARCHAR)    
--if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AST_MIGRAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)      
--BEGIN      
--drop table AST_MIGRAR      
--END      
-------------------------------------------------------------------------------------------------------------------    
set @CuryID ='SOL'    
set @CuryRate  = 1    

--SELECT * INTO AST_MIGRAR FROM (      
----SELECT '08/05/2013'REFNBR,20000 TOTAL,'IN' DOCTYPE UNION ALL    
----SELECT '12/04/2013'REFNBR,15000 TOTAL,'IN' DOCTYPE UNION ALL    
----SELECT '19/12/2012'REFNBR,25000 TOTAL,'IN' DOCTYPE           
--select R.RefNbr,R.TOTAL,R.DocType,S.S4Future12,S.InvcNbr,s.VendId from (    
--SELECT DISTINCT  vr_03681d."refnbr",vr_03681d.InvcNbr,    
--CASE WHEN ROUND((vr_03681d.Cur+vr_03681d.Past00+vr_03681d.Past01+vr_03681d.Past02+vr_03681d.Over02 ),2)  <0 THEN     
--ROUND((vr_03681d.Cur+vr_03681d.Past00+vr_03681d.Past01+vr_03681d.Past02+vr_03681d.Over02 ),2) *-1   ELSE    
--ROUND((vr_03681d.Cur+vr_03681d.Past00+vr_03681d.Past01+vr_03681d.Past02+vr_03681d.Over02 ),2) END TOTAL, vr_03681d.doctype    
--FROM [ALTOMAYO-WEB]."AM2021APP"."dbo"."vr_03681d" vr_03681d WHERE     
----((vr_03681d.aracct like '178101%') OR    
--((vr_03681d.APAcct = '421213')) AND  vr_03681d.CuryID  = 'SOL' AND  vr_03681d.DocType  ='AD'
--)R     
--INNER JOIN [ALTOMAYO-WEB]."AM2021APP"."dbo"."APDOC" S ON R.RefNbr = S.RefNbr  AND S.DocType = R.DocType  and s.InvcNbr = r.invcnbr    
--)X WHERE TOTAL > 0.5  --AND X.Invcnbr NOT IN ('-000031427','-000030911')

-- DELETE FROM RPTRUNTIME
PRINT     
'TABLA TEMPORAL CARGADA'     
set @Acct  ='421213'    
DECLARE CUR_MITABLA CURSOR FOR    

select TOP 10 * from  AST_MIGRAR  a  WHERE DocType = 'AD'  and a.InvcNbr not in (select InvcNbr from apdoc where VendId =a.VendId) AND InvcNbr IN ('0000000708')
--'0000000708'

OPEN CUR_MITABLA     
FETCH CUR_MITABLA INTO @refnbr,@Monto,@Doctype,@S4FUTURE12,@invcnbr,@VendId    
    
 WHILE (@@FETCH_STATUS = 0 )    
 BEGIN -- WHILE      
      ----------------------------------------------------------------------------------------------------------------------    
   -- D PARA NOTAS DE CREDITO     
   -- C PARA VENTAS NORMAL     
 select  @NewRefnbr =( SELECT right('000000' + cast(isnull( max(LastRefNbr),0) + 1 as varchar),6)  FROM APSetup )     
---------------------    
Insert into [ALTOMAYO-WEB].[AM2022APP].[dbo].[Apdoc](Acct, AddlCost, ApplyAmt, ApplyDate, ApplyRefNbr, BatNbr, BatSeq, CashAcct, CashSub, ClearAmt, ClearDate, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CurrentNbr,    
 CuryDiscBal, CuryDiscTkn, CuryDocBal, CuryEffDate, CuryId, CuryMultDiv, CuryOrigDocAmt, CuryPmtAmt, CuryRate, CuryRateType, CuryTaxTot00, CuryTaxTot01, CuryTaxTot02, CuryTaxTot03, CuryTxblTot00, CuryTxblTot01,    
  CuryTxblTot02, CuryTxblTot03, Cycle, DfltDetail, DirectDeposit, DiscBal, DiscDate, DiscTkn, Doc1099, DocBal,      DocClass, DocDate, DocDesc, DocType, DueDate, Econfirm, Estatus, InstallNbr,    
   InvcDate, InvcNbr, LineCntr,LUpd_DateTime, LUpd_Prog, LUpd_User, MasterDocNbr, NbrCycle, NoteID, OpenDoc,    OrigDocAmt,   PayDate, PayHoldDesc, PC_Status, PerClosed, PerEnt, PerPost, PmtAmt, PmtID, PmtMethod,    
    PONbr,    
    PrePay_RefNbr,    
  ProjectID,RefNbr, Retention, RGOLAmt, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Selected,    
 Status, Sub, TaxCntr00, TaxCntr01, TaxCntr02, TaxCntr03, TaxId00, TaxId01, TaxId02, TaxId03, TaxTot00, TaxTot01, TaxTot02, TaxTot03, Terms, TxblTot00, TxblTot01, TxblTot02, TxblTot03, User1, User2, User3, User4,    
  User5, User6,User7, User8, VendId)    
select top 1 @Acct, AddlCost, ApplyAmt, ApplyDate, ApplyRefNbr,@NewBatnbr, BatSeq, '104101', '000000000000', ClearAmt, ClearDate,  CpnyID, GETDATE(), Crtd_Prog, Crtd_User, CurrentNbr,    
 CuryDiscBal,CuryDiscTkn,@Monto, CuryEffDate, @CuryID, CuryMultDiv, @Monto,CuryPmtAmt, @CuryRate, CuryRateType,  0, CuryTaxTot01, CuryTaxTot02, CuryTaxTot03, 0, CuryTxblTot01,     
 CuryTxblTot02,CuryTxblTot03,  Cycle,  DfltDetail, DirectDeposit, DiscBal, DiscDate, DiscTkn, Doc1099, round( @Monto * @CuryRate,2), DocClass, docdate,DocDesc, 'AC', DueDate, Econfirm, Estatus, InstallNbr,    
 InvcDate, @invcnbr, LineCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, MasterDocNbr, NbrCycle,  NoteId, OpenDoc, round( @Monto * @CuryRate,2),  PayDate, PayHoldDesc, PC_Status, PerClosed,'202112','202112', PmtAmt, PmtID, PmtMethod,    
      PONbr,    
    PrePay_RefNbr,    
 ProjectID, @NewRefnbr,Retention, RGOLAmt, 0 rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, @S4FUTURE12,Selected,    
  Status, '000000000000',  TaxCntr00, TaxCntr01, TaxCntr02, TaxCntr03, '', '', '', '', taxtot00, TaxTot01, TaxTot02, TaxTot03, Terms, 0, TxblTot01, TxblTot02, TxblTot03, User1, User2, User3, User4,    
   User5, (CASE WHEN  @Doctype  ='AD' THEN 'OD' ELSE   User6 END ) User6, User7, User8 ,vendid    
from  [ALTOMAYO-WEB].[AM2021APP].[dbo].[Apdoc] where RefNbr  = @refnbr AND DOCBAL > 0 and InvcNbr = @Invcnbr and vendid  = @VendId and status <>'V'    
--select * from apdoc where perpost = '201812' and acct = '421213'    
PRINT 'SE INSERTÓ APDOC DOCUMENTO ......... : '  + CAST(@REFNBR AS VARCHAR)    
    
            
Insert into [ALTOMAYO-WEB].[AM2022APP].[dbo].[Aptran](Acct, AcctDist, AlternateID, BatNbr, BOMLineRef, BoxNbr, Component, CostType, CostTypeWO, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryId, CuryMultDiv,     
CuryPOExtPrice, CuryPOUnitPrice, CuryPPV, CuryRate, CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTranAmt, CuryTxblAmt00, CuryTxblAmt01, CuryTxblAmt02, CuryTxblAmt03, CuryUnitPrice, DrCr, Employee,    
EmployeeID, Excpt, ExtRefNbr, FiscYr, InstallNbr, InvcTypeID, InvtID, JobRate, JrnlType, Labor_Class_Cd, LineId, LineNbr, LineRef, LineType, LUpd_DateTime, LUpd_Prog, LUpd_User, MasterDocNbr, NoteID, PC_Flag,    
PC_ID, PC_Status, PerEnt, PerPost, PmtMethod, POExtPrice, POLineRef, PONbr, POQty, POUnitPrice, PPV, ProjectID, Qty, QtyVar, RcptLineRef, RcptNbr, RcptQty,  RefNbr, Rlsed, S4Future01, S4Future02,    
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ServiceDate, SiteId, SoLineRef, SOOrdNbr, SOTypeID, Sub, TaskID, TaxAmt00, TaxAmt01,    
TaxAmt02, TaxAmt03, TaxCalced, TaxCat, TaxId00, TaxId01, TaxId02, TaxId03, TaxIdDflt, TranAmt, TranClass, TranDate, TranDesc, trantype, TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitPrice,     
User1, User2, User3, User4, User5, User6, User7, User8, VendId, WONbr, WOStepNbr)    
    
select top 1 '591101', AcctDist, AlternateID,@NewBatnbr,BOMLineRef,BoxNbr, Component, 0,CostTypeWO, CpnyID, getdate(), Crtd_Prog, Crtd_User,  @CuryID, CuryMultDiv,    
 CuryPOExtPrice, CuryPOUnitPrice, CuryPPV,@CuryRate, CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, @Monto,CuryTxblAmt00, CuryTxblAmt01, CuryTxblAmt02, CuryTxblAmt03, CuryUnitPrice,'D',Employee,    
 EmployeeID, Excpt,@invcnbr, '2021', InstallNbr, InvcTypeID,InvtID, 0, 'AP',Labor_Class_Cd, 1, LineNbr, 1,'S', LUpd_DateTime, LUpd_Prog, LUpd_User,MasterDocNbr, NoteId,PC_Flag,    
 PC_ID, PC_Status, '202112', '202112',PmtMethod,POExtPrice, POLineRef, PONbr, POQty, POUnitPrice, PPV, ProjectID, Qty,  QtyVar, RcptLineRef,RcptNbr,RcptQty,  @NewRefnbr, 0, S4Future01, S4Future02,     
 S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ServiceDate, SiteId,SoLineRef,SOOrdNbr,SOTypeID,'000000000000',TaskID,     
 0, 0, 0, 0,'Y', 'INAFECTO','', '', '', '','', Round(@Monto * @CuryRate,2), TranClass, TranDate, 'SALDO INICIAL','AC',TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitPrice,     
 User1, User2, 0, 0, 0, 'AFEC1', User7, User8, VendId, WONbr, (CASE WHEN @Doctype ='AD' THEN  'X' ELSE  WOStepNbr  END )WOStepNbr    
from  [ALTOMAYO-WEB].[AM2021APP].[dbo].[Aptran] where RefNbr  = @refnbr and Acct = '421213' AND VendId  = @VendId and ExtRefNbr = @Invcnbr  and TRANAMT > 0  and trantype <>'HC'    

--RefNbr		TOTAL	DocType	S4Future12	InvcNbr			VendId
--013355    	4248	AD		REVR      	0000031052     	20174513245    
--014687    	4248	AD		F005      	-000030911     	20174513245    
--014708    	944		AD		F005      	-000031427     	20174513245    

--SELECT DocType, InvcNbr, Rlsed, *
---- UPDATE A SET InvcNbr = 'X000031427'
--FROM APDoc A WHERE InvcNbr IN ('-000031427') --,'-000030911','-000031427')
--AND DocType = 'AD'

--SELECT ExtRefNbr, * 
---- UPDATE A SET ExtRefNbr = 'X000031427'
--FROM [Aptran] A where RefNbr  = '014708' and Acct = '421213' AND VendId  = '20174513245' and ExtRefNbr = '-000031427' and TRANAMT > 0  and trantype <>'HC' 

--select * from APTRAN where perpost = '201812' and acct   = '421213'    
--select * from APTRAN where perpost = '201812' and batnbr = '000304'         
--select RefNbr,InvcNbr, * from apdoc where perpost = '201812' and batnbr = '000304'    
        
PRINT 'SE INSERTÓ APTRAN DOCUMENTO ......... : '+ CAST(@REFNBR AS VARCHAR)    
update APSetup set LastRefNbr  =@NewRefnbr    
-------------------------------------------------------------------------------    
 FETCH CUR_MITABLA INTO @refnbr,@Monto,@Doctype,@S4FUTURE12,@invcnbr,@VendId    
 END-- END WHILE    
CLOSE CUR_MITABLA    
DEALLOCATE CUR_MITABLA    
    
Insert into Batch ( Acct, AutoRev, AutoRevCopy, BalanceType, BankAcct, BankSub, BaseCuryID, BatNbr, BatType, clearamt, Cleared, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDepositAmt,    
 CuryDrTot, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, Cycle, DateClr, DateEnt, DepositAmt, Descr, DrTot, EditScrnNbr, GLPostOpt, JrnlType, LedgerID, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NbrCycle, NoteID,    
  OrigBatNbr, OrigCpnyID, OrigScrnNbr, PerEnt, PerPost,     
Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Status, Sub, User1, User2, User3, User4, User5, User6, User7, User8)    
SELECT TOP 1 Acct, AutoRev, AutoRevCopy, BalanceType, BankAcct, BankSub, BaseCuryID, @NewBatnbr, BatType, clearamt, Cleared, CpnyID, GETDATE(), Crtd_Prog, Crtd_User, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDepositAmt,    
 CuryDrTot, CuryEffDate, @CuryID,    
 CuryMultDiv, @CuryRate, CuryRateType, Cycle, DateClr, DateEnt, DepositAmt, Descr, DrTot, EditScrnNbr, GLPostOpt, JrnlType, LedgerID, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NbrCycle, NoteID, OrigBatNbr, OrigCpnyID,     
 OrigScrnNbr, '202112', '202112', 0, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, 'B', Sub, User1, User2, User3, User4, User5,     
 User6, User7, User8    
from [AM2021APP].[dbo].[Batch] where module  = 'AP'    
    
PRINT 'SE INSERTÓ BATCH CON LOTE  :' + CAST(@NewBatnbr AS VARCHAR)    
    
----ACTUALIZAMOS CABECERA DE LOTE GENERADO     
--select BATCH.CrTot,BATCH.CtrlTot, BATCH.CuryCrTot, BATCH.CuryCtrlTot, D.CuryOrigDocAmt,D.OrigDocAmt,CuryDepositAmt,DepositAmt,*    
UPDATE BATCH SET  CrTot=CONVERT(DEC(28,2),D.OrigDocAmt), CtrlTot=CONVERT(DEC(28,2),D.OrigDocAmt), CuryCrTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt), CuryCtrlTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt),CuryDrTot=CONVERT(DEC(28,2),D.OrigDocAmt),DrTot=CONVERT(DEC

(    
    
28,2),D.OrigDocAmt),CuryDepositAmt=CONVERT(DEC(28,2),D.OrigDocAmt), DepositAmt =CONVERT(DEC(28,2),D.OrigDocAmt)    
from BATCH INNER JOIN     
(SELECT  BATNBR, CONVERT(DEC(28,2),sum(CuryOrigDocAmt)) AS CuryOrigDocAmt,CONVERT(DEC(28,2),sum(OrigDocAmt) ) AS OrigDocAmt, CONVERT(DEC(28,2),sum(CuryDocBal)) AS CuryDocBal,CONVERT(DEC(28,2),sum(DocBal)) AS DocBal    
FROM APDOC WHERE BATNBR=@NewBatnbr    
GROUP BY BATNBR    
) D ON BATCH.BATNBR= D.BATNBR     
where BATCH.batnbr=@NewBatnbr  and BATCH.MODULE = 'AP'    
    
PRINT 'SE REGULARIZÓ MONTOS DE  BATCH CON LOTE  :' + CAST(@NewBatnbr AS VARCHAR)    
update batch set Crtd_Prog  = '03010' ,LUpd_Prog = '03010'  where Module  ='AP' and BatNbr =@NewBatnbr    
update APDOC set Crtd_Prog  = '03010' ,LUpd_Prog = '03010'  where BatNbr  = @NewBatnbr    
update APTran set Crtd_Prog = '03010' ,LUpd_Prog = '03010'  where  BatNbr = @NewBatnbr    
update APSetup set LastBatNbr  =@NewBatnbr    
    
PRINT 'SE ACTUALIZÓ SCREENNUMBER Y CORRELATIVO DE APSETUP'    
--EXEC LIBERARAR @NewBatnbr //LIBERAR AR     
    
-----------------LIBERAR AP -------------------------------    
EXEC pp_WrkReleaseRec @NewBatnbr,'AP','liberaDiarioVenta',1    
EXEC pp_03400 'liberaDiarioVenta', 'SYSADMIN'    
-----------------------------------------------------------    
PRINT ' SE LIBERÓ LOTE'    
---ACTUALIZAR DOCUMENTOS CORRECTOS     
    
declare @status char(1)     
select @status  = (select TOP 1 status from batch where module  ='AP' AND BATNBR  =@NewBatnbr   )     
    
PRINT 'EL STATUS DEL LOTE ES  : ' + CAST( @STATUS  AS VARCHAR)    
if @status  ='U'    
 BEGIN    
             
 UPDATE A  SET A.USER6 ='ND' , A.DOCTYPE  ='AD' FROM APDOC A WHERE BatNbr  = @NewBatnbr AND RefNbr IN     
 (SELECT RefNbr FROM   APTRAN WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X' )    
    
 UPDATE A SET TRANTYPE  ='AD' FROM APTRAN A WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X'    
    
 UPDATE A  SET  A.TRANTYPE  ='AD' FROM GLTRAN A WHERE BatNbr  = @NewBatnbr AND RefNbr IN     
 (SELECT RefNbr FROM   APTRAN WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X' ) AND MODULE ='AP'    
     
    
 --SELECT RefNbr FROM APTRAN WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X'     
 --ACTUALIZAMOS TIPOS DE DOCUMENTOS    
 --UPDATE H SET H.DocType  = A.DocType    
 --FROM APDOC H    
 --INNER JOIN AST_MIGRAR A ON  h.InvcNbr = A.InvcNbr  and h.VendId  = a.VendId    
 --where h.BatNbr = @NewBatnbr     
    
 -- UPDATE H SET H.TranType  = A.DocType    
 -- FROM APTran H    
 --INNER JOIN AST_MIGRAR A  ON H.S4Future12  = A.S4Future12 and h.ExtRefNbr = A.InvcNbr  and   h.VendId  = a.VendId    
 --where h.BatNbr = @NewBatnbr     
 -- UPDATE H SET H.TranType  = A.DocType    
 -- FROM GLTRAN H    
 --INNER JOIN AST_MIGRAR A ON  A.InvcNbr  = H.ExtRefNbr and A.VendId  = H.Id    
 --where h.BatNbr = @NewBatnbr     
 --PRINT 'SE ACTUALIZARON LOS TIPOS DE DOCUMENTO'    
     
 -------    
 UPDATE A SET A.Acct ='591101'    
 FROM GLTRAN A WHERE BatNbr  =@NewBatnbr AND MODULE  ='AP' AND TranType  ='AD' AND CrAmt > 0 AND DrAmt = 0    
    
 UPDATE A set a.acct ='421213'    
 FROM GLTRAN A WHERE BatNbr  =@NewBatnbr AND MODULE  ='AP' AND TranType  ='AD' AND DrAmt >0 AND CrAmt = 0    
    
--------------CONFIGURACION DE CUENTA SENTIDOS GLTRAN ---------------------------------------    
  --AC ----- DR >0  59    
  --AC ----- CR >0  4...    
  --VO ----- DR >0  59    
  --VO ----- CR >0  4...    
  --AD ----- CR >0  59    
  --AD ----- DR >0  4...    
---------------------------------------------------------------------------------------------     
 update a set perpost = '202112' from batch a where module    = 'AP' and batnbr  = @NewBatnbr    
 update a set perpost = '202112' from APDOC a where  batnbr   =  @NewBatnbr    
 update a set perpost = '202112' from APTRAN a where  batnbr  =  @NewBatnbr    
 update a set perpost = '202112' from gltran a where module   = 'AP' and batnbr  = @NewBatnbr    
 update a set FiscYr = '2021' from gltran a where module   ='AP' and batnbr  = @NewBatnbr    
 update a set FiscYr = '2021' from APTran a where batnbr  = @NewBatnbr    
    
    
 -----ACTUALIZAMOS CORRELATIVO DE GLTRAN   -----      
 declare @Batnbr char(6)     
 set @Batnbr  = ''     
 select @Batnbr  = ( select ltrim(rtrim(isnull(max(batnbr),'000000'))) from Batch   )     
 update GLSetup set LastBatNbr  = @Batnbr    
 END       
 -----------------------------------------------    
     
            
END    
