
create view V_EMBARQUESS
as

select  right(CONVERT(VARCHAR(24),invcdate,105),4) +    
    substring(CONVERT(VARCHAR(24),invcdate,105),4,2) perpost,ShipperID ,invcnbr,custid,invcdate,orddate,slsperid,  BuildCmpltDate
       from soshipheader   
 
      
      select *  from  soshipheader
             
       select ShipperID,invcnbr,BMIEffDate,BuildCmpltDate,CreditHoldDate,curyeffdate ,datecancelled,etadate,invcdate,lastappenddate,LastAppendTime,orddate,packdate,pickdate,reldate,
       ShipDateAct,ShipDatePlan from soshipheader where  month(invcdate) in (5,6) 
       order by invcdate desc
 

       
  sp_helptext V_EMBARQUESS
       
       
       select *  from newsh 
ShipDatePlan
2016-06-08 00:00:00
sp_helptext  V_EMBARQUESS
