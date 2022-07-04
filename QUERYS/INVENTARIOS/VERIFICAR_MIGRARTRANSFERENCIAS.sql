 sp_helptext MigrarTransferencias
--select id,idAlmacenOrigen,idAlmacenDestino,DocumentoClienteProveedor,* from SGRPAM.SGRPAM2015.GEN.Movimiento M where m.NumeroCorrelativo ='00000004'  
--select id,idAlmacenOrigen,idAlmacenDestino,DocumentoClienteProveedor,* from SGRPAM.SGRPAM2015.GEN.V_Movimiento M where m.NumeroCorrelativo ='00000004'  
--sp_helptext 'GEN.AM_EntradaxTransferencia_Listar'  
--sp_helptext MigrarTransferencias  '2015-11-20'  

CREATE proc MigrarTransferencias  
@fechaNegocio as datetime  
as  
  
declare @LastBatNbr char(6)  
declare @LstTrnsfrDocNbr char(6)  
declare @CostoExtendido decimal(16,2)  
declare @sumCantidad decimal(16,2)  
declare @identificador int   
declare @identificadorDestino int   
declare @siteid char(15)  
declare @siteidDestino char(15)  
declare @sufijo char(2)  
  
  
  
  
  declare @idmnov varchar(20)  
  declare @idAlmacenOrigen varchar(20)  
  declare @idAlmacenDestino varchar(20)  
  declare @DocumentoCliente varchar(15)  
  declare @NumeroCorrelativo varchar(20)  
  DECLARE Cur1 CURSOR FOR   
  select id,idAlmacenOrigen,idAlmacenDestino,DocumentoClienteProveedor,m.NumeroCorrelativo   
  FROM SGRPAM.SGRPAM2015.GEN.Movimiento M where fechaNegocio = @fechaNegocio and m.activo =1 --and m.NumeroCorrelativo ='00000004'  
  and IdTipoMovimiento in ('LIM01CEN000000000008') --and id ='CFCUZCO1000000000038'  
  AND m.ID+'T' collate Modern_Spanish_CI_AS  NOT IN (select user1 from batch )  
  OPEN Cur1  
  FETCH NEXT FROM Cur1 INTO @idmnov,@idAlmacenOrigen,@idAlmacenDestino,@DocumentoCliente,@NumeroCorrelativo  
  WHILE ( @@fetch_status <> -1 )  
  BEGIN  
  
set @LastBatNbr = (select LastBatNbr+1 from INSETUP)  
set @LastBatNbr = right('000000'+ rtrim(@LastBatNbr),6)  
  
set @LstTrnsfrDocNbr = (select LstTrnsfrDocNbr+1 from INSETUP)  
set @LstTrnsfrDocNbr = right('000000'+ rtrim(@LstTrnsfrDocNbr),6)  
  
select  @LastBatNbr,@LstTrnsfrDocNbr  
  
  
  
  
set @CostoExtendido= (select sum(CostoExtendido) FROM SGRPAM.SGRPAM2015.GEN.DetalleMovimiento where idmovimiento = @idmnov and activo =1)  
set @sumCantidad= (select sum(Cantidad) FROM SGRPAM.SGRPAM2015.GEN.DetalleMovimiento where idmovimiento = @idmnov and activo =1)  
  
set @identificador = (select identificador from SGRPAM.SGRPAM2015.gen.local where id = @idAlmacenOrigen )  
set @identificadorDestino = (select identificador from SGRPAM.SGRPAM2015.gen.local where id = @idAlmacenDestino )  
set @siteid = (select siteid from cf_tiendasite where numtienda = @identificador)  
set @siteidDestino = (select siteid from cf_tiendasite where numtienda = @identificadorDestino)  
  
  
  
BEGIN TRANSACTION -- O solo BEGIN TRAN  
  
BEGIN TRY  
  
insert into dbo.Batch(Acct, AutoRev, AutoRevCopy, BalanceType, BankAcct, BankSub, BaseCuryID, BatNbr, BatType, clearamt, Cleared, CpnyID, Crtd_DateTime,   
Crtd_Prog, Crtd_User, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDepositAmt, CuryDrTot, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, Cycle,   
DateClr, DateEnt, DepositAmt, Descr, DrTot, EditScrnNbr, GLPostOpt, JrnlType, LedgerID, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NbrCycle, NoteID,   
OrigBatNbr, OrigCpnyID, OrigScrnNbr, PerEnt, PerPost, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08,   
S4Future09, S4Future10, S4Future11, S4Future12, Status, Sub, User1, User2, User3, User4, User5, User6, User7, User8)  
  
