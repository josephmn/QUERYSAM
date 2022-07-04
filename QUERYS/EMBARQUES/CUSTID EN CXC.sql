

SELECT Salesperson."Name", Salesperson."SlsperId", ARDoc."CuryOrigDocAmt", ARDoc."CustId", ARDoc."DocDate", ARDoc."DocType", ARDoc."RefNbr", ARDoc."SlsperId",
 ARDoc."Terms", ARAdjust."AdjAmt", ARAdjust."AdjBatNbr", ARAdjust."AdjgDocDate", ARAdjust."AdjgDocType", ARAdjust."AdjgPerPost", ARAdjust."AdjgRefNbr", 
 ARAdjust."CuryAdjgAmt", Customer."Name" FROM { oj (("AM2016APP"."dbo"."Salesperson" Salesperson LEFT OUTER JOIN "AM2016APP"."dbo"."ARDoc" ARDoc
  ON Salesperson."SlsperId" = ARDoc."SlsperId")  INNER JOIN "AM2016APP"."dbo"."Customer" Customer ON ARDoc."CustId" = Customer."CustId") 
   INNER JOIN "AM2016APP"."dbo"."ARAdjust" ARAdjust ON ARDoc."RefNbr" = ARAdjust."AdjdRefNbr" AND ARDoc."CustId" = ARAdjust."CustId"}
    WHERE ARDoc."DocType" <> 'PA'   AND ((ArAdjust.perappl between '201605' AND '201605') AND (aradjust.custid like '%20452619483%'))
     ORDER BY ARDoc."SlsperId" ASC, ARDoc."RefNbr" ASC, ARAdjust."AdjgDocType" ASC, ARAdjust."AdjgRefNbr" ASC
     
     
     select *  from aradjust a
     inner join salesperson s on a.
  
  select S.SLSPERID,X.REFNBR,X.CUSTID,X.SLSPERID
  -- UPDATE X SET X.SLSPERID ='553'
  from salesperson S
  INNER JOIN 
  (   
  select batnbr,REFNBR,custid,slsperid from ardoc where doctype ='IN'
  AND REFNBR IN (SELECT ADJDREFNBR FROM ARADJUST )
  )x ON S.SLSPERID = X.SLSPERID AND S.SLSPERID ='553'
  
  
  
  
  
  SELECT * FROM xAMMae_Ruta WHERE SLSPERID ='203'
  
  
  SELECT SLSPERID,* FROM CUSTOMER WHERE CUSTID  ='20452619483'
 
  SELECT *  FROM ardoc where doctype ='IN' AND 
  
  SELECT *  FROM  [192.168.10.53].gisat.dbo.xAMMae_Ruta WHERE SLSPERID ='203'