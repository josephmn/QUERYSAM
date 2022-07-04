

select * from PARentaCertificado where Perid = '17636684' and ano = '2018'


--SELECT SUM(VacTotal+DevTotal) FROM PALiqBeneficios WHERE EmpId='AM' AND PerId='17636684' AND Year(FechaCese)='2018'        

--SELECT SUM(SueldoBruto) FROM PARemExterna WHERE PerId='17636684' AND Ano='2018'

--SELECT SUM(sbruto) FROM v_BrutoSubsidio WHERE PerId='17636684' 

select periodoid,perid,sbruto,cantidad from paboletah H inner join paboletad D ON H.nbrboleta=D.nbrboleta    
where D.rubid IN('S01','S02')  and d.cantidad>0  and perid = '72130767'
--and H.perid='40014425' and periodoid='201301'


SELECT RT.Ano, RT.Uit, BH.peremp as EmpId, BH.Perid, round(sum(sbruto),2)           
+ ISNULL((SELECT SUM(VacTotal+DevTotal ) FROM PALiqBeneficios WHERE EmpId=BH.peremp AND PerId=BH.Perid AND Year(FechaCese)=RT.Ano), 0)         
+ ISNULL((SELECT SUM(SueldoBruto) FROM PARemExterna WHERE PerId=BH.Perid AND Ano=RT.Ano), 0) 
- ISNULL((SELECT SUM(sbruto) FROM v_BrutoSubsidio WHERE PerId=BH.Perid ), 0) 
AS SBruto,          
        
isnull((SELECT round(sum(sbruto), 2) FROM paboletaH WHERE peremp=BH.peremp AND PERID=BH.PERID AND periodoid IN (right(RT.ano,2)+'07GR', right(RT.ano,2)+'12GR')), 0)           
+ ISNULL((SELECT sum(GratiTotal) FROM PALiqBeneficios WHERE EmpId=BH.peremp AND PerId=BH.Perid AND Year(FechaCese)=RT.Ano), 0)           
+ ISNULL((SELECT SUM(Gratificacion) FROM PARemExterna WHERE PerId=BH.Perid AND Ano=RT.Ano), 0) as Grati,          
        
--isnull((select sum(monto) from pautilidades WHERE BH.peremp=(SELECT EMPID FROM PAEMPRESA WHERE USER3=1) AND perid=BH.PERID AND left(periodoid,4)=RT.Ano), 0) as Utilidades,          
isnull((select sum(Monto) from PAUtilidades WHERE BH.peremp=(SELECT EMPID FROM PAEMPRESA WHERE USER3=1) AND perid=BH.PERID AND left(PeriodoId,4)=RT.Ano), 0) as Utilidades,          
    
(7*RT.Uit) as Deduccion,          
ISNULL((SELECT SUM(BD.cantidad) FROM PABoletaD BD INNER JOIN PABoletaH BH2 ON BD.nbrBoleta=BH2.nbrBoleta         
WHERE BD.RubId='D03' AND BH2.peremp=BH.peremp AND BH2.PerId=BH.PERID AND left(BH2.periodoid,4)=RT.Ano), 0)           
+ ISNULL((SELECT SUM(RentaQuinta) FROM PARemExterna WHERE PerId=BH.Perid AND Ano=RT.Ano), 0)     
+ ISNULL((SELECT SUM(RentaOtraEmp) FROM parentaquinta WHERE PerId=BH.Perid AND Ano=RT.Ano), 0)     
AS Retencion          
FROM PARentaCert RT INNER JOIN paboletaH BH ON RT.Ano=left(BH.PERIODOID,4)           
--where BH.perid='41262866'
GROUP BY RT.Ano, RT.Uit, BH.peremp, BH.perid



SELECT sbruto, sneto, user8, nbrboleta, * FROM paboletaH WHERE perid = '17636684' AND periodoid IN ('201801','201802','201803','201804','201805')


SELECT * FROM paboletad WHERE nbrboleta = '9000045452'


select * from PARentaCertificado where EmpId= 'AM'  AND ano= '2018' and perid= '17636684' 

--update paboletaH
--set sbruto = '3746.11' where  nbrboleta = '9000045452' -- 3699.43


--update paboletaH
--set sbruto = '3766.67' where  nbrboleta = '9000047079' --3750


/*********************************************/

--VALIDACION

select * from PARentaCertificado where EmpId= 'AM'  AND ano= '2018'  and perid= '17636684' 



SELECT PromProduccion, * --733.6
-- UPDATE A SET PromProduccion = 0
FROM PALiqBeneficios A WHERE PerId = '10684657'

SELECT PromProduccion, * FROM PALiqBeneficios WHERE PerId = '44204268'