select  
Acct='', AutoRev=0, AutoRevCopy=0, BalanceType='', BankAcct='', BankSub='', BaseCuryID='SOL',   
BatNbr=@LastBatNbr, BatType='N', clearamt=0, Cleared=0, CpnyID='ALTOMAYO', Crtd_DateTime=M.fechaCrea, Crtd_Prog='10040', Crtd_User='SYSADMIN',   
CrTot=@CostoExtendido, CtrlTot=@CostoExtendido, CuryCrTot=0, CuryCtrlTot=0, CuryDepositAmt=0, CuryDrTot=0, CuryEffDate='1900-01-01 00:00:00', CuryId='SOL', CuryMultDiv='M',   
CuryRate=1, CuryRateType='', Cycle=0, DateClr='1900-01-01 00:00:00', DateEnt='1900-01-01 00:00:00', DepositAmt=0, Descr='',   
DrTot=@sumCantidad, EditScrnNbr='10040', GLPostOpt='', JrnlType='IN', LedgerID='', LUpd_DateTime=M.fechaCrea, LUpd_Prog='10040', LUpd_User='SYSADMIN', Module='IN',   
NbrCycle=0, NoteID=0, OrigBatNbr='', OrigCpnyID='', OrigScrnNbr='', PerEnt=M.Periodo, PerPost=M.Periodo, Rlsed=0, S4Future01='', S4Future02='',   
S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00', S4Future08='1900-01-01 00:00:00', S4Future09=0, S4Future10=0,   
S4Future11='', S4Future12='', Status='B', Sub='', User1=@idmnov+'T', User2='', User3=0, User4=0, User5='', User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00'  
FROM SGRPAM.SGRPAM2015.GEN.Movimiento M    
where m.id =@idmnov and m.activo =1  
  
  
--select *from batch where batnbr ='000108'  and module ='IN'  
--SELECT   
--AckDateTime='1900-01-01 00:00:00', BatNbr='', BillShipAddr=0, BlktExprDate='1900-01-01 00:00:00', BlktPONbr='', Buyer='RUBEN',   
--CertCompl=0, ConfirmTo='', CpnyID='ALTOMAYO  ', Crtd_DateTime=FECHA, Crtd_Prog='04250', Crtd_User='SYSADMIN', CurrentNbr='', CuryEffDate=FECHA,   
--CuryFreight=0, CuryId=(SELECT NombreCorto  FROM SGRPAM.SGRPAM2015.GEN.Moneda WHERE ID = idmoneda), CuryMultDiv='M', CuryPOAmt=@CostoExtendido, CuryPOItemTotal=0, CuryRate=1,   
--CuryRateType='VENTA', CuryRcptTotAmt=0, CuryTaxTot00=0, CuryTaxTot01=0, CuryTaxTot02=0, CuryTaxTot03=0, CuryTxblTot00=0, CuryTxblTot01=0, CuryTxblTot02=0,  
--CuryTxblTot03=0, EDI=0, FOB='', Freight=0, LastRcptDate='1900-01-01 00:00:00', LineCntr=0, LUpd_DateTime=fechamodifica, LUpd_Prog='04250', LUpd_User='SYSADMIN',   
--NoteID=0, OpenPO=0, PC_Status='', PerClosed='', PerEnt=periodo, POAmt=@CostoExtendido, PODate=fecha, POItemTotal=0, PONbr=@LastPONbr, POType='OR', ProjectID='', PrtBatNbr='',   
--PrtFlg=0, RcptStage='N', RcptTotAmt=0, ReqNbr='', S4Future01='', S4Future02='', S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00',   
--S4Future08='1900-01-01 00:00:00', S4Future09=0, S4Future10=0, S4Future11='', S4Future12='', ShipAddr1=left(DireccionCompleta,30),   
--ShipAddr2=replace(DireccionCompleta,left(DireccionCompleta,30),''), ShipAddrID='', ShipAttn='', ShipCity='', ShipCountry='PE', ShipEmail='', ShipFax='', ShipName='ALTOMAYO PERU SAC', ShipPhone='', ShipState='',   
--ShipVia='', ShipZip='', Status='O', TaxCntr00=0, TaxCntr01=0, TaxCntr02=0, TaxCntr03=0, TaxID00='IGV1', TaxID01='', TaxID02='', TaxID03='', TaxTot00=0,   
--TaxTot01=0, TaxTot02=0, TaxTot03=0, Terms=(select Abreviatura  from SGRPAM.SGRPAM2015.GEN.PagoCondicion where id = CondicionPago), TxblTot00=0, TxblTot01=0, TxblTot02=0,   
--TxblTot03=0, User1='', User2='', User3=0, User4=0, User5='', User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00',   
--VendAddr1='', VendAddr2='', VendAddrID='DEFAULT', VendAttn='', VendCity='',   
--VendCountry='', VendEmail='', VendFax='', VendId=DocumentoClienteProveedor, VendName=NombreClienteProveedor, VendPhone='', VendState='', VendZip='', VouchStage=''  
--FROM SGRPAM.SGRPAM2015.GEN.Movimiento M  inner join SGRPAM.SGRPAM2015.GEN.Direccion  D on M.IdDireccionFactura = D.id  
--where m.id =@idmnov and m.activo =1  
  
