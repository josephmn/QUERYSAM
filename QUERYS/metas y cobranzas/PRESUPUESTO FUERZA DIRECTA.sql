
dbnav_pv_QDetP  '000277',  '100',  'ACL',  '%'

sp_helptext  dbnav_pv_QDetP 

select *from pv_QDetP FV inner join inventory S on FV.invtid=S.invtid  
where pv_Qcab_id=@parm1 and rTRIM(perid) like rTRIM(@parm2) and rTRIM(S.user1) like rTRIM(@parm3)  and rTRIM(FV.invtid) like rTRIM(@parm4)    


dbnav_FuerzaDirectaD0  '000277',  '100',  '%'
 sp_helptext dbnav_FuerzaDirectaD0 
 
 select * from PV_FuerzaDirectaD where pvfdV_id=@parm1 and ltrim(pvfdD_id)=ltrim(@parm2) and ltrim(marca) like ltrim(@parm3) order by marca   
 
 select * from PV_FuerzaDirectaD where pvfdV_id=@parm1 and ltrim(pvfdD_id)=ltrim(@parm2) and ltrim(marca) like ltrim(@parm3) order by marca   
 
 select pv_fuerzadirectah.pvfdh_id,pv_fuerzadirectah.periodo,pv_fuerzadirectah.zona,pv_fuerzadirectah.status,pv_fuerzadirectah.perid from pv_fuerzadirectah 
 (FASTFIRSTROW)  where pvfdh_id like  '%'   order by pvfdh_id desc

select * from pv_fuerzadirectah  WHERE pvfdh_id  = '000323'     ORDER BY pvfdh_id DESC

update pv_fuerzadirectah set Zona  ='LIMA' WHERE  pvfdh_id  = '000323' 


Zona
CATE                
INSERT INTO PV_FuerzaDirectaD ('C'XV'X')

sp_helptext  PV_FuerzaDirectah
---------------------------



codpvfdh
000281    

ALTER PROC TSP_INSERT_VENDOR
@CODVEND CHAR(3)
AS
BEGIN
declare @codreg char(6)
select @codreg  =( select codpvfdh from PVFDsetup )
set  
if @CODVEND = '100' 
begin
  print 'INGRESO 100' 
    
select  *  from pv_fuerzadirectah  H  where h. pvfdH_id ='000274'  
select  *  from pv_fuerzadirectad  H  where h. pvfdV_id ='000274'  

000279    	20        	000000                        	NULL	NULL	NULL	NULL	000009    	14        	NULL	NULL	NULL	0x000000009A1F9AC7


end 
ELSE
begin
 if @CODVEND = '184' 
 begin
  print 'INGRESO 184'
 end
 else
 begin
  print 'DIFERENTE 100  Y 184'
 end
end
END

EXEC TSP_INSERT_VENDOR '551'

update PVFDsetup set codpvfdh = '000278' 

select * from PVFDsetup

 select*  from pv_fuerzadirectah order by pvfdH_id desc 
 
select H.PERID,d.pvfdV_id,d.pvfdD_id from pv_fuerzadirectah  H
inner join PV_FuerzaDirectaD D on h.pvfdH_id  = D.pvfdV_id
 
where h. pvfdH_id ='000274'    

select * from PV_FuerzaDirectaD  where 


pvfdD_id
203       
pvfdH_id
000279    
pvfdD_id
546       
pvfdD_id
203       
pvfdD_id
203      
 
 select * from PV_FuerzaDirectaD order by pvfdV_id desc 
 pvfdH_id
000160   
pvfdV_id
000160     



CREATE PROC PV_DESPACHO  
@parm1 char(10)

AS

SELECT  *    FROM Vdespacho where user1 like @parm1 

SP_HELPTEXT  TSP_LISTAR_SCREENS 

TSP_LISTAR_SCREENS

create view Vdespacho
as

SELECT  DISTINCT  USER1 ,'' as timestamp   FROM SOSHIPHEADER 
go

select * from tb_restricciontipoX where tipo like @parm1 ORDER BY TIPO  
select * from vs_acreen where number like @parm1 order by  number  
select * from soshipheader where perpost ='201605' order by shipperid  desc

select slsperid,* from salesperson where name like '%SEM%'

select slsperid,* from salesperson  where S4Future11 ='557' 
select slsperid,* from salesperson  where S4Future11 ='557' 


S4Future11
159       


SELECT PERID , (PERNOMBRE +' '+PERPATERNO+ ' '+PERMATERNO )DATOS,PERFING,PERZONAID  FROM PERSONAL WHERE PERSTATUS ='A'

SELECT PERID,PERNOMBRE,PERFING,PERZONAID,A.ARENOMBRE FROM PERSONALV V
INNER JOIN paarea A ON V.PERAREA =A.AREID

  WHERE PERSTATUS in ('A','V')-- and perid ='45123196'



select COUNT(*)  from personal where perstatus in ('A','V')

      Select * from pacargo where carid like @Parm1 Order By carid  

 select * from paarea  
select * from pasubarea
sp_helptext cargo_all 