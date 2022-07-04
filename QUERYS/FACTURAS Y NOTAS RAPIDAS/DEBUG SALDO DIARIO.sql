
select sum(Subtotal),sum(igv),sum(total)  from CF_RegVtas where FechaNegocio ='2016-04-24' and NumTienda =  '12'


select distinct exportadofn,referenciafn from CF_RegVtas where FechaNegocio ='2016-04-24' and NumTienda =  '12' and exportadopa ='013445'

121F105375

select exportadofn,referenciafn ,exportadopa,referenciapa,total,numdoc from CF_RegVtas where referenciafn ='121B195964'

select exportadofn,referenciafn ,exportadopa,referenciapa,total,numdoc from CF_RegVtas where exportadopa ='013445'

--121B195964
select sum(total) from CF_RegVtas where referenciafn ='121B195964'
select sum(total) from CF_RegVtas where  exportadopa ='013445'

select batnbr,origdocamt,doctype from ardoc where refnbr  ='121B195964'
select batnbr,origdocamt,doctype from ardoc where  batnbr ='013445'




2319.5