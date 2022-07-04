

DMG_Inventory_Purchases


create proc DMG_Inventory_Purchases
	@InvtID	varchar(30)
as
	select	*
	from	Inventory
	where	InvtID like @InvtID
	and	TranStatusCode in ('AC','NU')
	order by InvtID

-- Copyright 1998 by Advanced Distribution Group, Ltd. All rights reserved.


create proc DMG_Inventory_Purchases2
	@InvtID	varchar(30)
as
	select	*
	from	Inventory
	where	InvtID like @InvtID
	and	TranStatusCode in ('AC','NU')
	order by InvtID

-- Copyright 1998 by Advanced Distribution Group, Ltd. All rights reserved.



select * from Inventory	where InvtID like @InvtID and TranStatusCode in ('AC','NU')	order by InvtID

insert into Inventory 

(ABCCode, ApprovedVendor, BMIDirStdCost, BMIFOvhStdCost, BMILastCost, BMIPDirStdCost, BMIPFOvhStdCost, BMIPStdCost, BMIPVOvhStdCost, BMIStdCost, BMIVOvhStdCost, BOLCode, 
Buyer, ChkOrdQty, ClassID, COGSAcct, COGSSub, Color, CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryListPrice, CuryMinPrice, CustomFtr, CycleID, Descr, DfltPickLoc, 
DfltPOUnit, DfltSalesAcct, DfltSalesSub, DfltShpnotInvAcct, DfltShpnotInvSub, DfltSite, DfltSOUnit, DfltWhseLoc, DirStdCost, DiscAcct, DiscPrc, DiscSub, EOQ, ExplInvoice, 
ExplOrder, ExplPackSlip, ExplPickList, ExplShipping, FOvhStdCost, FrtAcct, FrtSub, GLClassID, InvtAcct, InvtID, InvtSub, InvtType, ItemCommClassID, Kit, LastBookQty, 
LastCost, LastCountDate, LastSiteID, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LeadTime, LotSerFxdLen, LotSerFxdTyp, LotSerFxdVal, LotSerIssMthd, LotSerNumLen, 
LotSerNumVal, LotSerTrack, LUpd_DateTime, LUpd_Prog, LUpd_User, MaterialType, MaxOnHand, MfgLeadTime, MinGrossProfit, MoveClass, MSDS, NoteID, Pack, PDirStdCost, PerNbr, 
PFOvhStdCost, PPVAcct, PPVSub, PriceClassID, ProdMgrID, ProductionUnit, PStdCost, PStdCostDate, PVOvhStdCost, ReordPt, ReOrdPtCalc, ReordQty, ReOrdQtyCalc, ReplMthd, 
RollupCost, RollupPrice, RvsdPrc, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, 
S4Future12, SafetyStk, SafetyStkCalc, Selected, SerAssign, Service, ShelfLife, Size, Source, Status, StdCost, StdCostDate, StkBasePrc, StkItem, StkRvsdPrc, StkTaxBasisPrc, 
StkUnit, StkVol, StkWt, StkWtUnit, Style, Supplr1, Supplr2, SupplrItem1, SupplrItem2, TaxCat, TranStatusCode, Turns, UPCCode, UsageRate, User1, User2, User3, User4, User5, 
User6, User7, User8, ValMthd, VOvhStdCost, WarrantyDays, YTDUsage)
values
('  ','0','0','0','0','0','0','0','0','0','0','          ','DBLAZMED  ','1','26','691110','0','                    ','A','2018-10-17','10250','EAHUAGAR  ','0','0','0','          ','	LUBRICANTE DE CALIDAD ALIMENTARIA  SKF','          ','UND','701110','0','          ','                        ','CIXSUMIN  ','UND   ','BUENESTADO','0','741101',' ','0000-000-00-000','0','0','0','0','0','0','0','          ','                        ','    ','261101','M267003','0','O','          ','0','0','0','1900-01-01','          ','0','0','0','0',	'0','0',' ','            ',' ','0','                         ','NN','2018-10-17','10250','SYSADMIN  ','12','0','0','1','          ','                        ','0','      ','0','201810','0','711101','0','      ','          ','      ','0','1900-01-01','0','0','0','0','0','Q','0','0','0','                              ','                              ','1','0','0','0','1900-01-01','1900-01-01','0','0','          ','          ','0','0','0',' ','0','0','          ','P',' ','0','1900-01-01','0','1','	0','0','UND','0','0','      ','          ','               ','               ','                    ','                    ','AFECTO    ','AC','0','                              ','0','MAN','LGFP 2/1','0','0','0','GRA','1900-01-01','1900-01-01','A','0','0','0')



