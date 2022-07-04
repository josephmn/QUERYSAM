DECLARE  @A1 VARCHAR(6)   --slsperid
DECLARE  @A2 VARCHAR(6)   --periodo
DECLARE  @A3 VARCHAR(3)   --cod
DECLARE  @A4 VARCHAR(1)   --opc
DECLARE  @A5 VARCHAR(1)   --tipo
---------------------------------------
DECLARE  @A6 VARCHAR(3)   --porc
DECLARE  @A7 VARCHAR(3)   --marca
DECLARE  @A8 float        --incentivo
DECLARE  @A9 VARCHAR(3)   --referencia
DECLARE  @A10 VARCHAR(6)  --per
DECLARE  @A11 VARCHAR(3)  --sls
DECLARE  @C int           --per
-------------------------------------------------------------------------------------------------------------------
DECLARE CUR_MITABLA CURSOR FOR
select distinct slsperid,semana,cod,opcion,tipo from IncenSemanalLineas 
OPEN CUR_MITABLA 
FETCH CUR_MITABLA INTO @A1,@A2,@A3,@A4,@A5
set @C= 1
	WHILE (@@FETCH_STATUS = 0 )
	BEGIN -- WHILE
	 insert into inselineash (numid,slsperid,periodo,cod,opc,tipo) values(RIGHT(1000000 + @C,6),@A1,@A2,@A3,@A4,@A5)
----------------------------------------------------------------------------------------------------------------------
		DECLARE CUR_MITABLA2 CURSOR FOR
		--select semana a10,Slsperid a11,porc a6,Marca a7,incentivo a8,referencia a9 from IncenSemanalLineas where semana=@A2 and slsperid=@A1
		select semana,Slsperid,porc a6,Marca a7,referencia a9 from IncenSemanalLineas where semana=@A2 and slsperid=@A1
		OPEN CUR_MITABLA2 
		--FETCH CUR_MITABLA2 INTO @A10,@A11,@A6,@A7,@A8,@A9
		FETCH CUR_MITABLA2 INTO @A10,@A11,@A6,@A7,@A9
			WHILE (@@FETCH_STATUS = 0 )
				BEGIN -- WHILE
					--insert into inselineasd(numid,porc,marca,incentivo,referencia) values(RIGHT(1000000 + @C,6),@A6,@A7,@A8,@A9)
					insert into inselineasd(numid,porc,marca,referencia) values(RIGHT(1000000 + @C,6),@A6,@A7,@A9)
				--FETCH CUR_MITABLA2 INTO @A10,@A11,@A6,@A7,@A8,@A9
				FETCH CUR_MITABLA2 INTO @A10,@A11,@A6,@A7,@A9
			END-- END WHILE
		CLOSE CUR_MITABLA2
		DEALLOCATE CUR_MITABLA2
	  ------------------------------------------------------------
	  set @c = isnull(@c,0)+1
	FETCH CUR_MITABLA INTO @A1,@A2,@A3,@A4,@A5
	END-- END WHILE
CLOSE CUR_MITABLA
DEALLOCATE CUR_MITABLA




select RIGHT(1000000 + Row_number () Over(Order By porc asc ),6) AS numid ,* from IncenSemanalLineas 
select distinct slsperid,* from IncenSemanalLineas 
select * from IncenSemanalLineas
insert into inselineash (numid,slsperid,periodo,cod,opc,tipo) values(RIGHT(1000000 + 4,6),'231','092','001','1','V')

truncate table inselineash
truncate table inselineasd
select MAX(numid) from inselineash

select h.numid,slsperid,tipo,periodo,cod,opc,porc,referencia from inselineash h,inselineasd d where h.numid=d.numid order by h.numid asc



select count(*) from inselineasd where numid='000001'
select distinct slsperid,* from IncenSemanalLineas where Slsperid='000001'



select h.numid,slsperid,tipo,periodo,cod,opc,porc,referencia from inselineash h,inselineasd d where h.numid=d.numid  and h.numid='000001' order by h.numid,slsperid,periodo asc
select porc,referencia from inselineasd d where d.numid='000001'
