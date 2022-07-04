select rlsed,status,* from batch where batnbr='003057'
select rlsed,* from ardoc where batnbr='003057' and perpost='201506'
select rlsed,*  from artran where batnbr='003057' and perpost='201506'
select rlsed,perpost,*  from gltran where batnbr='003052' and module ='gl'


-------------- DETECTAR LOTE CON ASIENTOS EN OBSERVACION  ---------------
select  batnbr, sum(curycramt)as debe , 
               sum(curydramt) as haber ,
			  (sum(curycramt)-sum(curydramt)) as diferencia 
			 from gltran where perpost='201507' -- periodo
			group by batnbr having round((sum(curycramt)-sum(curydramt)),2) <>0
  
 
   select ar.acct,ar.curytranamt,gl.curycramt,gl.cramt,  gl.curydramt,gl.dramt from artran ar 
   INNER JOIN gltran gl on ar.batnbr= gl.batnbr
   and ar.refnbr=gl.refnbr
   and ar.acct = gl.acct
   where gl.perpost ='201506'
   and ar.batnbr='018300'
   and (curytranamt


SELECT x.curydramt,y.curycramt ,(x.curydramt-y.curycramt) as diferencia FROM (
(select ROW_NUMBER() OVER(ORDER BY curydramt ASC) AS row,curydramt from gltran 
 where batnbr='009205' and acct ='101000')x  
 INNER JOIN
(select ROW_NUMBER() OVER(ORDER BY curycramt ASC) AS row,curycramt from gltran 
 where batnbr='009205' and acct ='121301')y ON x.row = y.row)
where (x.curydramt-y.curycramt)<>0



)








 



select

(SELECT  index acct ,curycramt,curydramt     from gltran  where batnbr='018298' and acct ='101000'
order by curydramt asc)x
 inner outer join
(SELECT   acct ,curycramt,curydramt  from gltran  where batnbr='018298' and  acct ='121301'   
 order by curycramt asc)y 
where 


select x.curydramt,y.curycramt from ( curydramt,batnbr  from gltran  where batnbr='018298' and acct ='101000')x
inner join
(SELECT  curycramt,batnbr  from gltran  where batnbr='018298' and  acct ='121301' )y  on x.batnbr=y.batnbr








order by acct asc





