---- PERIODOS ACTIVOS------------------------


USE [AM2015APP]


SELECT * FROM XAMPERIODOSACTIVOS WHERE USUARIOID='lafloqui' AND  PANTALLA like 'YWVELLEO'


CREATE PROC TSP_LISTAR_PERIODOACTIVO
-- FUNCION	: LISTAR PERIODO ACTIVO PARA SPREAD1 [AM2015APP]
-- AUTOR	: Gasla Baudat Laisson 
-- Ultima Fecha Modificacion : 19/05/2015
-- Sistema  : Solomon v4

@parm varchar(30),
@parm2 varchar(10)
as
begin
 SELECT * FROM  xamperiodosactivos WHERE USUARIOID=@parm  and PANTALLA LIKE @parm2
order by USUARIOID,PANTALLA
end 
------------------------



CREATE PROC TSP_LISTAR_SCREENS
-- FUNCION	: LISTAR  LA TABLA SCREEN PARA USO PV [AM2015SYS]
-- AUTOR	: Gasla Baudat Laisson 
-- Ultima Fecha Modificacion : 19/05/2015
-- Sistema  : Solomon v4
@parm1 varchar(7) 
as
begin
select * from vs_acreen where number like @parm1 order by  number
--SELECT SUBSTRING(NUMBER,1,5)AS NUMERO, MODULE,NAME  FROM Screen WHERE NUMBER LIKE @PARM1 ORDER BY NUMBER
end


USE [AMCAF2015APP]

CREATE VIEW vs_acreen
-- FUNCION : Extrae campos seleccionados para proc TSP_LISTAR_SCREENS
as
select Module,Name,left(number,5)number ,ScreenType,convert(timestamp,'') Tstamp 
from Screen 

SELECT * FROM xamrestriccion WHERE USERID ='JSCHUCAR'  

/*
insert into  xamrestriccion(tipo,dato,userid)
values ('SUBCUENTABANCO','CATACAF000','CKZAPPAS')

insert into  xamrestriccion(tipo,dato,userid)
values ('CUENTABANCOO','759101','CKZAPPAS')

insert into  xamrestriccion(tipo,dato,userid)
values ('SUBCUENTABANCOD','CATLMAR000','ECMARSAL')

       
insert into  xamrestriccion(tipo,dato,userid)
values ('SUBCUENTABANCO','CACEVISRE000','AJTAMPEN')
*/
------------------------------------------------------------------------------

use [am2015app]
go

SELECT * FROM xamrestriccion WHERE userid='ajtampen' AND  PANTALLA like '%'
select * from screen where SCREENTYPE ='R'

insert into screen (MODULE,NAME,NUMBER,SCREENTYPE)
VALUES ('GA','Res. Liq. de Gastos','GAR0102','R')


select * from xamperiodosactivos where usuarioid='bdurbcha'

/*

UPDATE xamperiodosactivos SET periodoinicio ='201704' , PERIODOFIN  ='201704' WHERE usuarioid='ARRODPIZ'


SELECT * FROM XAMRESTRICCION  WHERE USERID  ='ajtampen' order by tipo desc 

/*
delete from xamperiodosactivos WHERE usuarioid='PAMARPAU'
select * from xamperiodosactivos where usuarioid ='PAMARPAU'ñ

insert into [AMCAF2016APP].[dbo].[xamperiodosactivos] (usuarioid,modulo,pantalla,descpantalla,periodoinicio,periodofin)
select 'AJTAMPEN',modulo,pantalla,descpantalla,periodoinicio,periodofin  from  [AMCAF2016APP].[dbo].[xamperiodosactivos] 
where usuarioid='ARRODPIZ'
*/




insert into xamrestriccion (userid,tipo,dato) 
values 
('JRCESCEL','SUBCUENTABANCOD','CACE000RE000')



select * from  [am2016app].[dbo].[xamrestriccion] where userid='JALVDEL'

delete from xamrestriccion where userid ='JALVDEL' and dato  ='101000'

104120 y 104121 

DELETE FROM [AMcaf2016APP].[dbo].[xamrestriccion] where userid='paayabas' and tipo ='CUENTABANCO' and dato not in ('104120','104121')

select * from  [AM2016APP].[dbo].[xamrestriccion] where userid='paayabas'

INSERT INTO [CA2016APP].[dbo].[xamrestriccion] (USERID,DATO,TIPO)
select 'BMMARRAM',DATO,TIPO from  [CA2016APP].[dbo].[xamrestriccion] where userid='EYCERCEP' 

EYCERCEP
BMMARRAM

INSERT INTO [AMCAF2016APP].[dbo].[xamrestriccion] (USERID,DATO,TIPO)
values ('LMPACPER','MARKETING','ALMACEN')

use [ca2015sys]
go

select* from custom2
delete from custom2 where entityid ='SYSADMIN'

SELECT*  FROM BATCH WHERE MODULE ='AR' AND PERPOST  ='201606'

select * from access 

select * from accessmodule 

select * from accessrights where rectype ='OM' AND USERID ='VMHUACAS'

SELECT *FROM USERREC

SELECT *FROM xAMSiteGrupoDespC


SELECT* FROM SCREEN WHERE NUMBER  LIKE '%40690%'
dbo.PES
SELECT* FROM Registration

dbo.PVRecdbo.RegistDetaildbo.RegistItemdbo.Registration
*/



sp_helptext accessdetrights_typ_uid_cpny_

