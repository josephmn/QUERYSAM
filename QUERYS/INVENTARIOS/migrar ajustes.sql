--------- MIGRAR AJUSTES --------
SP_HELPTEXT  MigrarAjustes 

SP_HELPTEXT MIGRAROC2
  idAlmacenDestino IN (@idlocal ,'LIM01CEN000000000049')    
ALTER proc MigrarAjustes    
@identificador int,    
@fechaNegocio as datetime    
as    
    
declare @LastBatNbr char(6)    
declare @CostoExtendido decimal(16,2)    
declare @sumCantidad decimal(16,2)    
--declare @identificador int     
declare @siteid char(15)    
declare @sufijo char(2)    
declare @idlocal char(20)    
    
set @idlocal = (select id from SGRPAM.SGRPAM2016.gen.local where identificador = @identificador )    
    
    
  declare @idmnov varchar(20)    
  declare @idAlmacenDestino varchar(20)    
  declare @DocumentoCliente varchar(15)    
  declare @TipoMovimiento varchar(20)    
  DECLARE Cur1 CURSOR FOR     
  select id,idAlmacenDestino,(select ltrim(rtrim(descripcion)) from SGRPAM.SGRPAM2016.GEN.TipoMovimiento where id =IdTipoMovimiento) TipoMovimiento    
  FROM SGRPAM.SGRPAM2016.INV.AjusteInventario M     
  where idAlmacenDestino IN  ('LIM01CEN000000000049',@idlocal)  
  and fechanegocio = @fechaNegocio  and m.activo =1    
  AND m.ID+'J' collate Modern_Spanish_CI_AS  NOT IN (select user1 from batch )    
  --id in('CFCUZCO2000000000040','CFCUZCO2000000000021')    
      
      
  OPEN Cur1    
  FETCH NEXT FROM Cur1 INTO @idmnov,@idAlmacenDestino,@TipoMovimiento    
  WHILE ( @@fetch_status <> -1 )    
  BEGIN    
    
if rtrim(ltrim(@TipoMovimiento))='ENTRADA DE INSUMO'    
set @sufijo = 'EI'    
else    
set @sufijo = 'AI'    
    
    
    
    
set @CostoExtendido= (select sum(CostoExtendido) FROM SGRPAM.SGRPAM2016.INV.DetalleAjusteInventario where idajusteInventario = @idmnov and activo =1)    
set @sumCantidad= (select sum(Cantidad) FROM SGRPAM.SGRPAM2016.INV.DetalleAjusteInventario where idajusteInventario = @idmnov and activo =1)    
set @identificador = (select identificador from SGRPAM.SGRPAM2016.gen.local where id = @idAlmacenDestino )    
set @siteid = (select siteid from cf_tiendasite where numtienda = @identificador)    
    
      
set @LastBatNbr = (select LastBatNbr+1 from INSETUP)    
--select @LastPONbr    
set @LastBatNbr = right('000000'+ rtrim(@LastBatNbr),6)    
--select @LastPONbr    
select  @LastBatNbr    
    
BEGIN TRANSACTION -- O solo BEGIN TRAN    
    
BEGIN TRY    
    
insert into dbo.Batch(Acct, AutoRev, AutoRevCopy, BalanceType, BankAcct, BankSub, BaseCuryID, BatNbr, BatType, clearamt, Cleared, CpnyID, Crtd_DateTime,     
Crtd_Prog, Crtd_User, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDepositAmt, CuryDrTot, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, Cycle,     
DateClr, DateEnt, DepositAmt, Descr, DrTot, EditScrnNbr, GLPostOpt, JrnlType, LedgerID, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NbrCycle, NoteID,     
OrigBatNbr, OrigCpnyID, OrigScrnNbr, PerEnt, PerPost, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08,     
S4Future09, S4Future10, S4Future11, S4Future12, Status, Sub, User1, User2, User3, User4, User5, User6, User7, User8)    
    
