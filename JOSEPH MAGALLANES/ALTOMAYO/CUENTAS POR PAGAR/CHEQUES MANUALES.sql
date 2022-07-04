
/***** elimar lote *****/

--delete FROM Batch WHERE BatNbr = '011863' AND Module = 'AP'
--delete FROM APDoc WHERE BatNbr = '011863'
--delete FROM APTran WHERE BatNbr = '011863'
--delete FROM GLTran WHERE BatNbr = '011863' AND Module = 'AP'
--delete FROM APAdjust WHERE AdjBatNbr = '011863'



--sp_whoisactive 


SELECT * FROM APDoc WHERE BatNbr IN ('008524','008525')

SELECT * FROM APDoc WHERE DocBal = 0 AND DocType = 'VO'

Select vendid, status, User6, s4future12, InvcNbr, * From APDoc where status <> 'V' and  vendid = '40053619' and User6= 'RG' and s4future12 = '001' and InvcNbr= 'REN0000188' 
and Refnbr <> '009985' and batnbr <> '011863'


SELECT * FROM Batch WHERE BatNbr = '011863' AND Module = 'AP'
SELECT batnbr, s4future12, InvcNbr, RefNbr, User1, * FROM APDoc WHERE BatNbr = '011863'
SELECT LineType, User1, CuryTranAmt, * 
-- update a set user1 = '1'
FROM APTran a WHERE BatNbr = '011863' --and User5 = 15
SELECT * FROM GLTran WHERE BatNbr = '011863' AND Module = 'AP'
SELECT * FROM APAdjust WHERE AdjBatNbr = '011863'

/*

sp_helptext 'apdoc_batnbr_acct_sub_refnbr'


Account_Active '104101'

  
/****** Object:  Stored Procedure dbo.APDoc_BatNbr_Acct_Sub_RefNbr    Script Date: 4/7/98 12:19:54 PM ******/  
Create Procedure APDoc_BatNbr_Acct_Sub_RefNbr @parm1 varchar ( 10), @parm2 varchar ( 10), @parm3 varchar ( 24), @parm4 varchar ( 10) As  
Select * From APDoc   
Where APDoc.BatNbr = '010018' And  
APDoc.DocClass = 'C' and  
APDoc.Acct like '999998' and  
APDoc.Sub like '000000000000' and  
APDoc.RefNbr like '008586' and  
(APDoc.DocType <> 'MC' and APDoc.DocType <> 'SC' and APDoc.DocType <> 'VT')  
Order By APDoc.BatNbr, APDoc.Acct, APDoc.Sub, APDoc.RefNbr   
  
  
  Select CashSub,DocType,* From APDoc   
WHERE 
(APDoc.DocType <> 'MC' and APDoc.DocType <> 'SC' and APDoc.DocType <> 'VT')  
Order By APDoc.BatNbr, APDoc.Acct, APDoc.Sub, APDoc.RefNbr   


CashAcct_Active 'ALTOMAYO', '999998', '000000000000' 


APAdjust_AdjgRefNbr '008586', 'HC', '999998', '000000000000'

 SP_HELPTEXT APAdjust_AdjgRefNbr
   
/****** Object:  Stored Procedure dbo.APAdjust_AdjgRefNbr    Script Date: 4/7/98 12:19:54 PM ******/  
Create Procedure APAdjust_AdjgRefNbr @parm1 varchar ( 10), @parm2 varchar ( 2), @parm3 varchar ( 10), @parm4 varchar ( 24) As  
Select * from APAdjust Where  
AdjgRefNbr = @parm1 and  
AdjgDocType = @parm2 and  
AdjgAcct = @parm3 and  
AdjgSub = @parm4  
AdjgSub = @parm4  
Select AdjgSub,* from apadjust where AdjBatNbr  ='010018'
  
--update apadjust set AdjgSub  ='000000000000'where AdjBatNbr  ='010018'


*/