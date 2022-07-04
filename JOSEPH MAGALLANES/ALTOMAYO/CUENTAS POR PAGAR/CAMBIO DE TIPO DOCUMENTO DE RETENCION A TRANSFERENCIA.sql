
--// revisar correlativo de setup AP, S4Future12 = retencion, LastRefNbr = ultima referencia

select S4Future12, LastRefNbr, * 
-- update apsetup set S4Future12 = '001119', LastRefNbr = '011452'
from apsetup


select * from Batch where batnbr = '012274' and Module = 'AP'

select refnbr, s4future12, s4future11, User1, * 
-- update APDoc set s4future11 = 5, s4future12 = ''
from APDoc where batnbr = '012359' 
--0 carta
--1	cheque
--2 compensacion
--3 detraccion
--4 retencion
--5 transferencia

--001108
--001120    
select refnbr, s4future12, s4future11, User1, * from APDoc where s4future11 = 5 and PerPost = '202110' and RefNbr = '010996'


select * from PLDocTypes



/* update del cambio

--select * from Batch where batnbr = '012359' and module = 'AP'
select refnbr, s4future12, s4future11, User1, * from APDoc where batnbr = '012359'
select RefNbr, * from GLTran where batnbr = '012359' and module = 'AP'
select AdjgRefNbr, * from APAdjust where AdjBatNbr = '012359'

update APDoc set RefNbr = '001108' from APDoc where batnbr = '012360'
update GLTran set RefNbr = '001108' from GLTran where batnbr = '012360' and module = 'AP'
update APAdjust set AdjgRefNbr = '001108' from APAdjust where AdjBatNbr = '012360'

*/