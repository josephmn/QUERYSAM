
/******** REPROCESAR ENSAMBLES ********/

-- 1- BLANQUEAR CAMPOS DE LA TABLA

select ExportadoEns,USER03, user07, * 
-- update CF_ResItem set ExportadoEns = '', USER03 = '0'
from CF_ResItem where NumTienda =  '44'  and  FechaNegocio = '03/11/2020'  and origen ='M' --and  ExportadoEns ='' --AND USER03=0 and  user07 =  '0' 


select ExportadoEns,USER03, user07, Origen, * from CF_ResItem where NumTienda =  '44'  and  FechaNegocio >= '03/11/2020'  and origen ='M' and  USER03=0 and  user07 =  '0' 
AND ExportadoEns <> ''

/******/
select * from CF_StkEnsamb where NumTienda =  '43'  and  FechaNegocio =  '10/05/2018'  and CodProd in (select invtid from inventory where StkItem=1)
AND CANTIDAD > CantDisp
/******/

-- deletear CF_ResItemCompD por lo lotes de componentes (ensambles)

select * from CF_ResItemCompD where NumTienda =  '44'  and  FechaNegocio =  '01/01/2019' and TipoProd='PROT' and Exportado=''  and  user07 =  '0'  order by Nivel desc, user03 asc 

--delete CF_ResItemCompD where  FechaNegocio > = '2018-10-01'

--- 2.- PASO 2 (QUITAR LOTES DEL SOLOMON IV)

SELECT *
-- DELETE 
FROM Batch WHERE BatNbr IN (select ExportadoEns from CF_ResItem where NumTienda =  '43'  and  FechaNegocio >= '10/01/2018'  and origen ='M' --and  USER03=0 and  user07 =  '0' 
AND ExportadoEns <> '') and Module = 'IN'

SELECT *
-- DELETE 
FROM INTran WHERE BatNbr IN (
select ExportadoEns from CF_ResItem where NumTienda =  '43'  and  FechaNegocio >= '10/01/2018'  and origen ='M' --and  USER03=0 and  user07 =  '0' 
AND ExportadoEns <> '')

SELECT *
-- DELETE 
FROM GLTran WHERE BatNbr IN (select ExportadoEns from CF_ResItem where NumTienda =  '43'  and  FechaNegocio >= '10/01/2018'  and origen ='M' --and  USER03=0 and  user07 =  '0' 
AND ExportadoEns <> '') AND Module = 'IN'



/**********************************************/


select * from CF_StkEnsamb where NumTienda =  '43'  and  FechaNegocio =  '07/31/2019'  and CodProd in (select invtid from inventory where StkItem=1) --AND CodProd = 'I219111'
AND CANTIDAD > CantDisp


----- liberar

declare @ALMACEN char(10), @COD_PROD char(10),  @qtyonhand FLOAT, @totcost FLOAT

set @ALMACEN = 'CFCUSCO2' set @COD_PROD = 'I250191' 

SET @qtyonhand = 1.892 SET   @totcost= 5.48857868

select siteid, INVTID, qtyonhand, totcost, AllocQty, QtyAvail, QtyCustOrd, round(qtyonhand,2),LastCost, * 
from itemsite
where siteid=@ALMACEN and  invtid  in (  @COD_PROD)

select siteid, INVTID, qtyonhand,WhseLoc,* 
from location
where siteid=@ALMACEN and  invtid  in ( @COD_PROD) and whseloc='BUENESTADO'

select STOCK,*from xamitemsite where  siteid=@ALMACEN and  invtid  in (  @COD_PROD)

/*
update itemsite set  qtyonhand = @qtyonhand ,QtyAvail =  @qtyonhand,totcost =@totcost * @qtyonhand  , AvgCost= @totcost
where siteid=@ALMACEN and  invtid   in ( @COD_PROD)

update location set qtyonhand = @qtyonhand --qtyonhand = qtyonhand+ @qtyonhand
where siteid=@ALMACEN and  invtid   in (  @COD_PROD)
and whseloc='BUENESTADO'

update xamitemsite SET stock =@qtyonhand , 
Costo = @qtyonhand * @totcost 
from xamitemsite where  siteid=@ALMACEN and  invtid  in (  @COD_PROD)

*/














