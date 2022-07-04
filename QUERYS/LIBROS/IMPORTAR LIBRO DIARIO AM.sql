
sp_helptext  imporLibroDiario_xls

alter view imporLibroDiario_xls      
as    
SELECT t.PerPost, t.BatNbr,CAST( t.module+'A' AS CHAR(3))AS module,v.Acct,convert(varchar,t.TranDate, 103) TranDate,v.Descr,  
(case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.CrAmt*-1 as decimal(10,2)) as varchar)  else cast(cast(t.DrAmt as decimal(10,2)) as varchar) end)  DrAmt,  
(case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.DrAmt*-1 as decimal(10,2)) as varchar)  else cast(cast(t.CrAmt as decimal(10,2)) as varchar) end)  CrAmt,  
v.Start      
FROM  stc_vr_ShareGLPeriodBal v      
 LEFT OUTER JOIN GLTran t WITH(INDEX(GLTran6)) ON v.Acct = t.Acct AND      
 v.BalanceType = t.BalanceType AND v.LedgerID = t.LedgerID AND      
     v.Period = t.PerPost AND v.Sub = t.Sub AND t.Posted = 'P' AND      
 v.Fiscyr = t.Fiscyr AND v.curyid = t.curyid AND v.CpnyID = t.CpnyId     
union all    
    
SELECT t.PerPost, t.BatNbr,CAST( t.module+'C' AS CHAR(2)) AS module,v.Acct,convert(varchar,t.TranDate, 103) TranDate,v.Descr,    
(case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.CrAmt*-1 as decimal(10,2)) as varchar)  else cast(cast(t.DrAmt as decimal(10,2)) as varchar) end)  DrAmt,    
(case when (v.Acct ='401720' and (t.DrAmt) < 0) then cast(cast(t.DrAmt*-1 as decimal(10,2)) as varchar)  else cast(cast(t.CrAmt as decimal(10,2)) as varchar) end)  CrAmt,    
v.Start        
FROM  AMCAF2015APP.DBO.stc_vr_ShareGLPeriodBal v        
 LEFT OUTER JOIN AMCAF2015APP.DBO.GLTran t WITH(INDEX(GLTran6)) ON v.Acct = t.Acct AND        
 v.BalanceType = t.BalanceType AND v.LedgerID = t.LedgerID AND        
     v.Period = t.PerPost AND v.Sub = t.Sub AND t.Posted = 'P' AND        
 v.Fiscyr = t.Fiscyr AND v.curyid = t.curyid AND v.CpnyID = t.CpnyId     