--select * from InventoryADG where invtid = 'M261001'
--82
insert into InventoryADG 
(AllowGenCont, BatchSize, BOLClass, CategoryCode, CountryOrig, Crtd_DateTime, Crtd_Prog, Crtd_User, Density, DensityUOM, Depth, DepthUOM, Diameter, DiameterUOM, Gauge, 
GaugeUOM, Height, HeightUOM, InvtID, Len, LenUOM, ListPrice, LUpd_DateTime, LUpd_Prog, LUpd_User, MinPrice, NoteID, OMCOGSAcct, OMCOGSSub, OMSalesAcct, OMSalesSub, Pack, 
PackCnvFact, PackMethod, PackSize, PackUnitMultDiv, PackUOM, ProdLineID, RetailPrice, RoyaltyCode, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, 
S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SCHeight, SCHeightUOM, SCLen, SCLenUOM, SCVolume, SCVolumeUOM, SCWeight, SCWeightUOM, SCWidth, 
SCWidthUOM, StdCartonBreak, StdGrossWt, StdTareWt, Style, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9, Volume, VolUOM, Weight, WeightUOM, Width, WidthUOM)

values
('0','0','                    ','          ','                    ','2018-10-17','10250','EAHUAGAR  ','0','     ','0','     ','0','     ','0','     ','0','     ','M266022','0','     ','0','2018-10-17','10250','SYSADMIN  ','0','0','691110','0000-000-00-000','701110','0000-000-00-000','0','0','PP','0',' ','      ','MAN','0','          ','                              ','                              ','0','0','0','0','1900-01-01','1900-01-01','0','0','          ','          ','0','      ','0','      ','0','      ','0','      ','0','      ','0',0	,'0','                    ','                              ','1900-01-01','                              ','                              ','                              ','0','0','          ','          ','1900-01-01',0,'      ',0,'UND   ',0,'     ')


select InvtSub, DfltSalesSub, COGSSub, PPVSub, * from Inventory where InvtID = 'M266022'


select InvtSub, DfltSalesSub, COGSSub, PPVSub, InvtID, * 
-- update Inventory set InvtSub = '000000000000', DfltSalesSub= '000000000000', COGSSub= '000000000000', PPVSub= '000000000000'
from Inventory where InvtID like 'M%'


/*
select * 
-- update a user2
from inventory a inner join #ABCDFG t on a.InvtID = t.InvtID
*/


/*
-- drop table #ABCDFG
create table #ABCDFG
(
InvtID char(7),
ref char(60)
)

--delete #ABCDFG

INSERT INTO #ABCDFG (InvtID,ref)
values
('M270019','RESISTENCIA CARTUCHO 10mmX160mm'),
('M270020','RESISTENCIA CARTUCHO 10mmX254mm'),
('M270021','RESISTENCIA CARTUCHO 9.5mmX250mm'),
('M270022','RESISTENCIA CARTUCHO 10.5mmX220mm')

*/





--SELECT * FROM INVENTORY A INNER JOIN #ABCDFG B ON A.InvtID = B.InvtID

--SELECT * 
--FROM INVENTORY WHERE User6 = 'TAL'

BEGIN  

declare @InvtIdOP char(7)
declare @Descr char(60)

DECLARE ULTRAINSTINTO CURSOR FOR                         
        
