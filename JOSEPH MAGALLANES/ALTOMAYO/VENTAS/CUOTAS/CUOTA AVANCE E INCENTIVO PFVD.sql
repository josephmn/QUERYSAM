
--SELECT A.shipperid, A.Invcnbr, A.perpost, A.slsperid, B.invtid, B.Descr, B.qtyship, B.Slsprice, B.totinvc, 
--(B.totinvc*1.18) CIGV, C.idmarca
--FROM SOShipHeader A
--INNER JOIN SOShipLine B ON A.SHIPPERID = B.SHIPPERID
--LEFT JOIN ZInventoryMILES C ON B.invtid = C.invtid
--WHERE A.Cancelled = 0 and A.SLSPERID = '973' AND PerPost = '202104'
--ORDER BY A.ShipperID ASC

SELECT PerPost, pvfdV_id, slsperid, name, idmarca, Cuota, avance, 
isnull((select top 1 monto from unpvt where numid='000419' --000420 AREQPT 
and lineas = idmarca and avance >= porc order by cast(porc as float) desc),0) logro FROM (
SELECT A.perpost, D.pvfdV_id, A.slsperid, S.name, C.idmarca, D.cuota, round(sum(B.totinvc),2) totinvc, 
cast(round(cast(sum(B.totinvc) as decimal(10,2))/cast(D.cuota as decimal(10,2)),4)*100 as float) avance
FROM SOShipHeader A
INNER JOIN SOShipLine B ON A.SHIPPERID = B.SHIPPERID
LEFT JOIN ZInventoryMILES C ON B.invtid = C.invtid
LEFT JOIN PV_FuerzaDirectaD D ON A.slsperid = D.pvfdD_id and C.idmarca = D.Marca and D.pvfdV_id = '000070' --'000066' --'000070'
LEFT JOIN Salesperson S ON A.slsperid = S.slsperid
WHERE A.Cancelled = 0 and A.SLSPERID = '738' AND A.PerPost IN ('202104') 
group by A.perpost, D.pvfdV_id, A.slsperid, S.name, C.idmarca, D.cuota
) X
order by x.idmarca asc



----select * from unpvt where numid = '000420' and lineas = 'MON' and 116.54 >= porc order by cast(porc as float) desc

--alter view unpvt
--as
--SELECT numid, porc, lineas, monto  
--FROM   
--   (select numid, porc, ACL, AGO, ADE, ATM, MON, KIM from INsemanalD ) p  --where numid = '000420'
--UNPIVOT  
--   (monto FOR lineas IN   
--      (ACL, AGO, ADE, ATM, MON, KIM)  
--)AS unpvt


--select * from INsemanalh where cod = '116'
--select * from INsemanalD where numid = '000420'

--SELECT * FROM PV_FuerzaDirectaH where periodo = '202104' and pvfdH_id = '000085'
--SELECT * FROM PV_FuerzaDirectaV where pvfdH_id = '000085'
--SELECT * FROM PV_FuerzaDirectaD where pvfdD_id = '976'

----select * from ventas where perpost = '202104' and slsperid = '973'

 --SELECT * FROM PV_FuerzaDirectaD where pvfdD_id = '706'


--select * from PV_FuerzaDirectaH H 
--inner join PV_FuerzaDirectaD D on H.pvfdH_id = D.pvfdV_id where pvfdH_id = '000085'
