--  /*
ALTER VIEW BONFESPXCLI      
AS      
SELECT D.CodProm, H.FechaInicio, H.FechaFin, H.SiteId, CONVERT(VARCHAR(10),GETDATE(),120) FechaActual, H.Estado, H.TipoProm, H.Prioridad,  
D.CustId, D.S4Future01, D.User02, D.InvtID, D.Operador, D.Qty, D.InvtIDB, D.QtyB      
FROM AMPromocionH H INNER JOIN AMPromocionD D ON H.CodProm = D.CodProm      
where H.Estado  = 'A' and H.Prioridad = '01' 

select Manejo  , ESTADO ,* FROM AMPromocionH  

SELECT dbo.newsh.custid,dbo.newsh.Crtd_User,dbo.newsh.Crtd_Prog,dbo.newsh.invcdate,dbo.newsh.invcnbr,    
    dbo.newsh.shipperid,dbo.newsh.siteid,dbo.newsh.ShiptoID,dbo.newsh.sotypeid,    
       convert(char(30),dbo.Salesperson.S4Future12) AS S4Future01,dbo.newsh.S4Future02,dbo.newsh.S4Future11,dbo.newsh.tstamp              
FROM         dbo.newsh INNER JOIN              
                      dbo.SoAddress ON dbo.newsh.CustID = dbo.SoAddress.CustId and dbo.newsh.ShipToId=dbo.SoAddress.ShipToId  LEFT OUTER JOIN              
                      dbo.Salesperson ON dbo.newsh.SlsperID = dbo.Salesperson.SlsperId              
WHERE     (dbo.newsh.Cancelled = 0) AND (dbo.newsh.CreditHold = 0) AND (dbo.newsh.Status = 'O') AND               
                      (dbo.newsh.NextFunctionClass = '0100') AND (dbo.newsh.NextFunctionID = '4099999')


--___________________________________________________BONIFICACION_________________________________________________________________--
--PASO 1__Revisar  que este en aqui 
Select * From xam_emba_imprimir  where SiteID =  'CIXPT'  and sotypeid =  'FCH' and S4Future01 =  'OTROS' and S4Future02 = ''
Select * From xam_emba_imprimir  where SiteID =  'LIMCEN'  and sotypeid =  'FLI' and S4Future01 =  'OTROS' and S4Future02 = ''

--PASO 2_Revisar que este bien configurado en la pantalla de BONxCLIENTE 

CREATE VIEW BONFESPXCLI      
AS      
SELECT D.CodProm, H.FechaInicio, H.FechaFin, H.SiteId, CONVERT(VARCHAR(10),GETDATE(),120) FechaActual, H.Estado, H.TipoProm, H.Prioridad,  
D.CustId, D.S4Future01, D.User02, D.InvtID, D.Operador, D.Qty, D.InvtIDB, D.QtyB      
FROM AMPromocionH H INNER JOIN AMPromocionD D ON H.CodProm = D.CodProm      
where H.Manejo = 'A' and H.Prioridad = '01' 
SELECT * FROM BONFESPXCLI WHERE SiteID=  'CIXPT'  AND   '08/16/19'  >= FechaInicio and   '08/16/19'   <= FechaFin and Estado='A' Order By Prioridad


--update  AMPromocionH  set Manejo ='A' 
select  Status , S4Future02 ,NextFunctionClass ,NextFunctionID ,CreditHold ,   * from newSH     where ShipperId  = 'FCH0002181'
select   * from newSL     where ShipperId  = 'FCH0002181'

select  Status , S4Future02 ,NextFunctionClass ,NextFunctionID ,CreditHold ,   * from newSH     where ShipperId  = 'FCH0002181'
select   * from newSL     where ShipperId  = 'FCH0002181'

--select      * into  DEMO1  from  newSH    where Shipperid = 'FCH0002181'
--select     * into  DEMO2 from  newSL    where Shipperid = 'FCH0002181'


Select * From xam_emba_imprimir  where SiteID =  'CIXPT'  and sotypeid =  'BCH' and S4Future01 =  'OTROS' and S4Future02 = ''

Select * From xam_emba_imprimir  where SiteID =  'LIMCEN'  and sotypeid =  'FLI' and S4Future01 =  'OTROS' and S4Future02 = ''


select   Status , S4Future11 ,S4Future02 ,NextFunctionClass ,NextFunctionID ,CreditHold , InvcDate ,  *  from  AM2020APP..DEMO1    where Shipperid = 'FCH0002181'
--select   Status , S4Future11 ,S4Future02 ,NextFunctionClass ,NextFunctionID ,CreditHold , InvcDate ,  *  from  AM2020APP..DEMO_2    where Shipperid = 'FLI0000611'


select   Status , S4Future11 ,S4Future02 ,NextFunctionClass ,NextFunctionID ,CreditHold , InvcDate , PerPost , SiteID , *  from  newSH   
WHERE PERPOST = '202103' and InvcDate = '2021-03-31' and SiteID = 'HUAPT' AND SHIPPERID = 'FDH0001658'
AND S4Future11 = ''

-- update  newSH  set   S4Future02  = '' ,S4Future11 = ''   , NextFunctionClass  =  '0100'  ,NextFunctionID ='4099999'  WHERE PERPOST = '202103' and InvcDate = '2021-03-31' and SiteID = 'HUAPT' AND S4Future11 = '' AND SHIPPERID = 'FDH0001658'

SELECT USER1 , USER2,    * FROM SOType WHERE  SOTypeID ='FCH'

 
                      
SELECT * FROM xAMPromocionD WHERE CodProm =  '0007'  and user01=  '0010'  and user02= 'DIS'  order by InvtID,Qty desc 

select  ShipperID , OrigInvtID, InvtID , QtyPick, QtyShip , User7,Crtd_DateTime , * 
--delete
from  newSL    where Shipperid IN (SELECT SHIPPERID FROM newSH WHERE PERPOST = '202103' and InvcDate = '2021-03-31' and SiteID = 'HUAPT' AND S4Future11 = '')  and User7 = '0007' AND SHIPPERID = 'FDH0001658'

select   * 
---DELETE
from  AM_Bonificaciones     WHERE   Shipperid IN (SELECT SHIPPERID FROM newSH WHERE PERPOST = '202103' and InvcDate = '2021-03-31' and SiteID = 'HUAPT' AND S4Future11 = '' AND SHIPPERID = 'FDH0001658'
)

----NUEVO
select  * 
---delete
from  soshiplinesplit1  where Shipperid = 'FDH0001658' and tstamp   in 
(
0x00000001DCACD379
)

select  * 
---delete
from  soshiplot1 where Shipperid = 'FDH0001658' and tstamp 
in (
0x00000001DCACD9BB
)

