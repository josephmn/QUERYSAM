
CREATE VIEW NEW_GRTJULIO_AM
AS
SELECT TOP 99999 * FROM (

/**************** ENERO *******************/
select DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN,
(CASE WHEN Dia_Ing = 1 and Month(z.perfing) = 1 AND YEAR(Z.perfing) = 2018 THEN (SELECT ENE FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) ELSE 0 END) GRT_ENE, 
(SELECT FEB FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_FEB, (SELECT MAR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_MAR, (SELECT ABR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_ABR, 
(SELECT MAY FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_MAY, (SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_JUN
from (
SELECT *, DAY(perfing) Dia_Ing
FROM (
select perid, pernombre, permaterno, perpaterno, perfing from Personal x where perid in (
select DNI from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
)
) --order by x.perid
) X
INNER JOIN (

select * from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
) --order by DNI
) Y ON X.perid = Y.DNI WHERE MONTH(X.perfing) = 1 AND 
YEAR(X.perfing) = 2018
--WHERE X.perid = '42347030'
) z

UNION ALL

/*********************** FEBRERO **************************/
select DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN, 0 GRT_ENE,
(CASE WHEN Dia_Ing = 1 and Month(z.perfing) = 2 AND YEAR(Z.perfing) = 2018 THEN (SELECT FEB FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) ELSE 0 END) GRT_FEB, 
(SELECT MAR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_MAR, (SELECT ABR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_ABR, 
(SELECT MAY FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_MAY, (SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_JUN
from (
SELECT *, DAY(perfing) Dia_Ing
FROM (
select perid, pernombre, permaterno, perpaterno, perfing from Personal x where perid in (
select DNI from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
)
) --order by x.perid
) X
INNER JOIN (

select * from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
) --order by DNI
) Y ON X.perid = Y.DNI WHERE MONTH(X.perfing) = 2 AND 
YEAR(X.perfing) = 2018
--WHERE X.perid = '42347030'
) z

UNION ALL

/*********************** MARZO **************************/
select DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN, 0 GRT_ENE, 0 GRT_FEB,
(CASE WHEN Dia_Ing = 1 and Month(z.perfing) = 3 AND YEAR(Z.perfing) = 2018 THEN (SELECT MAR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) ELSE 0 END) GRT_MAR, 
(SELECT ABR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_ABR, (SELECT MAY FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_MAY, 
(SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_JUN
from (
SELECT *, DAY(perfing) Dia_Ing
FROM (
select perid, pernombre, permaterno, perpaterno, perfing from Personal x where perid in (
select DNI from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
)
) --order by x.perid
) X
INNER JOIN (

select * from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
) --order by DNI
) Y ON X.perid = Y.DNI WHERE MONTH(X.perfing) = 3 AND 
YEAR(X.perfing) = 2018
--WHERE X.perid = '42347030'
) z

UNION ALL

/*********************** ABRIL **************************/
select DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN, 0 GRT_ENE, 0 GRT_FEB, 0 GRT_MAR,
(CASE WHEN Dia_Ing = 1 and Month(z.perfing) = 4 AND YEAR(Z.perfing) = 2018 THEN (SELECT ABR FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) ELSE 0 END) GRT_ABR, 
(SELECT MAY FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_MAY, (SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_JUN
from (
SELECT *, DAY(perfing) Dia_Ing
FROM (
select perid, pernombre, permaterno, perpaterno, perfing from Personal x where perid in (
select DNI from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
)
) --order by x.perid
) X
INNER JOIN (

select * from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
) --order by DNI
) Y ON X.perid = Y.DNI WHERE MONTH(X.perfing) = 4 AND 
YEAR(X.perfing) = 2018
--WHERE X.perid = '42347030'
) z

UNION ALL

/*********************** MAYO **************************/
select DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN, 0 GRT_ENE, 0 GRT_FEB, 0 GRT_MAR, 0 GRT_ABR,
(CASE WHEN Dia_Ing = 1 and Month(z.perfing) = 5 AND YEAR(Z.perfing) = 2018 THEN (SELECT MAY FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) ELSE 0 END) GRT_MAY, 
(SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) GRT_JUN
from (
SELECT *, DAY(perfing) Dia_Ing
FROM (
select perid, pernombre, permaterno, perpaterno, perfing from Personal x where perid in (
select DNI from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
)
) --order by x.perid
) X
INNER JOIN (

select * from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
) --order by DNI
) Y ON X.perid = Y.DNI WHERE MONTH(X.perfing) = 5 AND 
YEAR(X.perfing) = 2018
--WHERE X.perid = '42347030'
) z

UNION ALL

/*********************** JUNIO **************************/
select DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN, 0 GRT_ENE, 0 GRT_FEB, 0 GRT_MAR, 0 GRT_ABR, 0 GRT_MAY,
(CASE WHEN Dia_Ing = 1 and Month(z.perfing) = 6 AND YEAR(Z.perfing) = 2018 THEN (SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = Z.DNI) ELSE 0 END) GRT_JUN
from (
SELECT *, DAY(perfing) Dia_Ing
FROM (
select perid, pernombre, permaterno, perpaterno, perfing from Personal x where perid in (
select DNI from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
)
) --order by x.perid
) X
INNER JOIN (

select * from GRATIDIASPERIODO  
where 
(
ENE <> 30 or 
FEB <> 30 or 
MAR <> 30 or 
ABR	<> 30 or
MAY	<> 30 or
JUN	<> 30 
) --order by DNI
) Y ON X.perid = Y.DNI WHERE MONTH(X.perfing) = 6 AND 
YEAR(X.perfing) = 2018
--WHERE X.perid = '42347030'
) z

UNION ALL

SELECT DNI, PERSONAL, ENE, FEB, MAR, ABR, MAY, JUN, 
ENE GRT_ENE,
FEB GRT_FEB,
MAR GRT_MAR,
ABR GRT_ABR,
MAY GRT_MAY,
JUN GRT_JUN

--(SELECT ENE FROM GRATIDIASPERIODO WHERE DNI = GT.DNI) GRT_ENE,
--(SELECT FEB FROM GRATIDIASPERIODO WHERE DNI = GT.DNI) GRT_FEB, (SELECT MAR FROM GRATIDIASPERIODO WHERE DNI = GT.DNI) GRT_MAR, (SELECT ABR FROM GRATIDIASPERIODO WHERE DNI = GT.DNI) GRT_ABR, 
--(SELECT MAY FROM GRATIDIASPERIODO WHERE DNI = GT.DNI) GRT_MAY, (SELECT JUN FROM GRATIDIASPERIODO WHERE DNI = GT.DNI) GRT_JUN

FROM GRATIDIASPERIODO GT INNER JOIN PERSONAL P ON GT.DNI = P.perid WHERE YEAR(P.perfing) >= '1990' AND YEAR(P.perfing) < '2018' AND P.perstatus IN ('A','V')

) PEPEGRILLO ORDER BY PERSONAL ASC