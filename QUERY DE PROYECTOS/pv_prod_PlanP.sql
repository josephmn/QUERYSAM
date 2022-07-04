DBNAV_AMProdSemanalD
  
alter PROC  DBNAV_AMProdSemanalD  
---- Funcion : PLAN DE PRODUCCION SEMANAL     
---- Sistema : SOLOMON IV            
---- Usuario : JOSEPH MAGALLANES         
---- Fecha   : 23/11/17             
@parm1 CHAR (6),  
@Parm2 CHAR (5)  ,
@Parm3 CHAR (30) ,
@Parm4 CHAR (30) ,
@Parm5 CHAR (30) 
as    
begin    
select * from AMProdSemanalD where IdCorrelativo = @parm1  
and rtrim(ltrim(Producto)) like  rtrim(ltrim(@Parm3)) 
and rtrim(ltrim(Maquina)) like  rtrim(ltrim(@Parm4)) 
and rtrim(ltrim(Tipo)) like  rtrim(ltrim(@Parm5)) 
and Codigo like RTRIM(ltrim(@parm2)) 
order by IdCorrelativo,Codigo,Producto,Maquina,Tipo 
end    
-------------------------------------------------------------------------------------------------------
/*** pv para producto ***/
ALTER proc pv_prod_PlanP
@parm1 char(15)
as
select * from vs_prod_PlanP where Producto like @parm1 order by Producto
GO
/*** pv para maquina ***/
CREATE proc pv_maquinaPla
@parm1 char(20)
as
select * from vs_maquinaPlan where Maquina like @parm1 order by Maquina
GO
/*** pv para tipo ***/
ALTER proc pv_tipo_PlanP
@parm1 char(20)
as
select * from vs_tipo_PlanP where Tipo like @parm1 order by Tipo
GO
--------------------------------------------------------------------------------------------------------
/*** vista para producto ***/
create view vs_prod_PlanP
as
select '%'Producto,'Todos'Descripcion, cast('' as timestamp)as tstamp 
Union all
select distinct Producto,Producto Descripcion,cast('' as timestamp)as tstamp from AMProdSemanalD

/*** vista para producto ***/
create view vs_maquinaPlan
as
select '%'Maquina,'Todos'Descripcion, cast('' as timestamp)as tstamp 
Union all
select distinct Maquina, Maquina Descripcion,cast('' as timestamp)as tstamp from AMProdSemanalD
GO

UPDATE AMProdSemanalD SET Maquina = REPLACE (Maquina, 'Ñ','N')  from AMProdSemanalD

/*** vista para TIPO ***/
create view vs_tipo_PlanP
as
select '%'Tipo,'Todos'Descripcion, cast('' as timestamp)as tstamp 
Union all
select distinct Tipo,Tipo Descripcion,cast('' as timestamp)as tstamp from AMProdSemanalD



sp_helptext DBNAV_AMProdSemanalD