      
 CREATE VIEW VSTOCKTODOSMOV            
  AS            
  --Funcion  : Detallado en formato excel de stock general            
  --Sistema  : Solomon IV            
  --Usuario  : Gasla Baudat Laisson Gadel            
  --Ultima Mod : 07/09/2016                 
              
  --select R.InvtID,R.Descr, SUM(R.QtyOnHand)QtyOnHand,R.maximo,R.promedio,R.Minimo, (case when R.maximo  = 0  then 0  else (SUM(R.QtyOnHand) / R.Maximo)*30 end )DiasInventario             
  --from (            
  --SELECT 'Altomayo'Empresa,I.INVTID,I.descr,N.QtyOnHand ,max(T.StkMax)Maximo,avg(T.StkProm)Promedio,min(T.StkMax)Minimo            
  --from XAMNEWITEMSITE N            
  --inner JOIN INVENTORY I ON N.InvtID_Sol = I.InvtID            
  --inner JOIN TB_VALORESPROD T ON I.InvtID = T.InvtID  AND T.stkmax>0            
  --group by   I.INVTID ,I.descr ,N.QtyOnHand             
  --)R group by R.InvtID,R.Descr ,R.maximo,R.promedio,R.Minimo            
                  
 -- select R.InvtID,I.Descr,round(sum(R.QtyOnHand),2) QtyOnHand,round(max(Maximo),2) Maximo, round(min (Maximo),2)Minimo , round(avg (Maximo),2) Promedio , round((avg(R.QtyOnHand)/max(Maximo))*30,2) DiasInventario            
 -- from (            
 -- SELECT 'general'Empresa,T.USER4 perpost,t.INVTID,SUM(N.QtyOnHand)QtyOnHand,SUM(T.StkMax)Maximo            
 --from TB_VALORESPROD T inner join XAMNEWITEMSITE N on N.InvtID_Sol = T.InvtID and T.siteid = N.SiteId_Sol            
 -- WHERE t.INVTID ='21726' and  T.stkmax>0            
 -- group by  T.USER4,t.INVTID            
 -- )R               
 -- inner JOIN INVENTORY I ON R.INVTID = I.InvtID            
 -- where QtyOnHand>0 and perpost <> ltrim(year(getdate()))+ right('00' + ltrim(month (getdate())),2)            
 -- and r.INVTID ='21726'            
 -- group by R.InvtID,I.Descr             
            
            
            
select x.InvtID,x.Descr,round(sum(y.QtyNewDisp),2) QtyOnHand ,max(Maximo)Maximo ,min(Minimo) Minimo, avg(Promedio) Promedio            
from (            
  select R.InvtID,I.Descr,round(max(Maximo),2) Maximo, round(min (Maximo),2)Minimo , round(avg (Maximo),2) Promedio             
  from (            
  SELECT 'general'Empresa,T.USER4 perpost,t.INVTID,SUM(T.StkMax)Maximo  ,siteid          
  from TB_VALORESPROD T --inner join XAMNEWITEMSITE N on N.InvtID_Sol = T.InvtID and T.siteid = N.SiteId_Sol            
  WHERE t.SITEID not in('CIXDESMEDR','CIXDESUSO','HUADESUSO','LIMDESUSO','ROCSA1','ROCSA2')   --and t.StkMax >0         
  group by  T.USER4,t.INVTID  ,t.siteid          
  )R               
  left JOIN INVENTORY I ON R.INVTID = I.InvtID            
  where              
  perpost <> ltrim(year(getdate()))+ right('00' + ltrim(month (getdate())),2)            
  and   R.SITEID NOT IN ('CIXDESMEDR','CIXDESUSO','HUADESUSO','LIMDESUSO','ROCSA1','ROCSA2')            
  group by R.InvtID,I.Descr             
) x inner join (select InvtID_Sol,sum(QtyNewDisp)QtyNewDisp from XAMNEWITEMSITET where siteid_sol not in('CIXDESMEDR','CIXDESUSO','HUADESUSO','LIMDESUSO','ROCSA1','ROCSA2')         
  group by InvtID_Sol) Y            
on X.InvtID = Y.InvtID_Sol            
group by x.InvtID,x.Descr     



select * from TB_VALORESPROD