--begin tran
--update ardoc
--set SlsperId = '001'
--where batnbr = '013545' 

--commit

select SlsperId, * from ardoc where batnbr = '013545'