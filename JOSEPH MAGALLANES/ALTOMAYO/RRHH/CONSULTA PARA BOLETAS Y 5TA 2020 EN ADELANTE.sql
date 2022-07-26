DECLARE @DNI VARCHAR(10)

SET @DNI = '09670268' --10789468 --09670268 --45032867 AYON

SELECT * FROM tempPagoPlanilla WHERE PERID = @DNI
SELECT * FROM MONTO_SUELDOS WHERE perid = @DNI
SELECT SUM(rubsoles) MONTO_ANUAL FROM MONTO_SUELDOS WHERE perid = @DNI
SELECT * FROM IMPUESTO_AM2020 WHERE PERID = @DNI
SELECT * FROM QTA_FINAL WHERE PERID = @DNI
SELECT * FROM tempPAregistro 
WHERE 
perid = @DNI and cantidad > 0

--SELECT * FROM tempPagoPlanilla_HIST WHERE PERID = @DNI AND PERIODO >= '202201' AND PERIODO NOT LIKE '%GR'
--ORDER BY PERIODO ASC
-- 46311131 -- OK
-- 44228162
-- 48281331


-- UPDATE tempPagoPlanilla SET DIA_LABORA = 3 WHERE PERID = '41346123'
-- UPDATE tempPAregistro SET cantidad = 36.42, rubsoles = 36.42 where perid = '46653628' and rubid = 'S01'
-- UPDATE tempPAregistro SET cantidad = 4.19 where perid = '46653628' and rubid = 'A03'x

--select * into tempPAregistro_2 from tempPAregistro where PERID = '46653628'

--select * from tempPagoPlanilla where month(FINGRESO) = 1 and year(FINGRESO) = 2022 and tipo = 0

-- 44338499 SILVA GUERRA DEDALINA
-- 45032867 KRISTINA AYON
-- 09670268 VICTOR MANTILLA

--select * from tempPagoPlanilla where DIA_LCGH > 0
--select * from tempPagoPlanilla where DIA_LSGH > 0
--select * from tempPagoPlanilla where DIA_SUB_MAT > 0
--select * from tempPagoPlanilla where DIA_SUB_INC > 0
-- 23-07-2021 al 23-08-2021
-- 


--select * from tempPAregistro
---- UPDATE tempPAregistro SET cantidad = 0, rubsoles = 0 
--where perid in(
--'70777866'
--) and rubid = 'D03'

SELECT * FROM paboletad WHERE rubid = 'D03' AND nbrboleta IN (SELECT nbrboleta FROM paboletah where perid = '10287282' and periodoid > = '202101')
SELECT * FROM paboletad WHERE rubid = 'D23' AND nbrboleta IN (SELECT nbrboleta FROM paboletah where perid = '10287282' and periodoid > = '202101')

SELECT * FROM RPAGOPLANILLAS WHERE PERID = '46045027'
SELECT * FROM RPAGOPLANILLAS WHERE NOMBRES LIKE '%STAGNA%'

SELECT * 
-- UPDATE tempPAregistro SET cantidad = 0, rubsoles = 0
FROM tempPAregistro WHERE rubid = 'D22'

--AND perid IN ('16772997','45244880','46045027','47583861','72130767')  
--AND rubid = 'A01'

-- update tempPAregistro set cantidad = 83.7 where perid = '76577834' and rubid = 'A01'

--SELECT * FROM PAregistro WHERE perid = '19936035' AND rubid = 'D19'
--SELECT MontoQuintaExt, MontoRetenidoQuinta, * FROM personalValue WHERE PERID = '45244880'


SELECT A.periodoid, B.* 
FROM PABOLETAH A
INNER JOIN PABOLETAD B ON A.NBRBOLETA = B.NBRBOLETA
WHERE --A.PERIODOID = '2012GR' AND 
A.PERID = '43189942' AND (rubsoles > 0 OR cantidad <> 0) AND
A.periodoid >= '202101' AND rubid IN ('D03') ORDER BY A.periodoid ASC

SELECT * 
FROM tempPAregistro WHERE rubid = 'D03' AND rubsoles > 0 --AND perid = '10774615' --AND (cantidad <> 0 OR rubsoles <> 0)
ORDER BY perid ASC

select * 
-- update paplanillasD set procesado = 0, user4 = '', selec = 1
-- update paplanillasD set procesado = 1, user4 = 'GENERADO', selec = 0
from paplanillasD where batch = '000004' and perid = '16542308'

--CARGAR_MENSUAL_AM

-- EXEC CARGAR_PLANILLA '202207'
-- EXEC PLANILLA_MENSUAL_AM '202207'


----- GRATI
-- EXEC CARGAR_PLANILLA '2207GR'
-- EXEC PLANILLA_MENSUAL_AM '2207GR'

-- EXEC GEN_BOLETA2020

/*
SELECT * 
-- UPDATE PAregistro SET rubsoles = 150
FROM PAregistro WHERE perid IN (
SELECT perid FROM PERSONAL WHERE perstatus <> 'R' AND perid NOT IN ('76577834','40572017','10682322')
) AND rubid IN ('R09','D19')
*/


--SELECT A.periodoid, B.* 
--FROM PABOLETAH A
--INNER JOIN PABOLETAD B ON A.NBRBOLETA = B.NBRBOLETA
--WHERE --A.PERIODOID = '2012GR' AND 
--A.PERID = '16410842' AND (rubsoles > 0 OR cantidad <> 0) AND
--A.periodoid >= '202001' AND rubid IN ('D03','D23') 
--ORDER BY A.periodoid ASC

