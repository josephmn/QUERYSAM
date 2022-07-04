--GET_ActivosListar

SELECT * 
-- DELETE
FROM EnsambladoD WHERE SERIE = 'PF1B9BEKTDE9PK'

--SELECT * FROM PERSONAL WHERE PER_COD = '44195967'

select * from bd2016..Customers where custid = '00123612'



select RIGHT(LTRIM(RTRIM(custid)),8) DNI, custid, BillName, CardType into DATAAM
from [ALTOMAYO-WEB].[AM2020APP].dbo.Customer where LEN(custid) > 8 AND custid LIKE '00%' AND CustId NOT IN ('00000000000')

SELECT CustId, billname, shipperid, invcnbr into personas_sol
FROM [ALTOMAYO-WEB].[AM2020APP].dbo.soshipheader where perpost = '202009' and CustId in (

--SELECT DNI FROM (
SELECT AM.DNI, AM.BILLNAME, Z.CustId, (LTRIM(RTRIM(PATERNO)) + ' '+ LTRIM(RTRIM(MATERNO))+ ' '+ LTRIM(RTRIM(NOMBRES))) NOMBRE 
FROM DATAAM AM
INNER JOIN Customers Z
ON AM.DNI COLLATE SQL_Latin1_General_CP1_CI_AS = Z.custid
where billname like 'FERNANDEZ MAYTA%'
order by DNI asc
--) X WHERE BillName COLLATE SQL_Latin1_General_CP1_CI_AS <> NOMBRE
--) 

select * from Customers where (LTRIM(RTRIM(PATERNO)) + ' '+ LTRIM(RTRIM(MATERNO))+ ' '+ LTRIM(RTRIM(NOMBRES))) like 'FERNANDEZ MAYTA PILAR%'



select * from(
select am.custid, AM.BILLNAME, Z.CustId data, (LTRIM(RTRIM(PATERNO)) + ' '+ LTRIM(RTRIM(MATERNO))+ ' '+ LTRIM(RTRIM(NOMBRES))) NOMBRE 

from personas_sol am
INNER JOIN Customers Z
ON AM.custid COLLATE SQL_Latin1_General_CP1_CI_AS = Z.custid
) c
where billname COLLATE SQL_Latin1_General_CP1_CI_AS <> NOMBRE
  