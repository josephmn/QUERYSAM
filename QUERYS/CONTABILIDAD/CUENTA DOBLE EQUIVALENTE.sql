

use [am2016app]
go


sp_helptext LAG_LocAcctDis_DbNav

             Select *   
                from  LAG_LocAcctDis  
  -- where CpnyID like @parm1  and   
                -- LineNbr between @parmbeg and @parmend   
                order by LineNbr  

/*
SELECT *  FROM LAG_LocAcctDis WHERE ACCT9  ='659201' 

UPDATE LAG_LocAcctDis SET ACCT9  ='659203' WHERE ACCT9 ='659201' AND ACCT ='959203' AND ACCT9EQV ='791101'
*/
