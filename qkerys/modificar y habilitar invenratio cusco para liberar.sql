

select rlsed,status,* from batch where batnbr ='003114' and module ='in'
select rlsed,PERPOST,* from intran where batnbr ='003114'
select rlsed,trandate,* from gltran where batnbr ='003114' and module ='IN'


update batch
set Status = 'B', rlsed = '0'
where batnbr ='003114' and module ='in'


--UPDATE intran 
--SET Rlsed = '1'
--where batnbr ='042971'


--select status,* from batch where batnbr ='042971' and module ='in'

--rlsed

--DrTot

--CtrlTot

--CrTot