insert into dbo.INTran(Acct, AcctDist, ARLineID, ARLineRef, BatNbr, BMICuryID, BMIEffDate, BMIExtCost, BMIMultDiv, BMIRate, BMIRtTp, BMITranAmt, BMIUnitPrice,   
CmmnPct, CnvFact, COGSAcct, COGSSub, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DrCr, Excpt, ExtCost, ExtRefNbr, FiscYr, ID, InsuffQty, InvtAcct,   
InvtID, InvtMult, InvtSub, JrnlType, KitID, LineID, LineNbr, LineRef, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, OvrhdAmt, OvrhdFlag, PC_Flag,   
PC_ID, PC_Status, PerEnt, PerPost, ProjectID,Qty, QtyUnCosted, RcptDate, RcptNbr, ReasonCd, RefNbr, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04,   
S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShortQty, SiteID, SlsperID, SpecificCostID, Sub, TaskID,   
ToSiteID, ToWhseLoc, TranAmt, TranDate, TranDesc, TranType, UnitDesc, UnitMultDiv, UnitPrice, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)  
  
select Acct = (select INClearingAcct from insetup), AcctDist=0, ARLineID=0, ARLineRef='', BatNbr=@LastBatNbr, BMICuryID='', BMIEffDate='1900-01-01 00:00:00', BMIExtCost=0,   
BMIMultDiv='M', BMIRate=1, BMIRtTp='', BMITranAmt=0, BMIUnitPrice=0, CmmnPct=0, CnvFact=1, COGSAcct='', COGSSub='', CostType='', CpnyID='ALTOMAYO  ',   
Crtd_DateTime=M.fechaCrea, Crtd_Prog='10040', Crtd_User='SYSADMIN', DrCr='D', Excpt=0, ExtCost=CostoExtendido, ExtRefNbr='', FiscYr=year(M.fechaCrea), ID='',   
InsuffQty=0, InvtAcct=I.InvtAcct, InvtID='I'+P.codigoProducto, InvtMult=-1, InvtSub=I.InvtSub, JrnlType='IN', KitID='', LineID=ROW_NUMBER() OVER(ORDER BY codigoProducto DESC),   
LineNbr=ROW_NUMBER() OVER(ORDER BY codigoProducto DESC), LineRef=left('0000'+ltrim(ROW_NUMBER() OVER(ORDER BY codigoProducto DESC)),5),   
LotSerCntr=0, LUpd_DateTime=M.fechaCrea, LUpd_Prog='10040', LUpd_User='SYSADMIN', NoteID=0, OvrhdAmt=0, OvrhdFlag=0, PC_Flag='', PC_ID='', PC_Status='',   
PerEnt=M.Periodo, PerPost=M.Periodo, ProjectID='', Qty=Cantidad, QtyUnCosted=0, RcptDate='1900-01-01 00:00:00', RcptNbr='',   
ReasonCd='',   
 RefNbr = M.serie+ Numero, Rlsed=0, S4Future01='', S4Future02='', S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00',   
