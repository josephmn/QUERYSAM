



----------------------------
--CREAR TABLA PARA HISTORICO
----------------------------
CREATE TABLE HistPlanChange 
--Tabla donde se almacenara cambios de registro de planillas
(
PerId char(8) ,
TipoDato varchar(50) ,
DatoOLD varchar(200) ,
DatoNew varchar(200),
FechaMod datetime,
UserMod CHAR(8),
tstamp timestamp
)

PerId,TipoDato,DatoOLD,DatoNew,FechaMod,UserMod


insert into HistPlanChange(perid , TipoDato, DatoOLD, DatoNew, FechaMod, UserMod) values  ( 'PJE SAN PABLO 244-A-7 VIÑA DORADA -SURCO' ,'SUELDO', '1800' , '2000.00'  , GETDATE() ,SYSADMIN                                        )

insert into HistPlanChange(perid , TipoDato, DatoOLD, DatoNew, FechaMod, UserMod) values  ( 'PJE SAN PABLO 244-A-7 VIÑA DORADA -SURCO' ,'SUELDO', '1800' , '2000.00'  , GETDATE() , 'SYSADMIN'  ))
insert into HistPlanChange(perid , TipoDato, DatoOLD, DatoNew, FechaMod, UserMod) values  ( 'PJE SAN PABLO 244-A-7 VIÑA DORADA -SURCO' ,'SUELDO', '1800' , '2000.00'  , GETDATE() , 'SYSADMIN'  )

select * from HistPlanChange

DELETE FROM HistPlanChange













