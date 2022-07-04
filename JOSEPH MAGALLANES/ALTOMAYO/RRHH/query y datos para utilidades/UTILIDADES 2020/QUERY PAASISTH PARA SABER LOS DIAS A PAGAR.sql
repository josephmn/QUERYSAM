
-- REVISANDO A PERSONAL CESADO X MES
SELECT * FROM (
select perfing, perfend, ltrim(rtrim(perid)) perid, 
(DATEDIFF(DAY,perfing,perfend))+1 diff, 

(SELECT count(*) dias -- H.fecha, D.* 
FROM PAAsistH H
INNER JOIN PAAsistD D ON H.asistid = D.asistid WHERE D.perid = personal.perid AND h.fecha >= personal.perfing) dias,

pernombre, perpaterno, permaterno, perstatus
from personal
where month(perfing) >= 1 and year(perfing) = '2020'
AND perfend <> '1900-01-01'
) X WHERE diff <> dias

SELECT * 
-- DELETE
FROM PAAsistD WHERE asistid IN (SELECT asistid FROM PAAsistH WHERE fecha > '2020-10-31') AND perid = '46563840'

--- POR INTERVALOS
--SELECT * 
---- DELETE
--FROM PAAsistD WHERE asistid IN (SELECT asistid FROM PAAsistH WHERE fecha > '2020-10-31' AND FECHA < '2020-11-30') AND perid = '46563840'

-- EXEC INSERT_PER_XFECHA '2020-11-11','06649371'


SELECT H.fecha, D.* 
FROM PAAsistH H
INNER JOIN PAAsistD D ON H.asistid = D.asistid WHERE D.perid = '46563840' AND h.fecha >= '2020-12-07'



--45410963

/*
SELECT H.fecha, D.* 
FROM [AM2020APP_IMP]..PAAsistH H
INNER JOIN [AM2020APP_IMP]..PAAsistD D ON H.asistid = D.asistid WHERE D.perid = '45410963' AND h.fecha >= '2020-10-02 00:00:00'
*/