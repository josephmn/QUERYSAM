

------- EXTRAER ANTICIPO DESDE OD 

  SP_HELPTEXT  select_prepay

Create Proc Select_PrePay @parm1 varchar(15), @parm2 varchar(10)as  
Select j.* from apadjust j, apdoc d   
where j.adjddoctype = d.doctype and   
d.refnbr = j.AdjdRefNbr and   
j.vendid = d.vendid and   
j.adjddoctype = 'PP' and   
j.s4future11 <> 'V' and   
j.AdjAmt > 0 and   
d.docbal <> d.origdocamt and   
j.vendid = @parm1 and   
j.adjdrefnbr = @parm2 order by j.adjdrefnbr  


SELECT s4future11,*  FROM apadjust WHERE ADJDREFNBR LIKE '%009981%'

UPDATE apadjust SET AdjdDocType  ='PP'  WHERE ADJDREFNBR LIKE '%009981%' AND s4future11  =''

AdjdDocType
VO