

SELECT * FROM SOShipHeader WHERE SHIPPERID = 'FCH0004777'


SELECT * FROM newSH WHERE SHIPPERID = 'FCH0004777'


SELECT User1, * FROM newSH WHERE User1 LIKE '%8758'
SELECT User1, * FROM newSH WHERE User1 LIKE '%8759'





SELECT * 
-- UPDATE AMVouchers SET USER02 = ''
FROM AMVouchers WHERE almacen = 'CIXPT' AND SerieGR = '010'

select * 
-- UPDATE xAMDespEmbH_1 SET NroGuiaH = ''
from xAMDespEmbH_1 Where SiteIDH =  'CIXPT'  and NroDespachoH =   'S000008758' 

        

--when NextFunctionClass='4060' and NextFunctionID='4068002' then 'Imprimir Vocher'
--'4068002'

SELECT User1, User2, NextFunctionClass, NextFunctionID, ShipperID, * 
-- UPDATE newSH SET NextFunctionClass='4060', NextFunctionID='4068002', User2 = ''
FROM newSH WHERE User1 LIKE '%8758'

--0100	4043000 
--G066048294                    

SELECT User1, User2, NextFunctionClass, NextFunctionID, ShipperID, * 
-- UPDATE newSH SET NextFunctionClass='4060', NextFunctionID='4068002', User2 = ''
FROM newSH WHERE User1 LIKE '%8759'

--0100	4043000 
--G066048292                    

SELECT BillAddr1, BillAddr2, ShipAddr1, ShipAddr2, CustID, * 
-- 
FROM newSH
WHERE ShipperID IN
(
'FCH0004789',
'FCH0004790'     
)



select * 

from xAMDespEmbH_1 Where SiteIDH =  'CIXPT'  and NroDespachoH =   'S000008759' 

select * 

from xAMDespEmbH_1 Where SiteIDH =  'CIXPT'  and NroDespachoH =   'S000008759' 


SELECT * 
-- UPDATE phedespacho1 SET USER11 = 'R'
FROM phedespacho1 WHERE nrodespacho = 'S000008758'


SELECT * FROM xDespachoShippers1 WHERE NroDespacho = 'S000008758'



SELECT * FROM RptRuntime



CREATE  VIEW [dbo].[xAMDespEmbH_1]  
AS  
SELECT       
 D.DescrTraslado,  
 D.CostoMinimo,  
 P.user13 AS FechaDespH,  
 P.User12 AS GpoDesp,  
 D.IdTransportista,   
 D.LicenciaChofer,   
 D.MarcaCamion,   
 D.MotivoTraslado,   
 D.NoConstInscp,   
 D.NombreChofer,   
 P.nrodespacho AS NroDespachoH,   
 P.Nroguia AS NroGuiaH,  
 P.User2 AS NroSerie,   
 D.PlacaCamion,   
 D.PlacaCarreta,   
 P.almacen AS SiteIDH,   
 P.user11 AS Status,  
 P.User9 AS TipoDesp,  
 P.User3 as TipoImpr,    
 P.Tipo AS TipoMov,   
 P.user7 as TotDet,   
 P.user6 as TotSel,   
 P.user1 AS UserID,   
 P.User4 as UltimoCompr,   
 P.user10 as User10,  
 P.tstamp  
  
FROM         dbo.phedespacho1 P  
INNER JOIN --LEFT OUTER JOIN  
(SELECT user05 AS SiteID, NroDespacho AS NroDespacho, CostoMinimo, FechaDespacho AS FechaDespacho, Tipomov AS TipoMov, Transportista AS IdTransportista,   
 PlacaCamion AS PlacaCamion, User06 as PlacaCarreta,MarcaCamion AS MarcaCamion, LicenciaChofer AS LicenciaChofer, NombreChofer AS NombreChofer,   
        NoConstInscp AS NoConstInscp, MotivoTraslado AS MotivoTraslado, DescrTraslado AS DescrTraslado  
FROM    dbo.xDespachoShippers1  
GROUP BY user05, NroDespacho ,CostoMinimo, FechaDespacho, Tipomov, Transportista, PlacaCamion,User06, MarcaCamion, LicenciaChofer, NombreChofer, NoConstInscp,   
 MotivoTraslado, DescrTraslado) D  
ON (P.Almacen = D.SiteID) and (P.NroDespacho = D.NroDespacho)

