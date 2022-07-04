
-- SP_HELPTEXT ASP_REVISIONACCT_CUZCO
--ASP_REVISIONACCT_CUZCO '201901'

EXEC ASP_REVISIONACCT_CUZCO '201902'

ALTER PROC ASP_REVISIONACCT_CUZCO
@Perpost char(6) --201810
AS
BEGIN

DECLARE @xBATNBR CHAR(6)
DECLARE @xTRANTYPE CHAR(2)
DECLARE @xRefNbr CHAR(10)

DECLARE CUR_LOTESOBS CURSOR FOR

-----PASO 1 
select  DISTINCT  BatNbr, TranType, RefNbr  from INTran I
INNER join ItemSite S on I.InvtID  = S.InvtID AND I.SiteID  = S.SiteID 
 where I.perpost  = @Perpost --AND BatNbr  ='043029'--AND I.InvtAcct NOT LIKE '28%'
AND I.INVTACCT <> S.InvtAcct 
--AND I.TranType in ('RC')
--AND I.TranType in ('AJ')
--AND I.BatNbr  = '034874' 
ORDER BY I.BatNbr

OPEN CUR_LOTESOBS
FETCH  CUR_LOTESOBS INTO @xBATNBR,@xTRANTYPE,@xRefNbr


WHILE (@@FETCH_STATUS  = 0)
       BEGIN


       DECLARE @xINVTID CHAR(8)
       declare @xSITEID CHAR(15)
       declare @cuentamala Char(6)
       declare @cuentabuena Char(6)
       DECLARE CUR_PRODUCTO CURSOR FOR
       select distinct I.InvtID,I.SiteID,I.InvtAcct cuentamala, S.InvtAcct cuentabuena from INTran I
       inner join ItemSite S on I.InvtID  = S.InvtID and I.SiteID  = S.SiteID    
       where BatNbr  = @xBATNBR and TranType  =@xTRANTYPE  -- and I.InvtAcct <> S.InvtAcct  
       OPEN CUR_PRODUCTO 
       FETCH CUR_PRODUCTO INTO @xINVTID,@xSITEID,@cuentamala,@cuentabuena
       WHILE (@@FETCH_STATUS  = 0 )
       BEGIN

       if @xTRANTYPE  = 'AJ'
       begin
       --GL ES NOMBRE DEL PRODUCTO
       print ''+ CAST(@xTRANTYPE AS VARCHAR)
       print ' se va a cambiar el producto :' +cast(@xINVTID as varchar) + ' , con almacen  : ' + cast(@xSITEID as varchar) + ',de cuenta mala  :'+cast(@cuentamala as varchar)+'  por cuenta -->' + cast(@cuentabuena as varchar) 
       update INTran set InvtAcct  = @cuentabuena where BatNbr   = @xBATNBR and SiteID  = @xSITEID and  TranType  = @xTRANTYPE  and InvtID  = @xINVTID AND InvtAcct LIKE '2%'
       
       update GLTran set Acct  = @cuentabuena where BatNbr  =@xBATNBR and TranType  = @xTRANTYPE and TranDesc in (select CAST(descr as char(30)) from Inventory where InvtID  = @xINVTID) and Module  ='IN'
       and Acct like '2%'
       end

       if @xTRANTYPE  = 'RC'
       begin
       --GL ES EL CODIGO DEL PRODUCTO
       print ''+ CAST(@xTRANTYPE AS VARCHAR)
       print ' se va a cambiar el producto :' +cast(@xINVTID as varchar) + ' , con almacen  : ' + cast(@xSITEID as varchar) + ',de cuenta mala  :'+cast(@cuentamala as varchar)+'  por cuenta -->' + cast(@cuentabuena as varchar) 
       
       update INTran set InvtAcct  = @cuentabuena where BatNbr   = @xBATNBR and SiteID  = @xSITEID and InvtID  = @xINVTID AND InvtAcct LIKE '2%'
       
       update GLTran set Acct  = @cuentabuena where RefNbr  =@xRefNbr and TranType  = 'R' and TranDesc = @xINVTID and Module  ='PO'
       and Acct like '2%'
       
       end

       if @xTRANTYPE IN ('CT','TR')
       begin
       --GL ES EL DESCRIPCION PRODUCTO
       print ''+ CAST(@xTRANTYPE AS VARCHAR)
       print ' se va a cambiar el producto :' +cast(@xINVTID as varchar) + ' , con almacen  : ' + cast(@xSITEID as varchar) + ',de cuenta mala  :'+cast(@cuentamala as varchar)+'  por cuenta -->' + cast(@cuentabuena as varchar) 

       update INTran set InvtAcct  = @cuentabuena where BatNbr   = @xBATNBR and SiteID  = @xSITEID and InvtID  = @xINVTID AND InvtAcct LIKE '2%'
       
       update GLTran set Acct  = @cuentabuena where BatNbr  =@xBATNBR and TranType  = 'TR' and TranDesc in (select CAST(descr as char(30)) from Inventory where InvtID  = @xINVTID) and Module  ='IN'
       and Acct NOT IN ( '281101') and  Acct like '2%'

       update GLTran set Acct  = @cuentabuena where BatNbr  =@xBATNBR and TranType  = 'TR' and TranDesc  = @xINVTID and Module  ='IN'
       and   Acct  NOT IN ( '281101') and  Acct like '2%'



	      update GLTran set Acct  = @cuentabuena where BatNbr  =@xBATNBR and TranType  = 'CT' and TranDesc in (select CAST(descr as char(30)) from Inventory where InvtID  = @xINVTID) and Module  ='IN'
       and Acct NOT IN ( '281101') and  Acct like '2%'

       update GLTran set Acct  = @cuentabuena where BatNbr  =@xBATNBR and TranType  = 'CT' and TranDesc  = @xINVTID and Module  ='IN'
       and   Acct  NOT IN ( '281101') and  Acct like '2%'

       end

       --if @xTRANTYPE  = 'TR'
       --begin
       ----GL ES EL CODIGO DEL PRODCUTO
       --print ''+ CAST(@xTRANTYPE AS VARCHAR)
       --     print ' se va a cambiar el producto :' +cast(@xINVTID as varchar) + ' , con almacen  : ' + cast(@xSITEID as varchar) + ',de cuenta mala  :'+cast(@cuentamala as varchar)+'  por cuenta -->' + cast(@cuentabuena as varchar) 
       --end

       FETCH CUR_PRODUCTO INTO   @xINVTID,@xSITEID,@cuentamala,@cuentabuena
       END
       CLOSE CUR_PRODUCTO
       DEALLOCATE CUR_PRODUCTO

       FETCH  CUR_LOTESOBS INTO @xBATNBR,@xTRANTYPE,@xRefNbr
       END


CLOSE CUR_LOTESOBS
DEALLOCATE CUR_LOTESOBS
END





