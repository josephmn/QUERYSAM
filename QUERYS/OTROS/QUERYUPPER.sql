 select x.fechanegocio, x.tipo,x.total,y.fechanegocio,y.tipo,y.total  from (
( select row_number() over (order by fechanegocio asc) as row, fechanegocio, tipo,total
   from cfm_detpagotipo where numtienda  =  '26' 
and fechanegocio  between'20150801' and '20150831' and tipo <>'EFECTIVO'
)x
inner join 
(select row_number() over (order by fechanegocio asc) as row, fechanegocio, tipo,total
   from cf_detpago where numtienda  = '26'
and fechanegocio   between '2015-08-01' and '2015-08-31'    and tipo <>'EFECTIVO')y
on x.row =y.row)
where  x.total <>y.total



select x.batnbr,x.module,x.crtot,y.batnbr,y.module,y.crtot from
 ( SELECT row_number() over (order by batnbr asc) as rowx, BATNBR,MODULE,CRTOT FROM AM2015APP.dbo.BATCH )x
 left  Join
 ( SELECT row_number() over (order by batnbr asc) as rowy, BATNBR,MODULE,CRTOT FROM CA2015APP.dbo.BATCH )y
on x.rowx  =y.rowy
where x.crtot =y.crtot


