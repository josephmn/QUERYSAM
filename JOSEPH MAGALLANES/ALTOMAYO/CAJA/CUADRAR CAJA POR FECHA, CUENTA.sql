USE AM2019APP

--CA_ARDoc_Date_Prd 'ALTOMAYO', '101000', 'CAC2000RE000', '01/07/2019', '201901' 
--go
--CA_ARDoc_Date_Prd 'ALTOMAYO', '101000', 'CAC2000RE000', '01/06/2019', '201901' 
--go
--CaTran_TranDate_EntryID_Prd 'ALTOMAYO', '101000', 'CAC2000RE000', '01/07/2019', '201901' 
--go
--CaTran_TranDate_EntryID_Prd 'ALTOMAYO', '101000', 'CAC2000RE000', '01/06/2019', '201901' 
--GO


DECLARE @FECHA AS SMALLDATETIME  
DECLARE @banksub   CHAR(24)
DECLARE @MONTO    FLOAT  
DECLARE @PERPOST  CHAR(6)
SET  @FECHA = '01/14/2019' 
SET  @banksub = 'CHNO00000000' 
SET  @PERPOST = '201901' 
Select*
  from batch b join ardoc a on b.batnbr = a.batnbr 
Where a.cpnyid = 'ALTOMAYO'  
and a.bankacct = '101000'   
and a.banksub = @banksub 
and a.PerPost = @PERPOST  
and a.rlsed = 1  
and b.module = 'AR'  
and b.dateent = @FECHA 
and b.BatType <> 'C'  
-----------------
select   sum(x.OrigDocAmt) CuryReceipts       from (
Select b.BatNbr  ,  AcctNbr,AgentID,ApplAmt,ApplBatNbr,ApplBatSeq,Cleardate,CmmnAmt,CmmnPct
   ,CurrentNbr,CuryApplAmt,CuryClearAmt,CuryCmmnAmt,CuryDiscApplAmt,CuryDiscBal,
CuryDocBal,CuryOrigDocAmt,CuryStmtBal,CuryTaxTot00,CuryTaxTot01,
CuryTaxTot02,CuryTaxTot03,CuryTxblTot00,CuryTxblTot01,CuryTxblTot02,CuryTxblTot03,CustId,CustOrdNbr,DiscApplAmt,
DiscBal,DiscDate,DocBal,DocClass,DocDate,DocDesc,DocType,DraftIssued,DueDate,InstallNbr,JobCntr,LineCntr
  ,MasterDocNbr,NoPrtStmt,OpenDoc,OrdNbr,OrigDocAmt,OrigDocNbr,PC_Status,PerClosed,
  PmtMethod,ProjectID,RefNbr,RGOLAmt,ShipmentNbr,SlsperId,StmtBal,StmtDate,TaskID,TaxCntr00,
TaxCntr01,TaxCntr02,TaxCntr03,TaxId00,TaxId01,TaxId02,TaxId03,TaxTot00,TaxTot01,TaxTot02,TaxTot03,Terms,TxblTot00,TxblTot01,
TxblTot02,TxblTot03
from batch b join ardoc a on b.batnbr = a.batnbr Where a.cpnyid = 'ALTOMAYO'  and a.bankacct = '101000'   and a.banksub = @banksub and a.PerPost = @PERPOST and a.rlsed = 1  and b.module = 'AR'  
and b.dateent = @FECHA 
and b.BatType <> 'C'  
) x     

SET @MONTO = (select   sum(x.OrigDocAmt) CuryReceipts       from (
Select b.BatNbr  ,  AcctNbr,AgentID,ApplAmt,ApplBatNbr,ApplBatSeq,Cleardate,CmmnAmt,CmmnPct
   ,CurrentNbr,CuryApplAmt,CuryClearAmt,CuryCmmnAmt,CuryDiscApplAmt,CuryDiscBal,
CuryDocBal,CuryOrigDocAmt,CuryStmtBal,CuryTaxTot00,CuryTaxTot01,
CuryTaxTot02,CuryTaxTot03,CuryTxblTot00,CuryTxblTot01,CuryTxblTot02,CuryTxblTot03,CustId,CustOrdNbr,DiscApplAmt,
DiscBal,DiscDate,DocBal,DocClass,DocDate,DocDesc,DocType,DraftIssued,DueDate,InstallNbr,JobCntr,LineCntr
  ,MasterDocNbr,NoPrtStmt,OpenDoc,OrdNbr,OrigDocAmt,OrigDocNbr,PC_Status,PerClosed,
  PmtMethod,ProjectID,RefNbr,RGOLAmt,ShipmentNbr,SlsperId,StmtBal,StmtDate,TaskID,TaxCntr00,
TaxCntr01,TaxCntr02,TaxCntr03,TaxId00,TaxId01,TaxId02,TaxId03,TaxTot00,TaxTot01,TaxTot02,TaxTot03,Terms,TxblTot00,TxblTot01,
TxblTot02,TxblTot03
from batch b join ardoc a on b.batnbr = a.batnbr Where a.cpnyid = 'ALTOMAYO'  and a.bankacct = '101000'   and a.banksub = @banksub and a.PerPost = @PERPOST  and a.rlsed = 1  and b.module = 'AR'  
and b.dateent = @FECHA 
and b.BatType <> 'C'  
) x   )
SELECT    @MONTO
----------------------------------------------------------- 
Select  TranDate  ,* from CaTran   
where (bankcpnyid like 'ALTOMAYO' or trsftocpnyid like 'ALTOMAYO')  
and bankacct like '101000'   
and banksub like @banksub 
and trandate = @FECHA
and PerPost =  @PERPOST   
and rlsed = 1  

select  sum(X.curytranamt )Disbursements  from (
Select  * from CaTran   
where (bankcpnyid like 'ALTOMAYO' or trsftocpnyid like 'ALTOMAYO')  
and bankacct like '101000'   
and banksub like @banksub 
and trandate = @FECHA
and PerPost = @PERPOST   
and rlsed = 1  
)x
Select  TranDate  ,CuryReceipts, Receipts,* from CashSumD    where  TranDate >=  '12/01/2009'  and   banksub  = @banksub and  TranDate  = @FECHA  
 update  CashSumD  set  CuryReceipts = @MONTO , Receipts = @MONTO where  TranDate >=  '12/01/2009'  and   banksub  = @banksub and  TranDate  = @FECHA
  
