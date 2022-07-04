
pvrec_all 'xamzonaruta_todos'

select * from  xamzonaruta_todos

sp_helptext xamzonaruta_todos



select xAMZonaRuta.ZonaRutaID, xAMZonaRuta.Descripcion, xAMMAe_Ruta.Slsperid, salesperson.name, xAMMAe_Ruta.GrupoDespacho   
--select *  
from xAMZonaRuta inner join xAMMAe_Ruta on xAMZonaRuta.ZonaRutaID = xAMMAe_Ruta.ZonaRutaID inner join   
     salesperson on xAMMAe_Ruta.slsperid = salesperson.slsperid  
where xAMZonaRuta.ZonaRutaID like '%' order by xAMZonaRuta.ZonaRutaID  




select * from  xAMMAe_Ruta where slsperid ='553'