DECLARE @DNI VARCHAR(10)

SET @DNI = '16542308'

SELECT * FROM tempPagoPlanilla WHERE PERID = @DNI
SELECT * FROM MONTO_SUELDO_VARIACIONES WHERE perid = @DNI
SELECT * FROM MONTO_SUELDO_GRATI WHERE perid = @DNI
SELECT * FROM tempPAregistro 
WHERE 
perid = @DNI and cantidad > 0

SELECT * FROM tempPagoPlanilla_HIST WHERE PERID = @DNI AND PERIODO >= '202201' AND PERIODO NOT LIKE '%GR'
ORDER BY PERIODO ASC


----- GRATI
-- EXEC CARGAR_PLANILLA '2207GR'
-- EXEC PLANILLA_MENSUAL_AM '2207GR'

-- EXEC GEN_BOLETA2020
-- 44338499
/*

SELECT A.perid, A.rubsoles, B.GRATI 
FROM tempPAregistro A
INNER JOIN PLA_JANNET B ON A.perid = B.PERID
WHERE rubsoles <> 0 AND rubid = 'R07'
AND A.rubsoles <> B.GRATI

SELECT A.perid, A.rubsoles, B.PORCENT
FROM tempPAregistro A
INNER JOIN PLA_JANNET B ON A.perid = B.PERID
WHERE rubsoles <> 0 AND rubid = 'R05'
AND A.rubsoles <> B.PORCENT

SELECT A.perid, A.rubsoles, B.RETENCION
FROM tempPAregistro A
INNER JOIN PLA_JANNET B ON A.perid = B.PERID
WHERE rubsoles <> 0 AND rubid = 'D09'
AND A.rubsoles <> B.RETENCION

*/

--select perid, rubsoles, rubid from tempPAregistro where rubsoles <> 0 AND rubid NOT IN ('R05','R07','D09')
