/*
SELECT * 
-- UPDATE PAregistro SET rubsoles = 0
FROM PAregistro WHERE rubsoles <> 0
*/


SELECT SUM(B.cantidad) CANTIDAD, SUM(B.rubsoles) RUBSOLES
-- UPDATE B SET B.cantidad = 0, B.rubsoles = 0
-- UPDATE B SET B.cantidad = ROUND(B.cantidad,2), B.rubsoles = ROUND(B.rubsoles,2)
-- SELECT *
FROM paboletaH A
INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
WHERE A.periodoid = '202009' AND rubid = 'A03'

/*

SELECT SUM(B.cantidad) CANTIDAD, SUM(B.rubsoles) RUBSOLES
-- UPDATE B SET B.cantidad = 0, B.rubsoles = 0
FROM paboletaH A
INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
WHERE A.periodoid = '202008' AND rubid = 'A03'

-- SELECT SUM(B.cantidad) CANTIDAD, SUM(B.rubsoles) RUBSOLES
SELECT A.PERID, A.PERNOMBRE, B.*
-- UPDATE B SET B.cantidad = 0, B.rubsoles = 0
FROM paboletaH A
INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
--WHERE A.periodoid = '202008' AND rubid = 'AFA'
WHERE A.perid = '45206375' and A.periodoid = '202008'
*/



--SELECT * FROM paboletaH WHERE periodoid = '202009' AND perid = '46563840'

--SELECT * FROM paboletad WHERE nbrboleta = '9000118945' --AND rubid = 'R21'

--INSERT INTO PABOLETAD 
--(cantidad, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

----SELECT TOP 1 cantidad, B.nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, b.user1, b.user10, b.user2, b.user3, b.user4, b.user5, b.user6, b.user7, b.user8, b.user9
----FROM paboletaH A
----INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
----WHERE A.periodoid = '202008' AND rubid = 'R27' AND B.rubsubc = '000000000000' 

--SELECT TOP 1 0, '9000118945', provisiona, '', '', rubdesc, rubid, rubporcentaje, 0, '000000000000', '000000000000', rubtipo, b.user1, b.user10, b.user2, b.user3, b.user4, b.user5, b.user6, b.user7, b.user8, b.user9
--FROM paboletaH A
--INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
--WHERE rubid = 'D17' --AND A.nbrboleta = '9000118769'

-- 9000118400
