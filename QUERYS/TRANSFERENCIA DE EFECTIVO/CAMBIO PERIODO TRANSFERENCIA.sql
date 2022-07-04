---- CAMBIO DE PERIODO DE TRANSFERENCIA ---

ZZ	023655    	10-16	197759    	27/10/2016		29                            	628.20	0.00	628.20	 ingreso 	 
ZZ	023611    	10-16	196962    	18/10/2016		3                             	529.90	0.00	529.90	 ingreso 		10
												    10
ZZ	021317    	10-16	195617    	01/10/2016		36                            	227.40	0.00	227.40	 ingreso 


select * from catran where refnbr ='196841'

select * from cfm_detpago2 where referencia ='195617'

select PERPOST,* from batch where batnbr = '002227' and module ='CA'
select PERPOST, refnbr,* from catran where batnbr = '002227' 
select PERPOST,refnbr,* from gltran where batnbr = '002227' and module ='CA'


/*
update batch set perpost ='201609' where batnbr  in ('013525','013526','013533','013536','013539','013544','013568','013570','013535','013538','013543','013567','013569') and module ='CA'
update catran set perpost ='201609' where batnbr in('013525','013526','013533','013536','013539','013544','013568','013570','013535','013538','013543','013567','013569')
update gltran set perpost ='201609' where batnbr in ('013525','013526','013533','013536','013539','013544','013568','013570','013535','013538','013543','013567','013569') AND MODULE ='CA'  


update batch set perpost ='201701' where batnbr  in ('028560') and module ='CA'
update catran set perpost ='201701' where batnbr in('028560')
update gltran set perpost ='201701' where batnbr in ('028560') AND MODULE ='CA' 



UPDATE GLTRAN SET APPLIEDDATE ='2015-10-11' WHERE BATNBR ='021880' AND MODULE ='CA'


update batch set perpost  = '201607' where batnbr ='013507' and module = 'CA'
update CATRAN set perpost = '201607' where batnbr ='013507' 
update gltran set perpost = '201607' where batnbr ='013507' and module = 'CA'

002227

UPDATE CATRAN SET TRANDATE  ='2016-12-30' WHERE BATNBR='002227'
UPDATE GLTRAN SET TRANDATE  ='2016-12-30' WHERE BATNBR='002227' AND MODULE ='CA'
/*