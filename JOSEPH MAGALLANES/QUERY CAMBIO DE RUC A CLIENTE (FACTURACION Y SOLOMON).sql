


--SELECT CustId, Name, * FROM CUSTOMER WHERE CustId = '10116516809'

SELECT ARBatNbr, INBatNbr, CustID, InvcNbr, InvcDate, SiteID, BalDue, TermsID, * 
-- update d set CUSTID = '10165168009'
FROM SOShipHeader d WHERE CUSTID = '10165168009' and InvcNbr = 'F030014210'

--SELECT ID, * FROM INTran WHERE BatNbr = '005265' AND ID LIKE '1011651680%'

SELECT CustId, * 
-- update a set custid = '10165168009'
FROM ARDOC a WHERE BATNBR = '004861' AND CustId = '10165168009'

SELECT TOP 10 * 
-- update g set id = '10165168009'
FROM GLTran g WHERE ID = '10165168009' and RefNbr = 'F030014210'

--SELECT * FROM ARAdjust WHERE AdjdRefNbr = 'F030014210'

SELECT CustId, Name, BillSalut, Salut, TaxLocId, * 
-- update c set CustId = '10165168009', BillSalut = '10165168009', Salut = '10165168009', TaxLocId = '10165168009'
FROM CUSTOMER c WHERE CustId = '10165168009'

select CustId, TaxLocId, * 
--update s set CustId = '10165168009', TaxLocId = '10165168009'
from SOAddress s where custid = '10165168009'

--CORRECTO = 10165168009

/*

/****************************/
-- PARA FACELECTRO
USE AMFACELECT
GO

SELECT * FROM CLIENTE WHERE ID_CLIENTE = ''

SELECT * FROM DOCUMENTO WHERE ID_CLIENTE = ''