S4Future08='1900-01-01 00:00:00', S4Future09=0, S4Future10=0, S4Future11='', S4Future12='', ShortQty=0,   
SiteID=@siteid, SlsperID='', SpecificCostID='', Sub='0000000RE000', TaskID='', ToSiteID=@siteidDestino, ToWhseLoc='', TranAmt=CostoExtendido, TranDate=FechaNegocio,   
TranDesc=left(I.descr,30), TranType='TR', UnitDesc=(select Abreviatura  from SGRPAM.SGRPAM2015.GEN.UnidadMedida where id = idUnidadMedida), UnitMultDiv='M',   
UnitPrice=CostoUnitario, User1=@idmnov+'T', User2='', User3=0, User4=0, User5='', User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00', WhseLoc ='BUENESTADO'  
  
FROM   
SGRPAM.SGRPAM2015.GEN.Movimiento M  
inner join SGRPAM.SGRPAM2015.GEN.DetalleMovimiento D on M.id = D.idMovimiento  
inner join SGRPAM.SGRPAM2015.GEN.Producto P on D.idproducto = P.id  
inner join inventory I on 'I'+P.codigoProducto = I.invtid collate Modern_Spanish_CI_AS   
where idmovimiento = @idmnov and d.activo =1  
  
--select *from intran where batnbr ='000108'   
  
insert into trnsfrdoc (BatNbr, Comment, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, ExpectedDate, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID,   
RcptDate, RcptNbr, RefNbr, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10,   
S4Future11, S4Future12, ShipViaID, SiteID, Source, Status, ToSiteID, TranDate, TransferType, TrnsfrDocNbr, User1, User2, User3, User4, User5, User6,   
User7, User8)  
  
select BatNbr=@LastBatNbr, Comment='', CpnyID='ALTOMAYO', Crtd_DateTime=M.fechaCrea, Crtd_Prog='10040   ', Crtd_User='SYSADMIN  ', ExpectedDate=M.fechaCrea,   
LUpd_DateTime=M.fechaCrea, LUpd_Prog='10400SQL', LUpd_User='SYSADMIN  ', NoteID=0, RcptDate=M.fechaCrea, RcptNbr=@NumeroCorrelativo, RefNbr=@NumeroCorrelativo, S4Future01='',   
S4Future02='', S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00', S4Future08='1900-01-01 00:00:00',   
S4Future09=0, S4Future10=0, S4Future11='', S4Future12='', ShipViaID='', SiteID=@siteid, Source='IN', Status='I', ToSiteID=@siteidDestino, TranDate=FechaNegocio, TransferType=2,  
TrnsfrDocNbr=@LstTrnsfrDocNbr, User1='', User2='', User3=0, User4=0, User5=@NumeroCorrelativo, User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00'   
FROM SGRPAM.SGRPAM2015.GEN.Movimiento M    
where m.id =@idmnov and m.activo =1  
  
  
  