CREATE Proc AccessDetRights_Typ_UId_Cpny_ 
@parm1 varchar ( 1),
 @parm2 varchar ( 47),
 @parm3 varchar ( 20),
 @parm4 varchar ( 7) as
       Select * from AccessDetRights left join
                      Screen on    AccessDetRights.ScreenNumber  =    Screen.Number   
           where AccessDetRights.RecType          =    @parm1
             and AccessDetRights.UserId        =    @parm2
             and AccessDetRights.CompanyID     =    @parm3
             and AccessDetRights.ScreenNumber  LIKE @parm4
           
           order by AccessDetRights.RecType,
                    AccessDetRights.UserId,
                    AccessDetRights.CompanyID,
                    AccessDetRights.ScreenNumber 


Select  DISTINCT USERID from AccessDetRights left join
                      Screen on   
           AccessDetRights.ScreenNumber  =    Screen.Number   
           where 
             AccessDetRights.UserId        LIKE    '%'
            -- and AccessDetRights.CompanyID    = 'ALTOMAYO'
             and AccessDetRights.ScreenNumber  LIKE '%40690%'
           
           order by 
                    AccessDetRights.UserId
                  

DELETE FROM AccessDetRights  WHERE SCREENNUMBER LIKE '%40690%' AND USERID  <>'SYSADMIN'
            left join
                      Screen D on   
           C.ScreenNumber  =    D.Number 
WHERE   C.UserId   <>'SYSADMIN'
AND  C.ScreenNumber  LIKE '%40690%'



 accessdetrights_typ_uid_cpny_  'U',  'LAFLOQUI',  'ALTOMAYO', '%'



select *  from 





SELECT * FROM xamrestriccion WHERE USERID in ('JSCHUCAR','MFSERCAN','BDURBCHA','ECMARSAL','LAFLOQUI','MEFACARA'  )
AND TIPO IN('SUBCUENTABANCO','SUBCUENTABANCOD') AND DATO  IN ('CATUMAR000','CATCMAR000')


DELETE FROM xamrestriccion WHERE USERID in ('JSCHUCAR','MFSERCAN','BDURBCHA','ECMARSAL','LAFLOQUI','MEFACARA'  )
AND TIPO IN ('SUBCUENTABANCO','SUBCUENTABANCOD') AND DATO  IN ('CATUMAR000','CATCMAR000')

dbo.AccessModule


select* from dbo.AccessRights where userid  ='AJTAMPEN'

select* from dbo.AccessModule




accessrights_type_usrid_db  'U',  'AJTAMPEN',  'ALTOMAYO'


SP_HELPTEXT 'accessrights_type_usrid_db'

       Select * from AccessRights  
           where AccessRights.RecType         like  'U' 
             and AccessRights.UserId       like '%'
             and AccessRights.CompanyID like 'ALTOMAYO'
           order by RecType, UserId, CompanyID   
           
           
           
       SELECT A.USERID,U.USERNAME,A.SCREENNUMBER,E.NAME,A.* FROM     accessdetrights A
       INNER JOIN SCREEN E ON A.SCREENNUMBER = E.NUMBER
       INNER JOIN USERREC U ON A.USERID = U.USERID
       AND A.SCREENNUMBER LIKE 'XVVS100%' --PROCESO DIARIO VENTAS
       
       
       
       SELECT * FROM accessdetrights WHERE SCREENNUMBER  = 'XVVS100'
       
     
      DELETE FROM accessdetrights WHERE SCREENNUMBER IN ('4069000','4069001','4069002')
      AND USERID IN ('JAIREYAYA','MAVELIDR')
       
      
       
      UPDATE accessdetrights SET DeleteRights =0,InsertRights =0,UpdateRights =0 WHERE SCREENNUMBER  = 'PL41000' AND USERID NOT IN ('SYSADMIN')
       
            UPDATE accessdetrights SET DeleteRights =0,InsertRights =1,UpdateRights =0 WHERE SCREENNUMBER  = 'PL41000' AND USERID  IN ('AJTAMPEN') 
       select * from screen where number  ='XVVS100'
       

       
       
           update accessdetrights set updaterights= 1  where rectype= 'U'  and companyid= 'ALTOMAYO' and screennumber= 'XVVS100' 
                   
           update a set   rectype= 'U' 
           from accessdetrights a
           WHERE  a.screennumber= 'XVVS100' AND USERID ='YWVELLEO'
           
           
      SELECT * FROM SCREEN




insert into accessdetrights (CompanyID,DatabaseName,DeleteRights,InitRights,InsertRights,RecType,ScreenNumber,UpdateRights,UserId,ViewRights)
select distinct 'ALTOMAYO','',0,0,0,'R','XVVS100',0,UserId,1 FROM accessdetrights
      SELECT * FROM accessdetrights 
CompanyID
ALTOMAYO  

DeleteRights
0
DatabaseName
                              
InitRights
0

InsertRights
0

RecType
U

ScreenNumber
VXCC1  

UpdateRights
0

UserId
YWVELLEO     

ViewRights
1                  

DECLARE   --003160
 --delete from wrkreleasebad
@lote VARCHAR(20)  
DECLARE cClientes CURSOR FOR
		select distinct userid  from 
	USERREC  
OPEN cClientes 
FETCH cClientes INTO @lote 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin 
	      update accessdetrights set  rectype= 'U'  WHERE  companyid= 'ALTOMAYO' and screennumber= 'XVVS100' and userid =@lote
       --print 'exec liberarAR '+char(39)+ @lote +char(39)
 end	
FETCH cClientes INTO @lote
END
CLOSE cClientes
DEALLOCATE cClientes
go

                
                
                select * from USERREC