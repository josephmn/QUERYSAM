

--insert into LIQUIDACION_UTILIDADES_2020

SELECT RUC, RAZON, PERID, NOMBRES, FINGRESO, FCESE, ANHIO, RENTAANUALEMP, PORCENTAJE, MONTODIS, DIASLABORADOS, DIASLABORADOSEJERCICIO, PARTICIPACIONDIAS, 
REMUNERACIONESTOTALES, REMUNERACIONCOMPUTABLE, PARTICIPACIONREMUNERACION, REMANENTEUTILIDADES, REMANENTETOPE, REMANENTEFONDOEMPLEADO, RENTAQTAUTILIDADES, 
RETENCIONJUDICIAL, PERIODO, REPRESENTANTE, DECRETO, DIRECCION, PRESTAMOS, REINTEGRO, FECHAPAGO, NROCUENTA, ENTIDADBANCARIA, MONEDA, TIPOCAMBIO
FROM LIQUIDACION_UTILIDADES_2020 where ANHIO = '2020'
AND PERID in ('72130767','44195967')

select --B.pernombre, 
A.* 
-- UPDATE LIQUIDACION_UTILIDADES_2020 SET REPRESENTANTE = 'JUAN JOSE GRANDEZ FERNANDEZ', DECRETO = 'D.Leg. N� 892 y el D.S. N� 009-98-TR', DIRECCION = 'Av. Elmer Faucett Nro. 4805'
-- UPDATE A SET A.NOMBRES = B.pernombre
-- UPDATE A SET A.MONTODIS = 3521873.00, A.PORCENTAJE = 10, RENTAANUALEMP = 0
-- UPDATE A SET A.DIASLABORADOS = 84694
-- UPDATE A SET A.PARTICIPACIONDIAS = A.DIASLABORADOS
-- UPDATE A SET A.REMUNERACIONESTOTALES = 9292255.61
-- UPDATE A SET A.REMANENTEUTILIDADES = 0, A.REMANENTETOPE = 0, A.REMANENTEFONDOEMPLEADO = 0
-- UPDATE A SET A.REINTEGRO = 0
-- UPDATE A SET A.FECHAPAGO = '2022-04-01'
-- UPDATE A SET A.MONEDA = 'MN', A.TIPOCAMBIO = 1
from LIQUIDACION_UTILIDADES_2020 A
INNER JOIN PERSONALV B ON A.PERID  = B.perid
where ANHIO = '2021'
