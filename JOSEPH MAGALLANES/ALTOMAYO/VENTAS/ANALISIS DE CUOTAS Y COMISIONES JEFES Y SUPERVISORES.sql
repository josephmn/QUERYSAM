/*
select SlsperId, Name, S4Future11, a.User2, b.perfing, * 
from Salesperson A
LEFT JOIN PERSONAL B ON a.Attn = b.perid
where Name like '%stagnaro%'


-- SELECT * FROM Salesperson WHERE Attn = '42679855'

select SlsperId, Name, S4Future11, User2, * 
from Salesperson where SlsperId = '653'

-- 017 luicia becerra


select * from xamPorIncentD where user3 = '202201' and Marca = '091'
select * from [am2021app]..xamPorIncentD where Marca = '956'

select * from xamPorIncentD where user1 = '111'
*/

-- user1 --- codigo de bloque
-- user9 --- referencia a jefe
select tipo, cargo, Porcentaje, Marca, crdtDate, monto, a.user1, a.user2, a.user3, a.user4, a.user9, c.perfing 
-- update a set a.user9 = '935'
-- update a set a.user1 = '105'
-- update a set a.user9 = '557', a.crdtDate = '1900-01-01'
from xamPorIncentD a
left join Salesperson b on a.Marca = b.SlsperId
LEFT JOIN PERSONAL c ON b.Attn = c.perid
where a.user3 = '202201' AND tipo = 'V' AND cargo = 'V' AND a.user2 = 2 AND --c.perfing > = '2022-01-31'
Marca NOT IN 
(
'985','919','566','910','726','892','605','926','970','842','914','909','577','870','850','911','607','621','872',
'840','013','988','830','975','977','976','978','974','029','035','036','037','952','596','792','039','816','997',
'998','916','805','853','544','656','706','599','015','018','578','040','580','924','802','972','779','588','041',
'579','583','762','584','732','923','042','915','817','703','700','705','701','702','699','536','854','946','687',
'727'
)

select * 
-- update INsemanalh set perpost = '202201'
from INsemanalh 
--where cod = '104'


SELECT * FROM am2021app..INsemanalh where numid = '000432'
SELECT * FROM am2021app..INsemanalD where numid = '000432'
