
--------------------------------------------------------------------
------ ELIMINAR EL PAGO DE PROVISION -------------------------------
--------------------------------------------------------------------
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='012845' -- LOTE 
--set @refnbr ='121F104755' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= @batnbr -- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr--  and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR'-- and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go

SELECT * FROM LOTESPENDIENTES

delete from batch where batnbr =@batnbr and module  ='ar'
delete from ardoc where batnbr =@batnbr
delete from artran where batnbr =@batnbr
delete from gltran where batnbr =@batnbr and module  ='ar'
delete from aradjust where adjbatnbr =@batnbr
update cf_regvtas set exportadopa = '' , referenciapa = '' ,user06 = '' where exportadopa =@batnbr
delete from lrevisados where lote  =@batnbr

SP_HELPTEXT LOTESPENDIENTES


SELECT * FROM  LOTESPENDIENTES



ALTER VIEW LOTESPENDIENTES  
AS
    select  distinct b.batnbr ,'POR LIB' AS ESTADO  from ardoc a  
    inner join cf_regvtas cf on a.batnbr = cf.exportadofn   
    inner join batch b on a.batnbr =b.batnbr   
    where b.module ='ar' and b.status in ('b','h','s')  
    union all  
    select distinct  b.batnbr, 'OBS-IN' AS ESTADO  from batch b   
    inner join gltran g on b.batnbr  = g.batnbr  
    where b.module ='ar'  
    and b.status in ('b','h','s') and  g.module ='AR'  and  g.posted  in ('u','p')  
    union all   
    select  distinct b.batnbr ,'POR APL' AS ESTADO  from ardoc a  
    inner join cf_regvtas cf on a.batnbr = cf.exportadopa  
    inner join batch b on a.batnbr =b.batnbr  and  b.module ='ar'     
    where b.status in ('B','H','S')  
    union all 
    select  distinct b.batnbr ,'OBS-PA' AS ESTADO  from ardoc a  
    inner join cf_regvtas cf on a.batnbr = cf.exportadopa  
    inner join batch b on a.batnbr =b.batnbr  and  b.module ='ar' 
    inner join aradjust G on a.batnbr =G.adjbatnbr    
    where b.status in ('S','H') 
    and b.batnbr not in 
    (select batnbr from gltran where module ='AR')
GO


USE [CA2016APP]
GO
DECLARE   --003160
@lote VARCHAR(6) 
DECLARE
@estado VARCHAR(20) 
--delete from wrkreleasebad
DECLARE cClientes CURSOR FOR
  select batnbr , estado  from 	 LOTESPENDIENTES     
  
    
OPEN cClientes 
FETCH cClientes INTO @lote ,@estado
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin 
	   insert into  lrevisados select @lote 
	   if @estado  = 'POR LIB' or @estado  ='POR APL'
	   begin
	   EXEC	liberarAR @LOTE 
	   end
       --print 'exec liberarAR '+char(39)+ @lote +char(39)
 end	
FETCH cClientes INTO @lote ,@estado
END
CLOSE cClientes
DEALLOCATE cClientes
go
