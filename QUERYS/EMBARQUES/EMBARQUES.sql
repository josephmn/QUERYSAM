

-- EMBARQUES POR IMPRIMIR
Select * From xam_emba_imprimir where SiteID =  'LIMCEN' 
 and sotypeid =  'FLI' and S4Future01 ='OTROS' and S4Future02 = ''


update P set user4 = PlacaCamion FROM PHeDespacho1 P inner join xDespachoShippers1 H on P.almacen = H.user05 and P.nrodespacho = H.NroDespacho AND  H.FechaDespacho  =  LEFT(CONVERT(VARCHAR, GETDATE(), 120), 10) 
 
 update P set user4 = PlacaCamion FROM PHeDespacho P inner join xDespachoShippers H on P.almacen = H.user05 and P.nrodespacho = H.NroDespacho And H.FechaDespacho  =  LEFT(CONVERT(VARCHAR, GETDATE(), 120), 10) 



 select * from  PHeDespacho where nrodespacho  = 'S000005568'






SELECT * FROM  DistAlmacenH