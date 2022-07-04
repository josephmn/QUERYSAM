

-- PROCESOS 

use [ca2015sys]
go


select * from custom2 where entityid like 'CKZAPPAS'

delete from custom2 where entityid='CKZAPPAS' and screenid='0301000'


USE [CA2015APP]


GO
SELECT * FROM BATCH
-- LIBERAR DOCUMENTOS EMITIDOS EN SOLOMON PASO 1
-- ARDOC.RLSED = 0 TO ARDOC.RLSED=1
DECLARE    
@lote VARCHAR(6)  
DECLARE CR_LIBERAR_CXC CURSOR FOR
 Select batnbr from Batch, Currncy
           Where Batch.CuryId = Currncy.CuryId
             and Module   =   'AR'
             and CpnyId   =   'COFFEARTS '
             and Batch.Status   IN ('B', 'S', 'I')
 order by Batch.module,Batch.batnbr
OPEN CR_LIBERAR_CXC
FETCH CR_LIBERAR_CXC INTO   @lote
WHILE (@@FETCH_STATUS = 0)
BEGIN
begin  
	   EXEC	liberarAR @LOTE    
end	
FETCH CR_LIBERAR_CXC INTO   @lote
END
CLOSE CR_LIBERAR_CXC
DEALLOCATE CR_LIBERAR_CXC

select status,rlsed,* from batch where batnbr='017845'

select rlsed,* from ardoc where batnbr='017845'

select rlsed,* from artran where batnbr='017845' 

select rlsed,* from gltran where batnbr='017845'


use [ca2015app]
go 
 












 

