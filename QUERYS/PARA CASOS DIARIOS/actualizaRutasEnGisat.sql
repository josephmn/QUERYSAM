--De ahora en adelante  solamente ejecutar estos uno por uno en bd GISAT 192.168.10.53
-- sa p3p3gr1ll0
-- base GISAT


EXEC xATUpdate_RutasEnSolomon_1 -- rapido

EXEC xATInsert_xATClteDir_1 -- rapido

EXEC xATUpdate_xATClteDir_1               --rapido

EXEC xATInsert_xAMMae_Ruta_Gisat --rapido

EXEC xATUpdate_Cliente      --esperar

EXEC xATUpdate_Customer_1 --esperar

EXEC xATUpdate_SOAddress_1              --esperar

EXEC xATInsert_Mae_Ruta_Nextel1 -- rapido

sp_helptext xATUpdate_Cliente
 
--update  cliente set codclie='20505653514xx',IDZONA='',codvend ='' from cliente where codclie in('20505653514')


--select ESTADOCLIENTE,IDZONA,*from cliente where codclie in('16531125')
--select *from cliente where IDZONA='F120017' and  codclie in('1008706007519816701')
--select *from cliente where codvend ='539'

--select *from VENDEDOR where codvend ='539'

--delete from cliente where codclie in('20520790714')

--update  cliente set codvend ='532' from cliente where IDZONA='F120026'
--update  cliente set IDZONA='F140130',codvend ='521',estadocliente ='A' from cliente where codclie in('29635565')
--update  cliente set estadocliente ='A' from cliente where codclie in('25647353')
--select *from dbo.UBIGEO

--select *from dbo.XAMMAE_RUTA where zonarutaid ='F120017'
--select *from dbo.XAMMAE_RUTA where slsperid ='522'

