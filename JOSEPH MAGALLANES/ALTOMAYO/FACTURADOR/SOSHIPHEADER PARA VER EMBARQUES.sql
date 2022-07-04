

select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'B010001089'																														
select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'F010006009'																															
select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'F010006010'
select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'F010006011'
select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'F010006012'
select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'F010006013'																															
select InvcNbr, INBatNbr, ShipperID, Cancelled, CreditHold, AdminHold,  SlsperID, PerPost, Crtd_DateTime, LUpd_DateTime, NextFunctionClass, NextFunctionID, * from SOShipHeader where InvcNbr = 'F010006014'


select InvtID, QtyShip, ShipperID, * from SOShipLine where ShipperID = 'FLI0001612'
select InvtID, QtyShip, ShipperID, * from SOShipLine where ShipperID = 'FLI0001613'
select InvtID, QtyShip, ShipperID, * from SOShipLine where ShipperID = 'FLI0001614'
select InvtID, QtyShip, ShipperID, * from SOShipLine where ShipperID = 'FLI0001615'


select  distinct  InvtID ,l.descr ,h.SiteID,NextFunctionClass ,NextFunctionID  ,
(CASe when NextFunctionClass='0100' and NextFunctionID='4043000 ' then 'En despacho' when
 NextFunctionClass='0100' and NextFunctionID='4099999' then 'Imprimir Factura' 
when NextFunctionClass='4060' and NextFunctionID='4068001' then 'Asignar Transportista' when 
NextFunctionClass='4060' and NextFunctionID='4068002' then 'Imprimir Voucher'  end ) EstadoFunct ,
Cancelled ,H.Status ,SUM(QtyPick) sumQtyPick from newSH H inner join newSL L on H.ShipperID = L.ShipperID  
where /*l.InvtID ='21399' and h.SiteID ='CIXPT' AND */Cancelled=0
--and h.SiteID = 'LIMCEN'
GROUP BY InvtID  , l.descr , NextFunctionClass,NextFunctionID ,Cancelled ,H.Status,h.SiteID


