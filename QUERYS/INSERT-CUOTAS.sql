DECLARE   @numsemana int	
Declare   @contador int
declare   @codregistro char(6)
declare   @rnumsem   char(6)
declare   @rzonven	 char(20)	 	
declare   @rcodsup	 char(10)	
declare	  @rnomsup	 varchar(60)	
declare	  @rcodven   char(10)
declare   @rnomven   varchar(60)
declare   @rmarca	 varchar(60)		
declare   @rnommar	 varchar(60)
declare   @rcuotam	 float
set		  @contador=1 
DECLARE   @numeroregistro int
set       @numeroregistro=(select max(pvfdH_id) from PV_FuerzaDirectaH)   
set       @codregistro = 0

select  * from recuotas where rnumsem=32 and rcodsup='091' and rcodven='091' and rzonven='CATE'
	
	SELECT * 
	-- DELETE 
	FROM PV_FuerzaDirectaD WHERE pvfdV_id='000292'
	
	 SELECT * 
	-- DELETE 
	FROM PV_FuerzaDirectaV WHERE pvfdH_id='000292'
	
	
	SELECT *
	-- DELETE
	FROM PV_FuerzaDirectaH WHERE pvfdH_id='000292'
	
    
DECLARE cCuotas CURSOR FOR 


select DISTINCT rnumsem,rzonven,rcodsup,rcodven,rnomven from recuotas where  rcodsup='100' --and rcodven='091' and rzonven='CATE'
	        
OPEN cCuotas 
FETCH cCuotas INTO @rnumsem,@rzonven,@rcodsup,@rcodven,@rnomven
	WHILE (@@FETCH_STATUS = 0 )
	begin
	begin
-------------------------------------------------------------------------------------CODIGO--
		set @codregistro = (select max(pvfdH_id) from PV_FuerzaDirectaH)   ---seleccionamos el maximo registro--
       set @numeroregistro = cast(@codregistro as integer)  ---desglosamos el codigo de 000000	
       set @numeroregistro = @numeroregistro + @contador	 ---inicialisamos y agregamos 1
       set @codregistro=right('000000'+ rtrim(@numeroregistro),6)  
       
SELECT @codregistro



--select DISTINCT rnumsem,rzonven,rcodsup,rcodven,rnomven from recuotas where rnumsem=@rnumsem and rcodsup=@rcodsup and rcodven=@rcodven

	 insert into PV_FuerzaDirectaD(pvfdV_id,pvfdD_id,Cuota,Venta,cobertura,Marca,user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,user11,user12)
	select DISTINCT @codregistro,@rcodven,rcuotam,0,0,rmarca,'','','',0,0,0,0,0,0,null,null,null 
	from recuotas where rnumsem=@rnumsem and rcodsup=@rcodsup 
	
	
	
	
	--select DISTINCT 'yuuiyu','dsds',rcuotam,0,0,rmarca,'','','',0,0,0,0,0,0,null,null,null 
	--from recuotas where rnumsem='32' and rcodsup='100' order by rcodsup
	
	
	insert into PV_FuerzaDirectaV (pvfdH_id,pvfdV_id,perId,Cuota_Total_xVen,Venta_Total,VentaEfect_Total,Porc_VtaEfect,nroPedi_Efect,nroPedi_Rech,cobertura,
						user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,user11,user12)
						
						select DISTINCT @codregistro,'',pvfdD_id,sum(Cuota),0,0,0,0,0,0,pvfdD_id,'','',0,0,0,0,0,0,null,null,null 
						
						from PV_FuerzaDirectaD 
						where pvfdV_id=@codregistro and pvfdD_id=@rcodven group by pvfdD_id 
						

		INSERT INTO PV_FuerzaDirectaH(pvfdH_id,Linea_Negocio,perId,Periodo,Status,Zona,Cuota_Total_xVen,Venta_Total,VentaEfect_Total,Porc_VtaEfect,nroPedi_Efect,
								nroPedi_Rech,cobertura,fecha,user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,user11,user12) 
						
						select DISTINCT @codregistro,'',@rcodsup,@rnumsem,'A',@rzonven,0,0,0,0,0,0,0,null,'','','',0,0,0,0,0,0,null,null,null 
						
						from PV_FuerzaDirectaD --a inner join recuotas b on a.perId=b.rcodsup 
						where pvfdV_id=@codregistro 
						--and pvfdD_id=@rcodsup 
						
	
						 --and b.rnumsem=@rnumsem 
						 --and b.rzonven=@rzonven
						---and @rnumsem=
						--(select rnumsem from recuotas where rnumsem=@rnumsem and rcodsup=@rcodsup)
						--and @rzonven=( select rzonven from recuotas where rzonven=@rzonven and rcodsup=@rcodsup)--group by pvfdV_id ,perId