select * from #ABCDFG --where IdCorrelativo > = '000001' and IdCorrelativo <= '000100' -- = 0 -- > '000524' --where idcorrelativo = '000013'
                    
      OPEN ULTRAINSTINTO  FETCH ULTRAINSTINTO INTO @InvtIdOP, @Descr
                                          
            WHILE (@@FETCH_STATUS = 0 )                                    
            BEGIN -- WHILE                                          
            --PROCESO  DEMO                    
            --PRINT 'ZHUKULENTO'  
					
					insert into Inventory 
					(ABCCode, ApprovedVendor, BMIDirStdCost, BMIFOvhStdCost, BMILastCost, BMIPDirStdCost, BMIPFOvhStdCost, BMIPStdCost, BMIPVOvhStdCost, BMIStdCost, BMIVOvhStdCost, BOLCode, 
					Buyer, ChkOrdQty, ClassID, COGSAcct, COGSSub, Color, CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryListPrice, CuryMinPrice, CustomFtr, CycleID, Descr, DfltPickLoc, 
					DfltPOUnit, DfltSalesAcct, DfltSalesSub, DfltShpnotInvAcct, DfltShpnotInvSub, DfltSite, DfltSOUnit, DfltWhseLoc, DirStdCost, DiscAcct, DiscPrc, DiscSub, EOQ, ExplInvoice, 
					ExplOrder, ExplPackSlip, ExplPickList, ExplShipping, FOvhStdCost, FrtAcct, FrtSub, GLClassID, InvtAcct, InvtID, InvtSub, InvtType, ItemCommClassID, Kit, LastBookQty, 
					LastCost, LastCountDate, LastSiteID, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LeadTime, LotSerFxdLen, LotSerFxdTyp, LotSerFxdVal, LotSerIssMthd, LotSerNumLen, 
					LotSerNumVal, LotSerTrack, LUpd_DateTime, LUpd_Prog, LUpd_User, MaterialType, MaxOnHand, MfgLeadTime, MinGrossProfit, MoveClass, MSDS, NoteID, Pack, PDirStdCost, PerNbr, 
					PFOvhStdCost, PPVAcct, PPVSub, PriceClassID, ProdMgrID, ProductionUnit, PStdCost, PStdCostDate, PVOvhStdCost, ReordPt, ReOrdPtCalc, ReordQty, ReOrdQtyCalc, ReplMthd, 
					RollupCost, RollupPrice, RvsdPrc, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, 
					S4Future12, SafetyStk, SafetyStkCalc, Selected, SerAssign, Service, ShelfLife, Size, Source, Status, StdCost, StdCostDate, StkBasePrc, StkItem, StkRvsdPrc, StkTaxBasisPrc, 
					StkUnit, StkVol, StkWt, StkWtUnit, Style, Supplr1, Supplr2, SupplrItem1, SupplrItem2, TaxCat, TranStatusCode, Turns, UPCCode, UsageRate, User1, User2, User3, User4, User5, 
					User6, User7, User8, ValMthd, VOvhStdCost, WarrantyDays, YTDUsage)
					
					SELECT 
					ABCCode, ApprovedVendor, BMIDirStdCost, BMIFOvhStdCost, BMILastCost, BMIPDirStdCost, BMIPFOvhStdCost, BMIPStdCost, BMIPVOvhStdCost, BMIStdCost, BMIVOvhStdCost, BOLCode, 
					Buyer, ChkOrdQty, ClassID, COGSAcct, COGSSub, Color, CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryListPrice, CuryMinPrice, CustomFtr, CycleID, @Descr, DfltPickLoc, 
					DfltPOUnit, DfltSalesAcct, DfltSalesSub, DfltShpnotInvAcct, DfltShpnotInvSub, DfltSite, DfltSOUnit, DfltWhseLoc, DirStdCost, DiscAcct, DiscPrc, DiscSub, EOQ, ExplInvoice, 
					ExplOrder, ExplPackSlip, ExplPickList, ExplShipping, FOvhStdCost, FrtAcct, FrtSub, GLClassID, InvtAcct, @InvtIdOP, InvtSub, InvtType, ItemCommClassID, Kit, LastBookQty, 
					LastCost, LastCountDate, LastSiteID, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LeadTime, LotSerFxdLen, LotSerFxdTyp, LotSerFxdVal, LotSerIssMthd, LotSerNumLen, 
					LotSerNumVal, LotSerTrack, LUpd_DateTime, LUpd_Prog, LUpd_User, MaterialType, MaxOnHand, MfgLeadTime, MinGrossProfit, MoveClass, MSDS, NoteID, Pack, PDirStdCost, PerNbr, 
					PFOvhStdCost, PPVAcct, PPVSub, PriceClassID, ProdMgrID, ProductionUnit, PStdCost, PStdCostDate, PVOvhStdCost, ReordPt, ReOrdPtCalc, ReordQty, ReOrdQtyCalc, ReplMthd, 
					RollupCost, RollupPrice, RvsdPrc, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, 
					S4Future12, SafetyStk, SafetyStkCalc, Selected, SerAssign, Service, ShelfLife, Size, Source, Status, StdCost, StdCostDate, StkBasePrc, StkItem, StkRvsdPrc, StkTaxBasisPrc, 
					StkUnit, StkVol, StkWt, StkWtUnit, Style, Supplr1, Supplr2, SupplrItem1, SupplrItem2, TaxCat, TranStatusCode, Turns, UPCCode, UsageRate, User1, User2, User3, User4, User5, 
					User6, User7, User8, ValMthd, VOvhStdCost, WarrantyDays, YTDUsage 
					FROM Inventory where InvtID = 'M263015'
					
					PRINT 'SE INSERTO EL CODIGO EN INVENTORY'+ ' ' + @InvtIdOP
					
					insert into InventoryADG 
					(AllowGenCont, BatchSize, BOLClass, CategoryCode, CountryOrig, Crtd_DateTime, Crtd_Prog, Crtd_User, Density, DensityUOM, Depth, DepthUOM, Diameter, DiameterUOM, Gauge, 
					GaugeUOM, Height, HeightUOM, InvtID, Len, LenUOM, ListPrice, LUpd_DateTime, LUpd_Prog, LUpd_User, MinPrice, NoteID, OMCOGSAcct, OMCOGSSub, OMSalesAcct, OMSalesSub, Pack, 
					PackCnvFact, PackMethod, PackSize, PackUnitMultDiv, PackUOM, ProdLineID, RetailPrice, RoyaltyCode, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, 
					S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SCHeight, SCHeightUOM, SCLen, SCLenUOM, SCVolume, SCVolumeUOM, SCWeight, SCWeightUOM, SCWidth, 
					SCWidthUOM, StdCartonBreak, StdGrossWt, StdTareWt, Style, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9, Volume, VolUOM, Weight, WeightUOM, Width, WidthUOM)

					SELECT
					AllowGenCont, BatchSize, BOLClass, CategoryCode, CountryOrig, Crtd_DateTime, Crtd_Prog, Crtd_User, Density, DensityUOM, Depth, DepthUOM, Diameter, DiameterUOM, Gauge, 
					GaugeUOM, Height, HeightUOM, @InvtIdOP, Len, LenUOM, ListPrice, LUpd_DateTime, LUpd_Prog, LUpd_User, MinPrice, NoteID, OMCOGSAcct, OMCOGSSub, OMSalesAcct, OMSalesSub, Pack, 
					PackCnvFact, PackMethod, PackSize, PackUnitMultDiv, PackUOM, ProdLineID, RetailPrice, RoyaltyCode, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, 
					S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SCHeight, SCHeightUOM, SCLen, SCLenUOM, SCVolume, SCVolumeUOM, SCWeight, SCWeightUOM, SCWidth, 
					SCWidthUOM, StdCartonBreak, StdGrossWt, StdTareWt, Style, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9, Volume, VolUOM, Weight, WeightUOM, Width, WidthUOM 
					FROM
					InventoryADG WHERE InvtID = 'M263015'



					PRINT 'SE INSERTO EL CODIGO EN INVENTORYADG'+ ' ' + @InvtIdOP
					PRINT '----------------------------------------------------'
					PRINT ''
			                                        
            FETCH ULTRAINSTINTO INTO @InvtIdOP, @Descr
            END-- END WHILE                                  
      CLOSE ULTRAINSTINTO                                  
      DEALLOCATE ULTRAINSTINTO                                
