

SELECT LTRIM(RTRIM(perid)) PERID, fechainicio, fechafin, DATEDIFF(DAY,fechainicio,fechafin)+1 dias, Y.DIASX FROM (
SELECT DISTINCT perid, min(fechainicio) fechainicio, max(fechafin) fechafin FROM PAPermisoVacacion WHERE user6 = '202103' and tipo = 'V'
GROUP BY perid
) X INNER JOIN 
(
SELECT PerId DNI, DIAS DIASX FROM PALiqVacacion 
WHERE PeriodoId = '202103' AND PerId NOT LIKE '%X'
) Y ON X.perid = Y.DNI

WHERE 
--X.perid NOT IN ('42780335','47344842') 
DATEDIFF(DAY,fechainicio,fechafin)+1 <> Y.DIASX

--SELECT * FROM PERSONAL WHERE PERID = '46436988'


SELECT perid, fechainicio, fechafin FROM PAPermisoVacacion WHERE user6 = '202102' and tipo = 'V' AND perid = '70231098'

SELECT * FROM PALiqVacacion 
WHERE PeriodoId = '202103' AND PerId = '10025100' AND PerId NOT LIKE '%X'
--42780335
--47344842

SELECT perid, * FROM PERSONAL WHERE perpaterno LIKE '%FERNANDEZ%'




SELECT * FROM LIQUIDACION_CTS_2021



