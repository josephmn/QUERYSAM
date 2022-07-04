



select *from [AM2016APP] . [dbo].[xamPorIncent]

select *from [RES2016APP] . [dbo].[xamPorIncent] --where user3  ='201606'

--DELETE FROM [AM2016APP] . [dbo].[xamPorIncent]
INSERT INTO [AM2016APP] . [dbo].[xamPorIncent] (TIPO,CARGO,PORCENTAJE,crdtDate,user3)
SELECT TIPO,CARGO,PORCENTAJE,crdtDate,user3 FROM  [RES2016APP] . [dbo].[xamPorIncent]





insert into TEMP_GASLA1
select *  into TEMP_GASLA1 
 from [AM2016APP] . [dbo].[xamPorIncent]
select *  into TEMP_GASLA2 
 from [AM2016APP] . [dbo].[xamPorIncentD]

select *  from 

select *from [AM2016APP] . [dbo].[xamPorIncentD]
select *from [RES2016APP] . [dbo].[xamPorIncentD]


--DELETE FROM [AM2016APP] . [dbo].[xamPorIncentD]
INSERT INTO [AM2016APP] . [dbo].[xamPorIncentD] (TIPO,CARGO,PORCENTAJE,MARCA,crdtDate,MONTO,USER1,USER2,USER3,USER4,USER5)
SELECT TIPO,CARGO,PORCENTAJE,MARCA,crdtDate,MONTO,USER1,USER2,USER3,USER4,USER5 FROM  [RES2016APP] . [dbo].[xamPorIncentD] 



DELETE FROM [RES2016APP] . [dbo].[xamPorIncentD]


select *from xamPorIncentD
select *from [RES2016APP] . [dbo].[xamPorIncent] --where user3  ='201607'
select *from [RES2016APP] . [dbo].[xamPorIncentD] -- where user3  ='201607'

update [RES2016APP] . [dbo].[xamPorIncent]  set user3  ='201607' where user3  ='201606'
update [RES2016APP] . [dbo].[xamPorIncentD] set user3  ='201607' where user3  ='201606'



delete from [RES2016APP] . [dbo].[xamPorIncent] where user3  ='201606'
delete from [RES2016APP] . [dbo].[xamPorIncentD] where user3  ='201606'