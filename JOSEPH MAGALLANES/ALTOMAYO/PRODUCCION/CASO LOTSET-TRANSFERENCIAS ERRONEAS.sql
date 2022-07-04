

select SiteId, OrigQty, QtyOnHand, * from LotSerMst where InvtID  ='25513' and siteid  ='CIXINSUMOS'
select SiteId, QtyOnHand, * from Location where InvtID  ='25513' and siteid  ='CIXINSUMOS'
select SiteId, QtyAvail, QtyOnHand, * from ItemSite where InvtID  ='25513' and siteid  ='CIXINSUMOS'


--update LotSerMst set origqty =7090,  QtyOnHand = 7090 where InvtID  ='25513' and siteid  ='CIXINSUMOS' and lotsernbr ='0312201800'


select * from LotSerT where InvtID  ='25513' and siteid  ='CIXINSUMOS'
