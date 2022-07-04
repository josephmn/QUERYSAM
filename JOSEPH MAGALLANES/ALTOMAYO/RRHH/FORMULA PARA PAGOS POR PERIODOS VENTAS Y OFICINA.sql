
------ VENTAS (VARIABLE)

SELECT TOP 9999 h.perid, h.periodoid, d.rubsoles, d.rubid, d.rubdesc, d.cantidad, d.rubtipo
FROM paboletaH h
inner join paboletad d on h.nbrboleta = d.nbrboleta 
where LEFT(h.periodoid,4) = '2020' and h.perid = '09888735'
and rubsoles <> 0 and rubtipo not in ('01','05') AND rubid NOT IN ('D03','D22','D23','D16','D10','D24','D25','D27','D15','R17','R21','R18','D09','D26','D04')
and h.periodoid = '202001'
and d.user3 <> 1
order by d.rubtipo asc


---- ADMIN OFICINA

SELECT TOP 9999 h.nbrboleta, h.perid, h.periodoid, d.rubsoles, d.rubid, d.rubdesc, d.cantidad, d.rubtipo
FROM paboletaH h
inner join paboletad d on h.nbrboleta = d.nbrboleta 
where LEFT(h.periodoid,4) = '2020' and h.perid = '76086519'
and rubsoles <> 0 and rubtipo not in ('01','05') AND rubid NOT IN ('D03','D22','D23','D16','D10','D24','D25','D27','D15','R21','R18','D09','D26','D13','R24')
and h.periodoid = '202001'
and d.user3 <> 1
order by d.rubtipo asc

--SELECT * FROM PAregistro where perid = '72130767'

--SELECT * 
---- update paboletad set user3 = 1
--FROM paboletad WHERE nbrboleta = '9000105395' AND rubid = 'D18'

