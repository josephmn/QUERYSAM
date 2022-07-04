


Dbnav_OrdenVenta  'FDL0000002',  '%'

PV_OrdenVenta_A_P  'SYSADMIN',  'FDL0000002'  

sp_helptext PV_OrdenVenta_A_P






sp_helptext  Dbnav_OrdenVenta 


SELECT * FROM SOOrdVentaD  
JOIN Inventory ON SOOrdVentaD.Invtid = Inventory.Invtid  
WHERE   
SOOrdVentaD.NroOrdVenta = 'FLI0000005'   
 
  ORDER BY SOOrdVentaD.NroOrdVenta,SOOrdVentaD.InvtID  
  
  
SELECT * FROM SOOrdVentaH   
WHERE  Status in ('P')  and  left(NroOrdventa,2)<>'OV' and  left(user17,2) <> 1  and NroOrdVenta LIKE 'FLI0000009'  
  ORDER BY NroOrdVenta
  NroOrdVenta
BLI0000001     
  FechaOrdVenta
2016-01-06 00:00:00
  HoraAprobOrd
11:16:17  
SOTypeID
FLI
CustOrdNbr
4557849328                     


ShiptoID
R.C       

  ALTER VIEW VORDEN_PEDIDOS
  AS
  --Funcion  : Lista pedidos y cantidad que se atendio
  --Sistema  : Solomon IV
  --Usuario  : Gasla Baudat Laisson Gadel
  --Ultima Mod : 06/09/2016
  select SUBSTRING(  LEFT(CONVERT(VARCHAR, H.FechaOrdVenta, 120), 10),1,4) + SUBSTRING(LEFT(CONVERT(VARCHAR, H.FechaOrdVenta, 120), 10),6,2)Perpost,
   H.NroOrdVenta,H.FechaOrdVenta,H.HoraAprobOrd,H.SOTypeID,H.SITEID ,H.CustOrdNbr,C.Custid,C.name,S.addr1,D.InvtID,I.Descr,D.user01,
  D.MonQtyOrd,(D.MonQtyOrd -D.S4Future03)Atendido  from SOOrdVentaH H
  INNER JOIN SOOrdVentaD D ON H.NroOrdVenta = d.NroOrdVenta
  INNER JOIN INVENTORY I ON D.InvtID = I.InvtID
  INNER JOIN CUSTOMER C ON H.CUSTID = C.CUSTID
  INNER JOIN SoAddress S ON C.CUSTID =S.CUSTID and H.shiptoid = S.shiptoid
  WHERE  h.Status in ('P')  and  left(h.NroOrdventa,2)<>'OV' and  left(h.user17,2) <> 1 
  
  go
  
  select * from VORDEN_PEDIDOS
  
    set  @VAR1 =LEFT(CONVERT(VARCHAR, @fecha_ant, 120), 10)     
    /*
EXEC  TSP_GEN_HISTSTOCK
  
  SP_HELPTEXT TSP_GEN_HISTSTOCK
  */
  SELECT* FROM SOOrdVentaH WHERE NroOrdVenta ='FLI0000009'
  
    ShiptoID
R.C       
MonQtyOrd
192
shiptoid
R.C       
select * from SoAddress where custid =  '20109072177'  and shiptoid =  'DEFAULT' 

PV_OrdenVenta_A_P  'SYSADMIN',  'FLI0000009' 


select shiptoid,* from SoAddress  where addr1 like '%CARR. CENTRAL KM 2.5 STA ANITA%'
select * from SoAddress WHERE CUSTID ='20109072177'


20109072177    