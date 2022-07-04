
SELECT * 
-- UPDATE AMPlaactD SET CodProduccion = 'ACT_AUX35'
FROM AMPlaactD WHERE CodProduccion = 'ACT_AUX35' AND fecha >= '2019-06-21' --AND Descripcion = 'MEZCLA'



--SELECT A.IdCorrelativo, A.User1, A.Producto, B.Item, A.PriceDia, B.PriceDia, A.PriceNoche, B.PriceNoche, A.PriceDomingo, B.PriceDomingo 
---- UPDATE A SET A.PriceDia = B.PriceDia, A.PriceNoche = B.PriceNoche, A.PriceDomingo = B.PriceDomingo
--FROM AMPlaactD A INNER JOIN AMOperacionesACT B ON A.Producto = B.Item
--WHERE fecha >= '2019-09-23' and Fecha < = '2019-10-20' --and A.IdCorrelativo = '005468'
--AND A.Estado NOT IN ('X','C')


/**** PASO 1 - RECLACULAR CABCERAS (INICIO), UN SOLO UPDATE QUE RECALCULA LAS CABECERAS DE TODOS LOS LOTES POR INTERVALO DE FECHAS Y CON ESTADO A (ABIERTO) ****/

SELECT * 
-- UPDATE AMPlaactD set ProduccionF = round(ProduccionF,3)
FROM AMPlaactD WHERE User1 = 'ACTVAM' AND fecha > = '2021-07-21' AND fecha < = '2021-08-20' AND Estado NOT IN ('X','C')


UPDATE AMPlaactD set Saldototal = 
(CASE 
WHEN TipoPrice = 'D' THEN round(ProduccionF*PriceDia,2) 
WHEN TipoPrice = 'N' THEN round(ProduccionF*PriceNoche,2)
WHEN TipoPrice in ('X','W') THEN round(ProduccionF*PriceDomingo,2) 
ELSE '' END)
FROM AMPlaactD WHERE User1 = 'ACTVAM' AND user3 <> 'T' 
AND Estado NOT IN ('X','C') AND fecha > = '2021-07-21' AND fecha < = '2021-08-20'

/**** PASO 1 - RECALCULAR CABCERAS (FIN) ****/

--SELECT * FROM Batch WHERE BatNbr = '013823' AND Module = 'IN'

/*** PASO 2 - RECALCULAR CON INTEGRIDAD TODOS LOS LOTES (INICIO) SOLO LOS LOTES QUE NO ESTEAN ESTADO T (TEMMINADO) SOLO A (ABIERTO) Y NO TOMO LOS ANULADOS (X) ***/
BEGIN  

declare @correlativoD char(6)
declare @Tipo char(10)
declare @horario char(1)

DECLARE ULTRAINSTINTO CURSOR FOR                         
        
select IdCorrelativo, User1, TipoPrice from AMPlaactD WHERE --user3 <> 'T' AND 
Estado NOT IN ('X') AND fecha > = '2020-09-21' AND fecha < = '2020-10-20'
--AND IdCorrelativo > = '005824' AND IdCorrelativo <= '005824'
--where IdCorrelativo > = '000001' and IdCorrelativo <= '000100' -- = 0 -- > '000524' --where idcorrelativo = '000013'
                    
      OPEN ULTRAINSTINTO  FETCH ULTRAINSTINTO INTO @correlativoD, @Tipo, @horario
                                          
            WHILE (@@FETCH_STATUS = 0 )                                    
            BEGIN -- WHILE                                          
            --PROCESO  DEMO                    
            --PRINT 'ZHUKULENTO'  
                           
                           if LTRIM(RTRIM(@Tipo)) <> 'ACTVAM'
                                  BEGIN
                                        
                                         EXEC CalOPPlanilla_aux @correlativoD

                                        -- UPDATE AMPlaactD SET Estado = 'C' WHERE IdCorrelativo = @correlativoD

                                        PRINT 'ACTIVIDAD '+ @Tipo +' ' + @correlativoD
                                        PRINT '----------------------------------------------------'
                                        PRINT ''

                                  END
                           ELSE
                                  BEGIN
                                        EXEC CalOPPlanilla @correlativoD

                                        -- UPDATE AMPlaactD SET Estado = 'C' WHERE IdCorrelativo = @correlativoD

                                        PRINT 'ACTIVIDAD '+ @Tipo +' ' + @correlativoD
                                        PRINT '----------------------------------------------------'
                                        PRINT ''
                                  END
                                                            
            FETCH ULTRAINSTINTO INTO  @correlativoD, @Tipo, @horario
            END-- END WHILE                                  
      CLOSE ULTRAINSTINTO                                  
      DEALLOCATE ULTRAINSTINTO                                
END 

--select * from PerContratoBK where status = 'C'


--select * 
---- UPDATE AMPLAACTD SET SALDOTOTAL = 109.43
--from AMPlaactD where fecha = '2018-12-04' AND IDCORRELATIVO = '000931'

--SELECT * 
---- UPDATE AMPlaactD SET SALDOTOTAL = '238.4'
--FROM AMPlaactD WHERE fecha = '2018-10-24' AND User1 = 'ACTVAM' AND IdCorrelativo = '000050'

--SELECT * FROM AMPlaactD WHERE fecha = '2018-10-27' AND User1 = 'ACTVAM'
--SELECT * FROM AMPlaactD WHERE fecha = '2018-10-24' AND User1 = 'ACTVAM' --AND IDCO

EXEC CalOPPlanilla '005822'

--14000