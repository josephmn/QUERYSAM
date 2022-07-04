
 

  
  
-- SP_HELPTEXT ASP_GENERATEAPERTURA_APDOL  
-- ASP_GENERATEAPERTURA_APDOL    
-- SP_HELPTEXT ASP_GENERATEAPERTURA_APDOL          
-- SELECT * FROM AST_MIGRAR       
-- select SUM(( CASE  WHEN DocType in ('AD') THEN curydocbal * - 1  ELSE curydocbal  END)) MONTO  from AST_MIGRAR      
-- select *  
-- delete   
-- from AM2021APP..RptRunTime    
-- SELECT InvcNbr,* FROM APDOC WHERE PerPost  = '202112' AND ACCT ='421213' and CuryId ='DOL'  
   
   
  
    
--alter  PROC ASP_GENERATEAPERTURA_APDOL    
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
select  @NewBatnbr  = ( select  right('000000' + cast(isnull( max(lastbatnbr),0) + 1 as varchar),6) from APSetup)    
DECLARE @S4FUTURE12 char(4)     
declare @Invcnbr  char(10)     
declare @VendId char(11)     
    
DECLARE @NOVALE FLOAT    
-------------------------------------------------------------------------------------------------------------------    
PRINT 'LOTE A INSERTAR : ' + CAST(@NewBatnbr AS VARCHAR)    
--if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AST_MIGRAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)      
--BEGIN      
--drop table AST_MIGRAR      
--END      
-------------------------------------------------------------------------------------------------------------------    
set @CuryID ='DOL'    
set @CuryRate  = 3.998
  
