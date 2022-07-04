

SELECT * FROM EnsambladoD WHERE CodActivo = '202004109'

SELECT A.CodActivo, A.Serie, B.CodActivo, B.Serie, A.Modelo, B.Modelo, A.Marca, B.Marca, B.codInventario, B.PN, B.Local, B.Departamento,  * 
-- update a set A.CodActivo = B.CodActivo, A.Serie = B.Serie, A.Modelo = B.Modelo, A.Marca = B.Marca
---- UPDATE A SET A.MARCA = 'DELL'
-- UPDATE B SET B.codInventario = '202001119'
-- UPDATE B SET LOCAL = 12
-- UPDATE B SET DEPARTAMENTO = 1
FROM EnsambladoD A
INNER JOIN Activos B ON A.Correlativo = B.Correlativo
WHERE CorrelaENS = 'ENS0000000058' --AND A.Correlativo = 'RGA0000002017'

SELECT * 
-- UPDATE EnsambladoH SET LOCAL = '12'
FROM EnsambladoH WHERE Correlativo = 'ENS0000000215'

SELECT * 
-- DELETE
FROM EnsambladoD WHERE CorrelaENS = 'ENS0000000166' AND Correlativo = 'RGA0000001152'

SELECT A.CorrelaENS, A.CodActivo, A.Serie, B.CodActivo, B.Serie, A.Modelo, B.Modelo, A.Marca, B.Marca, B.codInventario, B.PN, B.Local, B.Departamento,  * 
-- update a set A.CodActivo = B.CodActivo, A.Serie = B.Serie, A.Modelo = B.Modelo, A.Marca = B.Marca
---- UPDATE A SET A.MARCA = 'DELL'
-- UPDATE B SET B.codInventario = '202020153'
-- UPDATE B SET LOCAL = 3
-- UPDATE B SET DEPARTAMENTO = 2
FROM EnsambladoD A
INNER JOIN Activos B ON A.Correlativo = B.Correlativo
WHERE A.Serie = 'ST1000DM003'

SELECT * FROM Activos WHERE Serie = 'Z9A271VN'

SELECT * FROM Local
SELECT * FROM Departamento


SELECT Local, Departamento, * 
-- UPDATE Activos SET LOCAL = 3
-- UPDATE Activos SET DEPARTAMENTO = 2
FROM Activos WHERE Correlativo IN (
SELECT Correlativo FROM AsignacionD WHERE PER_COD = '91919191'
UNION ALL
SELECT Correlativo FROM EnsambladoD WHERE CorrelaENS IN (SELECT Correlativo FROM AsignacionD WHERE PER_COD = '91919191')
)



--INSERT INTO PERSONAL

--SELECT 
--'20000451', 'DESARROLLOAM', '(10.10.4.9)', PER_APE_MA, PER_DOC, FEC_NAC, EST_CIVIL, SEXO, DIRECCION, 
--LOCAL, EMPRESA, AREA, CARGO, CONTRATO, REGISTRO_MARC, FEC_ING, MAR_DNI, MAR_HUELLA, COD_BARRA, 
--PER_STATUS, BARRAS, Picture, Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, AfterF1, AfterF2, 
--AfterF3, AfterF4, AfterF5, AfterF6, AfterF7, AfterF8, s4future1, s4future2, s4future3, s4future4, 
--User1, User2, User3, User4, User5, User6, User7, User8, User10, User11, User12, HUELLA1, HUELLA2
--FROM PERSONAL WHERE PER_NOMBRE LIKE '%ALTOMAYO-ANT%'



SELECT * 
-- UPDATE EnsambladoH SET LOCAL = 10
FROM EnsambladoH WHERE Correlativo IN (SELECT Correlativo FROM AsignacionD WHERE PER_COD = '91919191')


select * 
-- UPDATE Activos SET LOCAL = 1
-- UPDATE Activos SET DEPARTAMENTO = 1
-- update Activos set codActivo = '202001112'
-- update activos set modelo = 'DH61WW*'
from Activos where Correlativo = 'RGA0000000512'

select * 
-- delete
from AsignacionD where Correlativo = 'ENS0000000092'

select * 
-- delete
from EnsambladoD where Correlativo = 'RGA0000000512'


SELECT * FROM MODELO_PlacaMadre WHERE Correlativo = 'PLM0000000010'

SELECT * FROM Activos WHERE CodModelo = 'PLM0000000010'

SELECT * 
-- UPDATE AsignacionH SET PER_COD = '16781705'
FROM AsignacionH WHERE PER_COD = '16781705'

SELECT * 
-- UPDATE AsignacionD SET USER1 = 'ASI0000000074'
FROM AsignacionD WHERE USER1 = 'ASI0000000075' AND Correlativo = 'RGA0000000337'


SELECT A.CodActivo, A.Serie, B.CodActivo, B.Serie, * 

FROM EnsambladoD A
INNER JOIN Activos B ON A.Correlativo = B.Correlativo
WHERE 
a.Serie = '9sz6db5d'
--A.CodActivo = '202004105'


exec ENCONTRAR_INCIDENCIA 'ENS0000000148'
exec ENCONTRAR_INCIDENCIA 'ENS0000000148'
exec GET_INCIDENCIA_ITEM 'ENS0000000148'

exec GET_ListarIncidencia_Item 'ENS0000000148'


select * from BD2016..Customers where custid = '48167756'




select * from ASIGNACION_HIST where Marca = 'DELL' AND Serie = 'HDRJG72'
select * from ASIGNACION_HIST where Marca = 'DELL' AND Serie LIKE '9F%&'

SELECT * FROM PERSONAL WHERE PER_COD = '47836866'
SELECT * FROM PERSONAL WHERE PER_COD = '46056625'