END 


---- PARA LOS PRODUCTOS RECIEN CREADOS

BEGIN  

declare @LOcation char(7)

DECLARE ULTRAINSTINTO CURSOR FOR                         
        
select Invtid from #ABCDFG --where IdCorrelativo > = '000001' and IdCorrelativo <= '000100' -- = 0 -- > '000524' 
--where Invtid = 'M262046'
                    
      OPEN ULTRAINSTINTO  FETCH ULTRAINSTINTO INTO @LOcation
                                          
            WHILE (@@FETCH_STATUS = 0 )                                    
            BEGIN -- WHILE                                          
            --PROCESO  DEMO                    
            --PRINT 'ZHUKULENTO'  
					
					

					INSERT INTO Location 
					(CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, InvtID, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyAlloc, QtyOnHand, QtyShipNotInv, 
					QtyWORlsedDemand, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
					S4Future11, S4Future12, Selected, SiteID, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)

					SELECT TOP 1 'A', '2018-02-27', '10400SQL', 'SYSADMIN', @LOcation, '2018-02-27', '10250', 'SYSADMIN', 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '1900-01-01', '1900-01-01', 0, 0, '', '', 0,
					'CIXSUMIN', '', '', 0, 0, '', '', '1900-01-01', '1900-01-01', 'BUENESTADO'
					FROM Location WHERE InvtID = 'M270010' --AND SiteID = 'CFCUSCO1'
					
					PRINT 'SE INSERTO EL CODIGO EN LOCATION'+ ' ' + @LOcation

					INSERT INTO ItemSite (ABCCode, AllocQty, AvgCost, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, 
					BMIPStdCst, BMIPVOvhStdCst, BMIStdCost, BMITotCost, BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, 
					Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, EOQ, FOvhStdCst, InvtAcct, InvtID, InvtSub, LastBookQty, LastCost, LastCountDate, 
					LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LastVendor, LeadTime, LUpd_DateTime, LUpd_Prog, 
					LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, PStdCostDate, PStdCst, PVOvhStdCst, 
					QtyAlloc, QtyAvail, QtyCustOrd, QtyInTransit, QtyNotAvail, QtyOnBO, QtyOnDP, QtyOnHand, QtyOnKitAssyOrders, QtyOnPO, QtyOnTransferOrders, 
					QtyShipNotInv, QtyWOFirmDemand, QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, 
					ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, 
					S4Future10, S4Future11, S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, ShipNotInvAcct, ShipNotInvSub, 
					SiteID, StdCost, StdCostDate, StkItem, TotCost, Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage)

					select ABCCode, AllocQty, AvgCost, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, 
					BMIPStdCst, BMIPVOvhStdCst, BMIStdCost, BMITotCost, BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, 
					Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, EOQ, FOvhStdCst, InvtAcct, @LOcation, InvtSub, LastBookQty, LastCost, LastCountDate, 
					LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LastVendor, LeadTime, LUpd_DateTime, LUpd_Prog, 
					LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, PStdCostDate, PStdCst, PVOvhStdCst, 
					QtyAlloc, QtyAvail, QtyCustOrd, QtyInTransit, QtyNotAvail, QtyOnBO, QtyOnDP, QtyOnHand, QtyOnKitAssyOrders, QtyOnPO, QtyOnTransferOrders, 
					QtyShipNotInv, QtyWOFirmDemand, QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, 
					ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, 
					S4Future10, S4Future11, S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, ShipNotInvAcct, ShipNotInvSub, 
					'CIXSUMIN', StdCost, StdCostDate, StkItem, TotCost, Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage 
					from ItemSite where InvtID = 'M270010' --and SiteID = 'CFCUSCO1'

					INSERT INTO xAMNewItemSite 
					(SiteID_Sol, SiteID_Nex, InvtID_Sol, InvtID_Nex, QtyOnHand, QtyPorDesp, QtyEnDesp, QtyInPorLib, QtyInTransit, QtyAvail, QtyEnNex, QtyNewDisp)
					
					--SELECT 'CFCUSCO3', '02', @LOcation, '000'+@LOcation, 0, 0, 0, 0, 0, 0, 0, 0 FROM xAMNewItemSite WHERE InvtID_Sol = 'I212248'
					--UNION ALL
					SELECT TOP 1 'CIXSUMIN', '', @LOcation, '000'+@LOcation, 0, 0, 0, 0, 0, 0, 0, 0 FROM xAMNewItemSite WHERE InvtID_Sol = 'M270010'

					PRINT 'SE INSERTO EL CODIGO EN xAMNewItemSite'+ ' ' + @LOcation

					INSERT INTO xamitemsite (SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)

					--SELECT 'CFCUSCO3', @LOcation, 0, 0, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 from xamitemsite WHERE InvtID = 'I212248' AND SiteId = 'CFCUSCO1'
					--UNION ALL
					SELECT TOP 1 'CIXSUMIN', @LOcation, 0, 0, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 from xamitemsite WHERE InvtID = 'M270010' --AND SiteId = 'CFCUSCO1'

					PRINT 'SE INSERTO EL CODIGO EN xamitemsite'+ ' ' + @LOcation
					PRINT '----------------------------------------------------'
					PRINT ''
			                                        
            FETCH ULTRAINSTINTO INTO @LOcation
            END-- END WHILE                                  
      CLOSE ULTRAINSTINTO                                  
      DEALLOCATE ULTRAINSTINTO                                
