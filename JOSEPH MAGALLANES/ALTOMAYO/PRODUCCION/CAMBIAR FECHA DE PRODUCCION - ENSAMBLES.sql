
select * 
-- UPDATE BATCH set perpost = '201812'
from Batch where BatNbr = '014700' and Module = 'IN'

select t.trandate, PerPost, * 
--update t set t.TranDate = '2018-04-10' 
--update t set Perpost = '201812' --where BatNbr = '002940'
from AssyDoc t where BatNbr in ('014700')


/*** para cambios en intran por ingreso con periodo erroneo ***/

SELECT PerEnt, PerPost, * 
-- UPDATE T SET PERPOST = '201812'
FROM INTRAN T WHERE BatNbr IN ('014700')



/*** para cambios en gltran por ingreso con periodo erroneo ***/

SELECT PerEnt, PerPost, * 
-- UPDATE T SET PERPOST = '201812'
FROM GLTran T WHERE BatNbr IN ('014700') and Module = 'IN'






