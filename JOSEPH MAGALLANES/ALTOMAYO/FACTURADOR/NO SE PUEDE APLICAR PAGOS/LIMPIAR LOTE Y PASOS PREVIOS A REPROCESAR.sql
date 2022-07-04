
       
	   -- VER MONTOS SI ESTAN CORRECTOS EN [SOShipHeader] CON PANTALLA EN PAGO EN BLQUES
	   SELECT round(CuryTotInvc,2), Cancelled, * FROM [AM2018APP].[DBO].[SOShipHeader] WHERE User1  ='S000004760' AND Cancelled  = 0 
	   
	   
	   -- VERIFICAR EN SOSHIPHEADER LA CANTIDAD DE LOTES Y VERIFICAR ANULADOS (1) CON NO ANULADOS (0)
	   SELECT distinct  arbatnbr FROM [AM2018APP].[DBO].[SOShipHeader] WHERE User1  ='S000004760' AND Cancelled  = 0
	   SELECT distinct  arbatnbr FROM [AM2018APP].[DBO].[SOShipHeader] WHERE User1  ='S000004760' AND Cancelled  = 1


	   --SELECT * FROM ARAdjust WHERE AdjdRefNbr IN (SELECT REFNBR FROM ARDOC WHERE BatNbr = '004031')


       select * from xDespachoShippers where NroDespacho  ='S000004750'

	   --- VER SALDO EN ARDOC
	   SELECT DocBal, CuryDocBal, Status,* FROM ARDoc WHERE RefNbr = 'B030031998' and DocType = 'IN'

		
		-- PASO 1 ELIMINAR LOTE DE TABLAS DEL SOLOMON

---------- EDITAR SI NO ESTAN EN GLTRAN -----------------------------------------------
--DECLARE @BATNBR CHAR(6)
--SET @BATNBR ='003996'
--delete from ardoc where batnbr=@BATNBR
--delete from artran where batnbr=@BATNBR
--delete from gltran where batnbr=@BATNBR and  module  ='AR'
--delete from batch where batnbr=@BATNBR  and  module  ='AR'
---------------------------------------------------------------------------------------

	   -- QUITAR arbatnbr AL DESPACHO PARA PROCESAR UNA VEZ ELIMINADO EL PASO 1
       SELECT distinct status,arbatnbr  FROM [AM2018APP].[DBO].[SOShipHeader] WHERE User1  ='S000004750' AND Cancelled  = 0
       --update  SOShipHeader  set arbatnbr = '' where User1  ='S000004750' AND Cancelled = 1 --and ARBatNbr <>'003996'

--S000002392                    
--S000004750                    
--S000004751                    
--S000004752                    
--S000004754                    
--S000004755                    
--S000004756                    
--S000004757                    
--S000004758                    
--S000004759                    
--S000004760                    

       --select   ShipperID ,* from soshipheader WHERE   perpost =  '201805'  and curyid ='SOL' and Status = 'C' And    left(shipperid,1)<>'N' and cancelled =0 and user1  ='S000002391' and arbatnbr  ='' order by user1 asc 


       --DELETE DESPUES DE GENERAR LOTE AR
       select * from RefNbr where RefNbr in (select RefNbr from ardoc where BatNbr  ='004031' )  -- 004027
      -- delete from RefNbr where RefNbr in (select RefNbr from ardoc where BatNbr  ='004147' ) 


       select * from HistDocSlsTax where RefNbr in (select RefNbr from ardoc where BatNbr  ='004031' )
     --  delete from HistDocSlsTax where RefNbr in (select RefNbr from ardoc where BatNbr  ='004147' )


