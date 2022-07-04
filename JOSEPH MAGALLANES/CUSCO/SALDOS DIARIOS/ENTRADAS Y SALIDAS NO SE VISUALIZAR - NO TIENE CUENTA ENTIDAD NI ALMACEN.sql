
--- PARA VENTAS

select * 
-- UPDATE A SET IdAlmacenDestino = 'LIM01CEN000000000055', IdCuentaEntidadDestino = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-11' AND Observacion LIKE '%VISA : Tranferencia Automatica%' --AND IdCaja = 'CFCUZCO3000000000001'

select * 
-- UPDATE A SET IdAlmacenDestino = 'LIM01CEN000000000055', IdCuentaEntidadDestino = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-15' AND Observacion LIKE '%VENTA%' AND IdCaja = 'CFCUZCO3000000000001'


---- PARA VISA

select * 
-- UPDATE A SET IdAlmacenDestino = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-10' AND Observacion LIKE '%VISA : Tranferencia Automatica%'

select * 
-- UPDATE A SET IdAlmacenDestino = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-11' AND Observacion LIKE '%VISA : Tranferencia Automatica%'



---- PARA MASTERCARD

select * 
-- UPDATE A SET IdAlmacenOrigen = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-10' AND Observacion LIKE '%MASTERCARD : Tranferencia Automatica%'

select * 
-- UPDATE A SET IdAlmacenOrigen = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-11' AND Observacion LIKE '%MASTERCARD : Tranferencia Automatica%'


--- PARA GASTO CAJA

select * 
-- UPDATE A SET IdAlmacenOrigen = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-10' AND Observacion LIKE '%GASTO DE CAJA%'

select * 
-- UPDATE A SET IdAlmacenOrigen = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-15' AND Observacion LIKE '%GASTO DE CAJA%'



--- PARA VACIO

select * 
-- UPDATE A SET IdAlmacenOrigen = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-10' AND Observacion = 'TRANSFERENCIA AUTOMATICA VENTA 10/10/2019'

select * 
-- UPDATE A SET IdAlmacenOrigen = 'LIM01CEN000000000055', IdCuentaEntidadOrigen = 'CACUCA30000000000001'
from GEN.TransferenciaEfectivo A where IdLocal = 'LIM01CEN000000000055' and fechanegocio = '2019-10-11' AND Observacion = 'TRANSFERENCIA AUTOMATICA VENTA 11/10/2019'