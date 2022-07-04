

------------------------------------------
-- JALAR OC EN AP DOCUMENTOS Y AJUSTES ---
------------------------------------------

SP_HELPTEXT APPO_RcptNbr_NotVouched

 Select * from POTran where RcptNbr = @parm1  
    and VouchStage <> 'F'  
 and not exists(select 'x' from aptran where   
  ponbr = @parm2 and   
  rcptnbr = @parm1 and   
  APTran.RcptLineRef = POTran.LineRef and  
  aptran.rlsed = 0)  
            Order by LineNbr   


------ VERIFICAR DESDE POTRAN ---------------
 Select * from POTran where RcptNbr = '000502'  
 and VouchStage <> 'F'  
 and not exists(select 'x' from aptran where   
  ponbr = '000502' and   
  rcptnbr = '000503'  and   
  APTran.RcptLineRef = POTran.LineRef and  
  aptran.rlsed = 0)  
            Order by LineNbr   
---------------------------------------------

APPO_RcptNbr_NotVouched '000502', '000503' 
