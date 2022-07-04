--migracionnnnnn--
----------MIGRAR INFO--------------
--GEN.AM_Movimiento_MigrarVentas '201810'

---PASOS MIGRACION---------exec recargar_kardex
--1)PRIMER PASO
select cf.fechanegocio,cf.* from CFM_RegVtas cf 
inner join cf_tiendasite t on cf.numtienda  =t.numtienda 
where cf.Chk_Num  not in (select Chk_Num from CF_RegVtas)
and month(cf.fechanegocio)= 05
order by cf.fechanegocio asc, cf.numtienda asc

--select distinct(NumTienda) from CFM_RegVtas where FechaNegocio = '2017-07-12'

declare @fecha varchar(10)
set @fecha ='2018-08-01'
-------- importado facturacion correcto 
select fechanegocio,ExportadoFN,referenciaFN,exportadopa,referenciapa,* from CF_RegVtas where fechanegocio between  @fecha and GETDATE() and ExportadoFN = ''
-------- importado pagos correcto 
select fechanegocio,ExportadoFN,referenciaFN,exportadopa,referenciapa,* from CF_RegVtas where FechaNegocio between  @fecha and GETDATE() and ExportadoPA = ''

select MAX (BatNbr) from Batch where Module= 'ar'

select fechanegocio,ExportadoFN,referenciaFN,exportadopa,referenciapa,* from CF_RegVtas where FechaNegocio between '2017-07-04' and GETDATE() and chk_num ='CFCUZCO1000000000107' and ExportadoPA = ''

---)LIBERAR
DECLARE   --003160
 --delete from wrkreleasebad
@lote VARCHAR(6)  
DECLARE cClientes CURSOR FOR
		select --top 20
		BATNBR from batch 
		where 1=1
		and module = 'AR' 
        and perpost = '201905'
		and status  in ('B','H','S') 
		and crtd_User = 'SYSADMIN'	
		and batnbr not in (select lote from lrevisados)		        
OPEN cClientes 
FETCH cClientes INTO @lote 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin 
	   insert into  lrevisados select @lote 
	   EXEC	liberarAR @LOTE 
       --print 'exec liberarAR '+char(39)+ @lote +char(39)
 end	
FETCH cClientes INTO @lote
END
CLOSE cClientes
DEALLOCATE cClientes
go

--------------------------------------------------------------------

--2)SEG PASO

select fechanegocio,fecha,ExportadoFN,referenciaFN,exportadopa,ReferenciaPA,*  from CF_RegVtas cf  
inner join batch b on cf.exportadofn =b.batnbr
where ExportadoPA ='' 
and b.module ='AR'
--and b.status   IN ('U','P')
and b.status   IN ('B','S','H')      
--and b.module ='ar'
and CF.user06 ='' 
and CF.total <> 0 
and MONTH(CF.fechaNEGOCIO) = 05
order by cf.EXPORTADOFN ASC 
go

/****ejecutar para saber la duplicidad****/
--ardebug '000495'  


select * from dbo.WrkRelease

delete from WrkRelease

--verificaciones para duplicidad
/******revisar error nombre de referencia de duplicidad*******/
--select DocType, * from ARDoc where RefNbr = 'B770000485'

/******respuesta a mandar por correo******/
--select batNbr, RefNbr, DocDate, OrigDocAmt from ARDoc where RefNbr = 'B770000485'

/******revisar por nombre de bat*******/
--select TranDate, * from ARTran where BatNbr = '001019'


/*****CAMBIO LOTE PARA PODER LIBERAR*****/
SELECT NumDoc, ExportadoFN, ReferenciaFN FROM CF_RegVtas WHERE ExportadoFN = '001036' AND ReferenciaFN = 'B770000485'

--492

--UPDATE CF_RegVtas
--SET NumDoc = '0000493', ReferenciaFN = 'B770000493'
--WHERE ExportadoFN = '001036' AND ReferenciaFN = 'B770000485' AND NumDoc = '0000485'


-------------------------------------------------------------------------
--3)TER PASO
--para transferencia de efectivo alexander (periodos ingresados mes antes)
				
select ss.* from   cfm_detpago2  ss
inner join cf_tiendasite T on ss.numtienda  =t.numtienda
where  exportadotr = '' and
--t.numtienda = 44 and
month(ss.fechanegocio)  in (05)  --and ss.FechaNegocio = '2018-11-26'
--and referencia like '%111'
--and nombrvc ='201602'
order by ss.fechanegocio ASC
go

select * from cfm_detpago2 where FechaNegocio = '2018-11-26' and NumTienda = 44
--001404

--select * from CFM_DetPago2 where Exportadotr = '001048'
--select * from CFM_DetPago2 where Referencia like '%1048'

--'1048'
--'1046'
--'1045'
--'1044'
--'1043'
--'1042'

--------------------VERIFICACION---------------------------------

declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='000572'-- LOTE 000575
--set @refnbr ='041B094973' --DOCUMENTO
SELECT perpost,PerEnt,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,PerEnt,Rlsed,batnbr,docdate,refnbr,CuryOrigDocAmt,docbal,curydocbal,doctype,custid,rlsed,taxid00,applbatnbr,terms,* from ardoc c where batnbr= @batnbr order by c.RefNbr--and refnbr = @refnbr
select perpost,PerEnt,rlsed,batnbr,TranDate,refnbr,acct,curyid, curytranamt,tranamt,jrnltype,trantype,whseloc,* from artran c where batnbr= @batnbr  order by c.RefNbr--and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,PerEnt,rlsed,batnbr,TranDate,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g 
where batnbr = @batnbr and module = 'AR' order by g.RefNbr --and refnbr like @refnbr 

