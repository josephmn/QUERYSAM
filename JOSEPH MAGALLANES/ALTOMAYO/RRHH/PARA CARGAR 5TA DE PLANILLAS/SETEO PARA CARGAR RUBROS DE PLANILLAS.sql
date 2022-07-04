
--SELECT B.* 
---- UPDATE B SET B.CANTIDAD = 0, B.RUBSOLES = 0
--FROM paboletaH A
--INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
--WHERE A.periodoid = '202010'


SELECT SUM(B.CANTIDAD) CANTIDAD, SUM(B.RUBSOLES) RUBSOLES
-- UPDATE B SET B.CANTIDAD = ROUND(B.CANTIDAD,2), B.RUBSOLES = ROUND(B.RUBSOLES,2)
FROM paboletaH A
INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
WHERE A.periodoid = '202010' AND B.rubid = 'A03'

