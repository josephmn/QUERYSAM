
pvrec_all 'purchord_vendid_ponbr'
purchord_vendid_ponbr  '20450752496',  '001078' 

PORcpt_On_VOtran '001078', '001077', '', '00002'
PORcpt_On_VOtran '001078', '001077', '', '00006'



    Select * from PurchOrd where VendId = '20450752496'
        and PONbr Like '001078'
        order by VendId, PONbr 

select purchord.ponbr,purchord.user6,purchord.potype,purchord.status,
purchord.podate from purchord (FASTFIRSTROW)  
where vendid =  '20450752496'  and ponbr like  '%'   
and potype in ('or', 'dp', 'st') and 
status in ('m', 'o', 'p') order by vendid, ponbr desc

purchord_vendid_ponbr  '20450752496',  '001078' 

PONbr_On_VOtran '001078', '' 

select batnbr, refnbr, PONbr, trantype from APtran Where --PONbr = '001078' --and RefNBr <> @parm3 
--and --rlsed = 0  and 
trantype in ('AD', 'VO')

POReceipt_PONbr_AP_PV '001078', '%'

PurOrdDet_PONbr '001078', -32768, 32767 

AP_POReceipt_RcptNbr_Vouch '001077' 

Select * From POReceipt Where 
                POReceipt.RcptNbr = '001077' 
                And POReceipt.Rlsed = 1
                And VouchStage <> 'F'

APPO_RcptNbr_NotVouched '001077', '001078' 

PORcpt_On_VOtran '001078', '001077', '', '00001'
PORcpt_On_VOtran '001078', '001077', '', '00002'
PORcpt_On_VOtran '001078', '001077', '', '00003'
PORcpt_On_VOtran '001078', '001077', '', '00006'

PORcpt_On_VOtran '001078', '001077', '', '00006'

EXEC PORcpt_On_VOtran2 '001077', '00002', 43.63, 0.964 
EXEC PORcpt_On_VOtran2 '001077', '00003', 24.75, 60 
EXEC PORcpt_On_VOtran2 '001077', '00006', 29.08, 1.0

EXEC PORcpt_On_VOtran2 '001215', '00003', 25.4, 35

SELECT * FROM PurchOrd WHERE PONbr = '001078'

SELECT QtyOrd, QtyRcvd, InvtID, TranDesc,  * FROM PurOrdDet WHERE PONbr = '001078'

APPO_RcptNbr_NotVouched '001214', '001215' 

APPO_RcptNbr_NotVouched '001214', '001215' 




Create proc APPO_RcptNbr_NotVouched @parm1 varchar ( 10), @parm2 varchar(10) as
 Select * from POTran where RcptNbr = '001214'
    and VouchStage <> 'F'
	and not exists(select 'x' from aptran where 
		ponbr = '001215' and 
		rcptnbr = '001214' and 
		APTran.RcptLineRef = POTran.LineRef and
		aptran.rlsed = 0)
            Order by LineNbr 




select batnbr, rcptnbr, LineRef, CuryExtCost, CuryCostVouched, RcptQty, QtyVouched, * from POtran 
where 
RcptNbr = '001214'

---------------------------------------------------------------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>> ENAQUI HACER EL CAMBIAZO

select batnbr, rcptnbr, LineRef, Qty, CuryExtCost, RcptQty, CuryCostVouched, QtyVouched, * 
-- update t set RcptQty = 6.65, Qty = 6.65
from POtran t  
where 
RcptNbr = '000031' and LineRef = '00004'

---------------------------------------------------------------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>					   

select Batnbr, RcptNbr, * from POTran where PONbr = '001397'

alter Procedure PORcpt_On_VOtran2 @parm1  varchar(10), @parm2 varchar(5), @parm3 float, @parm4 float As
--modificado por Manuel Rojas, se puso decimal ,1 por tema de redondeo  
select batnbr, rcptnbr from POtran 
where 
RcptNbr = @parm1 and 
LineRef = @parm2 and 
(convert(dec(28,1),@parm3) <> convert(dec(28,1),POTran.CuryExtCost) - convert(dec(28,1),POTran.CuryCostVouched)
OR
convert(dec(28,1),@parm4) <> convert(dec(28,1),POTran.RcptQty) - convert(dec(28,1),POTran.QtyVouched))