--SELECT * FROM MONTO_SUELDOS WHERE periodoid = '202012'


/*

-- BONIFICACION EXTRA POR TEMAS DE REINTEGRO DE GRATIFICACIONES DEL MES DE JULIO 2020

SELECT B.* 
FROM PABOLETAH A
INNER JOIN PABOLETAD B ON A.NBRBOLETA = B.NBRBOLETA
WHERE --A.PERIODOID = '2012GR' AND 
A.PERID = '46203303' AND (rubsoles > 0 OR cantidad <> 0) AND
A.periodoid = '202012'

SELECT * 
-- UPDATE PABOLETAD SET RUBTIPO = '03'
FROM PABOLETAD WHERE NBRBOLETA = '9000120781' AND RUBID = 'D25'

INSERT INTO PABOLETAD
(cantidad, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

SELECT TOP 1 13.50, '9000120781', provisiona, rubctac, rubctad, 'DEVOLUCION PAGO EXCESO VACACIONES', 'D25', rubporcentaje, 13.50, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9 
FROM PABOLETAD WHERE nbrboleta = '9000117207' AND rubid = 'R07'



-- DELETE FROM PABOLETAD WHERE nbrboleta = '9000117179' AND rubid = 'R07' AND rubdesc = 'BONIFICACION EXTRA'
-- DELETE FROM PABOLETAD WHERE nbrboleta = '9000117309' AND rubid = 'R07' AND rubdesc = 'BONIFICACION EXTRA'
-- DELETE FROM PABOLETAD WHERE nbrboleta = '9000117207' AND rubid = 'R07' AND rubdesc = 'BONIFICACION EXTRA'


SELECT * FROM PABOLETAD WHERE nbrboleta = '9000117179' AND rubid = 'R07' AND rubdesc = 'BONIFICACION EXTRA'
SELECT * FROM PABOLETAD WHERE nbrboleta = '9000117309' AND rubid = 'R07' AND rubdesc = 'BONIFICACION EXTRA'
SELECT * FROM PABOLETAD WHERE nbrboleta = '9000117207' AND rubid = 'R07' AND rubdesc = 'BONIFICACION EXTRA'
*/


select * from paboletah where nbrboleta = '9000117179'
select * from paboletah where perid = '10861882' and periodoid = '2007GR'


SELECT * FROM paboletaH WHERE periodoid = '202105' AND PERID = '20108971'
SELECT * FROM paboletaH WHERE periodoid = '202105' AND PERID = '72130767'

SELECT * 
-- UPDATE paboletad SET CANTIDAD = 7.88, RUBSOLES = 0
FROM paboletad WHERE nbrboleta = '9000122028'
AND rubid = 'A03'


SELECT * 
-- UPDATE paboletad SET CANTIDAD = 13.5, RUBSOLES = 13.5
FROM paboletad WHERE nbrboleta = '9000122245'
AND rubid = 'A03'


/*

CREATE VIEW RPAGOPLANILLAS    
-- SISTEMA : SOLOMON IV          
-- FUNCION : VISTA PARA DATA DINAMICA DE PAGO DE PLANILLAS MENSUAL
-- FECHA   : 2020-07-21
-- USUARIO : JOSEPH CARLOS MAGALLANES NOLAZCO    
AS    
SELECT EMPID, A.PERID, NOMBRES, AR.arenombre AREA, CA.carnombre CARGO, PERIODO, 
CONVERT(VARCHAR(10),CAST(FINGRESO AS datetime),103) FINGRESO, 
CONVERT(VARCHAR(10),CAST(FCESE AS datetime),103) FCESE, Movilidad MovilidadCOM, MovilidadSUP,     
BASICO, AFAM, TIPO, AFP, AFP_COMISION, NUM_DIAS_MES, DIA_BOLETA, DIA_LABORA,     
DIA_FALTA, DIA_VACAC, DIA_LCGH, DIA_LSGH, DIA_SUSPECGH, DIA_SUSPESGH, DIA_PERMISO, DIA_MEDICO,    
DIA_SUB_MAT, DIA_SUB_INC, DIA_COVID, DIA_OTROS, DIA_NOCOUNT, MONTO_VAC, PROM_PROD_VAC,     
APORTE_FONDO_VAC, APORTE_COMISION_VAC, APORTE_SEGURO_VAC, NETO_VAC, Razon, PAGO_MES,     
COMENTARIO, A.CALCULO,    
cantidad,    
rubdesc,    
rubid,  
rubtipo,
rubporcentaje,    
rubsoles, (CASE WHEN (M.PERID IS NULL OR M.PERID = '') THEN ROUND((P.permovilidad/30)*DIA_LABORA,2) ELSE ROUND((P.permovilidad/30)*DIA_LABORA,2) END) MOV_COMERCIAL
FROM tempPagoPlanilla A    
INNER JOIN tempPAregistro B ON A.PERID = B.perid  
LEFT JOIN Personal P ON P.perid = A.PERID
LEFT JOIN temp_movitemporal M ON A.PERID = M.PERID
LEFT JOIN PAcargo CA ON P.percargo = CA.carid
LEFT JOIN PAarea AR ON P.perarea = AR.areid
WHERE (B.rubsoles <> 0 OR B.cantidad <> 0) --AND A.PERID = '72130767'


--select * from RPAGOPLANILLAS where DIA_FALTA <> 0

*/