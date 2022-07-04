
SELECT * 
-- update FAMBonificB SET Estado = 'A'
-- delete
FROM FAMBonificB where IdCorrelativo IN ('000070') --,'000068','000069')

SELECT * 
-- delete
FROM FAMBonificH where IdCorrelativo = '000070' --and Item0 = '06'

SELECT * 
-- delete
FROM FAMBonificDG where IdCorrelativo = '000070' --and Item0 = '06'

SELECT * 
-- delete
FROM FAMBonificD where IdCorrelativo = '000070' --and Item0 = '06'



/*

DELETE FROM FAMBonificB where IdCorrelativo = '000054'
DELETE FROM FAMBonificH where IdCorrelativo = '000054' --and Item0 = '06'
DELETE FROM FAMBonificDG where IdCorrelativo = '000054' --and Item0 = '06'
DELETE FROM FAMBonificD where IdCorrelativo = '000054' --and Item0 = '06'


*/
---ELIMINAR BONIFICACION GENERADA

select * 
-- delete
from xAMPromocionh where CodProm in ('0026') --,'0000036','000037')

select * 
-- delete
from xAMPromocionD where CodProm in ('0026')


/*
select * FROM [AM2019APP1902]..FAMBonificB where IdCorrelativo = '000051'
select * FROM [AM2019APP1902]..FAMBonificH where IdCorrelativo = '000051' --and Item0 = '06'
select * FROM [AM2019APP1902]..FAMBonificDG where IdCorrelativo = '000051' --and Item0 = '06'
select * FROM [AM2019APP1902]..FAMBonificD where IdCorrelativo = '000051' --and Item0 = '06'


insert into FAMBonificB 
(IdCorrelativo, Fecha, Almacen, Periodo, Estado, FechaIni, FechaFin, ListaClasePrecios, 
Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, User4, User5, 
User6, User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, 
s4future4, s4future5, s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, 
s4future12, s4future13, s4future14)

select  
IdCorrelativo, Fecha, Almacen, Periodo, Estado, FechaIni, FechaFin, ListaClasePrecios, 
Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, User4, User5, 
User6, User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, 
s4future4, s4future5, s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, 
s4future12, s4future13, s4future14
FROM [AM2019APP1902]..FAMBonificB where IdCorrelativo = '000051'


insert into FAMBonificH
(IdCorrelativo, Item0, Almacen, Descripcion, FechaIni, FechaFin, ListaClasePrecios, Crtd_DateTime, 
Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, User4, User5, User6, User7, User8, User9, 
User10, User11, User12, s4future1, s4future2, s4future3, s4future4, s4future5, s4future6, s4future7, 
s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14)

select IdCorrelativo, Item0, Almacen, Descripcion, FechaIni, FechaFin, ListaClasePrecios, Crtd_DateTime, 
Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, User4, User5, User6, User7, User8, User9, 
User10, User11, User12, s4future1, s4future2, s4future3, s4future4, s4future5, s4future6, s4future7, 
s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14
FROM [AM2019APP1902]..FAMBonificH where IdCorrelativo = '000051'


insert into FAMBonificDG
(IdCorrelativo, Item0, orden, InvtId, unidMedida, Descr, FechaIni, PriceClass, CustClass, Qty, 
Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, User4, User5, User6, 
User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, s4future4, s4future5, 
s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14)

select IdCorrelativo, Item0, orden, InvtId, unidMedida, Descr, FechaIni, PriceClass, CustClass, Qty, 
Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, User4, User5, User6, 
User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, s4future4, s4future5, 
s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14
FROM [AM2019APP1902]..FAMBonificDG where IdCorrelativo = '000051'


insert into FAMBonificD 
(IdCorrelativo, Item0, orden, InvtId, Descr, FechaIni, PriceClass, CustClass, Qty, Price, Cost, Margen, 
Promedio, Estado, Porcentaje, Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, 
User4, User5, User6, User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, 
s4future4, s4future5, s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14)

select IdCorrelativo, Item0, orden, InvtId, Descr, FechaIni, PriceClass, CustClass, Qty, Price, Cost, Margen, 
Promedio, Estado, Porcentaje, Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1, User2, User3, 
User4, User5, User6, User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, 
s4future4, s4future5, s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14
FROM [AM2019APP1902]..FAMBonificD where IdCorrelativo = '000051'





*/