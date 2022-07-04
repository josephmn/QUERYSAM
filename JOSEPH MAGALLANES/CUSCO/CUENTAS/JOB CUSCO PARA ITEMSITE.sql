
/************* PARA LOCATION ******************/

SELECT * FROM
--UPDATE 
LOCATION 
--SET qtyonhand = (select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid)
where whseloc='BUENESTADO' AND round(qtyonhand,1) <> round((select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid),1)


SELECT qtyonhand, InvtID, SiteID, * FROM itemsite WHERE 

-- LastCost <---- ULTIMO COSTO DEL PRODUCTO
-- qtyonhand <---- STOCK DEL PRODUCTO

/************* RECARGAR NEWITEM SITE **************/

--exec xam_Recarga_xAMNewItemSite


/******/
CREATE PROC xam_Recarga_xAMNewItemSite
AS

declare @RegVs int
declare @RevTb int

set @RegVs = (select count(*) from xAMNewItemSiteVs)
set @RevTb = (select count(*) from xAMNewItemSite)

----------------------------------->

--CREATE VIEW dbo.xAMNewItemSiteVs
--AS
SELECT     
dbo.ItemSite.SiteID as SiteID_Sol, 
isNull(dbo.xAMSiteDistrib.ch_CodDistr,'') as SiteID_Nex, 
dbo.ItemSite.InvtID as InvtID_Sol, 
right('0000000000' + rtrim(dbo.ItemSite.InvtID),10) as InvtID_Nex, 
dbo.ItemSite.QtyOnHand, 
ISNull(dbo.xAMProdEnEmb.QtyPorDesp,0) as QtyPorDesp, 
IsNull(dbo.xAMProdEnEmb.QtyEnDesp,0) as QtyEnDesp, 
IsNull(dbo.xAMProdEnINporLib.QtySum,0) as QtyInPorLib, 
dbo.ItemSite.QtyInTransit,
(dbo.ItemSite.QtyOnHand- ISNull(dbo.xAMProdEnEmb.QtyPorDesp,0) - IsNull(dbo.xAMProdEnEmb.QtyEnDesp,0) - IsNull(dbo.xAMProdEnINporLib.QtySum,0)) as QtyAvail,
convert(Float,0) as QtyEnNex,
convert(Float,0) as QtyNewDisp,
convert(timestamp,'') as tstmap
FROM         
dbo.ItemSite 
LEFT OUTER JOIN dbo.xAMProdEnEmb ON dbo.ItemSite.SiteID = dbo.xAMProdEnEmb.SiteID AND dbo.ItemSite.InvtID = dbo.xAMProdEnEmb.InvtID 
LEFT OUTER JOIN dbo.xAMProdEnINporLib ON dbo.ItemSite.SiteID = dbo.xAMProdEnINporLib.SiteID AND dbo.ItemSite.InvtID = dbo.xAMProdEnINporLib.InvtID 
LEFT OUTER JOIN dbo.xAMSiteDistrib ON dbo.ItemSite.SiteID = dbo.xAMSiteDistrib.SiteId

----------------------------------->


IF @RegVs = @RevTb 
BEGIN

EXEC xAMUpdate_xAMNewItemSite
-------------------------------------------------------------------->

