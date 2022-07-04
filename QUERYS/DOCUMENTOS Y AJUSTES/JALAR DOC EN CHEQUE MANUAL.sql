apdoc_vendid_cpnyid_docclass  '1111111149',  'COFFEARTS',  '012652' 

sp_helptext apdoc_vendid_cpnyid_docclass


 select opendoc,rlsed,selected,docclass,batnbr,vendid from apdoc where refnbr ='008844'
  
select refnbr,* from apdoc where vendid='1111111146' and  CpnyID like 'COFFEARTS' 
and DocClass = 'N'  
and DocType in ('VO', 'AC', 'AD', 'PP')  
and OpenDoc = 1  
and Rlsed = 1   
and Selected = 0   

select refnbr,* from apdoc where vendid='20394862704' and  CpnyID like 'COFFEARTS' 
and DocClass = 'N'  
--and DocType in ('VO', 'AC', 'AD', 'PP')  
and OpenDoc = 1  
and Rlsed = 1   
and Selected = 0   
and refnbr = '007473'


select opendoc,* from apdoc where batnbr  ='011821' and refnbr  ='007473'
update apdoc set opendoc  =1 where batnbr  ='014243' and refnbr  ='008844'

select refnbr,* from apdoc where vendid='1111111149' and  CpnyID like 'COFFEARTS'  and refnbr ='013336'
1111111149
1111111149         
select refnbr,vendid,* from apdoc where  CpnyID like 'COFFEARTS'  and refnbr ='013336'
select refnbr,vendid,* from aptran where  CpnyID like 'COFFEARTS'  and refnbr ='013336'

--update apdoc set vendid ='1111111149'  where  batnbr ='022908' and refnbr ='013336'
    
  
    
    


select apdoc.refnbr,apdoc.cpnyid,apdoc.doctype,apdoc.vendid,apdoc.invcnbr,apdoc.ponbr,apdoc.origdocamt,apdoc.cycle,apdoc.batnbr from 
apdoc   (FASTFIRSTROW)  where vendid =  '20514513172'  and cpnyid like  'COFFEARTS' 
 and refnbr like  '006042'   and docclass = 'n' and opendoc = 1 and rlsed = 1 and selected = 0
  order by opendoc, rlsed, refnbr, status    
  
  
 
  update apdoc set opendoc  = 1 where batnbr ='004958'
  