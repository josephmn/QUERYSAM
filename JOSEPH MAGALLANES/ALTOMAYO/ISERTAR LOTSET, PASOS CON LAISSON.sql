
--select distinct BatNbr from intran where BatNbr not in (select BatNbr from LotSerT)

declare @BATNBR CHAR(6)
declare @numero INT
declare @numerochar char(6)
-------------------------------------------------------------------------------------------------------------------
DECLARE CUR_INTRAN CURSOR FOR

--delete from LotSerT where BatNbr = '000006'

--filtrar los lotes que se va a insertar
select distinct BatNbr from intran where BatNbr not in (select BatNbr from LotSerT) AND TranType = 'IN' --manuel lotes

set @numero = 0

OPEN CUR_INTRAN 
FETCH CUR_INTRAN INTO @BATNBR

	WHILE (@@FETCH_STATUS = 0 )
	BEGIN -- WHILE
	
	--procedimiento para cargar tabla temporal y actualizar (regularizar lotes en intran)
	exec asp_actLineIntran @batnbr

	--SE ACTUALIZAN CAMPOS LINEID, LINERF
	update h set LineId = d.Row, LineRef = d.LineNbrRef
	from INTran h inner join tp_IntrenRef d on h.batNbr = d.Batnbr and  h.recordID = D.RecordID 
	where h.BatNbr = @batnbr 
	 
	 --select * from LotSerT
	 --INSERT INTO A LA TABLA LOTSERT

	 declare @existe int
	 select @existe = (select count(*) from LotSerT where BatNbr = @BATNBR)	 
	 if @existe = 0
	 begin
		 insert into LotSerT (BatNbr, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CustID, ExpDate, INTranLineID, INTranLineRef, InvtID, InvtMult, KitID, LineNbr, LotSerNbr, LotSerRef, LUpd_DateTime, LUpd_Prog, 
		 LUpd_User, MfgrLotSerNbr, NoteID, ParInvtID, ParLotSerNbr, Qty, RcptNbr, RefNbr, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
		 S4Future09, S4Future10, S4Future11, S4Future12, ShipContCode, ShipmentNbr, SiteID, ToSiteID, ToWhseLoc, TranDate, TranSrc, TranTime, TranType, UnitCost, UnitPrice, User1, User2, User3, User4, User5, User6, 
		 User7, User8, WarrantyDate, WhseLoc)
		select i.BatNbr, 'ALTOMAYO',i.TranDate,i.Crtd_Prog,i.Crtd_User, i.ID,i.TranDate, i.lineId, i.LineRef,i.InvtID,I.InvtMult,'',i.LineID,
		--(substring(LEFT(CONVERT(VARCHAR, getdate(), 120), 10),6,2)+substring(LEFT(CONVERT(VARCHAR, getdate(), 120), 10),9,2)+substring(LEFT(CONVERT(VARCHAR, getdate(), 120), 10),1,4)+'00'),
		(select top 1 LotSerNbr from lotsert where invtid = i.invtid and siteid = i.siteid and InvtMult = 1 order by Crtd_DateTime) --and TranDate = i.TranDate) 
		LotSerNbr,
		  i.LineRef, i.TranDate,i.LUpd_Prog, i.LUpd_User, '',0,'','',i.Qty, '',i.RefNbr,i.Rlsed, '', '', 0,0,0,0,'1900-01-01','1900-01-01',0,0,'','','',0,i.SiteID,'','',i.TranDate, b.Module, i.TranDate,
		  i.TranType, i.UnitPrice,0,'','',0,0,'','','1900-01-01','1900-01-01',i.TranDate,i.WhseLoc
		 from INTran i inner join batch b on i.BatNbr = b.BatNbr and b.Module = 'IN' where  i.BatNbr = @batnbr
	 end
	FETCH CUR_INTRAN INTO @BATNBR
	END-- END WHILE
CLOSE CUR_INTRAN
DEALLOCATE CUR_INTRAN
