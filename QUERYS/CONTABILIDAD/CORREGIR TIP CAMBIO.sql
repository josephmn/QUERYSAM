select 'EXEC CORREGIRTIPOCAMBIO_GL '''+ rtrim(batnbr)+ ''',' + ltrim(CuryRate) , CrAmt,DrAmt,module,refnbr,refnbr,sub,curyid,curyrate,* from (
select batnbr a,*from gltran where acct in ('951120','951121') and perpost ='201506' and batnbr in(
select distinct right(left(TranDesc,10),6) from gltran where acct in ('631120') and perpost ='201508')
union all
select  right(left(TranDesc,10),6)a,* from gltran where acct in ('631120') and perpost ='201508'
) x 
--where batnbr  in ('002172','002170')
order by a,x.sub,BaseCuryID
