

Customer_Active  '20492092313' 

sp_helptext  Customer_Active



select * from xAM_ListPrecioPorClienteSol where CustID =  '20492092313'  and InvtID =  '21738'  and SlsUnit=  'UND' 

 sp_helptext xAM_ListPrecioPorClienteSol



select top 1 * from xAM_ListPrecioSol where ch_LstPrecio =  ''  and right(rtrim(ch_CodProd),5) =  '21738'
  and nu_Corte <= 1 and SlsUnit=  'UND'  order by nu_Corte desc
  
  
  
SELECT     dbo.SlsPrc.CustID, dbo.SlsPrc.InvtID, dbo.SlsPrcDet.DetRef, dbo.SlsPrcDet.DiscPrice,dbo.SlsPrcDet.SlsUnit  
FROM         dbo.SlsPrc INNER JOIN  
                      dbo.SlsPrcDet ON dbo.SlsPrc.SlsPrcID = dbo.SlsPrcDet.SlsPrcID  
WHERE     (dbo.SlsPrc.PriceCat = 'IC')