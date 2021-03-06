
SELECT * FROM LOCAL


SELECT * FROM ASISTENCIA_TEMP WHERE LOC_COD = 1 AND PER_COD = '47180826' AND FECHA > = '2021-01-19'



--DEL 19 DE ENERO AL 20 DE FEBRERO

SELECT [PER_COD], [NOMBRES],
ISNULL([ASISTIO],0) [ASISTIO], ISNULL([FALTO],0) [FALTO], ISNULL([VACACIONES],0) [VACACIONES] --, [SUBSIDIO MATERNO], [SUBSIDIO ENF/INCP]
FROM  
(

SELECT DISTINCT PER_COD, 
(LTRIM(RTRIM(B.PERPATERNO))+' '+LTRIM(RTRIM(B.PERMATERNO))+' '+LTRIM(RTRIM(B.PERNOMBRE))) NOMBRES, (CASE WHEN COMENTARIO = '' THEN 'ASISTIO' ELSE COMENTARIO END) COMENTARIO, COUNT(*) NUMERO 
FROM ASISTENCIA_TEMP A
LEFT JOIN APERSONALBD B ON A.PER_COD = B.PERID
WHERE LOC_COD = 1 AND FECHA > = '2021-01-20'
GROUP BY PER_COD, COMENTARIO, B.PERPATERNO, B.PERMATERNO, B.PERNOMBRE

) AS SourceTable  
PIVOT  
(  
SUM(NUMERO)  
FOR COMENTARIO IN ([ASISTIO], [FALTO], [VACACIONES]) --, [SUBSIDIO MATERNO], [SUBSIDIO ENF/INCP] 
) AS PivotTable

--SELECT * FROM ASISTENCIA_TEMP WHERE PER_COD = '47344842'
--SELECT DISTINCT COMENTARIO FROM ASISTENCIA_TEMP WHERE FECHA > = '2021-01-20' AND LOC_COD = 1 AND COMENTARIO = 'SUBSIDIO ENF/INCP'