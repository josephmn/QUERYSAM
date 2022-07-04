
/**** CAMBIO DE RAZON SOCIAL CUZCO ****/

select VendName, VendId, * from PurchOrd where PONbr = '000664' --and VendId = '20564347982'

--update PurchOrd set VendId = '20527925682', VendName = 'ANDINO SAC' where PONbr = '000664'

select * from POReceipt where BatNbr = '017316'

--20602491391

/**** CONSULTA EL VENDEDOR ****/

SELECT Name, * FROM Vendor WHERE VendId = '20602491391'

--ANDINO SAC                    	20527925682    


SELECT CUSTID, batnbr, refnbr, * FROM ardoc
--update ardoc set custid  ='20511283460' 
where batnbr ='000571' and refnbr  ='F140009181' and CUSTID = '20511286460'

select CUSTID, * from artran
--update artran set custid  ='20511283460' 
where batnbr ='000571' and refnbr  ='F140009181'and  CUSTID = '20511286460'

select ID, * from gltran
--update gltran set id  ='20511283460' 
where batnbr ='000571' and refnbr  ='F140009181' and  module ='AR' AND ID = '20511286460'

select CUSTID, * from aradjust
--update aradjust set custid  ='20511283460' 
where adjbatnbr ='000571' and adjdrefnbr ='F140009181' and CUSTID = '20511286460'


--20511286460    	000569    	F140009181
--20511286460    	000571    	F140009181