END 


-- SELECT * FROM Location WHERE InvtID IN (select Invtid from #ABCDFG)
-- SELECT * FROM xAMNewItemSite WHERE InvtID_Sol in (select Invtid from #ABCDFG)
-- SELECT * FROM xamitemsite WHERE InvtID in (select Invtid from #ABCDFG)


SELECT *
-- DELETE TOP (2)
FROM xamitemsite where InvtID = 'M268077' AND SITEID = 'CIXPROD'


--SELECT * FROM Location WHERE InvtID = 'M261054'
-- DROP TABLE #AB
CREATE TABLE #AB
(
InvtID char(7),
ref char(30)
)

INSERT INTO #AB
VALUES
('M267001','WURTH'),
('M267002','SKF'),
('M267019','SKF'),
('M267020','SKF'),
('M267021','WD-40'),
('M267022','WD-40'),
('M267023','VISTONY'),
('M267024','WURTH'),
('M267025','WURTH'),
('M267026','AFRICANO'),
('M267027','TRIZ'),
('M267028','VERSATILE'),
('M267029','SIKAFLEX'),
('M267030','WURTH'),
('M267031','WURTH'),
('M267032',''),
('M267033',''),
('M267034','')




SELECT A.InvtID, B.InvtID, A.User2, B.REF, * 
-- UPDATE A SET A.User2 = B.REF
-- UPDATE A SET A.User2 = ''
FROM Inventory A INNER JOIN #ABCDFG B ON A.InvtID = B.InvtID


SELECT * FROM Location WHERE InvtID IN (SELECT InvtID FROM #ABCDFG)
SELECT * FROM ItemSite WHERE InvtID IN (SELECT InvtID FROM #ABCDFG)
SELECT * FROM xAMNewItemSite WHERE InvtID_Sol IN (SELECT InvtID FROM #ABCDFG)
SELECT * FROM xamitemsite WHERE InvtID IN (SELECT InvtID FROM #ABCDFG)

--SELECT * 
---- DELETE TOP(1)
--FROM xamitemsite WHERE InvtID IN (SELECT InvtID FROM #ABCDFG) AND InvtID = 'M270022'


--delete from inventory where InvtID in (SELECT InvtID FROM #ABCDFG)
--delete from InventoryADG where InvtID in (SELECT InvtID FROM #ABCDFG)

