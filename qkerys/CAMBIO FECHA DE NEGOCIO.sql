
/************************** cambio fecha de negocio ********************************/

--lote
--000358

--numero
--1471

--cusco1

--consulta actual
select Status, PERPOST, PerEnt, PerPost, * from batch where batnbr = '000657' and module ='CA'
select PERPOST, refnbr, TranDate, PerEnt, PerPost, * from catran where batnbr = '000657' 
select Posted, PERPOST, refnbr, PerEnt, PerPost, * from gltran where batnbr = '000657' and module ='CA'

--referencia
select Status, PERPOST, PerEnt, PerPost, * from batch where batnbr = '000571' and module ='CA'
select PERPOST, refnbr, TranDate, PerEnt, PerPost, * from catran where batnbr = '000571' 
select Posted, PERPOST, refnbr, PerEnt, PerPost, * from gltran where batnbr = '000571' and module ='CA'

--begin tran
--update catran
--set TranDate = '2018-02-23' where batnbr = '000358' and module ='CA'

--commit