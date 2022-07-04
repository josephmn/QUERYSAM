



SELECT * FROM newSH WHERE CUSTID IN ('20492092313','20108730294','20482032215') AND PerPost = '201903'


SELECT * 
-- UPDATE Customer SET BILLZIP = '', USER5 = '', ZIP = ''
FROM Customer WHERE CustId IN ('20492092313','20108730294','20482032215')



SELECT * FROM xamzonaruta_todos



create proc xAMZonaRuta_todos
	@parm1 varchar(10)
as
select xAMZonaRuta.ZonaRutaID, xAMZonaRuta.Descripcion, xAMMAe_Ruta.Slsperid, salesperson.name, xAMMAe_Ruta.GrupoDespacho 
--select *
from xAMZonaRuta inner join xAMMAe_Ruta on xAMZonaRuta.ZonaRutaID = xAMMAe_Ruta.ZonaRutaID inner join 
     salesperson on xAMMAe_Ruta.slsperid = salesperson.slsperid
where xAMZonaRuta.ZonaRutaID like 'CYNINST1' order by xAMZonaRuta.ZonaRutaID






INSERT INTO xAMZonaRuta (ZonaRutaID, Descripcion, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)
SELECT 'CYNINST1', 'CASH & CARRY', user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 FROM xAMZonaRuta WHERE ZonaRutaID = 'CANINST1'


INSERT INTO xAMMAe_Ruta (SiteID, ZonaRutaID, CodMapa, AntZonaRutaID, AntCodMapa, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo, frecuencia, Estado, SlsperId, GrupoDespacho, ZonaVentaID, Secuencia)
SELECT SiteID, 'CYNINST1', CodMapa, 'CYNINST1', AntCodMapa, '806', '806', '806', '806', '806', '806', '806', frecuencia, Estado, '806', GrupoDespacho, ZonaVentaID, Secuencia 
FROM xAMMAe_Ruta WHERE ZonaRutaID = 'CANINST1'




SELECT BillZip, User5, Zip, SlsperId, CustId, Status, * 
-- UPDATE Customer SET BillZip = 'CANINST1', SlsperId = '091'
FROM Customer WHERE BillZip = 'CANINST1' 

SELECT BillZip, User5, Zip, SlsperId, * 
-- UPDATE Customer SET User5 = 'CANINST1'
FROM Customer WHERE User5 = 'RUECONO' 

SELECT BillZip, User5, Zip, SlsperId, * 
-- UPDATE Customer SET Zip = 'CANINST1'
FROM Customer WHERE Zip = 'RUECONO' 


---2DA PARTE

SELECT User5, Zip, SlsPerID, * 
-- UPDATE SOAddress SET SlsPerID = '091', User5 = 'CANINST1', Zip = 'CANINST1'
FROM SOAddress WHERE SlsPerID = '091'

SELECT User5, Zip, SlsPerID, * 
-- UPDATE SOAddress SET User5 = 'CANINST1'
FROM SOAddress WHERE User5 = 'RUECONO'

SELECT User5, Zip, SlsPerID, * 
-- UPDATE SOAddress SET Zip = 'CANINST1'
FROM SOAddress WHERE Zip = 'RUECONO'




