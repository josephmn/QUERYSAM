
SELECT Salesperson."Name", Salesperson."SlsperId", ARDoc."CuryOrigDocAmt", ARDoc."CustId", ARDoc."DocDate", ARDoc."DocType", ARDoc."RefNbr", ARDoc."SlsperId",
 ARDoc."Terms", ARAdjust."AdjAmt", ARAdjust."AdjBatNbr", ARAdjust."AdjgDocDate", ARAdjust."AdjgDocType", ARAdjust."AdjgPerPost", ARAdjust."AdjgRefNbr",
  ARAdjust."CuryAdjgAmt", Customer."Name" FROM { oj (("AM2016APP"."dbo"."Salesperson" Salesperson LEFT OUTER JOIN "AM2016APP"."dbo"."ARDoc" ARDoc
   ON Salesperson."SlsperId" = ARDoc."SlsperId")  INNER JOIN "AM2016APP"."dbo"."Customer" Customer ON ARDoc."CustId" = Customer."CustId") 
   INNER JOIN "AM2016APP"."dbo"."ARAdjust" ARAdjust ON ARDoc."RefNbr" = ARAdjust."AdjdRefNbr" AND ARDoc."CustId" = ARAdjust."CustId"} 
    WHERE ARDoc."DocType" <> 'PA'   AND ((ArAdjust.perappl between '201606' AND '201606') AND (aradjust.adjbatnbr in ('006641','006640','006354','006618','006585' ))) 
    ORDER BY ARDoc."SlsperId" ASC, ARDoc."RefNbr" ASC, ARAdjust."AdjgDocType" ASC, ARAdjust."AdjgRefNbr" ASC
    
    SELECT A.REFNBR  FROM salesperson  S 
    left outer join ardoc A  on S.slsperid  =A.slsperid 
    INNER JOIN CUSTOMER U ON A.CUSTID = U.CUSTID
    INNER JOIN  ARADJUST R ON A.refnbr  = r.adjdrefnbr and A.custid = R.custid WHERE A.DOCTYPE <>'PA' AND R.PERAPPL  ='201606' AND R.ADJDREFNBR LIKE '%F160069717%'
    
   
   
   
   
   SELECT A.REFNBR,A.SLSPERID ,S.SLSPERID
   --UPDATE  A SET  A.SLSPERID = S.SLSPERID
   FROM ARDOC   A 
   INNER JOIN SOSHIPHEADER S ON A.REFNBR  = S.INVCNBR 
   WHERE A.REFNBR IN 
   ( SELECT REFNBR FROM ARDOC WHERE BATNBR IN ('006641','006640','006354','006618','006585' ))
   AND A.DOCTYPE  ='IN' AND A.SLSPERID ='
   
    WHERE 
   
   006641-006640-006354-006618-006585 
   
   
   
   
   
   
     
   
   
   
     
    F160069733 
    F160069717
   
   
   
   
   
   
   
    select *  from Salesperson where slsperid ='463'
   
    select doctype,*  from ardoc where refnbr  ='F160069733'
    
    006441    BUENO
    006572    MALO
    
   -6640-6354-6618-6585