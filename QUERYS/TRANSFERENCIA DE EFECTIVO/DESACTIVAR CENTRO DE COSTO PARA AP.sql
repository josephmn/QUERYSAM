


select *  from gltran where sub ='CATCMAR000'

 CATU-MAR-000
 
 
 
 
 pvrec_all 'subxref_sub'
 
 
 SP_HELPTEXT subxref_sub
 
 
 
select subxref.sub,subxref.descr from subxref (FASTFIRSTROW)  where cpnyid =  'COFFEARTS'  and active = 1 
and sub like  '%'   and (subxref.sub between 'CATCMAR000' and 'zzzzzzzzzzzzzzzzzzzzzzzz') order by cpnyid,sub


select subxref.sub,subxref.descr from subxref (FASTFIRSTROW)  where cpnyid =  'COFFEARTS'  and active = 1 
and sub =  'CATUMAR000'

SP_HELPTEXT subxref

delete from subxref where  cpnyid =  'COFFEARTS'  and active = 1 and sub =  'CATCMAR000'