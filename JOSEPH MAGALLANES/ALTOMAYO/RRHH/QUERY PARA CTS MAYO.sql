
-- DROP TABLE DATOS
CREATE TABLE AAAA_FF
(
PERID VARCHAR(15),
NOVIEMBRE FLOAT,
DICIEMBRE FLOAT,
ENERO FLOAT,
FEBRERO FLOAT,
MARZO FLOAT,
ABRIL FLOAT
)

-- DROP TABLE AAAA_FF2

SELECT PERID, NOMBRES,
0 NOVIEMBRE,
isnull([DICIEMBRE],0) [DICIEMBRE],
isnull([ENERO],0) [ENERO], 
isnull([FEBRERO],0) [FEBRERO],
isnull([MARZO],0) [MARZO],
isnull([ABRIL],0) [ABRIL] INTO AAAA_FF2
FROM 
(
select A.PERID, A.NOMBRES, 

(CASE 

WHEN RIGHT(PERIODO,2) = '01' THEN 'ENERO' 
WHEN RIGHT(PERIODO,2) = '02' THEN 'FEBRERO' 
WHEN RIGHT(PERIODO,2) = '03' THEN 'MARZO' 
WHEN RIGHT(PERIODO,2) = '04' THEN 'ABRIL' 
WHEN RIGHT(PERIODO,2) = '05' THEN 'MAYO' 
WHEN RIGHT(PERIODO,2) = '06' THEN 'JUNIO' 
WHEN RIGHT(PERIODO,2) = '07' THEN 'JULIO' 
WHEN RIGHT(PERIODO,2) = '08' THEN 'AGOSTO' 
WHEN RIGHT(PERIODO,2) = '09' THEN 'SEPTIEMBRE' 
WHEN RIGHT(PERIODO,2) = '10' THEN 'OCTUBRE' 
WHEN RIGHT(PERIODO,2) = '11' THEN 'NOVIEMBRE' 
WHEN RIGHT(PERIODO,2) = '12' THEN 'DICIEMBRE' 

ELSE '' END) MES,

(CASE WHEN RIGHT(PERIODO,2) = '02' THEN 
(CASE WHEN ((DIA_LABORA + DIA_VACAC + DIA_LCGH + DIA_SUSPECGH + DIA_MEDICO + DIA_SUB_MAT + DIA_SUB_INC + DIA_COVID + DIA_OTROS) + 2) > = 30 THEN 30 
ELSE (CASE WHEN YEAR(FINGRESO) = '2021' AND MONTH(FINGRESO) = '02' AND DAY(FINGRESO) <> 1 THEN (DIA_LABORA + DIA_VACAC + DIA_LCGH + DIA_SUSPECGH + DIA_MEDICO + DIA_SUB_MAT + DIA_SUB_INC + DIA_COVID + DIA_OTROS)
ELSE (DIA_LABORA + DIA_VACAC + DIA_LCGH + DIA_SUSPECGH + DIA_MEDICO + DIA_SUB_MAT + DIA_SUB_INC + DIA_COVID + DIA_OTROS) + 2 END) END) 
ELSE (DIA_LABORA + DIA_VACAC + DIA_LCGH + DIA_SUSPECGH + DIA_MEDICO + DIA_SUB_MAT + DIA_SUB_INC + DIA_COVID + DIA_OTROS) END)  DIAS
from tempPagoPlanilla_HIST A
INNER JOIN PERSONAL B ON A.PERID = B.PERID AND B.perstatus <> 'R' AND perfing <= '2021-04-01'
--where A.perid = '76577834'
) AS SourceTable  
PIVOT  
(  
SUM(DIAS)  
FOR MES IN ([DICIEMBRE],[ENERO], [FEBRERO], [MARZO], [ABRIL])  
) X

-- truncate table AAAA_FF

SELECT * 
-- UPDATE tempPagoPlanilla_HIST SET DIA_MEDICO = 20
FROM tempPagoPlanilla_HIST 
WHERE PERID = '44891191' AND PERIODO = '202104'


SELECT * 
FROM AAAA_FF A
LEFT JOIN COMPARATIVO_SISTEMAS B ON A.PERID = B.PERID
WHERE (B.FEBRERO <> 0 AND B.MARZO <> 0 AND B.ABRIL <> 0)

SELECT * 
-- UPDATE AAAA_FF SET ABRIL = 29
FROM AAAA_FF WHERE PERID = '44891191'

SELECT nbrboleta, periodoid, perid, * 
-- DELETE
FROM paboletaH A WHERE PERID = '03385891' --AND nbrboleta = '9000120610'
ORDER BY A.periodoid

SELECT * 
--- UPDATE PABOLETAH SET NBRBOLETA = '9000120610'
FROM PABOLETAH WHERE PERID = '45203105' AND PERIODOID = '202011'


SELECT * 
-- UPDATE paboletaD SET NBRBOLETA = '9000120610'
FROM paboletaD A WHERE nbrboleta = '9000120202'

--INSERT INTO PABOLETAH
--(afpnombre, empdir, emprazon, nbrboleta, perafp, percargo, perdias, peremp, perfing, perhoras, perid, periodoid, pernombre, pernumafp, 
--perseguro, pertipopago, sbruto, sempresa, sneto, status, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

--SELECT afpnombre, empdir, emprazon, nbrboleta, perafp, percargo, perdias, peremp, perfing, perhoras, perid, periodoid, pernombre, pernumafp, 
--perseguro, pertipopago, sbruto, sempresa, sneto, status, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9 FROM AM2020APP..paboletaH WHERE nbrboleta = '9000120883'

--INSERT INTO PABOLETAD
--(cantidad, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

--SELECT cantidad, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9 
--FROM AM2020APP..paboletad WHERE nbrboleta = '9000120883'




SELECT * 
-- UPDATE tempPagoPlanilla_HIST SET DIA_LABORA = 30, DIA_SUB_INC = 0
FROM tempPagoPlanilla_HIST WHERE PERID = '40640940'
AND PERIODO = '202104'


