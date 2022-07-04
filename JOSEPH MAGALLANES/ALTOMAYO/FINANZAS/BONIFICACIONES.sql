
/**** LIMPIAR LAS PROMOCIONES MAL INSERTADAS ****/

select * 
-- delete
from xAMPromocionh where CodProm in ('0023','0024','0025') --,'0000036','000037')

select * 
-- delete
from xAMPromocionD where CodProm in ('0023','0024','0025')

/**** VOLVER A HABILITAR LAS PROMOCIONES A INSERTAT EN LA PANATALLA DE MANUEL ****/

select * 
-- update s set estado = 'A', USER1 = ''
-- delete
from FAMBonificB where IdCorrelativo in ('000031','000032','000033','000036','000037')

select * 
-- delete
from FAMBonificH where IdCorrelativo in ('000031','000032','000033','000036','000037')

select * 
-- delete
from FAMBonificDG where IdCorrelativo in ('000031','000032','000033','000036','000037')

select * 
-- delete
from FAMBonificD where IdCorrelativo in ('000031','000032','000033','000036','000037')
