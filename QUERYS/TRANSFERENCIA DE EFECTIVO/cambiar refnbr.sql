
---SE VERIFICA TRANSFERENCIA EN BATCH,CATRAN,GLTRAN (MASTERCARD)
SELECT status,rlsed,* FROM BATCH WHERE BATNBR ='011987' AND MODULE ='CA'
SELECT refnbr,* FROM CATRAN WHERE BATNBR='011987' --AND REFNBR ='VISA'
SELECT posted,refnbr,* FROM GLTRAN WHERE BATNBR='011987' AND MODULE  ='CA'


update CATRAN set refnbr  ='187108' where batnbr  ='011987' and refnbr  ='.187108'
update  GLTRAN set refnbr  = '187108' where  BATNBR='011987' AND MODULE  ='CA' and refnbr  ='.187108'



GL	4768	16-Jun	��������� 	186910

SELECT status,rlsed,* FROM BATCH WHERE BATNBR ='004768' AND MODULE ='gl'
SELECT posted,refnbr,* FROM GLTRAN WHERE BATNBR='004768' AND MODULE  ='gl'

update  GLTRAN set refnbr  = '186910' where  BATNBR='004768' AND MODULE  ='gl' and refnbr  =''