--SELECT   
--AddlCostPct=0, AllocCntr=0, AlternateID='', AltIDType='', BlktLineId=0, BlktLineRef='', Buyer='', CnvFact=1, CostReceived=0, CostReturned=0, CostVouched=0,   
--Crtd_DateTime=d.fechacrea, Crtd_Prog='04250', Crtd_User='SYSADMIN', CuryCostReceived=0, CuryCostReturned=0, CuryCostVouched=0, CuryExtCost=CostoExtendido,   
--CuryId='SOL', CuryMultDiv='M', CuryRate=1, CuryTaxAmt00=0, CuryTaxAmt01=0, CuryTaxAmt02=0, CuryTaxAmt03=0, CuryTxblAmt00=0, CuryTxblAmt01=0, CuryTxblAmt02=0,   
--CuryTxblAmt03=0, CuryUnitCost= CostoUnitario, ExtCost=CostoExtendido, ExtWeight=0, InvtID= 'I'+P.codigoProducto, KitUnExpld=0, Labor_Class_Cd='', LineID=ROW_NUMBER() OVER(ORDER BY codigoProducto DESC), LineNbr=ROW_NUMBER() OVER(ORDER BY codigoProducto D
  
--ESC),   
--LineRef=left('0000'+ltrim(ROW_NUMBER() OVER(ORDER BY codigoProducto DESC)),5), LUpd_DateTime=d.fechacrea, LUpd_Prog='04250', LUpd_User='SYSADMIN', NoteID=0, OpenLine=1, OrigPOLine=1, PC_Flag='Y', PC_ID='', PC_Status='O',   
--PONbr=@LastPONbr, POType='OR', ProjectID='', PromDate=FECHAprometida, PurAcct=InvtAcct, PurchaseType='GI', PurchUnit=(select Abreviatura  from SGRPAM.SGRPAM2015.GEN.UnidadMedida where id = idUnidadMedida),   
--PurSub=InvtSub, QtyOrd= Cantidad, QtyRcvd=0, QtyReturned=0, QtyVouched=0, RcptPctAct='N', RcptPctMax=100, RcptPctMin=100, RcptStage='N', ReasonCd='',   
--ReqdDate= fechaRequerida, ReqNbr='', S4Future01='', S4Future02='', S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00',   
--S4Future08='1900-01-01 00:00:00', S4Future09=0, S4Future10=0, S4Future11='', S4Future12='', ShipAddr1='', ShipAddr2='', ShipAddrID='', ShipCity='',   
--ShipCountry='', ShipName='', ShipState='', ShipViaID='', ShipZip='', SiteId=@siteid, SOLineRef='', SOOrdNbr='', SOSchedRef='', StepNbr=0, TaskID='',   
--TaxAmt00=0, TaxAmt01=0, TaxAmt02=0, TaxAmt03=0, TaxCalced='', TaxCat=(case when afecto =1 then 'AFECTO' else 'INAFECTO' end), TaxID00='IGV1', TaxID01='',   
--TaxID02='', TaxID03='', TaxIdDflt='', TranDesc=left(DESCRIPCION,60), TxblAmt00=0, TxblAmt01=0, TxblAmt02=0, TxblAmt03=0, UnitCost=CostoUnitario,   
--UnitMultDiv='M', UnitWeight=0, User1='', User2='', User3=0, User4=0, User5='', User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00',   
--VouchStage='N', WOBOMSeq=0, WOCostType='', WONbr='', WOStepNbr=0  
  
--FROM SGRPAM.SGRPAM2015.GEN.DetalleMovimiento D  
--inner join SGRPAM.SGRPAM2015.GEN.Producto P on D.idproducto = P.id  
--inner join inventory I on 'I'+P.codigoProducto = I.invtid collate Modern_Spanish_CI_AS   
--where idmovimiento = @idmnov and d.activo =1  
  
  
update INSETUP set  LastBatNbr =@LastBatNbr,LstTrnsfrDocNbr=@LstTrnsfrDocNbr  from INSETUP  
  
PRINT 'Se genero con exito'  
COMMIT TRANSACTION -- O solo COMMIT  
  
END TRY  
  
BEGIN CATCH  
  
/* Hay un error, deshacemos los cambios*/   
  
ROLLBACK TRANSACTION -- O solo ROLLBACK  
  
PRINT 'Se ha producido un error!'  
  
END CATCH  
  
   FETCH NEXT FROM Cur1 INTO @idmnov,@idAlmacenOrigen,@idAlmacenDestino,@DocumentoCliente,@NumeroCorrelativo  
  END  
  
  CLOSE Cur1  
  
  DEALLOCATE Cur1  
  
/*  
select *from   
SGRPAM.SGRPAM2015.INV.DetalleAjusteInventario M   
where idajusteInventario like'%CFCUZCO2000000000038%'  
  
select *from   
SGRPAM.SGRPAM2015.INV.AjusteInventario M   
where id like'%CFCUZCO2000000000038%'  
  
select *from inventory where invtid in (select invtid from intran where batnbr ='008634')  
select *from inventoryadg where invtid in (select invtid from intran where batnbr ='008634')  
  
select *from SGRPAM.SGRPAM2015.GEN.TipoMovimiento  
   
008628  
select *from batch where batnbr ='008634'  and module ='IN'  
select *from intran where batnbr ='008634'   
select *from gltran where batnbr ='008634'  and module ='IN'  
  
select INClearingAcct,* from insetup  
  
sp_helptext reasoncode_all  
Select * from ReasonCode   
  
  
SELECT DISTINCT USER1 FROM INTRAN  
SELECT DISTINCT USER1 FROM BATCH  
SELECT DISTINCT USER1 FROM PurchOrd  
SELECT DISTINCT USER1 FROM PurOrdDet  
  
  
*/  
  





