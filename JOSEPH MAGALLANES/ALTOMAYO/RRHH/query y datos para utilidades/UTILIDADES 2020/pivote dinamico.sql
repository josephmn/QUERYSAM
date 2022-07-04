
CREATE Procedure  JV_PIVOTDINAMIC
@PER_COD   VARCHAR(15)
AS

IF exists ( select * from dbo.sysobjects where id = object_id(N'[dbo].[RUB_PERSONAS1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1 )  
BEGIN  
 drop table RUB_PERSONAS1  
END  
 
declare @columnas varchar(max)
set @columnas = ''
select @columnas =  coalesce(@columnas + '[' + cast(rubid as varchar(50)) + '],', '')
FROM (select distinct perid ,  rubid from JV_RUBROS where  perid = ltrim(rtrim(@PER_COD))) as DTM

set @columnas = left(@columnas,LEN(@columnas)-1)

DECLARE @SQLString nvarchar(MAX);

set @SQLString = N'
SELECT *  INTO  RUB_PERSONAS1
FROM
(SELECT  perid , rubid	,Rub
    FROM JV_DEMO where perid ='''+ rtrim(ltrim(@PER_COD)) +''') AS SourceTable
PIVOT
(
AVG(Rub)
FOR rubid IN (' + @columnas + ')
) AS PivotTable;'

EXECUTE sp_executesql @SQLString