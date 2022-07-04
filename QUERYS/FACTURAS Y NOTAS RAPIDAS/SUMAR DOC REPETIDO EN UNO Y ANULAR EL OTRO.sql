

/*
select * from cfm_regvtas where fechanegocio ='2016-04-30' and numtienda ='12' and  numdoc like'%96247'




declare @subtotal float
declare @igv float
declare @total float
declare @pago float

set @subtotal = (select round(sum(subtotal),2)subtotal from cfm_regvtas where fechanegocio ='2016-04-30' and numtienda ='12' and  numdoc like'%96247')
set @igv = (select round(sum(igv),2)igv from cfm_regvtas where fechanegocio ='2016-04-30' and numtienda ='12' and  numdoc like'%96247')
set @TOTAL = (select round(sum(total),2)subtotal from cfm_regvtas where fechanegocio ='2016-04-30' and numtienda ='12' and  numdoc like'%96247')


/*
25.85
4.65
30.5
*/
UPDATE CFM_REGVTAS SET SUBTOTAL = @SUBTOTAL, IGV =@IGV , TOTAL  =@TOTAL WHERE CHK_NUM ='CFAPIURA000000022421'


UPDATE CFM_REGVTAS SET NUMDOC ='X0160430-01-9196247'  WHERE CHK_NUM ='CFAPIURA000000022423'


20160430-01-0196247     
20160430-01-9196247     

