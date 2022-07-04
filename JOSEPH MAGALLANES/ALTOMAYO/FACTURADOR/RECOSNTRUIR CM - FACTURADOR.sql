


select top  15 * from soshipheader WHERE   perpost =  '201903'  and curyid ='SOL' and Status = 'C' And  
left(shipperid,1)<>'N' And     ShipRegisterID = '' and cancelled =0 and NextFunctionClass ='' order by user1 asc 

SELECT InvcNbr, perpost, curyid, Status, shipperid, ShipRegisterID, cancelled, NextFunctionClass, * 
-- UPDATE SOShipHeader SET ShipRegisterID = '', ARBATNBR = '', INBATNBR = ''
FROM SOShipHeader WHERE ShipperID = 'CFLI000017'



select * from Batch where BatNbr = '002745' and Module = 'AR'
select * from Batch where BatNbr = '003095' and Module = 'IN'
SELECT * FROM ARDoc WHERE BatNbr = '002745'
SELECT * FROM ARTran WHERE BatNbr = '002745'
SELECT * FROM GLTran WHERE BatNbr = '002745' AND Module = 'AR'
SELECT * FROM INTran WHERE BatNbr = '003095'
SELECT * FROM GLTran WHERE BatNbr = '003095' AND Module = 'IN'

002745    
003095    


EXEC GLTRAN_POR_CM_BONIFIC 'FLI0000694','CFLI000014','21762'

EXEC GLTRAN_POR_CM_BONIFIC 'FLI0000695','CFLI000015','21762'

EXEC GLTRAN_POR_CM_BONIFIC 'FLI0000696','CFLI000016','21762'

SELECT ShipperID, LineRef, * FROM SOShipLine WHERE ShipperID = 'CFLI000016'

EXEC GLTRAN_POR_CM_BONIFIC 'FLI0000697','CFLI000017','21762'




SELECT InvcNbr, * FROM SOShipHeader WHERE ShipperID = 'FLI0000694'
SELECT InvcNbr, * FROM SOShipHeader WHERE ShipperID = 'CFLI000014'

SELECT BatNbr, * FROM ARDoc WHERE RefNbr = 'F010010290'
SELECT BatNbr, * FROM ARDoc WHERE RefNbr = 'F020000330'
     

SELECT * FROM ARTran WHERE BatNbr = '002248' AND RefNbr = 'F010010290'
SELECT * FROM ARTran WHERE BatNbr = '002721' AND RefNbr = 'F020000330'


SELECT * FROM GLTran WHERE BatNbr = '002248' AND RefNbr = 'F010010290'
SELECT * FROM GLTran WHERE BatNbr = '002721' AND RefNbr = 'F020000330'




ALTER PROC GLTRAN_POR_CM_BONIFIC
-- SISTEMA  :  SOLOMON IV
-- FUNTION  :  PARA RECONSTRUIR GLTRAN, INTRAN, ARTRAN, ARDOC, SOSHIPHEADER, SOSHIPLINE
-- USUARIO  :  JOSEPH CARLOS MAGALLANES NOLAZCO
--   FECHA  :  15-03-2019
@xFLI as char(15),
@xCFLI as char(15),
@xInvtID as char(6)
AS
BEGIN                                    
--DECLARE @ShipperID as char(15)               
--DECLARE @InvtiD as char(6)      
DECLARE @User7 as char(4)
DECLARE @QtyPick as float
DECLARE @QtyShip as float
DECLARE @TotInvc as float
DECLARE @User5 as float
DECLARE @Cost as float
DECLARE @TotCost as float
DECLARE @Taxable as int
DECLARE @TaxAmt00 as int
DECLARE @Disp as char(5)
DECLARE @LineRef as char(5)
DECLARE @LotSerCntr	as int
DECLARE @ManualCost	as int 
DECLARE @ManualPrice as int 
DECLARE @OrigShipperID as char(15)
DECLARE @OrigShipperLineRef as char(5)        	           
                      
DECLARE WS_CUR_CM CURSOR FOR                       

SELECT @xCFLI CFLI, @xFLI ShipperID, @xInvtID InvtID, User7, (QtyPick*-1) QtyPick, (QtyShip*-1) QtyShip, (TotInvc*-1) TotInvc, User5, Cost, (TotCost*-1) TotCost, 
Taxable, (TaxAmt00*-1) TaxAmt00, 'RTS' Disp, RIGHT('0000'+LTRIM(RIGHT(ISNULL(LineRef+1,'0000'),6)+1),5) LineRef, (LotSerCntr+1) LotSerCntr, '1' ManualCost, '1' ManualPrice, 
@xFLI OrigShipperID, LineRef OrigShipperLineRef 
FROM SOShipLine WHERE ShipperID = @xFLI
AND InvtID NOT IN (SELECT INVTID FROM SOShipLine WHERE ShipperID = @xCFLI) and User7 <> '' AND InvtID = @xInvtID

--SELECT ShipperID, InvtID, User7, QtyPick, QtyShip, TotInvc, User5, Cost, TotCost, Taxable, TaxAmt00, Disp, LineRef, LotSerCntr, ManualCost, ManualPrice, OrigShipperID, OrigShipperLineRef FROM SOShipLine WHERE ShipperID = 'CFLI000014'
--SELECT ShipperID, InvtID, User7, QtyPick, QtyShip, TotInvc, User5, Cost, TotCost, Taxable, TaxAmt00, Disp, LineRef, LotSerCntr, ManualCost, ManualPrice, OrigShipperID, OrigShipperLineRef FROM SOShipLine WHERE ShipperID = 'FLI0000694'
--AND InvtID NOT IN (SELECT INVTID FROM SOShipLine WHERE ShipperID = 'CFLI000014')

