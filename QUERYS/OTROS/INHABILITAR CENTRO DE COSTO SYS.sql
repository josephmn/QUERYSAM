

select * from subxref (FASTFIRSTROW)  where cpnyid =  'COFFEARTS'  and active = 1 and sub like  '%'
and (subxref.sub between 'CAIQMA' and 'zzzzzzzzzzzzzzzzzzzzzzzz') order by cpnyid,sub


UPDATE subxref SET ACTIVE =  0 WHERE SUB IN ('CAIQMAR000','CATCMAR000','CATUMAR000')












