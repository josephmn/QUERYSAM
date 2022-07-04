
SELECT * 
-- update PreGastoH set saldoact = 2826086.3
FROM PreGastoH WHERE Codigo = '000002'

SELECT * 
-- update PreConceptxGasto set saldoact = 237501
FROM PreConceptxGasto WHERE Codigo = '000002' AND CodConcept = 'ATL001'

select * 
-- UPDATE PreGastMensual SET totalMes = 24999, saldo = 0, MontoAplicado = 24999
from PreGastMensual WHERE Codigo = '000002' AND CodConcept = 'ATL001' --and NombreMes IN ('Abril','Mayo')

--SELECT * FROM SYS.TABLES WHERE NAME LIKE '%Pre%' order by create_date desc

SELECT * FROM PresupuestoSaldoHist WHERE Codigo = '000002'


