
SELECT SlsperID, BillZip, TermsID,* 
-- UPDATE newSH SET SlsperID = '680'
FROM newSH WHERE ShipperID = 'FLI0000086'
SELECT SlsperID, BillZip, TermsID,* 
-- UPDATE newSH SET SlsperID = '680'
FROM newSH WHERE ShipperID = 'FLI0000087'


--F010007958
--F010007959

--F010008382
--F010008379
--F010008456

--F010008519     
--F010008520    695         

select InvcNbr, * from soshipheader where shipperid = 'FLI0000097'

select Name, * from salesperson where slsperid = '767'

SELECT INVCNBR, CUSTID, SLSPERID, arbatnbr, TermsID, * 
-- UPDATE S SET SlsperID = '680'
FROM newSH S
WHERE InvcNbr = 'F010009716'

SELECT INVCNBR, CUSTID, SLSPERID, arbatnbr, TermsID, * FROM SOShipHeader 
WHERE InvcNbr = 'F010009716'

--F010008272
--F010008207

--F010007960
--F010007961

SELECT INVCNBR, CUSTID, SLSPERID, arbatnbr, * FROM SOShipHeader WHERE InvcNbr = 'F010009716'

SELECT INVCNBR, CUSTID, SLSPERID, arbatnbr, * FROM SOShipHeader WHERE CUSTID = '20544142772' AND PerPost = '201808'

--729       
--F020000259     
--F010007554     
--F010007746     

--F010008500     
--F010008499     


SELECT INVCNBR, CUSTID, SLSPERID, arbatnbr, TermsID, ShipperID, * 
-- update t set slsperid = '547', BILLZIP = '01SEM100' 
-- update t set TermsID = '03'
-- update t set TermsID = '05'
FROM SOShipHeader t WHERE InvcNbr = 'F010013924'
-- CUSTID = '20544142772' AND PerPost = '201808'

select perpost,batnbr,docdate,DueDate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid, * 
-- update c set slsperid = '547' 
-- update c set terms = '03', duedate = dateadd(day,30,docdate)
-- update c set terms = '05', duedate = dateadd(day,60,docdate)
from ardoc c where batnbr= '013715' and refnbr = 'F010013924'

select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc, Slsperid, *
-- update c set slsperid = '547'
from artran c where batnbr= '013715' and refnbr = 'F010013924' and slsperid <> ''

--select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
--where batnbr= '007164' and module = 'AR' and refnbr like 'F020000259'

--select * from aradjust where  adjdrefnbr = 'F010008519' AND adjbatnbr = '008130' 

--select * from SOShipHeader where PerPost = '201808'

--- REVISAR QUE PASEN BIEN A ARDOC

--F010007893     
--F010007900     


SELECT INVCNBR, CUSTID, SLSPERID, arbatnbr, INBatNbr, * 
-- update t set slsperid = '680'
FROM NEWSH t WHERE CUSTID = '20600132076' AND PerPost = '201810'

select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* 
-- update c set slsperid = '680'
from ardoc c where batnbr= '007880' and refnbr = 'F010007850'

select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc, Slsperid, * 
-- update c set slsperid = '680'
from artran c where batnbr= '007880' and refnbr = 'F010007850' and slsperid ='091'














