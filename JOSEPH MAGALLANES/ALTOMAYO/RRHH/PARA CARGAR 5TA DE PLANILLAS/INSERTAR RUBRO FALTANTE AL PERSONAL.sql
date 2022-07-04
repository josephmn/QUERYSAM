


SELECT * FROM paboletaH WHERE perid = '41780751' AND periodoid = '202010'

SELECT A.pernombre, B.*
FROM paboletaH A
INNER JOIN paboletad B ON A.nbrboleta = B.nbrboleta
WHERE A.periodoid = '202009' AND B.rubid = 'D03'



INSERT INTO paboletad 
(cantidad, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, rubsoles, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9)

SELECT 
0, '9000119241', provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, 0, 'CHNO00000000', 'CHNO00000000', rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9 
FROM paboletad WHERE nbrboleta = '9000119273' AND rubid = 'D17'

--SELECT 
--0, nbrboleta, provisiona, rubctac, rubctad, rubdesc, rubid, rubporcentaje, 0, rubsubc, rubsubd, rubtipo, user1, user10, user2, user3, user4, user5, user6, user7, user8, user9 
--FROM paboletad WHERE nbrboleta = '9000119273' --AND rubid = 'S01'


--DELETE TOP (1) FROM paboletad WHERE nbrboleta = '9000119273' AND rubid = 'D17'

