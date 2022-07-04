




----------------------*** REPORTES SOLOMON **-----------------------

ALTER VIEW MG_DOC_SIN_MIG
-- FUNCION	: Listar cfm_regvtas que no esten en cf_regvtas(CHK_NUM)
-- AUTOR	: Gasla Baudat Laisson 
-- Ultima Fecha Modificacion : 04/07/2015
-- Sistema  : Solomon v4 (CA2015APP)
AS
select left(CM.FECHANEGOCIO,4)+ right(left(CM.FECHANEGOCIO,7),2) perpost,TS.DESCRIPCION,
(case when tipodoc = '12' -- tickets
then  SUBSTRING(numdoc,10 , 15)else numdoc end)DOCUMENTO,
CM.*
 from CFM_RegVtas CM
INNER JOIN CF_TIENDASITE TS ON CM.NUMTIENDA=TS.NUMTIENDA
WHERE CM.CHK_NUM NOT IN (SELECT CHK_NUM FROM CF_REGVTAS)
GO

----------------------
-- DOCUMENTOS MIGRADOS QUE FALTAN EXPORTAR F  -- 
ALTER VIEW MG_DOC_SINEXP
-- FUNCION	: Listar cfm_regvtas que no esten en solomon
-- AUTOR	: Gasla Baudat Laisson 
-- Ultima Fecha Modificacion : 04/07/2015
-- Sistema  : Solomon v4 (CA2015APP)
AS
SELECT  right(CONVERT(VARCHAR(24),fechanegocio,105),4) +
		  substring(CONVERT(VARCHAR(24),fechanegocio,105),4,2) perpost,--PERIODO 
		 (case when tipodoc = '12' -- tickets
		  then  SUBSTRING(numdoc,10 , 15)else numdoc end)DOC,
TS.DESCRIPCION,
CF.*
from cf_regvtas  CF
	INNER JOIN CF_TIENDASITE TS ON CF.NUMTIENDA= TS.NUMTIENDA 
WHERE CF.EXPORTADOFN='' --AND TOTAL >0  
GO


ALTER VIEW MG_DOC_SINAPLICAR
-- FUNCION	: Listar cf_regvtas que aun no se apliquen(EXPORTADOPA,USER06) 
-- AUTOR	: Gasla Baudat Laisson 
-- Ultima Fecha Modificacion : 04/07/2015
-- Sistema  : Solomon v4 (CA2015APP)
AS
SELECT  right(CONVERT(VARCHAR(24),fechanegocio,105),4) +
		  substring(CONVERT(VARCHAR(24),fechanegocio,105),4,2) perpost,--PERIODO 
		 (case when tipodoc = '12' -- tickets
		  then  SUBSTRING(numdoc,10 , 15)else numdoc end)DOC,
TS.DESCRIPCION,CF.*  from CF_RegVtas CF 
--WHERE TS.NUMTIENDA = CF.NUMTIENDA
INNER JOIN CF_TIENDASITE TS ON CF.NUMTIENDA= TS.NUMTIENDA 
AND CF.ExportadoPA =''  and CF.user06 ='' and CF.total <> 0 
GO


ALTER VIEW MG_TRANSF_EFEC
-- FUNCION	: Listar cfm_detpago que aun no se exporta(EXPORTADOTR)
-- AUTOR	: Gasla Baudat Laisson 
-- Ultima Fecha Modificacion : 04/07/2015
-- Sistema  : Solomon v4 (CA2015APP)
AS
SELECT  right(CONVERT(VARCHAR(24),fechanegocio,105),4) +
		  substring(CONVERT(VARCHAR(24),fechanegocio,105),4,2) perpost,
TS.DESCRIPCION,
CF.* from CFM_DetPago2 CF
INNER JOIN CF_TIENDASITE TS ON CF.NUMTIENDA = TS.NUMTIENDA 
where CF.exportadotr ='' 
GO


