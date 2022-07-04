
--VERIFICAR AJUSTES POR LIBERAR --
select distinct b.batnbr from batch B inner join intran I on B.batnbr = I.batnbr 
where B.module ='IN' and I.TranType ='AJ' and b.rlsed =0 and b.Crtd_User='SYSADMIN' and b.batnbr not in ('002207')









