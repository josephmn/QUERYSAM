--042297    
--042333    
--042340    
--042364    


select Rlsed,perpost,s4future07,status,* from batch where batnbr  ='042364' and module = 'in'
select Rlsed,perent,perpost,trandate,* from intran where batnbr  ='042364' 
select Rlsed,perent,perpost,trandate,* from gltran where batnbr  ='042364' and module = 'in'

--update batch 
--set status = 'U', Rlsed = '1' where batnbr  ='042259' and module = 'in'

--update intran 
--set Rlsed = '1' where batnbr  ='042259' --and module = 'in'