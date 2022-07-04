
/***************************/
SELECT DISTINCT TERMSID FROM SOShipHeader SO WHERE INVCDATE = '2018-06-11' AND InvcNbr LIKE 'B%'
/***************************/

SELECT InvcDate, ShipDateAct, CreditHoldDate, CuryEffDate, ETADate, CustOrdNbr, OrdDate, OrdNbr, ShipDatePlan, InvcNbr, Cancelled, TermsID, ARBatNbr, INBatNbr, * 
-- UPDATE SO SET INVCDATE = '2018-06-12'
FROM SOShipHeader SO WHERE INVCDATE = '2018-06-11' AND InvcNbr LIKE 'B%' AND TermsID = '03' --and InvcNbr not like '%006674%' AND InvcNbr = 'F010006677'

SELECT CuryEffDate, DiscDate, DocDate, DueDate, * 
-- UPDATE AR SET DOCDATE = '2018-06-12', DUEDATE = '2018-07-12'
FROM ARDoc AR WHERE RefNbr IN (
SELECT InvcNbr FROM SOShipHeader SO WHERE INVCDATE = '2018-06-11' AND InvcNbr LIKE 'B%' AND TermsID = '03' --and InvcNbr not like '%006674%' AND InvcNbr = 'F010006677'
) AND DocType <> 'PA'

SELECT TRANDATE, TranType, * 
-- UPDATE AT SET TRANDATE = '2018-06-12'
FROM ARTRAN AT WHERE REFNBR IN (
SELECT InvcNbr FROM SOShipHeader SO WHERE INVCDATE = '2018-06-11' AND InvcNbr LIKE 'B%' AND TermsID = '03' --and InvcNbr not like '%006674%' AND InvcNbr = 'F010006677'
) AND TranType = 'IN'

SELECT TranDate, * 
-- UPDATE IT SET TranDate = '2018-06-12'
FROM INTRAN IT WHERE RefNbr IN (
SELECT InvcNbr FROM SOShipHeader SO WHERE INVCDATE = '2018-06-11' AND InvcNbr LIKE 'B%' AND TermsID = '03' --and InvcNbr not like '%006674%' AND InvcNbr = 'F010006677'
) --AND TRANTYPE = 'IN'

--01
--03
--04
--05
--11

SELECT TermsId, Descr FROM TERMS WHERE TermsId = '05'


SELECT CuryEffDate, DiscDate, DocDate, DueDate, * 
-- UPDATE AR SET DOCDATE = '2018-06-12', DUEDATE = (SELECT DATEADD(DAY,60,'2018-06-12'))
FROM ARDoc AR WHERE RefNbr IN (
--SELECT InvcNbr FROM SOShipHeader SO WHERE INVCDATE = '2018-06-11' AND InvcNbr LIKE 'F%' and InvcNbr not like '%006674%' AND TermsID = '11' 
'F010006678',     
'F010006681',     
'F010006680',     
'F010006679',     
'F010006682',     
'F010006684',     
'F010006683',     
'F010006690'  
) AND DocType <> 'PA'


SELECT DATEADD(DAY,60,'2018-06-12')

SELECT DATEADD(DAY,60,'2018-06-11')

