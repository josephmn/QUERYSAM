SELECT status,* FROM BATCH WHERE BATNBR ='007665' AND MODULE ='CA'
SELECT * FROM CATRAN WHERE BATNBR='007665' --AND REFNBR ='VISA'
SELECT * FROM GLTRAN WHERE BATNBR='007665' AND MODULE  ='CA'

	select isnull(sum(Total),0)   from CFM_DetPago where NombRVC in('VISA') and NumTienda = '3'  AND fechaNegocio ='2016-04-14'
------------------------------------------------------------------
    declare @totVisa float
    declare @loteV char(6)
    declare @fecha varchar(20)
    declare @numtienda varchar(2)
    set @fecha ='2016-04-14'
    set @numtienda ='3'
    set @loteV ='007665'
--	select  @totVisa=isnull(sum(Total),0)   from CFM_DetPago where NombRVC in('VISA') and NumTienda = '3'  AND fechaNegocio ='2016-04-14'
    set @totvisa = 322.10
	--select  @totMaster=isnull(sum(Total),0)   from CFM_DetPago where NombRVC in('MASTERCARD') and NumTienda = @NumTienda  AND fechaNegocio =@fechastring	
	UPDATE CF_DetPago SET  TOTAL = @totVisa from CF_DetPago  where  tipo ='VISA' AND FechaNegocio = @fecha and NumTienda = @NumTienda
	--select curyTranAmt,TranAmt,refnbr,* from catran where batnbr =@loteM and refnbr ='MASTERCARD'
	update catran set  curyTranAmt=@totVisa,TranAmt=@totVisa from catran where batnbr =@loteV and refnbr ='VISA'
	declare @totBatV float
	select @totBatV=sum(TranAmt) from catran where batnbr =@loteV and drcr ='C'
	update gltran set  CrAmt= @totVisa,CuryCrAmt= @totVisa from gltran where batnbr =@loteV  and module ='CA'and refnbr ='VISA' and acct='101000'
	update gltran set  CuryDrAmt= @totVisa,DrAmt= @totVisa from gltran where batnbr =@loteV  and module ='CA'and refnbr ='VISA' and acct='103101'
        declare @totVisa float
            set @totvisa = 322.10
    update batch set crtot=@totvisa,ctrltot=@totvisa,curycrtot=@totvisa,curyctrltot=@totvisa,
    curydrtot=@totvisa,drtot=@totvisa from batch where batnbr ='007665' and module ='CA'
------------------------------------------------------------------







select * from CFM_DetPago where NombRVC in('VISA') and NumTienda = '3'  AND fechaNegocio ='2016-04-14'