/****ejecutar para saber la duplicidad****/
--ardebug '001019'

select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr ---TABLA PAGOS ---
go
--------------

select perpost,STATUS,module,rlsed,* from BATCH where BatNbr='000601' and MODULE = 'AR' 
select perpost,batnbr,docdate,CuryOrigDocAmt,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,* from ARDoc where BatNbr='000601'
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran where BatNbr='000601'

--select ExportadoPA,ReferenciaPA ,* from CF_RegVtas where ExportadoFN ='000574'

----STATUS 5 ----

---B = BALANCEADO
---S = RETENIDO
---H = OBSERVACION
---U = UNPOSTED ( LIBERADO )
---P = POSTED 
---(U,P) PENDIENTES DE LOS PAGOS DE 2 OPCION (IMPORTAR PAGOS)
---(B,S,H) PARA VERIFICAR ERRORES DE LA PRIMERA OPCION


--OBS:

--OBS:
----( CUANDO TRANTYPE ES = IN , CM SE GENERA 121301)
----( CUANDO TRANTYPE ES = PA , CM SE GENERA 101000)
-----SOLO LOS PA GENERAN ARDJUST -------------



select top 10 Chk_Num ,* from CF_RegVtas where NumTienda ='43' order by right(Chk_Num,8) desc
select top 10 Chk_Num ,* from CF_RegVtas where NumTienda ='44' order by right(Chk_Num,8) desc
--insert into CF_RegVtas select top 1 C1,NumTienda , Chk_Num , TipoDoc , Fecha , Hora,NumSerie,NumDoc , RazonSocial1, RazonSocial2 , RazonSocial3,RUC,C2,C3,Subtotal,AutoServicio, IGV,Total,Propina,NumDocAnulacion,NumCajero,NombCajero,NumEmpleado,NombEmpleado,PrimerNombEmpleado,Apellido,SecuenciaEmpleado,NumRVC,NumCaja,NombCaja,FechaNegocio,Identificador,ExportadoFN,ReferenciaFN,ExportadoPA,ReferenciaPA,Crtd_User,Crtd_DateTime,LUpd_User,LUpd_DateTime,User01,User02,User03,User04,User05,User06,User07,User08,User09,User10,pago from CF_RegVtas where numdoc='0003222' and NumTienda ='44'
--insert into CF_RegVtas 
--(C1,NumTienda , Chk_Num , TipoDoc , Fecha , Hora,NumSerie,NumDoc ,RazonSocial1, RazonSocial2 , RazonSocial3,RUC,C2,C3,Subtotal,AutoServicio, IGV,Total,Propina,NumDocAnulacion,NumCajero,NombCajero,NumEmpleado,NombEmpleado,PrimerNombEmpleado,Apellido,SecuenciaEmpleado,NumRVC,NumCaja,NombCaja,FechaNegocio,Identificador,ExportadoFN,ReferenciaFN,ExportadoPA,ReferenciaPA,Crtd_User,Crtd_DateTime,LUpd_User,LUpd_DateTime,User01,User02,User03,User04,User05,User06,User07,User08,User09,User10,pago) 
--select top 1 nombrvc,C1,NumTienda ,'CFCUZCO2000000025014', TipoDoc ,'2017-06-21 00:00:00' Fecha, Hora,NumSerie,'0003428' NumDoc, RazonSocial1, RazonSocial2 , RazonSocial3,RUC,C2,C3,Subtotal,AutoServicio, IGV,Total,Propina,NumDocAnulacion,NumCajero,NombCajero,NumEmpleado,NombEmpleado,PrimerNombEmpleado,Apellido,SecuenciaEmpleado,NumRVC,NumCaja,NombCaja,FechaNegocio,Identificador,ExportadoFN,ReferenciaFN,ExportadoPA,ReferenciaPA,Crtd_User,Crtd_DateTime,LUpd_User,LUpd_DateTime,User01,User02,User03,User04,User05,User06,User07,User08,User09,User10,pago from CF_RegVtas where numdoc='0003222' and NumTienda ='44'


/*********** CARGAR INVENTARIOS PARA ALEXANDER ********************/
/*********** ================================= ********************/

--sp_helptext recargar_kardex

/** EJECUTAR ESTE PROCEDURE **/

--exec recargar_kardex

--CREATE proc recargar_kardex  
--as  
--truncate table tb_kardexINV  
--insert into tb_kardexINV(identificador, nombrelocal, fecha, fechanegocio, movimiento, idmovimiento, MovAsociado, Numero, Correlativo,Corre_Asociado,Fecha_Asociado, cant, Observacion, Lote,LoteAsociado)  
--select identificador, nombrelocal, fecha, fechanegocio, movimiento, idmovimiento, MovAsociado, Numero, Correlativo,Corre_Asociado,Fecha_Asociado, cant, Observacion, Lote ,LoteAsociado  
--from kardexINV

select * from tb_kardexINV where 
fechanegocio = '2018-07-20'
--Correlativo = '00000098'

select distinct(fecha) from tb_kardexINV where fecha like '%2017-07%'

--sp_help tb_kardexINV


/*********** VER VISA Y MASTERCARD********************************/
/*********** =====================********************************/

SELECT * FROM CF_DetPago --WHERE ExportadoTr = '0001443'
WHERE FechaNegocio = '2017-09-01' AND Tipo = 'VISA'					--PROCESADA

SELECT * FROM CFM_DetPago --WHERE Referencia = '0001443'
WHERE FechaNegocio = '2017-09-01' AND NombTenderMedia = 'VISA'		--BRUTA






