select    
Acct='', AutoRev=0, AutoRevCopy=0, BalanceType='', BankAcct='', BankSub='', BaseCuryID='SOL',     
BatNbr=@LastBatNbr, BatType='N', clearamt=0, Cleared=0, CpnyID='ALTOMAYO', Crtd_DateTime=M.fechaCrea, Crtd_Prog='10030', Crtd_User='SYSADMIN',     
CrTot=@CostoExtendido, CtrlTot=@CostoExtendido, CuryCrTot=0, CuryCtrlTot=0, CuryDepositAmt=0, CuryDrTot=0, CuryEffDate='1900-01-01 00:00:00', CuryId='SOL', CuryMultDiv='M',     
CuryRate=1, CuryRateType='', Cycle=0, DateClr='1900-01-01 00:00:00', DateEnt='1900-01-01 00:00:00', DepositAmt=0, Descr='',     
DrTot=@sumCantidad, EditScrnNbr='10030', GLPostOpt='', JrnlType='IN', LedgerID='', LUpd_DateTime=M.fechaCrea, LUpd_Prog='10030', LUpd_User='SYSADMIN', Module='IN',     
NbrCycle=0, NoteID=0, OrigBatNbr='', OrigCpnyID='', OrigScrnNbr='', PerEnt=M.Periodo, PerPost=M.Periodo, Rlsed=0, S4Future01='', S4Future02='',     
S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00', S4Future08='1900-01-01 00:00:00', S4Future09=0, S4Future10=0,     
S4Future11='', S4Future12='', Status='B', Sub='', User1=@idmnov+'J', User2='', User3=0, User4=0, User5='', User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00'    
FROM     
SGRPAM.SGRPAM2016.INV.AjusteInventario M     
where id =@idmnov    
    
--select *from batch where batnbr ='008628'  and module ='IN'    
    
insert into dbo.INTran(Acct, AcctDist, ARLineID, ARLineRef, BatNbr, BMICuryID, BMIEffDate, BMIExtCost, BMIMultDiv, BMIRate, BMIRtTp, BMITranAmt, BMIUnitPrice,     
CmmnPct, CnvFact, COGSAcct, COGSSub, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DrCr, Excpt, ExtCost, ExtRefNbr, FiscYr, ID, InsuffQty, InvtAcct,     
InvtID, InvtMult, InvtSub, JrnlType, KitID, LineID, LineNbr, LineRef, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, OvrhdAmt, OvrhdFlag, PC_Flag,     
PC_ID, PC_Status, PerEnt, PerPost, ProjectID,Qty, QtyUnCosted, RcptDate, RcptNbr, ReasonCd, RefNbr, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04,     
S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShortQty, SiteID, SlsperID, SpecificCostID, Sub, TaskID,     
ToSiteID, ToWhseLoc, TranAmt, TranDate, TranDesc, TranType, UnitDesc, UnitMultDiv, UnitPrice, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)    
    
select Acct = I.PPVAcct, AcctDist=0, ARLineID=0, ARLineRef='', BatNbr=@LastBatNbr, BMICuryID='', BMIEffDate='1900-01-01 00:00:00', BMIExtCost=0,     
BMIMultDiv='M', BMIRate=1, BMIRtTp='', BMITranAmt=0, BMIUnitPrice=0, CmmnPct=0, CnvFact=1, COGSAcct='', COGSSub='', CostType='', CpnyID='ALTOMAYO  ',     
Crtd_DateTime=M.fechaCrea, Crtd_Prog='10030', Crtd_User='SYSADMIN', DrCr='C', Excpt=0, ExtCost=CostoExtendido, ExtRefNbr='', FiscYr=year(M.fechaCrea), ID='',     
InsuffQty=0, InvtAcct=I.InvtAcct, InvtID='I'+P.codigoProducto, InvtMult=1, InvtSub=I.InvtSub, JrnlType='IN', KitID='', LineID=ROW_NUMBER() OVER(ORDER BY codigoProducto DESC),     
LineNbr=ROW_NUMBER() OVER(ORDER BY codigoProducto DESC), LineRef=left('0000'+ltrim(ROW_NUMBER() OVER(ORDER BY codigoProducto DESC)),5),     
LotSerCntr=0, LUpd_DateTime=M.fechaCrea, LUpd_Prog='10030', LUpd_User='SYSADMIN', NoteID=0, OvrhdAmt=0, OvrhdFlag=0, PC_Flag='', PC_ID='', PC_Status='',     
PerEnt=M.Periodo, PerPost=M.Periodo, ProjectID='', Qty=Cantidad, QtyUnCosted=0, RcptDate='1900-01-01 00:00:00', RcptNbr='',     
ReasonCd=(select ltrim(rtrim(abreviatura)) from SGRPAM.SGRPAM2016.inv.Ajustemotivo where id =IdMotivoAjuste),     
 RefNbr = @sufijo+ Numero, Rlsed=0, S4Future01='', S4Future02='', S4Future03=0, S4Future04=0, S4Future05=0, S4Future06=0, S4Future07='1900-01-01 00:00:00',     