--CREATE  proc  xAMUpdate_xAMNewItemSite
--as
 --update xAMNewItemSite set
 SELECT *
		--xAMNewItemSite.QtyOnHand = xAMNewItemSiteVs.QtyOnHand, 
		--xAMNewItemSite.QtyPorDesp= xAMNewItemSiteVs.QtyPorDesp, 
		--xAMNewItemSite.QtyEnDesp = xAMNewItemSiteVs.QtyEnDesp,
		--xAMNewItemSite.QtyInPorLib = xAMNewItemSiteVs.QtyInPorLib,
		--xAMNewItemSite.QtyInTransit = xAMNewItemSiteVs.QtyInTransit,
		--xAMNewItemSite.QtyAvail = xAMNewItemSiteVs.QtyAvail,
		--xAMNewItemSite.QtyEnNex = xAMNewItemSiteVs.QtyEnNex,
		--xAMNewItemSite.QtyNewDisp = xAMNewItemSiteVs.QtyNewDisp
 from 	xAMNewItemSite  INNER JOIN xAMNewItemSiteVs 
		ON xAMNewItemSite.SiteID_Sol = xAMNewItemSiteVs.SiteID_Sol and xAMNewItemSite.InvtID_Sol = xAMNewItemSiteVs.InvtID_Sol 
 WHERE   round(xAMNewItemSite.QtyOnHand,2)  	<> round(xAMNewItemSiteVs.QtyOnHand,2)
	or  round(xAMNewItemSite.QtyPorDesp,2) 	<> round(xAMNewItemSiteVs.QtyPorDesp,2)
	or  round(xAMNewItemSite.QtyEnDesp,2)		<> round(xAMNewItemSiteVs.QtyEnDesp,2)
	or  round(xAMNewItemSite.QtyInPorLib,2)	<> round(xAMNewItemSiteVs.QtyInPorLib,2)
	or  round(xAMNewItemSite.QtyInTransit,2)	<> round(xAMNewItemSiteVs.QtyInTransit,2)
	or  round(xAMNewItemSite.QtyAvail,2)		<> round(xAMNewItemSiteVs.QtyAvail,2)
	or  round(xAMNewItemSite.QtyEnNex,2)		<> round(xAMNewItemSiteVs.QtyEnNex,2)
	or  round(xAMNewItemSite.QtyNewDisp,2)	<> round(xAMNewItemSiteVs.QtyNewDisp,2)

-------------------------------------------------------------------->

END
ELSE
BEGIN

insert into xAMNewItemSite
select SiteID_Sol, SiteID_Nex, InvtID_Sol, InvtID_Nex, QtyOnHand, QtyPorDesp, QtyEnDesp, QtyInPorLib, QtyInTransit, QtyAvail, QtyEnNex, QtyNewDisp, null             
from xAMNewItemSiteVs 
where (dbo.trim(SiteID_Sol) +''+ dbo.trim(InvtID_Sol)) not in (select dbo.trim(SiteID_Sol) +''+ dbo.trim(InvtID_Sol) from xAMNewItemSite)

END



/************* UPDATE NEWITEM SITE ****************/

exec xAMUpdate_xAMNewItemSite

CREATE  proc  xAMUpdate_xAMNewItemSite
as
SELECT *
 --update xAMNewItemSite set
	--	xAMNewItemSite.QtyOnHand = xAMNewItemSiteVs.QtyOnHand, 
	--	xAMNewItemSite.QtyPorDesp= xAMNewItemSiteVs.QtyPorDesp, 
	--	xAMNewItemSite.QtyEnDesp = xAMNewItemSiteVs.QtyEnDesp,
	--	xAMNewItemSite.QtyInPorLib = xAMNewItemSiteVs.QtyInPorLib,
	--	xAMNewItemSite.QtyInTransit = xAMNewItemSiteVs.QtyInTransit,
	--	xAMNewItemSite.QtyAvail = xAMNewItemSiteVs.QtyAvail,
	--	xAMNewItemSite.QtyEnNex = xAMNewItemSiteVs.QtyEnNex,
	--	xAMNewItemSite.QtyNewDisp = xAMNewItemSiteVs.QtyNewDisp
 from 	xAMNewItemSite  INNER JOIN xAMNewItemSiteVs 
		ON xAMNewItemSite.SiteID_Sol = xAMNewItemSiteVs.SiteID_Sol and xAMNewItemSite.InvtID_Sol = xAMNewItemSiteVs.InvtID_Sol 
 WHERE   round(xAMNewItemSite.QtyOnHand,2)  	<> round(xAMNewItemSiteVs.QtyOnHand,2)
	or  round(xAMNewItemSite.QtyPorDesp,2) 	<> round(xAMNewItemSiteVs.QtyPorDesp,2)
	or  round(xAMNewItemSite.QtyEnDesp,2)		<> round(xAMNewItemSiteVs.QtyEnDesp,2)
	or  round(xAMNewItemSite.QtyInPorLib,2)	<> round(xAMNewItemSiteVs.QtyInPorLib,2)
	or  round(xAMNewItemSite.QtyInTransit,2)	<> round(xAMNewItemSiteVs.QtyInTransit,2)
	or  round(xAMNewItemSite.QtyAvail,2)		<> round(xAMNewItemSiteVs.QtyAvail,2)
	or  round(xAMNewItemSite.QtyEnNex,2)		<> round(xAMNewItemSiteVs.QtyEnNex,2)
	or  round(xAMNewItemSite.QtyNewDisp,2)	<> round(xAMNewItemSiteVs.QtyNewDisp,2)







