

------CLIENTES 


select customer.custid,customer.name,customer.taxregnbr,customer.phone,customer.zip,customer.status
 from customer (FASTFIRSTROW)  where
 custid like  '%'  
 and (customer.custid between '56425455'
 and 'zzzzzzzzzzzzzzz') order by custid



SELECT* FROM CUSTOMER WHERE CUSTID ='56425455'

DECLARE @CUST_OLD  VARCHAR(11) 
DECLARE @CUST_NEW VARCHAR(11)
SET @CUST_OLD = '56425455'
SET @CUST_NEW = '05642545'
UPDATE CUSTOMER SET BILLSALUT = @CUST_NEW,CUSTID=@CUST_NEW,SALUT =@CUST_NEW,TAXLOCID =@CUST_NEW
WHERE CUSTID =@CUST_OLD



SELECT CUSTID,NAME,* FROM CUSTOMER WHERE  CUSTID LIKE '%2060072751%'
 
  2049108184    
  
  
  
  
select custid,* from ardoc where refnbr like '%0984'