S4Future08='1900-01-01 00:00:00', S4Future09=0, S4Future10=0, S4Future11='', S4Future12='', ShortQty=0,     
SiteID=@siteid, SlsperID='', SpecificCostID='', Sub='0000000RE000', TaskID='', ToSiteID='', ToWhseLoc='', TranAmt=CostoExtendido, TranDate=FechaNegocio,     
TranDesc=left(I.descr,30), TranType='AJ', UnitDesc=(select Abreviatura  from SGRPAM.SGRPAM2016.GEN.UnidadMedida where id = idUnidadMedida), UnitMultDiv='M',     
UnitPrice=CostoUnitario, User1=@idmnov+'J', User2='', User3=0, User4=0, User5='', User6='', User7='1900-01-01 00:00:00', User8='1900-01-01 00:00:00', WhseLoc ='BUENESTADO'    
FROM     
SGRPAM.SGRPAM2016.INV.AjusteInventario M     
INNER JOIN SGRPAM.SGRPAM2016.INV.DetalleAjusteInventario D  ON M.Id = D.idajusteInventario    
inner join SGRPAM.SGRPAM2016.GEN.Producto P on D.idproducto = P.id      
inner join inventory I on 'I'+P.codigoProducto = I.invtid collate Modern_Spanish_CI_AS      
where idajusteInventario =@idmnov  and d.activo =1      
    
--select *from intran where batnbr ='008628'     
    
    
    
update B set CrTot = ExtCost , CtrlTot = ExtCost , DrTot = Qty    
from batch B inner join     
(    
select batnbr,sum(round(ExtCost,2)) ExtCost,sum(Qty)Qty     
from intran where batnbr = @LastBatNbr    
group by batnbr    
)X on B.batnbr = X.batnbr    
where module ='IN'    
    
    
update INSETUP set  LastBatNbr =@LastBatNbr      
    
PRINT 'Se genero con exito'    
COMMIT TRANSACTION -- O solo COMMIT    
    
END TRY    
    
BEGIN CATCH    
    
/* Hay un error, deshacemos los cambios*/     
    
ROLLBACK TRANSACTION -- O solo ROLLBACK    
    
PRINT 'Se ha producido un error!'    
    
END CATCH    
    
   FETCH NEXT FROM Cur1 INTO @idmnov,@idAlmacenDestino,@TipoMovimiento    
  END    
    
  CLOSE Cur1    
    
  DEALLOCATE Cur1    
    
/*    
select *from     
SGRPAM.SGRPAM2016.INV.DetalleAjusteInventario M     
where idajusteInventario like'%CFCUZCO2000000000038%'    
    
select *from     
SGRPAM.SGRPAM2016.INV.AjusteInventario M     
where id like'%CFCUZCO2000000000038%'    
    
select *from inventory where invtid in (select invtid from intran where batnbr ='010735')    
    
select *from SGRPAM.SGRPAM2016.GEN.TipoMovimiento    
     
 008628    
select *from batch where batnbr ='008631'  and module ='IN'    
select *from intran where batnbr ='008631'     
select *from gltran where batnbr ='008631'  and module ='IN'    
    
    
sp_helptext reasoncode_all    
Select * from ReasonCode     
    
*/    
    
  