





use [am2012app]
go


select * from account 


select  distinct G.ACCT,A.DESCR ,sum(cramt)as cred,sum(dramt)as deb,
case when sum(cramt) > sum(dramt) then round(sum(cramt)- sum(dramt),0) else round(sum(dramt) - sum (cramt),0) end  from gltran G
inner join account A ON G.ACCT  =A.ACCT
where  g.perpost between '201112' and '201212'-- and g.acct ='104101'
group by g.acct,a.descr order by g.acct asc


select acct,sum(cramt)as  cred,sum(dramt)as deb,(sum(cramt) - sum(dramt)) as diferencia  from gltran where acct  ='104101' and perpost between '201112' and '201212'
group by acct





select acct,sum(cramt)as  cred,sum(dramt)as deb,(sum(cramt) - sum(dramt)) as diferencia  from gltran G
inner join account A ON G.acct  = A.acct


where acct  ='104101' and perpost between '201112' and '201212'
group by acct




