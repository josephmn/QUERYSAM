/**/
/*******************************************************************/
---- Funcion : PLAN DE PRODUCCION SEMANAL (CONTROL CALLAO) V5.0 ----
---- Sistema : SOLOMON IV										----
---- Usuario : JOSEPH MAGALLANES								----
---- Fecha   : 11/01/18											----
/*******************************************************************/

/****************** PLAN DE PRODUCCION SEMANAL ******************/

USE AM2018APP
GO

/***** CREACION DE TABLA PRINCIPAL - PLANTILLA *****/

CREATE TABLE AMPlaProdSemanalPlantilla
(
Producto CHAR (20) NULL,
Maquina CHAR (20) NULL,
Tipo CHAR (20) NULL,
Codigo CHAR (5) NULL,
Descr CHAR (120) NULL,
PesoKG FLOAT NULL,
SISEMINI FLOAT NULL,
LUNES	FLOAT NULL,
MARTES	FLOAT NULL,
MIERCOLES	FLOAT NULL,
JUEVES	FLOAT NULL,
VIERNES	FLOAT NULL,
SABADO	FLOAT NULL,
DOMINGO	FLOAT NULL,
PRODSEM FLOAT NULL,
SFSEMEND FLOAT NULL,
tstamp timestamp NOT NULL
)
GO

--DROP TABLE AMPlaProdSemanalPlantilla
--TRUNCATE TABLE AMPlaProdSemanalPlantilla

SELECT * FROM AMPlaProdSemanalPlantilla

--UPDATE AMPlaProdSemanalPlantilla SET Maquina = REPLACE (Maquina, 'Ñ','N')  from AMPlaProdSemanalPlantilla