--SELECT * INTO AST_MIGRAR FROM (    
--select R.RefNbr,S.CuryDocBal,R.DocType,S.S4Future12,S.InvcNbr,s.VendId ,S.DocBal from (    
--SELECT DISTINCT  vr_03681d."refnbr",vr_03681d.InvcNbr,    
--CASE WHEN ROUND((vr_03681d.Cur+vr_03681d.Past00+vr_03681d.Past01+vr_03681d.Past02+vr_03681d.Over02 ),2)  < 0 THEN     
--ROUND((vr_03681d.Cur+vr_03681d.Past00+vr_03681d.Past01+vr_03681d.Past02+vr_03681d.Over02 ),2) *-1   ELSE    
--ROUND((vr_03681d.Cur+vr_03681d.Past00+vr_03681d.Past01+vr_03681d.Past02+vr_03681d.Over02 ),2) END TOTAL,vr_03681d.doctype    
--FROM [ALTOMAYO-WEB]."AM2021APP"."dbo"."vr_03681d" vr_03681d WHERE     
----((vr_03681d.aracct like '178101%') OR    
--((vr_03681d.APAcct = '421213') AND (vr_03681d.curyid = 'DOL') --and vr_03681d.DocType IN ('VO')  
  
--)      
--)R     
--INNER JOIN [ALTOMAYO-WEB]."AM2021APP"."dbo"."APDOC" S ON R.RefNbr = S.RefNbr  AND S.DocType = R.DocType  and s.InvcNbr = r.invcnbr    
--)X WHERE CuryDocBal > 0.9  --AND RefNbr ='011455'    
    
-- DELETE FROM RPTRUNTIME
           
    
PRINT     
'TABLA TEMPORAL CARGADA'    
     
    
set @Acct  ='421213'    
DECLARE CUR_MITABLA CURSOR FOR  
  
--SELECT * FROM AST_MIGRAR    
select TOP 5 * from  AST_MIGRAR  a  WHERE DocType = 'AD'  and a.InvcNbr not in (select InvcNbr from apdoc where VendId =a.VendId) --and invcnbr in ('0000026988')

--SELECT * FROM APDoc WHERE InvcNbr IN ('0000000290','0000000516')

OPEN CUR_MITABLA     
FETCH CUR_MITABLA INTO @refnbr,@Monto,@Doctype,@S4FUTURE12,@invcnbr,@VendId,@NOVALE    
    
 WHILE (@@FETCH_STATUS = 0 )    
 BEGIN -- WHILE      
      ----------------------------------------------------------------------------------------------------------------------    
   -- D PARA NOTAS DE CREDITO     
   -- C PARA VENTAS NORMAL     
   select  @NewRefnbr =( SELECT  right('000000' + cast(isnull( max(LastRefNbr),0) + 1 as varchar),6)  FROM APSetup )     
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
 CuryTxblTot02,CuryTxblTot03,  Cycle,  DfltDetail, DirectDeposit, DiscBal, DiscDate, DiscTkn, Doc1099, round( @Monto * @CuryRate,2), DocClass, docdate,DocDesc, 'VO', DueDate, Econfirm, Estatus, InstallNbr,    
 InvcDate, @invcnbr, LineCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, MasterDocNbr, NbrCycle,  NoteId, OpenDoc, round( @Monto * @CuryRate,2),  PayDate, PayHoldDesc, PC_Status, PerClosed,'202112','202112', PmtAmt, PmtID, PmtMethod,    
      PONbr,    
    PrePay_RefNbr,    
 ProjectID, @NewRefnbr,Retention, RGOLAmt, 0 rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, @S4FUTURE12,Selected,    
  Status, '000000000000',  TaxCntr00, TaxCntr01, TaxCntr02, TaxCntr03, '', '', '', '', taxtot00, TaxTot01, TaxTot02, TaxTot03, Terms, 0, TxblTot01, TxblTot02, TxblTot03, User1, User2, User3, User4,    
   User5, (CASE WHEN  @Doctype  ='AD' THEN 'OD' ELSE   User6 END ) User6, User7, User8 ,vendid    
from  [ALTOMAYO-WEB].[AM2021APP].[dbo].[Apdoc] where RefNbr  = @refnbr AND DOCBAL > 0 and InvcNbr = @Invcnbr and vendid  = @VendId    
--select * from apdoc where perpost = '201812' and acct = '471001'    
PRINT 'SE INSERTÓ ARDOC DOCUMENTO ......... : '  + CAST(@REFNBR AS VARCHAR)    
    
    
    
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
 0, 0, 0, 0,'Y', 'INAFECTO','', '', '', '','', Round(@Monto * @CuryRate,2), TranClass, TranDate, 'SALDO INICIAL','VO',TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitPrice,     
 User1, User2, 0, 0, 0, 'AFEC1', User7, User8, VendId, WONbr, (CASE WHEN @Doctype ='AD' THEN  'X' ELSE  WOStepNbr  END )WOStepNbr    
from  [ALTOMAYO-WEB].[AM2021APP].[dbo].[Aptran] where RefNbr  = @refnbr and Acct = '421213' AND VendId  = @VendId and ExtRefNbr = @Invcnbr  and TRANAMT > 0  and trantype <>'HC'    
    
--select * from APTRAN where perpost = '201812' and acct   = '471001'    
--select * from APTRAN where perpost = '201812' and batnbr = '000304'         
--select RefNbr,InvcNbr, * from apdoc where perpost = '201812' and batnbr = '000304'    
        
PRINT 'SE INSERTÓ ARTRAN DOCUMENTO ......... : '+ CAST(@REFNBR AS VARCHAR)    
update APSetup set LastRefNbr  =@NewRefnbr    
-------------------------------------------------------------------------------    
 FETCH CUR_MITABLA INTO @refnbr,@Monto,@Doctype,@S4FUTURE12,@invcnbr,@VendId,@NOVALE    
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
from AM2021APP..batch where module  = 'AP'    
    
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
 (SELECT RefNbr FROM   APTRAN WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X'  )    
      
 UPDATE A SET TRANTYPE  ='AD' FROM APTRAN A WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X'    
    
 UPDATE A  SET  A.TRANTYPE  ='AD' FROM GLTRAN A WHERE BatNbr  = @NewBatnbr AND RefNbr IN     
 (SELECT RefNbr FROM   APTRAN WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X'  ) AND MODULE ='AP'    
     
 --SELECT RefNbr FROM APTRAN WHERE BatNbr  = @NewBatnbr AND WOStepNbr  ='X'      
 ----ACTUALIZAMOS TIPOS DE DOCUMENTOS    
 -- UPDATE H SET H.DocType  = A.DocType    
 -- FROM APDOC H    
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
    
 END         
  -----ACTUALIZAMOS CORRELATIVO DE GLTRAN   -----      
 declare @Batnbr char(6)     
 set @Batnbr  = ''     
 select @Batnbr  = ( select ltrim(rtrim(isnull(max(batnbr),'000000'))) from Batch   )     
 update GLSetup set LastBatNbr  = @Batnbr    
      
 -----------------------------------------------    
END    
