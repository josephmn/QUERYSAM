


/*
select  NumtenderMedia,NombRVC,sum(Total)   from CFM_DetPago where NombRVC in('VALE','VISA') and NumTienda = '16'  --AND fechaNegocio like '20140309%' 
group by NumtenderMedia,NombRVC

select  NumtenderMedia,NombRVC,*  from CFM_DetPago where NombRVC in('VALE') and NumTienda = '16'  AND fechaNegocio like '201403%' 

select * from CF_DetPago  where  tipo ='VISA' AND FechaNegocio = '2014-03-09' and NumTienda = '16' 

select curyTranAmt,TranAmt,*from catran where batnbr ='002831'
select curyTranAmt,TranAmt,*from catran where batnbr ='002831' and refnbr ='VISA'
select CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDrTot,DrTot,*from batch where batnbr ='002831' and module ='CA'

select CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDrTot,DrTot,*from batch where batnbr ='002831' and module ='CA'

*/


declare @totVisa float
declare @totMaster float
declare @NumTienda int
declare @fechastring char(8)
declare @fecha datetime 
declare @loteV char(6)
declare @loteM char(6)
declare @ind  int

		--declare @NumTienda char(2)
		--declare @Base char(15)
--  where  NumTienda 
		DECLARE Cur1 CURSOR FOR 
		select  distinct  NumTienda,fechaNegocio from CFM_DetPago 
		where NombRVC in('VISA','MASTERCARD','VALE')   
		AND fechaNegocio like '20160622%' 
		and NumTienda = '12'
		OPEN Cur1
		FETCH NEXT FROM Cur1 INTO @NumTienda,@fechastring
		WHILE ( @@fetch_status <> -1 )
		BEGIN
		

/*
select *from catran where batnbr ='009469'
select *from gltran where batnbr ='009469' and module ='CA'

*/



--select right('20140314',2)
--select *from catran where batnbr ='006041'


set @ind =1
--set @lote='002831'
--set @fechastring ='20140317'
set @fecha ='2016-06-'+ right(@fechastring,2)

set @NumTienda = @NumTienda

/*
update CF_DetPago set ExportadoTr='007442'
where  tipo ='VISA' AND FechaNegocio = '2015-04-25' and NumTienda = '28' 
SELECT * FROM  CF_DetPago 
where  tipo ='MASTERCARD' AND FechaNegocio = '2016-06-22' and NumTienda = '12' 
update CF_DetPago  SET TOTAL =174
where  tipo ='MASTERCARD' AND FechaNegocio = '2016-06-22' and NumTienda = '12'  AND EXPORTADOTR ='012336' AND TOTAL  =122
*/

declare @valorV float
declare @valorM float
declare @valorV1 float
declare @valorM1 float
declare @valorV2 float
declare @valorM2 float

select  @valorV1=sum(Total)   from CFM_DetPago where NombRVC in('VISA') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring

select  @valorM1=sum(Total)   from CFM_DetPago where NombRVC in('MASTERCARD') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring


set @loteV =''
set @loteM =''

select @loteV=isnull(ExportadoTr,'') , @valorV = isnull(total,0) from CF_DetPago  where  tipo ='VISA' AND FechaNegocio = @fecha and NumTienda = @NumTienda	
select @loteM=isnull(ExportadoTr,'') , @valorM = isnull(total,0) from CF_DetPago  where  tipo ='MASTERCARD' AND FechaNegocio = @fecha and NumTienda = @NumTienda
--select @NumTienda,@fecha,@loteV,@loteV,@loteM
select @valorV2=CrAmt from gltran where  module ='CA'and acct='101000'  and trandesc = ltrim(@NumTienda) and  trandate  = @fecha and refnbr ='VISA' 
select @valorM2=CrAmt from gltran where  module ='CA'and  acct='101000'  and trandesc = ltrim(@NumTienda) and  trandate  = @fecha and refnbr ='MASTERCARD'
--select refnbr,CrAmt,CuryCrAmt,trandesc,trandate,* from gltran where  module ='CA' and refnbr in('VISA','MASTERCARD') and acct='101000' 
-- and trandesc = ltrim(@NumTienda) and  trandate  = @fecha

--select  NumTienda,fechaNegocio,NumtenderMedia,NombRVC,sum(Total)   from CFM_DetPago where NombRVC in('VALE','MASTERCARD','VISA') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring
--group by NumTienda,fechaNegocio,NumtenderMedia,NombRVC
--select * from CF_DetPago  where  tipo ='VISA' AND FechaNegocio = @fecha and NumTienda = @NumTienda
--select * from CF_DetPago  where  tipo ='MASTERCARD' AND FechaNegocio = @fecha and NumTienda = @NumTienda

--select curyTranAmt,TranAmt,*from catran where batnbr =@loteV and refnbr ='VISA'
--select curyTranAmt,TranAmt,*from catran where batnbr =@loteM and refnbr ='MASTERCARD'
--select round(@valorV1,2) valorV1, round(@valorV,2) valorV,round(@valorM1,2) valorM1,round(@valorM,2) valorM,round(@valorM2,2) valorM2, round(@valorM,2) valorM, round(@valorV2,2) valorV2, round(@valorV,2)valorV

