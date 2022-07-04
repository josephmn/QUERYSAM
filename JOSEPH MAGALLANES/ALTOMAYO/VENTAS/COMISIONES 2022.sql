
/* REVISAR SI EXISTE EN EL PERIODO */

--insert into xamPorIncent 
--(tipo, cargo, Porcentaje, crdtDate, monto, user1, user2, user3, user4)
select tipo, cargo, Porcentaje, crdtDate, monto, user1, user2, '202201', user4 
from AM2021APP..xamPorIncent where user3 = '202112'

--insert into xamPorIncentD
--(tipo, cargo, Porcentaje, Marca, crdtDate, monto, user1, user2, user3, user4, user5, user6, user7, user8, user9)
select tipo, cargo, Porcentaje, Marca, crdtDate, monto, user1, user2, '202201', user4, user5, user6, user7, user8, user9 
from AM2021APP..xamPorIncentD where user3 = '202112'


--insert into INsemanalh
--(Codigo, numid, perpost, cod, descr, opcion, estado, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, 
--S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, User1, User2, User3, User4, User5, User6, User7, User8, User9, User10)
select Codigo, numid, perpost, cod, descr, opcion, estado, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, 
S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, User1, User2, User3, User4, User5, User6, User7, User8, User9, User10 
from AM2021APP..INsemanalh where perpost = '202112' and cod <> ''

--insert into INsemanalD
--(Perpost, numid, RefPorc, porc, ACL, AGO, ADE, ATM, MON, KIM, COB, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, 
--S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Codigo, User1, User2, User3, User4, User5, User6, User7, User8, User9, User10)
select Perpost, numid, RefPorc, porc, ACL, AGO, ADE, ATM, MON, KIM, COB, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, 
S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Codigo, User1, User2, User3, User4, User5, User6, User7, User8, User9, User10 
from AM2021APP..INsemanalD where numid in 
(select numid from AM2021APP..INsemanalh where perpost = '202112' and cod <> '')

/* EJECUTAR LOS JOBS */

-- 1. 0LlenarComisonVendedores_2020

-- 2. AM2020_LlenaPFVD   ...(REVISAR LOS PERIODOS)

-- 3. AM2020llenar_tb_ventas   ...(REVISAR LOS PERIODOS)

-- truncate table INsemanalh
select * 
-- update a set numid = x.wow
from INsemanalh a inner join (
select right(ltrim(rtrim('000000'+CAST(ROW_NUMBER() OVER(ORDER BY numid ASC) AS VARCHAR))),6) wow, numid
from INsemanalh 
) x on a.numid = x.numid

-- update INsemanalD set perpost = '202201'
-- update INsemanalh set perpost = '202201'

select SlsperId, Name, * from Salesperson where Name like '%deivy%'

select * from PV_FuerzaDirectaH
select * from PV_FuerzaDirectaD

