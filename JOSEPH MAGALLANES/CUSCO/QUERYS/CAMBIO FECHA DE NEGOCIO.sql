
/************************** cambio fecha de negocio ********************************/

--lote
--000358

--numero
--1471

--cusco1


select Status, PERPOST,* from batch where batnbr = '000358' and module ='CA'
select PERPOST,refnbr,* from catran where batnbr = '000358' 
select Posted, PERPOST,refnbr,* from gltran where batnbr = '000358' and module ='CA'


--begin tran
--update catran
--set TranDate = '2018-02-23' where batnbr = '000358' and module ='CA'

--commit