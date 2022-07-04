

SP_HELPTEXT  Actualiza_Stock_Sh


select * from  xamnewitemsitet

sp_helptext xamnewitemsitet

CREATE view xAMNewItemSiteT  
as  
SELECT   xAMNewItemSite.SiteID_Sol,  
   xAMNewItemSite.InvtID_Sol ,  
   xAMNewItemSite.QtyOnHand , --Liberado  
         xAMNewItemSite.QtyPorDesp ,   
   xAMNewItemSite.QtyEnDesp ,   
   xAMNewItemSite.QtyInPorLib ,   
         xAMNewItemSite.QtyInTransit ,   
   --xAMNewItemSite.QtyAvail ,   
   'QtyEnNextel' = IsNull(xAMProdNexSite.QtyEnNextel,0),--case when  xAMProdNexSite.QtyEnNextel is null then 0 else xAMProdNexSite.QtyEnNextel end ,   
         'QtyNewExist'  = xAMNewItemSite.QtyOnHand - xAMNewItemSite.QtyEnDesp - xAMNewItemSite.QtyInPorLib ,  
         'QtyNewDisp'  = xAMNewItemSite.QtyOnHand - xAMNewItemSite.QtyPorDesp - xAMNewItemSite.QtyEnDesp - xAMNewItemSite.QtyInPorLib - IsNull(xAMProdNexSite.QtyEnNextel,0)  
  
  
FROM     xAMNewItemSite LEFT OUTER JOIN  
         xAMProdNexSite ON xAMNewItemSite.SiteID_Sol = xAMProdNexSite.SiteID AND xAMNewItemSite.InvtID_Sol = xAMProdNexSite.InvtID  
  
  
  sp_helptext  xAMProdNexSite
  
-------
CREATE VIEW dbo.xAMProdNexSite  
AS  
SELECT      
SiteID_Sol as SiteID,   
Invtid_Sol as InvtID,   
SUM(QtyEnNextel) AS QtyEnNextel,  
convert(timestamp,') as tstmap  
FROM         dbo.xAMProdCompNexS  
GROUP BY SiteID_Sol, Invtid_Sol  
  
  
  sp_helptext  xAMProdCompNexS
  CREATE   View  dbo.xAMProdCompNexS      
as      
Select       
xAMSD.SiteId as SiteID_Sol,      
Nex.SiteId_Nex as SiteId_Nex,      
xAMSD.WhSeloc as WhSeloc_Sol,      
convert(char(30),Nex.Invtid_Sol) as Invtid_Sol,      
Nex.Invtid_Nex as Invtid_Nex,      
convert(float,Nex.QtySum) as QtyEnNextel,      
convert(timestamp,') as tstmap      
FROM  dbo.xAMProdCompNex as Nex      
LEFT OUTER JOIN dbo.xAMSiteDistrib as xAMSD      
ON Nex.SiteID_Nex = xAMSD.ch_CodDistr 

sp_helptext  xAMProdCompNex




CREATE view xAMProdCompNex  
as  
select    
H.ch_CodDistr as SiteID_Nex,   
right(D.ch_CodProd,5) as InvtID_Sol,   
D.ch_CodProd as InvtID_Nex,  
IsNull(sum(nu_Empaques),0) as QtySum  
FROM CAB_MOVI H   
INNER JOIN DET_MOVI D ON H.nu_correla = D.nu_correla   
AND H.ch_status = 'T'and ch_nopedido='  
group by ch_CodDistr,D.ch_CodProd   



select slsperid,* from customer where custid ='20547436700'
update customer set slsperid ='511' where custid ='20547436700' 
