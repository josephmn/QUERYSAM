-- logearse al servidor 192.168.10.51 --- ALTOMAYO-DATA
-- base de datos AM2014APP
-- sa sql2012

----******************************'TEMA DE CAMBIAR VENDEDOR DE ZONA (rutas de
--solomon (no empiezan con F ))'   ******************************************

declare @Vend varchar(3)
declare @VendNew varchar(3)
declare @Ruta varchar(10)
--select  @Ruta='PNSEM01' ,  
select @Vend='539'  , @VendNew='657'

Select  ZonaRutaID ,*,
            lunes=      case when Lunes=@Vend then @VendNew else Lunes end,
            Martes=     case when Martes=@Vend then @VendNew else Martes end,
            Miercoles=  case when Miercoles=@Vend then @VendNew else Miercoles end,
            Jueves=     case when Jueves=@Vend then @VendNew else Jueves end,
            Viernes=    case when Viernes=@Vend then @VendNew else Viernes end,
            Sabado=     case when Sabado=@Vend then @VendNew else Sabado end,                                               
            Domingo=    case when Domingo=@Vend then @VendNew else Domingo end,    
            SlsperId=   case when SlsperId=@Vend then @VendNew else SlsperId
end                                            
From  xAMMae_Ruta -- where SlsperId In ('229')
WHERE ZonaRutaID in
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)





--select slsperid,name,*from salesperson where name like '%yo%' slsperid ='229'

--go
print 'Actualiza en customer'

--select slsperid,* from customer where  slsperid ='434' user5='PSJU103'

 update customer set slsperid = @VendNew
where custid in (select v.custid
                  from customer c inner join custslsper v on c.custid=
v.custid
                  where rtrim(c.user5) IN
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
 )

and c.status='A')

--go
print 'Actualiza en customer'

--select slsperid,* from soaddress where user5='PSJU103'

 update soaddress set slsperid = @VendNew
 --select *from soaddress
where custid in (select  c.custid
                  from soaddress c --inner join custslsper v on c.custid= v.custid
                  where LTRIM(rtrim(c.user5)) IN
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
) --AND C.SLSPERID ='507'
)
AND 
LTRIM(rtrim(user5)) IN(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)

--and shipToId='DEFAULT'

--go 

print 'Actualiza en custslsper'

--select count(*) from custslsper 

update custslsper set slsperid = @VendNew
where custid in (select v.custid
                  from customer c inner join custslsper v on c.custid=
v.custid
                  where rtrim(c.user5) IN
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)
and c.status='A')


--go                  

 

print 'actualiza en [192.168.10.9].DB_ALTOMAYO.dbo.Mae_cli'

--select  count(*) from  [192.168.10.9].DB_ALTOMAYO.dbo.Mae_cli
 update [192.168.10.9].DB_ALTOMAYO.dbo.Mae_cli set ch_CodVen = @VendNew
where ch_CodRuta IN
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)
 --go

print 'ACTUALIZA EN Mae_Ruta DE nextel'

--declare @Vend varchar(3)

--declare @VendNew varchar(3)

 

--set @Vend='140'

--set @VendNew='169'

 

/*Select *,

            ch_P1=      case when ch_P1=@Vend then @VendNew else ch_P1 end,
            ch_P2=      case when ch_P2=@Vend then @VendNew else ch_P2 end,
            ch_P3=      case when ch_P3=@Vend then @VendNew else ch_P3 end,
            ch_P4=      case when ch_P4=@Vend then @VendNew else ch_P4 end,
            ch_P5=      case when ch_P5=@Vend then @VendNew else ch_P5 end,
            ch_P6=      case when ch_P6=@Vend then @VendNew else ch_P6 end,
            ch_P7=      case when ch_P7=@Vend then @VendNew else ch_P7 end,
            ch_frecuencia

FROM   [192.168.10.9].DB_ALTOMAYO.dbo.Mae_Ruta 

WHERE ch_CodRuta IN (select  ch_CodRuta from
[192.168.10.9].DB_ALTOMAYO.dbo.Mae_Ruta  where ch_P1=@Vend or  ch_P2=@Vend
or  ch_P3=@Vend or  ch_P4=@Vend or  ch_P5=@Vend or  ch_P6=@Vend or
ch_P7=@Vend )

*/

-- select ch_P1,ch_P2,ch_P3 from [192.168.10.9].DB_ALTOMAYO.dbo.Mae_Ruta WHERE ch_CodRuta IN
--('18lu104','18lu204','18ma204','18mi204')


--UPDATE [192.168.10.9].DB_ALTOMAYO.dbo.Mae_Ruta  SET 

--            ch_P1=      case when ch_P1=@Vend then @VendNew else ch_P1 end,
--            ch_P2=      case when ch_P2=@Vend then @VendNew else ch_P2 end,
--            ch_P3=      case when ch_P3=@Vend then @VendNew else ch_P3 end,
--            ch_P4=      case when ch_P4=@Vend then @VendNew else ch_P4 end,
--            ch_P5=      case when ch_P5=@Vend then @VendNew else ch_P5 end,
--            ch_P6=      case when ch_P6=@Vend then @VendNew else ch_P6 end,
--            ch_P7=      case when ch_P7=@Vend then @VendNew else ch_P7 end

--WHERE ch_CodRuta IN
--('18lu105','18lu205','18mi205')
 
--go
 

print 'ACTUALIZA EN xAMMae_Ruta DE ALTOMAYO'


UPDATE [192.168.10.53].gisat.dbo.xAMMae_Ruta SET 
            lunes=      case when Lunes=@Vend then @VendNew else Lunes end,
            Martes=     case when Martes=@Vend then @VendNew else Martes
end,
            Miercoles=  case when Miercoles=@Vend then @VendNew else
Miercoles end,
            Jueves=     case when Jueves=@Vend then @VendNew else Jueves
end,
            Viernes=    case when Viernes=@Vend then @VendNew else Viernes
end,
            Sabado=     case when Sabado=@Vend then @VendNew else Sabado
end,                                               
            Domingo=    case when Domingo=@Vend then @VendNew else Domingo
end,    
            SlsperId=   case when SlsperId=@Vend then @VendNew else SlsperId
end                                            
WHERE ZonaRutaID IN
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)


print 'ACTUALIZA EN xAMMae_Ruta DE ALTOMAYO'


UPDATE xAMMae_Ruta SET 

            lunes=      case when Lunes=@Vend then @VendNew else Lunes end,
            Martes=     case when Martes=@Vend then @VendNew else Martes end,
            Miercoles=  case when Miercoles=@Vend then @VendNew else Miercoles end,
            Jueves=     case when Jueves=@Vend then @VendNew else Jueves end,
            Viernes=    case when Viernes=@Vend then @VendNew else Viernes 
end,
            Sabado=     case when Sabado=@Vend then @VendNew else Sabado
end,                                               
            Domingo=    case when Domingo=@Vend then @VendNew else Domingo
end,    
            SlsperId=   case when SlsperId=@Vend then @VendNew else SlsperId
end                                            
WHERE ZonaRutaID IN
(
'18LU103',
'18LU203',
'18MI203',
'F120004',
'F120010',
'F120018',
'F120021',
'F120033',
'F120040',
'F120041',
'F120044',
'F120056'
)

