



select * from sys.tables where name like '%incen%'


SELECT * FROM xamPorIncentD

SELECT * FROM xamPorIncent

-- delete from xamPorIncent where user3 = '201806'
--insert into xamPorIncent (tipo, cargo, Porcentaje, crdtDate, monto, user1, user2, user3, user4)
select tipo, cargo, Porcentaje, crdtDate, monto, user1, user2, '202205', user4 from xamPorIncent where user3 = '202204'

--insert into xamPorIncentD (tipo, cargo, Porcentaje, Marca, crdtDate, monto, user1, user2, user3, user4, user5, user6, user7, user8, user9)
SELECT tipo, cargo, Porcentaje, Marca, crdtDate, monto, user1, user2, '202205', user4, user5, user6, user7, user8, user9 FROM xamPorIncentD where user3 = '202204'


select * 
-- update INsemanalh set Codigo = '000004'
from INsemanalh where perpost = '202204'

select * from INsemanalD

--DELETE FROM xamPorIncent WHERE user3 = '201809'
--DELETE FROM xamPorIncentD WHERE USER3 = '201809'



/* CAMBIO DE PFVD */ --- PEDIDO POR PEDRO LA TORRE A PARTIR DE 01-04-2019

SELECT SlsperId, Name, * FROM Salesperson WHERE Name LIKE '%luis%'


SELECT CustId RUC, Name RAZON, 'LISSETH ESPINOZA DAVILA' SUPERVISOR, SlsperId CODIGO, ClassId CLASE, PerNbr PERIODO, PriceClassID 'CLASE PRECIO', User1 ZONA, User5 'ZONA RUTA'
FROM Customer X WHERE SlsperId = '705' ORDER BY X.PriceClassID

SELECT CustId, Name, SlsperId, ClassId, PerNbr, PriceClassID, User1, User5
FROM Customer X WHERE SlsperId = '694' ORDER BY X.PriceClassID



--699	 LEDDY TARRILLO PEREZ
--700	 YONY LAMADRID AGUIRRE
--701	 MANUEL SALAZAR PIEDRA
--702	 OLGA SENMACHE LINARES
--703	 ANA PAOLA VERA SANCHEZ
--705	 LISSETH ESPINOZA DAVILA


select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '778'

select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '771'
select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '544'
select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '599'
select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '656'
select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '706'
select SlsperId, Name, User2, S4Future11, * from Salesperson WHERE SlsperId = '738'



--694

select User1, User5, SlsperId, * from Customer where SlsperId = '694'

-- ALEJANDRO PEREZ (006) (03MEN01)-----> LUIS ROJAS (694) (03DISCH)

SELECT User1, User5, SlsperId, * 
-- UPDATE Customer SET SlsperId = '694', User5 = '03DISCH'
FROM Customer WHERE CustId IN (
'20450456927',
'20404342593',
'20450382893',
'20600048652',
'20494057400',
'20531174730',
'20489155070',
'20450394638',
'20542262762'
)


SELECT slsperid, custid, * FROM SOShipHeader WHERE Custid in (
'20480050984',
'20600048652') and PerPost = '201903' and SiteID = 'CIXPT'

-- LUIS ROJAS (694) ---- > ALEJANDO PEREZ (006) 


SELECT User1, User5, SlsperId, * 
-- UPDATE Customer SET SlsperId = '006', User5 = '03MEN01'
FROM Customer 
WHERE CustId IN (
'20479504068',
'20480050984',
'20480193319'
)


----- SOOADRESS

SELECT User2, SlsPerID, User5, * 
-- UPDATE SOAddress SET SlsPerID = '694', User5 = '03DISCH'
FROM SOAddress WHERE CustId IN (
'20450456927',
'20404342593',
'20450382893',
'20600048652',
'20494057400',
'20531174730',
'20489155070',
'20450394638',
'20542262762'
) AND User5 <> ''






SELECT User2, SlsPerID, User5, * 
-- UPDATE SOAddress SET SlsPerID = '006', User5 = '03MEN01'
FROM SOAddress WHERE CustId IN (
'20479504068',
'20480050984',
'20480193319'
) and SlsPerID = '694'





