INSERT INTO AMPlaProdSemanalPlantilla (Producto, Maquina, Tipo, Codigo, Descr, PesoKG, SISEMINI) --LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO, DOMINGO, PRODSEM, SFSEMEND)
VALUES
('SOLUBLE','RIGIDOS','CLASICO','21008','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO FRASCO 180 GR','0.18','0'),
('SOLUBLE','RIGIDOS','CLASICO','21009','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO FRASCO 50 GR','0.05','0'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21018','ALTOMAYO CAFÉ INSTANTÁNEO DESCAFEINADO FRASCO 50 GR','0.05','0'),
('TYM','TYM','CLASICO','21032','ALTOMAYO CAFÉ TOSTADO MOLIDO CLÁSICO BOLSA 200 GR','0.2','0'),
('TYM','MANUAL TYM','GOURMET','21039','ALTOMAYO CAFÉ TOSTADO MOLIDO GOURMET P/PASAR BOLSA 250 GR','0.25','0'),
('TYM','MANUAL TYM','GOURMET','21040','ALTOMAYO CAFÉ TOSTADO MOLIDO GOURMET BOLSA 1 KG.','1','0'),
('TYM','MANUAL TYM','GOURMET','21075','ALTOMAYO CAFÉ TOSTADO EN GRANO GOURMET EXPRESO BOLSA 250 GR','0.25','0'),
('SOLUBLE','RIGIDOS','CLASICO','21090','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO DOIG PACK 50 GR','0.05','0'),
('SOLUBLE','SACHET','KIMBO','21129','KIMBO CEBADA INSTANTANEO DISPLAY 8GR X 50 SACHETS','0.4','0'),
('TYM','MANUAL TYM','GOURMET','21150','ALTOMAYO CAFÉ TOSTADO MOLIDO GOURMET P/PASAR BOLSA 500 GR','0.5','0'),
('TYM','TYM','CLASICO','21162','ALTOMAYO CAFE TOSTADO MOLIDO CLASICO BOLSA 50 GR.','0.05','0'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21381','ALTOMAYO CAFÉ INSTANTANEO DESCAFEINADO FRASCO 180 GR','0.18','0'),
('SOLUBLE','RIGIDOS','GOURMET','21398','ALTOMAYO CAFÉ INSTANTANEO GOURMET FRASCO 180 GR','0.18','0'),
('SOLUBLE','RIGIDOS','GOURMET','21399','ALTOMAYO CAFÉ INSTANTANEO GOURMET FRASCO 50 GR','0.05','0'),
('SOLUBLE','RIGIDOS','GOURMET','21410','ALTOMAYO CAFE INST GOURMET HERMETIPACK 50GR','0.05','0'),
('TYM','MANUAL TYM','CLASICO','21478','ALTOMAYO CAFÉ TOSTADO MOLIDO CLÁSICO BOLSA 500 GR','0.5','0'),
('SOLUBLE','TUBINO','CLASICO','21542','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO 02 TIRAS X 08 STICKS X12GR','0.192','0'),
('SOLUBLE','RIGIDOS','CLASICO','21577','ALTOMAYO CAFÉ INSTANTÁNEO CLASICO BOLSA 25 KG','1','0'),
('SOLUBLE','RIGIDOS','GOURMET','21597','ALTOMAYO CAFE INST GOURMET HERMETIPACK 100 GR','0.1','0'),
('SOLUBLE','RIGIDOS','CLASICO','21598','ALTOMAYO CAFE INST CLASICO HERMETIPACK X100 GR','0.1','0'),
('SOLUBLE','TUBINO','GOURMET','21720','ALTOMAYO CAFÉ INSTÁNTANEO GOURMET PAQUETE 100 UNDX2GR STICKS','0.2','0'),
('TYM','TYM','CLASICO','21725','ALTOMAYO TOSTADO MOLIDO CLASICO 85 GR','0.085','0'),
('TYM','TYM','GOURMET','21726','ALTOMAYO TOSTADO MOLIDO GOURMET 85 GR','0.085','0'),
('SOLUBLE','RIGIDOS','GOURMET','21731','ALTOMAYO FLEXIBLE GOURMET BOLSA 180GR','0.18','0'),
('SOLUBLE','RIGIDOS','GOURMET','21751','ALTOMAYO CAFÉ INSTANTÁNEO GOURMET LATA 190 GR','0.19','0'),
('SOLUBLE','RIGIDOS','CLASICO','21753','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO LATA 190 GR','0.19','0'),
('SOLUBLE','RIGIDOS','CLASICO','21758','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO LATA 200 GR-2','0.2','0'),
('SOLUBLE','TUBINO','CLASICO','21759','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO 2 TIRAS DE 8 STICKS X 6 G','0.096','0'),
('SOLUBLE','TUBINO','GOURMET','21761','ALTOMAYO CAFÉ INSTANTÁNEO GOURMET 02 TIRAS X 8 STICKS X 8 GR','0.128','0'),
('SOLUBLE','TUBINO','CLASICO','21763','ALTOMAYO CAFÉ INSTANTÁNEO CLÁSICO 02 TIRAS X 08 STICKS X10GR','0.16','0'),
('SOLUBLE','TUBINO','DESCAFEINADO','21766','AM CAFÉ INST. DESCAF. GRANULADO 2 TIRAS DE 8UND=16 STICK 7GR','0.112','0'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21767','AM CAFÉ INST. DESCAFEINADO GRANULADO FRASCO 180 GR','0.18','0'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21768','AM CAFÉ INST. DESCAFEINADO GRANULADO FRASCO 50 GR','0.05','0'),
('SOLUBLE','TUBINO','DESCAFEINADO','21769','ALTOMAYO CAFÉ INST. DESCAFEINADO GRANULADO  STICK 7GR.','0.007','0'),
('SOLUBLE','RIGIDOS','PREMIUM','21775','ALTOMAYO CAFÉ GRANULADO PREMIUM FRASCO 100 GR','0.1','0'),
('SOLUBLE','TUBINO','PREMIUM','21780','ALTOMAYO CAFÉ GRANULADO PREMIUM CAJA 4  GR','0.004','0'),
('SOLUBLE','TUBINO','DESCAFEINADO','21781','ALTOMAYO CAFE INST.DESCAF.GRANULADO PAQ. 100 UNIDX2GR STICKS','0.2','0'),
('SOLUBLE','TUBINO','CLASICO','21782','ALTOMAYO CAFE INST. CLASICO PAQ.100 UNIDX 2GR STICKS','0.2','0'),
('TYM','MANUAL TYM','GOURMET','24030','MATERIA PRIMA TOSTADO EN GRANO BLEND 1 EN KG CAFETERIA','1','0')
GO

--TRUNCATE TABLE AMPlaProdSemanalPlantilla

CREATE TABLE AMCapcProdDIoSemPlan
(
Producto CHAR (20) NULL,
Maquina CHAR (20) NULL,
Tipo CHAR (20) NULL,
Codigo CHAR (5) NULL,
Descr CHAR (120) NULL,
PesoKG FLOAT NULL,
Unidades FLOAT NULL,
CapcProd FLOAT NULL,
Canales FLOAT NULL,
NumMaquina FLOAT NULL,
ProdEsperada FLOAT NULL,
User1 char(10) NULL,
User2 char(10) NULL,
User3 char(10) NULL,
User4 char(50) NULL,
User5 char(50) NULL,
User6 char(50) NULL,
User7 float NULL,
User8 float NULL,
User9 float NULL,
User10 smalldatetime NULL,
User11 smalldatetime NULL,
User12 smalldatetime NULL,
s4future1 float NULL,
s4future2 float NULL,
s4future3 char(30) NULL,
s4future4 char(30) NULL,
s4future5 float NULL,
s4future6 float NULL,
s4future7 float NULL,
s4future8 char(30) NULL,
s4future9 char(30) NULL,
s4future10 float NULL,
s4future11 smalldatetime NULL,
s4future12 smalldatetime NULL,
s4future13 float NULL,
s4future14 float NULL,
Crtd_DateTime datetime null,
Crtd_User varchar(10) null,
LUpd_DateTime datetime   null,
LUpd_User varchar(10) null,
tstamp timestamp NOT NULL
)

--select cast(ProdEsperada as float) from AMCapcProdDIoSemPlan where Codigo = ''

/******* INSERTAR DATOS ********/

INSERT INTO AMCapcProdDIoSemPlan (Producto, Maquina, Tipo, Codigo, Descr, PesoKG, Unidades, CapcProd, Canales, NumMaquina, ProdEsperada)
VALUES
('SOLUBLE','RIGIDOS','CLASICO','21008','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICOFRASCO180GR','1','18','1','2','9','19440'),
('SOLUBLE','RIGIDOS','CLASICO','21009','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICOFRASCO50GR','1','20','1','2','9','21600'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21018','ALTOMAYOCAFÉINSTANTÁNEODESCAFEINADOFRASCO50GR','1','20','1','2','9','21600'),
('TYM','MANUALTYM','GOURMET','21030','ALTOMAYOCAFÉTOSTADOENGRANOGOURMETBOLSA1KG','1','1','1','1','8','480'),
('TYM','MANUALTYM','CLASICO','21031','ALTOMAYOCAFÉTOSTADOMOLIDOCLÁSICOBOLSA1KG','1','1','1','1','8','480'),
('TYM','TYM','CLASICO','21032','ALTOMAYOCAFÉTOSTADOMOLIDOCLÁSICOBOLSA200GR','1','20','1','1','16','19200'),
('TYM','MANUALTYM','GOURMET','21039','ALTOMAYOCAFÉTOSTADOMOLIDOGOURMETP/PASARBOLSA250GR','1','9','1','1','16','8640'),
('TYM','MANUALTYM','GOURMET','21040','ALTOMAYOCAFÉTOSTADOMOLIDOGOURMETBOLSA1KG.','1','1','1','1','8','480'),
('TYM','MANUALTYM','GOURMET','21075','ALTOMAYOCAFÉTOSTADOENGRANOGOURMETEXPRESOBOLSA250GR','1','9','1','1','16','8640'),
('SOLUBLE','RIGIDOS','CLASICO','21090','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICODOIGPACK50GR','1','25','1','2','9','27000'),
('SOLUBLE','SACHET','KIMBO','21129','KIMBOCEBADAINSTANTANEODISPLAY8GRX50SACHETS','50','20','6','1','24','3456'),
('TYM','MANUALTYM','GOURMET','21150','ALTOMAYOCAFÉTOSTADOMOLIDOGOURMETP/PASARBOLSA500GR','1','5','1','1','16','4800'),
('TYM','TYM','CLASICO','21162','ALTOMAYOCAFETOSTADOMOLIDOCLASICOBOLSA50GR.','1','27','1','1','16','25920'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21381','ALTOMAYOCAFÉINSTANTANEODESCAFEINADOFRASCO180GR','1','18','1','2','9','19440'),
('SOLUBLE','RIGIDOS','GOURMET','21398','ALTOMAYOCAFÉINSTANTANEOGOURMETFRASCO180GR','1','18','1','2','9','19440'),
('SOLUBLE','RIGIDOS','GOURMET','21399','ALTOMAYOCAFÉINSTANTANEOGOURMETFRASCO50GR','1','20','1','2','9','21600'),
('SOLUBLE','RIGIDOS','GOURMET','21410','ALTOMAYOCAFEINSTGOURMETHERMETIPACK50GR','1','25','1','2','9','27000'),
('TYM','TYM','CLASICO','21421','ALTOMAYOCAFÉTOSTADOMOLIDOCLÁSICO200GRX6UND','0','0','0','0','0','0'),
('TYM','TYM','CLASICO','21422','ALTOMAYOCAFETOSTADOMOLIDOCLASICO50GR.X6UND','0','0','0','0','0','0'),
('TYM','MANUALTYM','CLASICO','21478','ALTOMAYOCAFÉTOSTADOMOLIDOCLÁSICOBOLSA500GR','1','5','1','1','16','4800'),
('SOLUBLE','TUBINO','CLASICO','21542','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICO02TIRASX08STICKSX12GR','0','0','0','0','0','0'),
('SOLUBLE','RIGIDOS','CLASICO','21577','ALTOMAYOCAFÉINSTANTÁNEOCLASICOBOLSA25KG','1','5','1','1','8','2400'),
('SOLUBLE','RIGIDOS','GOURMET','21597','ALTOMAYOCAFEINSTGOURMETHERMETIPACK100GR','1','18','1','2','9','19440'),
('SOLUBLE','RIGIDOS','CLASICO','21598','ALTOMAYOCAFEINSTCLASICOHERMETIPACKX100GR','1','18','1','2','9','19440'),
('SOLUBLE','TUBINO','GOURMET','21720','ALTOMAYOCAFÉINSTÁNTANEOGOURMETPAQUETE100UNDX2GRSTICKS','100','30','4','3','24','5184'),
('TYM','TYM','CLASICO','21725','ALTOMAYOTOSTADOMOLIDOCLASICO85GR','1','25','1','1','16','24000'),
('TYM','TYM','GOURMET','21726','ALTOMAYOTOSTADOMOLIDOGOURMET85GR','1','25','1','1','16','24000'),
('SOLUBLE','RIGIDOS','GOURMET','21731','ALTOMAYOFLEXIBLEGOURMETBOLSA180GR','1','9','1','2','9','9720'),
('SOLUBLE','RIGIDOS','GOURMET','21751','ALTOMAYOCAFÉINSTANTÁNEOGOURMETLATA190GR','1','17','1','1','9','9180'),
('SOLUBLE','RIGIDOS','CLASICO','21753','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICOLATA190GR','1','17','1','1','9','9180'),
('SOLUBLE','RIGIDOS','CLASICO','21758','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICOLATA200GR-2','1','17','1','1','9','9180'),
('SOLUBLE','TUBINO','CLASICO','21759','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICO2TIRASDE8STICKSX6G','16','22','4','1','24','7920'),
('SOLUBLE','TUBINO','GOURMET','21761','ALTOMAYOCAFÉINSTANTÁNEOGOURMET02TIRASX8STICKSX8GR','16','25','4','3','24','27000'),
('SOLUBLE','TUBINO','CLASICO','21763','ALTOMAYOCAFÉINSTANTÁNEOCLÁSICO02TIRASX08STICKSX10GR','16','20','4','3','24','21600'),
('SOLUBLE','TUBINO','DESCAFEINADO','21766','AMCAFÉINST.DESCAF.GRANULADO2TIRASDE8UND=16STICK7GR','16','25','4','3','24','27000'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21767','AMCAFÉINST.DESCAFEINADOGRANULADOFRASCO180GR','1','18','1','2','9','19440'),
('SOLUBLE','RIGIDOS','DESCAFEINADO','21768','AMCAFÉINST.DESCAFEINADOGRANULADOFRASCO50GR','1','20','1','2','9','21600'),
('SOLUBLE','TUBINO','DESCAFEINADO','21769','ALTOMAYOCAFÉINST.DESCAFEINADOGRANULADOSTICK7GR.','0','0','0','0','0','0'),
('SOLUBLE','RIGIDOS','PREMIUM','21775','ALTOMAYOCAFÉGRANULADOPREMIUMFRASCO100GR','1','25','1','2','9','27000'),
('SOLUBLE','TUBINO','PREMIUM','21780','ALTOMAYOCAFÉGRANULADOPREMIUMCAJA4 GR','0','0','0','0','0','0'),
('SOLUBLE','TUBINO','DESCAFEINADO','21781','ALTOMAYOCAFEINST.DESCAF.GRANULADOPAQ.100UNIDX2GRSTICKS','100','30','4','3','24','5184'),
('SOLUBLE','TUBINO','CLASICO','21782','ALTOMAYOCAFEINST.CLASICOPAQ.100UNIDX2GRSTICKS','100','30','4','3','24','5184'),
('TYM','MANUALTYM','GOURMET','24030','MATERIAPRIMATOSTADOENGRANOBLEND1ENKGCAFETERIA','1','9','1','1','8','4320')


--TRUNCATE TABLE AMCapcProdDIoSemPlan

/******* CREACION DE LAS TABLAS PARA LA PANTALLA *******/

CREATE TABLE AMProdSemanalH
(
IdCorrelativo CHAR(6) NULL,
Fecha DATETIME NULL,
Mes	CHAR(6) NULL,
Semana CHAR(6) NULL,
Descr varchar(50) NULL,
Estado Char(1) NULL,
User1 char(10) NULL,
User2 char(10) NULL,
User3 char(10) NULL,
User4 char(50) NULL,
User5 char(50) NULL,
User6 char(50) NULL,
User7 float NULL,
User8 float NULL,
User9 float NULL,
User10 smalldatetime NULL,
User11 smalldatetime NULL,
User12 smalldatetime NULL,
s4future1 float NULL,
s4future2 float NULL,
s4future3 char(30) NULL,
s4future4 char(30) NULL,
s4future5 float NULL,
s4future6 float NULL,
s4future7 float NULL,
s4future8 char(30) NULL,
s4future9 char(30) NULL,
s4future10 float NULL,
s4future11 smalldatetime NULL,
s4future12 smalldatetime NULL,
s4future13 float NULL,
s4future14 float NULL,
Crtd_DateTime datetime null,
Crtd_User varchar(10) null,
LUpd_DateTime datetime   null,
LUpd_User varchar(10) null,
tstamp timestamp NOT NULL
)
GO

--drop table AMProdSemanalH


CREATE TABLE AMProdSemanalD
(
IdCorrelativo CHAR(6) NULL,
Producto CHAR (20) NULL,
Maquina CHAR (20) NULL,
Tipo CHAR (20) NULL,
Codigo CHAR (5) NULL,
Descr CHAR (120) NULL,
PesoKG FLOAT NULL,
SISenINI FLOAT NULL,
Cprod1	FLOAT NULL,
Lunes	FLOAT NULL,
Cprod2	FLOAT NULL,
Martes	FLOAT NULL,
Cprod3	FLOAT NULL,
Miercoles	FLOAT NULL,
Cprod4	FLOAT NULL,
Jueves	FLOAT NULL,
Cprod5	FLOAT NULL,
Viernes	FLOAT NULL,
Cprod6	FLOAT NULL,
Sabado FLOAT NULL,
Cprod7	FLOAT NULL,
Domingo	FLOAT NULL,
ProdSem FLOAT NULL,
SFSemEND FLOAT NULL,
User1 char(10) NULL,
User2 char(10) NULL,
User3 char(10) NULL,
User4 char(50) NULL,
User5 char(50) NULL,
User6 char(50) NULL,
User7 float NULL,
User8 float NULL,
User9 float NULL,
User10 smalldatetime NULL,
User11 smalldatetime NULL,
User12 smalldatetime NULL,
s4future1 float NULL,
s4future2 float NULL,
s4future3 char(30) NULL,
s4future4 char(30) NULL,
s4future5 float NULL,
s4future6 float NULL,
s4future7 float NULL,
s4future8 char(30) NULL,
s4future9 char(30) NULL,
s4future10 float NULL,
s4future11 smalldatetime NULL,
s4future12 smalldatetime NULL,
s4future13 float NULL,
s4future14 float NULL,
tstamp timestamp NOT NULL
)
GO

--drop table AMProdSemanalD

SELECT * FROM AMProdSemanalH

--truncate table AMProdSemanalH
--truncate table AMProdSemanalD

SELECT * FROM AMProdSemanalD


/******* CREACION DE DBNAV PARA PANTALLA *******/

CREATE PROC  DBNAV_AMProdSemanalD
---- Funcion : PLAN DE PRODUCCION SEMANAL   
---- Sistema : SOLOMON IV									 
---- Usuario : JOSEPH MAGALLANES						 
---- Fecha   : 23/11/17										 
@parm1 CHAR (6),
@Parm2 CHAR (5)
as  
begin  
select * from AMProdSemanalD where IdCorrelativo = @parm1 and Codigo like RTRIM(ltrim(@parm2)) 
order by IdCorrelativo   
end  
GO

/******* CREACION DEL PV PARA LA BUSQUEDA DE CORRELATIVO *******/

CREATE PROC PV_AMProdSemanalH
---- Funcion : PLAN DE PRODUCCION SEMANAL
---- Sistema : SOLOMON IV									 
---- Usuario : JOSEPH MAGALLANES						 
---- Fecha   : 23/11/17	
@parm1 char(6)
as
begin
select * from AMProdSemanalH where IdCorrelativo LIKE @parm1 order by IdCorrelativo
end
GO

/******* CREATE VISTA PARA INSERTAR ********/

ALTER VIEW vs_AMProdSemanalPla  
  
---- Funcion : PLAN DE PRODUCCION SEMANAL  
---- Sistema : SOLOMON IV            
---- Usuario : JOSEPH MAGALLANES         
---- Fecha   : 05/12/17   
  
AS  
select AMPlaProdSemanalPlantilla.Producto as PRODUCTO, AMPlaProdSemanalPlantilla.Maquina as MAQUINA, AMPlaProdSemanalPlantilla.Tipo as TIPO, 
Inventory.InvtID CODIGO,
Inventory.Descr as DESCRIPCION,(InventoryADG.Weight)/1000 as PesoKG,sum(QtyNewDisp + QtyInTransit) as Stock
  
from Inventory   
inner join InventoryADG  on Inventory.InvtID = InventoryADG.InvtID   
inner join xAMMarcas on xAMMarcas.idmarca = Inventory.User1   
inner join xAMNewItemSiteT on xAMNewItemSiteT.InvtID_Sol = Inventory.InvtID  
inner join AMPlaProdSemanalPlantilla on AMPlaProdSemanalPlantilla.Codigo = Inventory.InvtID where Inventory.InvtId in 
('21008','21009','21018','21032','21039','21040','21075','21090','21129','21150','21162','21381','21398','21399',
'21410','21478','21542','21577','21597','21598','21720','21725','21726','21731','21751','21753','21758','21759','21761','21763',
'21766','21767','21768','21769','21775','21780','21781','21782','24030') 
and xAMNewItemSiteT.SiteId_Sol not in ('CIXDESMEDR','HUADESUSO','CIXDESUSO','LIMDESUSO','MARKETING','MARKTEMP')   
group by AMPlaProdSemanalPlantilla.Producto,CODIGO,xAMMarcas.descr,AMPlaProdSemanalPlantilla.Maquina,AMPlaProdSemanalPlantilla.Tipo, Inventory.InvtID,
Inventory.Descr,InventoryADG.Weight,InventoryADG.WeightUOM --order by CODIGO

/******* CREATE PROCEDURE INSERTAR *******/

ALTER PROCEDURE AMInsertarProductoSemanal       
---- Funcion : PLAN DE PRODUCCION SEMANAL   
---- Sistema : SOLOMON IV									 
---- Usuario : JOSEPH MAGALLANES						 
---- Fecha   : 24/11/17 
@parm1 AS CHAR(6)
As        
INSERT INTO AMProdSemanalD       
(IdCorrelativo, Producto, Maquina, Tipo, Codigo, Descr, PesoKG, SISenINI, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo, ProdSem, SFSemEND, User1, 
User2, User3, User4, User5, User6, User7, User8, User9, User10, User11, User12, s4future1, s4future2, s4future3, s4future4, s4future5, s4future6, s4future7, 
s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14)      
select @parm1, Producto, Maquina, Tipo, Codigo, DESCRIPCION, PesoKG, Stock, '0', '0', '0', '0', '0', '0','0', '0', '0',null,null,null,null,null,null,null,null,
null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null from vs_AMProdSemanalPla
GO


--select * from AMProdSemanalDBK

--EXEC AMInsertarProductoSemanal  & SParm(bAMProdSemanalH.IdCorrelativo)

--sp_helptext AMInsertarProductoSemanal

ALTER PROCEDURE AMInsertarProductoSemanalBACKUP         
---- Funcion : PLAN DE PRODUCCION SEMANAL     
---- Sistema : SOLOMON IV            
---- Usuario : JOSEPH MAGALLANES         
---- Fecha   : 12/12/17   
@parm1 AS CHAR(6)  
As          
INSERT INTO AMProdSemanalDBK         
(IdCorrelativo, Producto, Maquina, Tipo, Codigo, Descr, PesoKG, SISenINI, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo, ProdSem, SFSemEND, User1, User2, User3, User4, User5, User6, User7, User8, User9, User10, User11, User12, s4future1, 
s4future2, s4future3, s4future4, s4future5, s4future6, s4future7, s4future8, s4future9, s4future10, s4future11, s4future12, s4future13, s4future14)        
select @parm1, Producto, Maquina, Tipo, Codigo, DESCRIPCION, PesoKG, Stock, '0', '0', '0', '0', '0', '0','0', '0', '0',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
,null,null,null,null,null from vs_AMProdSemanalPla
go

/****actualizado al 17-01-2018 ****/

/**** creacion de la tabla para el reporte ****/

--drop table AMPrealvsPsem

create table AMPrealvsPsem
(
IdCorrelativo CHAR(6) NULL,
Codigo CHAR (5) NULL,
Descr CHAR (120) NULL,
Lunes	FLOAT NULL,
Martes	FLOAT NULL,
Miercoles	FLOAT NULL,
Jueves	FLOAT NULL,
Viernes	FLOAT NULL,
Sabado FLOAT NULL,
Domingo FLOAT NULL,
tstamp timestamp NOT NULL
)

select * from AMPrealvsPsem


--exec AMProdReporte '000002'

--select * from AMPrealvsPsem

/**** create procedure para generar el reporte semanal ****/

ALTER PROCEDURE AMProdReporte
---- Funcion : PLAN DE PRODUCCION SEMANAL (FECHA INICIO - FECHA FIN)        
---- Sistema : SOLOMON IV                
---- Usuario : JOSEPH MAGALLANES             
---- Fecha   : 17/01/18    
   
@parm1 AS CHAR(6)
--set @parm1 = '000001'    
As
--limpia la tabla, para borrar registros anterirores
truncate table AMPrealvsPsem

INSERT INTO AMPrealvsPsem (IdCorrelativo, Codigo, Descr, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo)

select AH.IdCorrelativo, AP.Codigo, AP.Descr, 
(primeratabla.Lunes - AP.Lunes) LunesD,
(primeratabla.Martes - AP.Martes) MartesD,
(primeratabla.Miercoles - AP.Miercoles) MiercolesD,
(primeratabla.Jueves - AP.Jueves) JuevesD,
(primeratabla.Viernes - AP.Viernes) ViernesD,
(primeratabla.Sabado - AP.Sabado) SabadoD,
(primeratabla.Domingo - AP.Domingo) DomingoD
from (
SELECT y.KitID, y.Descr, ISNULL((y.Lunes),0) Lunes, ISNULL((y.Martes),0) Martes, ISNULL((y.Miercoles),0) Miercoles, 
ISNULL((y.Jueves),0) Jueves, ISNULL((y.Viernes),0) Viernes, ISNULL((y.Sabado),0) Sabado, ISNULL((y.Domingo),0) Domingo FROM (
select [KitID],[Descr],[Lunes],[Martes],[Miercoles],[Jueves],[Viernes],[Sabado],[Domingo] from (
SELECT assy.KitID, inv.Descr, sum(assy.KitCntr) KitCntr, (
SELECT (case x.dia 
when 'Monday' then 'Lunes' 
when 'Tuesday' then 'Martes'
when 'Wednesday' then 'Miercoles'
when 'Thursday' then 'Jueves'
when 'Friday' then 'Viernes'
when 'Saturday' then 'Sabado'
when 'Sunday' then 'Domingo'
else 'NADA'
end) Dia FROM (
select CONVERT(VARCHAR(100),DATENAME(weekday,assy.TranDate)) dia
)x
) DiaSemana FROM AssyDoc assy
inner join Inventory inv on assy.KitID = inv.InvtID
where TranDate between 
--@fechaInicio 
(select distinct ff.FechaInicio from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = @parm1)
and 
--@fechaFin
(select distinct ff.FechaFin from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = @parm1)
group by assy.KitID, inv.Descr,assy.TranDate
--ORDER BY assy.TranDate
)x
pivot
(
SUM(KitCntr)
for [DiaSemana] in ([Lunes],[Martes],[Miercoles],[Jueves],[Viernes],[Sabado],[Domingo])
)
AS PIVOTETE
)y
) primeratabla
inner join AMProdSemanalD AP ON AP.Codigo = primeratabla.KitID
inner join AMProdSemanalH AH ON AH.IdCorrelativo = AP.IdCorrelativo
--inner join FechaPlanProduccion lp on AH.Semana = lp.NroSemana
WHERE AH.IdCorrelativo = @parm1



/****actualizado al 18-01-2018 ****/

/**** creacion de la tabla para el reporte de Materia Prima x Kg ****/

create table AMProMPxKG
(
IdCorrelativo CHAR(6) NULL,
PT CHAR(6) NULL,
DescripcionPT CHAR (120) NULL,
IdMP CHAR(6) NULL,
DescrpcionMP CHAR (120) NULL,
Peso FLOAT NULL,	
Produccion FLOAT NULL,	
Lunes	FLOAT NULL,
Martes	FLOAT NULL,
Miercoles	FLOAT NULL,
Jueves	FLOAT NULL,
Viernes	FLOAT NULL,
Sabado FLOAT NULL,
Domingo FLOAT NULL,
ProdRealKG FLOAT NULL,
Proyectado FLOAT NULL,
PSxKG FLOAT NULL,
Eficiencia FLOAT NULL,
tstamp timestamp NOT NULL
)

select * from AMProMPxKG

--drop table AMProMPxKG

--exec RAMProdMPxKG '000002'

ALTER PROCEDURE RAMProdMPxKG
---- Funcion : PLAN DE PRODUCCION SEMANAL (CALCULAR MATERIA PRIMA X KG)        
---- Sistema : SOLOMON IV                
---- Usuario : JOSEPH MAGALLANES             
---- Fecha   : 18/01/18    
   
@parm1 AS CHAR(6)
--set @parm1 = '000002'    
As
--limpia la tabla, para borrar registros anterirores
truncate table AMProMPxKG

INSERT INTO AMProMPxKG (IdCorrelativo, PT, DescripcionPT, IdMP, DescrpcionMP, Peso, Produccion, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo, ProdRealKG, Proyectado, PSxKG, Eficiencia)

select top 9999999 IdCorrelativo,	PT,	DescripcionPT,	IdMP,	DescrpcionMP,	Peso,	Produccion,	LUNES,	MARTES,	MIERCOLES,	JUEVES,	VIERNES, SABADO, DOMINGO, 
isnull(round((Produccion * Peso),4),0) ProdRealKG, isnull(Proyectado,0) Proyectado, isnull(PSxKG,0) PSxKG,
case PSxKG
when 0 then 0
else isnull(((round(((Peso * Produccion) / PSxKG),4))*100),0)
end Eficiencia
from (
select 
IdCorrelativo,	PT,	DescripcionPT,	IdMP,	DescrpcionMP,	Peso,	Produccion,	LUNES,	MARTES,	MIERCOLES,	JUEVES,	VIERNES, SABADO, DOMINGO, Proyectado, 
(Proyectado * Peso) PSxKG
from (
SELECT TOP 99999999 GOOGLE.IdCorrelativo,GOOGLE.PT, GOOGLE.DescripcionPT, GOOGLE.IdMP, GOOGLE.DescrpcionMP, GOOGLE.Peso, GOOGLE.Produccion, --GOOGLE.ProdSemanal,
GOOGLE.LUNES,
GOOGLE.MARTES, 
GOOGLE.MIERCOLES,
GOOGLE.JUEVES,
GOOGLE.VIERNES,
GOOGLE.SABADO,
GOOGLE.DOMINGO, 
--SUM(GOOGLE.LUNES+GOOGLE.MARTES+GOOGLE.MIERCOLES +GOOGLE.JUEVES+GOOGLE.VIERNES+GOOGLE.SABADO) TOTALSEM, 
(select ProdSem from AMProdSemanalD where IdCorrelativo = @parm1 and Codigo = GOOGLE.PT) Proyectado  FROM (
SELECT TOP 9999999 COMER.IdCorrelativo, COMER.PT, COMER.DescripcionPT, COMER.IdMP, COMER.DescrpcionMP, COMER.Peso, SUM(COMER.Produccion) Produccion, 
SUM(ISNULL(COMER.LUNES,0)) LUNES,
SUM(ISNULL(COMER.MARTES,0)) MARTES, 
SUM(ISNULL(COMER.MIERCOLES,0)) MIERCOLES,
SUM(ISNULL(COMER.JUEVES,0)) JUEVES,
SUM(ISNULL(COMER.VIERNES,0)) VIERNES,
SUM(ISNULL(COMER.SABADO,0)) SABADO,
SUM(ISNULL(COMER.DOMINGO,0)) DOMINGO
FROM (
select [IdCorrelativo],[PT],[DescripcionPT],[IdMP],[DescrpcionMP],[Peso],[Produccion],[LUNES],[MARTES],[MIERCOLES],[JUEVES],[VIERNES],[SABADO],[DOMINGO] from (
--select y.PT, y.DescripcionPT, y.IdMP, y.DescrpcionMP, y.Peso, y.Produccion, y.PesoxMP, y.FechaProduccion from (
select top 999999 Ah.IdCorrelativo, k.KitId PT, k.Descr DescripcionPT, c.CmpnentId IdMP, iv.Descr DescrpcionMP, 
c.CmpnentQty Peso, asy.KitCntr Produccion, 
--ad.ProdSem ProdSemana, 
(c.CmpnentQty * asy.KitCntr) PesoxMP, (SELECT (case x.dia 
when 'Monday' then 'Lunes' 
when 'Tuesday' then 'Martes'
when 'Wednesday' then 'Miercoles'
when 'Thursday' then 'Jueves'
when 'Friday' then 'Viernes'
when 'Saturday' then 'Sabado'
when 'Sunday' then 'Domingo'
else 'NADA'
end) Dia FROM (
select CONVERT(VARCHAR(100),DATENAME(weekday,asy.TranDate)) dia
)x) FechaProduccion from Kit k
inner join Component c on c.KitId = k.KitId 
inner join Inventory i on i.InvtID = c.CmpnentId
inner join InventoryADG iadg on iadg.InvtID = i.InvtID
inner join AssyDoc asy on asy.KitID = k.KitId
inner join FechaPlanProduccion fp on fp.FechaAct = asy.TranDate
inner join AMProdSemanalH Ah on Ah.Semana = fp.NroSemana

--inner join AMProdSemanalD ad on ah.IdCorrelativo = ad.IdCorrelativo

left outer join Inventory iv on iv.InvtID = c.CmpnentId

where --k.KitId = '21761' and 
I.ClassID IN ('23','24') and i.InvtID in ('23001','24006','24008','24009','24013','24092','24133','24134')
and
asy.TranDate 
between 
(select distinct ff.FechaInicio from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = @parm1) 
and 
(select distinct ff.FechaFin from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = @parm1)
and
ah.IdCorrelativo = @parm1
order by asy.TranDate
) y  
pivot
(SUM(PesoxMP)
for [FechaProduccion] in([LUNES],[MARTES],[MIERCOLES],[JUEVES],[VIERNES],[SABADO],[DOMINGO])
) AS ALE

) COMER
GROUP BY COMER.IdCorrelativo, COMER.IdMP, COMER.DescrpcionMP, COMER.PT, COMER.DescripcionPT, COMER.Peso
order by COMER.IdMP
) GOOGLE

inner join AMProdSemanalD ad on GOOGLE.IdCorrelativo = ad.IdCorrelativo

GROUP BY
GOOGLE.IdCorrelativo, GOOGLE.IdMP, GOOGLE.DescrpcionMP, GOOGLE.PT, GOOGLE.DescripcionPT,  GOOGLE.Peso, GOOGLE.Produccion,
GOOGLE.LUNES,
GOOGLE.MARTES, 
GOOGLE.MIERCOLES,
GOOGLE.JUEVES,
GOOGLE.VIERNES,
GOOGLE.SABADO,
GOOGLE.DOMINGO

order by GOOGLE.PT

) ale
where IdMP not in ('24092','24133','24134')
group by 
IdCorrelativo,	PT,	DescripcionPT,	IdMP,	DescrpcionMP,	Peso,	Produccion,	LUNES,	MARTES,	MIERCOLES,	JUEVES,	VIERNES, SABADO, DOMINGO, Proyectado
) Ma

group by
IdCorrelativo,	PT,	DescripcionPT,	IdMP,	DescrpcionMP,	Peso,	Produccion,	LUNES,	MARTES,	MIERCOLES,	JUEVES,	VIERNES, SABADO, DOMINGO, Proyectado, PSxKG


/*****************************************************************/
/*****************************************************************/
/**************** para reporte de eficiencia *********************/

--drop table AMProEfic

create table AMProEfic
(
IdCorrelativo CHAR(6) NULL,
Trandate CHAR(20) NULL,
Dia char(20) NULL,
Codigo CHAR(5) NULL,
Descripcion CHAR (120) NULL,
ProdDia FLOAT NULL,
ProdReal FLOAT NULL,
Eficiencia FLOAT NULL,
tstamp timestamp NOT NULL
)


select * from AMProEfic


--exec RAMProdEfic '000001'

ALTER PROCEDURE RAMProdEfic
---- Funcion : PLAN DE PRODUCCION SEMANAL (CALCULAR MATERIA PRIMA X KG)        
---- Sistema : SOLOMON IV                
---- Usuario : JOSEPH MAGALLANES             
---- Fecha   : 18/01/18    
   
@parm1 AS CHAR(6)
--set @parm1 = '000002'    
As
--limpia la tabla, para borrar registros anterirores
truncate table AMProEfic

INSERT INTO AMProEfic (IdCorrelativo, Trandate, Dia, Codigo, Descripcion, ProdDia, ProdReal, Eficiencia)

select IdCorrelativo, TranDate, Dia, Codigo, Descr, ProdDia, KitCntr, 
(
CASE ProdDia
when 0 then 0
ELSE (round((KitCntr/ProdDia),4)*100)
END) Eficiencia

from (
select j.IdCorrelativo,
j.TranDate ,
j.Dia,
j.Codigo   ,
j.Descr	   ,

(case j.Dia

WHEN 'Lunes' THEN (Select Lunes from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
WHEN 'Martes' THEN (Select Martes from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
WHEN 'Miercoles' THEN (Select Miercoles from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
WHEN 'Jueves' THEN (Select Jueves from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
WHEN 'Viernes' THEN (Select Viernes from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
WHEN 'Sabado' THEN (Select Sabado from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
WHEN 'Domingo' THEN (Select Domingo from AMProdSemanalD where codigo = j.Codigo and IdCorrelativo = @parm1)
ELSE 0
END) ProdDia  ,
j.KitCntr  
from (
select top 999999
ad.Idcorrelativo,
(SELECT (case x.dia 
when 'Monday' then 'Lunes' 
when 'Tuesday' then 'Martes'
when 'Wednesday' then 'Miercoles'
when 'Thursday' then 'Jueves'
when 'Friday' then 'Viernes'
when 'Saturday' then 'Sabado'
when 'Sunday' then 'Domingo'
else 'NADA'
end) Dia FROM (
select CONVERT(VARCHAR(100),DATENAME(weekday,asy.TranDate)) dia
)x) Dia,
(cast(convert(varchar(10),asy.TranDate, 105) as char(10))) TranDate, ad.Codigo, ad.Descr --, ad.ProdSem
, sum(asy.KitCntr) KitCntr FROM AssyDoc asy
inner join AMProdSemanalD AD on AD.Codigo = asy.KitID
inner join AMProdSemanalH AH on ah.IdCorrelativo = ad.IdCorrelativo
WHERE 
asy.TranDate between 
--@fechaInicio 
(select distinct ff.FechaInicio from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = @parm1)
and 
--@fechaFin
(select distinct ff.FechaFin from AMProdSemanalH hh inner join FechaPlanProduccion ff on hh.Semana = ff.NroSemana where hh.IdCorrelativo = @parm1)

and AH.IdCorrelativo = @parm1

group by ad.Idcorrelativo, asy.trandate, ad.Codigo, ad.Descr, ad.ProdSem

order by asy.TranDate
)j
)ale


/*********************************************************************************************************************************************/
/*********************************************************************************************************************************************/
/*																																			 */
/*********************************************************  PARA REPORTERIA MENSUAL  *********************************************************/
/*																																			 */
/*********************************************************************************************************************************************/
/*********************************************************************************************************************************************/