OPEN WS_CUR_CM                                      
	FETCH WS_CUR_CM INTO @xCFLI, @xFLI, @xInvtID, @User7, @QtyPick, @QtyShip, @TotInvc, @User5, @Cost, @TotCost, @Taxable, @TaxAmt00, @Disp, @LineRef, @LotSerCntr, @ManualCost, @ManualPrice, @OrigShipperID, @OrigShipperLineRef
                  
	WHILE (@@FETCH_STATUS = 0 )                                                  
		BEGIN -- WHILE                                                                  
                  
			PRINT 'ENTRO AL INSERT DE SOSHIPLINE EL CFLI: ' + @xCFLI               
      
			-- 1.- PROCEDEMOS A INSERTAR LA LINEA FALTANAT EN SOSHIPLINE
			INSERT INTO SOShipLine(
			AlternateID, AltIDType, BMICost, BMICuryID, BMIEffDate, BMIExtPriceInvc, BMIMultDiv, BMIRate, BMIRtTp, BMISlsPrice, ChainDisc, CmmnPct, CnvFact, 
			COGSAcct, COGSSub, CommCost, Cost, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCommCost, CuryCost, CuryListPrice, CurySlsPrice, CuryTaxAmt00, 
			CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTotCommCost, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, CuryTxblAmt01, CuryTxblAmt02, 
			CuryTxblAmt03, Descr, DescrLang, DiscAcct, DiscPct, DiscSub, Disp, InspID, InspNoteID, InvAcct, InvSub, InvtID, ItemGLClassID, LineRef, ListPrice, 
			LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, ManualCost, ManualPrice, NoteID, OrdLineRef, OrdNbr, OrigINBatNbr, OrigInvcNbr, OrigInvtID, 
			OrigShipperID, OrigShipperLineRef, ProjectID, QtyPick, QtyShip, RebateID, RebatePer, RebateRefNbr, S4Future01, S4Future02, S4Future03, S4Future04, 
			S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Sample, Service, ShipperID, ShipWght, SiteID, 
			SlsAcct, SlsperID, SlsPrice, SlsPriceID, SlsSub, SplitLots, Status, TaskID, Taxable, TaxAmt00, TaxAmt01, TaxAmt02, TaxAmt03, TaxCat, TaxID00, 
			TaxID01, TaxID02, TaxID03, TaxIDDflt, TotCommCost, TotCost, TotInvc, TotMerch, TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitMultDiv, 
			User1, User10, User2, User3, User4, User5, User6, User7, User8, User9)

			SELECT
			AlternateID, AltIDType, BMICost, BMICuryID, BMIEffDate, BMIExtPriceInvc, BMIMultDiv, BMIRate, BMIRtTp, BMISlsPrice, ChainDisc, CmmnPct, CnvFact, 
			COGSAcct, COGSSub, CommCost, Cost, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCommCost, CuryCost, CuryListPrice, CurySlsPrice, CuryTaxAmt00, 
			CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTotCommCost, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, CuryTxblAmt01, CuryTxblAmt02, 
			CuryTxblAmt03, Descr, DescrLang, DiscAcct, DiscPct, DiscSub, @Disp Disp, InspID, InspNoteID, InvAcct, InvSub, InvtID, ItemGLClassID, 
			@LineRef LineRef, ListPrice, 
			@LotSerCntr LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, @ManualCost ManualCost, @ManualPrice ManualPrice, NoteID, OrdLineRef, OrdNbr, OrigINBatNbr, OrigInvcNbr, OrigInvtID, 
			@OrigShipperID OrigShipperID, @OrigShipperLineRef OrigShipperLineRef, ProjectID, @QtyPick QtyPick, @QtyShip QtyShip, RebateID, RebatePer, RebateRefNbr, S4Future01, S4Future02, S4Future03, S4Future04, 
			S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Sample, Service, @xCFLI ShipperID, ShipWght, SiteID, 
			SlsAcct, SlsperID, SlsPrice, SlsPriceID, SlsSub, SplitLots, Status, TaskID, Taxable, TaxAmt00, TaxAmt01, TaxAmt02, TaxAmt03, TaxCat, TaxID00, 
			TaxID01, TaxID02, TaxID03, TaxIDDflt, TotCommCost, @TotCost TotCost, TotInvc, TotMerch, TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitMultDiv, 
			User1, User10, User2, User3, User4, User5, User6, User7, User8, User9 
			FROM SOShipLine WHERE ShipperID = @xFLI
			AND InvtID NOT IN (SELECT INVTID FROM SOShipLine WHERE ShipperID = @xCFLI) and User7 <> '' AND InvtID = @xInvtID
      
		FETCH WS_CUR_CM INTO @xCFLI, @xFLI, @xInvtID, @User7, @QtyPick, @QtyShip, @TotInvc, @User5, @Cost, @TotCost, @Taxable, @TaxAmt00, @Disp, @LineRef, @LotSerCntr, @ManualCost, @ManualPrice, @OrigShipperID, @OrigShipperLineRef
		END-- END WHILE                          
	CLOSE WS_CUR_CM                       
DEALLOCATE WS_CUR_CM                                              
                  
END 

       