select batnbr, rcptnbr, CuryExtCost, CuryCostVouched, RcptQty, QtyVouched,* from POTran where 
--RcptQty = '1.05' and
CuryExtCost = '29.08'

select batnbr, rcptnbr, LineRef, CuryExtCost, CuryCostVouched, RcptQty, QtyVouched, * from POtran 
where 
RcptNbr = '000032' and 
LineRef = '00004' and 

(convert(dec(28,1),'29.08') <> convert(dec(28,1),round(POTran.CuryExtCost,0)) - convert(dec(28,1),round(POTran.CuryCostVouched,0)) 
OR 
convert(dec(28,1),'1.5') <> convert(dec(28,1),round(POTran.RcptQty,0)) - convert(dec(28,1),round(POTran.QtyVouched,0)))


select CONVERT(dec(28,1),'43.63')
select convert(dec(28,1),'43.63') - convert(dec(28,1),'0')

select convert(dec(28,1),'0.964') 
select convert(dec(28,1),'0.964') - convert(dec(28,1),'0')



select CONVERT(dec(28,1),'29.08')
select convert(dec(28,1),'29.08') - convert(dec(28,1),'0')

select convert(dec(28,1),'1.05')
select convert(dec(28,1),'1.05') - convert(dec(28,1),'0')




PORcpt_On_VOtran '001078', '001077', '', '00002'
PORcpt_On_VOtran '001078', '001077', '', '00003'
PORcpt_On_VOtran '001078', '001077', '', '00006'

PORcpt_On_VOtran2 '001077', '00002', 43.63, .96 
PORcpt_On_VOtran2 '001077', '00003', 24.75, 60 
PORcpt_On_VOtran2 '001077', '00006', 29.08, 1.04 


--CREATE Procedure PORcpt_On_VOtran2 @parm1  varchar(10), @parm2 varchar(5), @parm3 float, @parm4 float As
--modificado por Manuel Rojas, se puso decimal ,1 por tema de redondeo  
select batnbr, rcptnbr, LineRef, CuryExtCost, CuryCostVouched, RcptQty, QtyVouched, CuryUnitCost, ExtCost, UnitCost, * from POtran 
where 
RcptNbr = '001077' and 
LineRef = @parm2 and 
(convert(dec(28,1),@parm3) <> convert(dec(28,1),POTran.CuryExtCost) - convert(dec(28,1),POTran.CuryCostVouched)
OR
convert(dec(28,1),@parm4) <> convert(dec(28,1),POTran.RcptQty) - convert(dec(28,1),POTran.QtyVouched))





select batnbr, rcptnbr, LineRef, CuryExtCost, CuryCostVouched, RcptQty, QtyVouched, CuryUnitCost, ExtCost, UnitCost, * 
-- update t set CuryUnitCost = 27.80114, UnitCost = 27.80114, RcptQty = 1.04
from POtran t
where 
RcptNbr = '001214' and LineRef = '00006'


SELECT * FROM APDoc WHERE BatNbr = '003279'


SELECT CuryDocBal, DocBal, * 
-- UPDATE A SET CuryDocBal = 114.99, DocBal = 114.99
FROM APDoc A WHERE BatNbr = '037603'


SELECT CuryTranAmt, CuryPOExtPrice, CuryTxblAmt00, TranAmt, TxblAmt00, InvtID, * 
-- UPDATE T SET CuryTranAmt = 29.07, CuryPOExtPrice= 29.07, CuryTxblAmt00= 29.07, TranAmt= 29.07, TxblAmt00= 29.07
FROM APTran T WHERE BatNbr = '037603' AND InvtID = 'I250174'


select batnbr, rcptnbr, LineRef, CuryExtCost, CuryCostVouched, RcptQty, QtyVouched, CuryUnitCost, ExtCost, UnitCost, * 
-- update t set CuryUnitCost = 48.42307, UnitCost = 48.42307, RcptQty = 1.04
-- update t set RcptQty = 1.04
from POtran t
where 
BatNbr = '000032' and LineRef = '00004'






