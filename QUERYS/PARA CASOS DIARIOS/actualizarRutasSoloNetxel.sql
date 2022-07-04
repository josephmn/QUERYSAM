-- logearse al servidor 192.168.10.9 --- 
-- sa sql2007
-- base de datos BD_ALTOMAYO

declare @Vend varchar(3)
declare @VendNew varchar(3)
declare @Ruta varchar(10)
--select ch_frecuencia, *
----update Mae_Ruta set ch_frecuencia=2
--from  Mae_Ruta
--WHERE ch_CodRuta IN
--('TSVI204')
--select  @Ruta='PNSEM01' ,  
select @Vend='551'  , @VendNew='558'
UPDATE dbo.Mae_Ruta  SET 

            ch_P1=      case when ch_P1=@Vend then @VendNew else ch_P1 end,
            ch_P2=      case when ch_P2=@Vend then @VendNew else ch_P2 end,
            ch_P3=      case when ch_P3=@Vend then @VendNew else ch_P3 end,
            ch_P4=      case when ch_P4=@Vend then @VendNew else ch_P4 end,
            ch_P5=      case when ch_P5=@Vend then @VendNew else ch_P5 end,
            ch_P6=      case when ch_P6=@Vend then @VendNew else ch_P6 end,
            ch_P7=      case when ch_P7=@Vend then @VendNew else ch_P7 end

WHERE ch_CodRuta IN
(
'F120058',
'F120060',
'F120061',
'F120062',
'F120064',
'18DIA03'
)
go

/*
--select *From dbo.MAE_DISTR
01SEM0120492596893
--SELECT *FROM Mae_Ruta WHERE ch_CodRuta IN( 'F120001')
SELECT *FROM Mae_Ruta WHERE ch_CodRuta IN('F080001')
delete FROM Mae_Ruta WHERE ch_CodRuta IN( '01JIMEN')
update Mae_Ruta set ch_frecuencia='2' FROM Mae_Ruta WHERE  ch_CodRuta IN( 
'F120001',
'03MA108',
'03MI108',
'03JU108',
'03VI108',
'03SA108',
'03LU208',
'03MA208',
'03MI208',
'03JU208',
'03VI208',
'03SA208'
) 
656                                        F120001
SELECT distinct '''' + CH_CODRUTA +''',' FROM MAE_CLI WHERE ch_codven='652'

20434086150	Distribuidora Odet
20511908745	Comercia S.A
20538277721	Economysa


--SELECT *FROM MAE_CLI WHERE CH_codClien in ('20122138161')
--delete FROM MAE_CLI WHERE CH_codClien in ('20511908745')
select * FROM MAE_CLI WHERE CH_codClien in('16531125')
--SELECT *FROM MAE_CLI WHERE CH_codClienin()
--SELECT *FROM MAE_CLI WHERE ch_codven='536' and CH_CODRUTA='03VI108'
--SELECT *FROM MAE_CLI WHERE CH_codClien in('15423285','08927605')
--SELECT *FROM MAE_CLI WHERE CH_codClien in('15423285','08927605')
SELECT distinct ch_CodRuta , '''+ ch_CodRuta + '',' FROM MAE_CLI WHERE ch_codven='02' and ch_CodRuta not like 'F%'
COD DE VENDEDOR                        RUTA
230                                        F120022
544                                        F120009
643                                        F120055
656                                        F120001
657                                        F120010



-- SELECT *FROM MAE_CLI WHERE CH_CODRUTA in
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)

--SELECT *FROM MAE_CLI WHERE CH_CODRUTA='03SEMA3'
--SELECT *FROM MAE_CLI WHERE ch_codVen='539'
--select *from MAE_VEND where ch_CodVende in('327')
--select *from MAE_VEND where ch_CodDistr='05' 
--update MAE_VEND set ch_CodDistr='05',ch_cargo ='1' from MAE_VEND where ch_CodVende in('539')
--
--update MAE_CLI set ch_codRuta ='F010082', ch_codVen ='458' FROM MAE_CLI WHERE CH_codClien in ('20492400662')
--update MAE_CLI set ch_CodDistr ='06' FROM MAE_CLI WHERE CH_codClien in ('20511908745')
--update MAE_CLI set ch_CodDistr ='01' FROM MAE_CLI WHERE ch_codVen='203'
--update MAE_CLI set ch_forpago ='03',ch_codcanal=22 FROM MAE_CLI WHERE CH_codClien in ('08172195')
----SELECT *
--FROM MAE_CLI WHERE CH_codClien in (
--'45523813',
--'94548812',
--'94549413')
--update MAE_CLI set ch_codVen ='521'  FROM MAE_CLI WHERE CH_CODRUTA='F140229'

--insert into Mae_Ruta(ch_CodDistr, ch_CodRuta, ch_P1, ch_P2, ch_P3, ch_P4, ch_P5, ch_P6, ch_P7, ch_frecuencia, ch_Estado)
values ('01','01SEM09','002','002','002','002','002','002','002','1',')

----update Mae_Ruta set ch_frecuencia='0' from Mae_Ruta where ch_codRuta='18MI201'
----update Mae_Ruta set ch_P6='402' from Mae_Ruta where ch_codRuta='01JIMEN'
update Mae_Ruta set ch_CodDistr='01' from Mae_Ruta where ch_codRuta='01JIMEN'

select * from Mae_Ruta where ch_codRuta='18MI201'

SELECT des_cond As nombre FROM FACT_COND WHERE ch_coddistr = '06' AND cod_cond='01' 
*/