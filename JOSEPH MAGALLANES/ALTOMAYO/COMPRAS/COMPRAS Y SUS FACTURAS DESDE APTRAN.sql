

select po.PONbr LoteOrdCompra, po.Crtd_User  Usuario, po.VendId RucProveedor, po.VendName  NombreProv, 
case po.Status  when  'M' then  'Orden Completado' else  'Orden Abierta'end Estado, 
apt.BatNbr LoteProvision, apt.RefNbr LoteReferencia, apt.InvtID CodProducto, apt.TranDesc NombreProducto,
apt.Qty cantidad, apt.CuryUnitPrice PrecioUnitario, apt.PerPost Periodo
,apd.S4Future12 Serie, apd.InvcNbr Factura,apd.InvcDate FechaEmision
from PurchOrd po 
inner join APTran apt on po.PONbr = apt.PONbr 
inner join APDoc apd on apd.BatNbr = apt.BatNbr and apd.RefNbr = apt.RefNbr
ORDER BY po.PONbr ASC, apt.PerPost ASC