--SELECT column_name(s)
--FROM table1
--INNER JOIN table2
--ON table1.column_name=table2.column_name
------------------------------------PV_FuerzaDirectaH -------------------------------------------------------
                                             
--	INSERT INTO PV_FuerzaDirectaH(pvfdH_id,Linea_Negocio,perId,Periodo,Status,Zona,Cuota_Total_xVen,Venta_Total,VentaEfect_Total,Porc_VtaEfect,nroPedi_Efect,
--									nroPedi_Rech,cobertura,fecha,user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,user11,user12)           
--	values (codregistro,'',@rcodsup,@rnumsem,'A',@rzonven,0,0,0,0,0,
--									0,0,getdate(),null,null,null,0,0,0,0,0,0,null,null,null)
									
          
-- ------------------------------------PV_FuerzaDirectaV-------------------------------------------------------------
-- insert into PV_FuerzaDirectaV (pvfdH_id,pvfdV_id,perId,Cuota_Total_xVen,Venta_Total,VentaEfect_Total,Porc_VtaEfect,nroPedi_Efect,nroPedi_Rech,cobertura,
--								user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,user11,user12)
--	values (@codregistro,'',@rcodven,sum=(@rcuotam),0,0,0,0,0,0,@rcodven
--								,'','',0,0,0,0,0,0,null,null,null)
-- -------------------------------------------------------------------------------------------------------------------
--DECLARE cCuotasDetalle CURSOR FOR

--select rcodven,rmarca,rnommar,rcuotam from recuotas where rcodven=@rcodsup
	        
--OPEN  cCuotasDetalle 
--FETCH cCuotasDetalle INTO @rcodven,@rmarca,@rnommar,@rcuotam
--WHILE
-- -----------------------------------PV_FuerzaDirectaD---------------------------------------------------------------
   
-- insert into PV_FuerzaDirectaD(pvfdV_id,pvfdD_id,Cuota,Venta,cobertura,Marca,user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,user11,user12)
--	values (@codregistro,@rcodven,@rcuotam,0,0,@rmarca,null,null,null,0,0,0,0,0,0,null,null,null) 
					
-- ----------------------------
-- END
--  FETCH cCuotasDetalle INTO @rcodven,@rmarca,@rnommar,@rcuotam
--END
--CLOSE cCuotasDetalle
--DEALLOCATE cCuotasDetalle
 
 END
 FETCH cCuotas INTO @rnumsem,@rzonven,@rcodsup,@rcodven,@rnomven
END
CLOSE cCuotas
DEALLOCATE cCuotas
go

 /*
 ---
 
 create table recuotas
(
rnumsem  char(6),
rzonven	 char(20),	 	
rcodsup	 char(10),	
rnomsup	 varchar(60),	
rcodven   char(10),
rnomven   varchar(60),
rmarca	  varchar(60),		
rnommar	  varchar(60),
rcuotam	  float
 )
 
 select * from recuotas
 select *from PV_FuerzaDirectaD where pvfdV_id ='000270'
 
 select *from PV_FuerzaDirectaV where pvfdH_id ='000270'
 
select *from PV_FuerzaDirectaD where pvfdV_id ='000270'
 select *from PV_FuerzaDirectaH where pvfdH_id ='000270' 
 
select *from PV_FuerzaDirectaH where pvfdH_id ='000270'    
select *from PV_FuerzaDirectaV where pvfdH_id ='000270'                              
select *from PV_FuerzaDirectaD where pvfdV_id ='000270'


select *from PV_FuerzaDirectaH where pvfdH_id ='000356'    
select *from PV_FuerzaDirectaV where pvfdH_id ='000356'                              
select *from PV_FuerzaDirectaD where pvfdV_id ='000356'   
*/