
---- CLIENTES POR SUPERVISOR, TRADICIONAL, INSTITUCIONAL, AUTOSERVICIOS

SELECT distinct S.CustID, TermsID, S.SlsperID, C.Name FROM SOShipHeader S
INNER JOIN Customer C ON S.CustID = C.CustId
INNER JOIN SOShipLine O ON O.ShipperID = S.ShipperID
INNER JOIN (SELECT InvtID FROM Inventory WHERE user6 = 'GOU' AND InvtID NOT LIKE '%GS%' AND InvtID LIKE '21%' AND TranStatusCode = 'AC'
and InvtID not in ('21762','21765','21766','21767','21768','21769','21772','21779','21785','21787','21788','21789','21791','21792','21793','21722','21748'))X ON X.InvtID = O.InvtID
WHERE S.SlsperID = '695' AND 
InvcDate >= '2018-01-01' /*COLOCAR FECHA PARA VER CLIENTES*/ --<----- INGRESAR FECHA
and S.TermsID <> '01' AND S.TermsID = '03'

-- CONSULTA CODIGO SUPERVISOR
SELECT SlsperId, Name, * FROM Salesperson WHERE Name LIKE '%ALLISON%'

select SlsperId, * 
-- UPDATE c set slsperid = '680'
from customer c where custid IN (
'20123387326',
'20537321190',
'20254014843',
'20340549750',
'20100049181',
'20465062356',
'20510716974',
'20516079372',
'20506782610',
'20538713211',
'20509411671',
'20100118336',
'20523005503',
'20600677951',
'20601632846',
'20563079585',
'20600935195',
'20570874803',
'20536837893',
'20553246971',
'20503794692',
'20600939905',
'20550322383',
'20517612511',
'10406234547',
'20552885776',
'20538227545',
'20304420244',
'20333684021',
'20602855482',
'20512913017',
'20493428536',
'20513081236',
'20500985322',
'20108730294',
'20601652634',
'20263809441')
/*
'20123387326'

680
*/