if (round(@valorV1,2) <> round(@valorV,2) or round(@valorM1,2) <> round(@valorM,2) or round(@valorM2,2) <> round(@valorM,2) or round(@valorV2,2) <> round(@valorV,2) ) --and @loteM <>''
begin
--set @ind =1

select  NumTienda,fechaNegocio,NumtenderMedia,NombRVC,sum(Total)   from CFM_DetPago where NombRVC in('VALE','MASTERCARD','VISA') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring
group by NumTienda,fechaNegocio,NumtenderMedia,NombRVC

select * from CF_DetPago  where  tipo ='VISA' AND FechaNegocio = @fecha and NumTienda = @NumTienda
select * from CF_DetPago  where  tipo ='MASTERCARD' AND FechaNegocio = @fecha and NumTienda = @NumTienda

select refnbr,CrAmt,CuryCrAmt,trandesc,trandate,* from gltran where  module ='CA' and refnbr in('VISA','MASTERCARD') and acct='101000' 
 and trandesc = ltrim(@NumTienda) and  trandate  = @fecha

--select @NumTienda,@fecha,@loteV,@loteV,@loteM
select curyTranAmt,TranAmt,*from catran where batnbr =@loteV
select curyTranAmt,TranAmt,*from catran where batnbr =@loteV and refnbr ='VISA'
select curyTranAmt,TranAmt,*from catran where batnbr =@loteM and refnbr ='MASTERCARD'



--select CrAmt,CuryCrAmt from gltran where batnbr =@loteV  and module ='CA'and refnbr ='VISA' and acct='101000'
--select CuryDrAmt,DrAmt from gltran where batnbr =@loteV  and module ='CA'and refnbr ='VISA' and acct='103101'
--select CrAmt,CuryCrAmt from gltran where batnbr =@loteM  and module ='CA'and refnbr ='MASTERCARD' and acct='101000'
--select CuryDrAmt,DrAmt from gltran where batnbr =@loteM  and module ='CA'and refnbr ='MASTERCARD' and acct='103101'

--select CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDrTot,DrTot,*from batch where batnbr =@loteV and module ='CA'
--select CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDrTot,DrTot,*from batch where batnbr =@loteM and module ='CA'

end 
else
begin
	set @ind =0
end

if @ind = 1 
BEGIN

print @loteV
	select  @totVisa=isnull(sum(Total),0)   from CFM_DetPago where NombRVC in('VISA') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring
	select  @totMaster=isnull(sum(Total),0)   from CFM_DetPago where NombRVC in('MASTERCARD') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring
	
	
	UPDATE CF_DetPago SET  TOTAL = @totVisa from CF_DetPago  where  tipo ='VISA' AND FechaNegocio = @fecha and NumTienda = @NumTienda
	UPDATE CF_DetPago SET  TOTAL = @totMaster from CF_DetPago  where  tipo ='MASTERCARD' AND FechaNegocio = @fecha and NumTienda = @NumTienda
	select @totMaster,@loteM
	select curyTranAmt,TranAmt,refnbr,* from catran where batnbr =@loteM and refnbr ='MASTERCARD'
	update catran set  curyTranAmt=@totVisa,TranAmt=@totVisa from catran where batnbr =@loteV and refnbr ='VISA'
	update catran set  curyTranAmt=@totMaster,TranAmt=@totMaster 
	--select curyTranAmt,TranAmt,refnbr,@totMaster,@loteM,@totMaster ,*
	from catran where batnbr =@loteM and refnbr ='MASTERCARD'

	declare @totBatV float
	select @totBatV=sum(TranAmt) from catran where batnbr =@loteV and drcr ='C'
	declare @totBatM float
	select @totBatM=sum(TranAmt) from catran where batnbr =@loteM and drcr ='C'

update gltran set  CrAmt= @totVisa,CuryCrAmt= @totVisa from gltran where batnbr =@loteV  and module ='CA'and refnbr ='VISA' and acct='101000'
update gltran set  CuryDrAmt= @totVisa,DrAmt= @totVisa from gltran where batnbr =@loteV  and module ='CA'and refnbr ='VISA' and acct='103101'
update gltran set  CrAmt= @totMaster,CuryCrAmt= @totMaster from gltran where batnbr =@loteM  and module ='CA'and refnbr ='MASTERCARD' and acct='101000'
update gltran set  CuryDrAmt= @totMaster,DrAmt= @totMaster from gltran where batnbr =@loteM  and module ='CA'and refnbr ='MASTERCARD' and acct='103101'


	update batch set  CrTot=@totBatV,CtrlTot=@totBatV,CuryCrTot=@totBatV,CuryCtrlTot=@totBatV,CuryDrTot=@totBatV,DrTot=@totBatV
	from batch where batnbr =@loteV and module ='CA'
	update batch set  CrTot=@totBatM,CtrlTot=@totBatM,CuryCrTot=@totBatM,CuryCtrlTot=@totBatM,CuryDrTot=@totBatM,DrTot=@totBatM
	from batch where batnbr =@loteM and module ='CA'	

END


		-- codigo
		
			FETCH NEXT FROM Cur1 INTO   @NumTienda,@fechastring
		END
		CLOSE Cur1
		DEALLOCATE Cur1