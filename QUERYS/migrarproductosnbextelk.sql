


exec xAMPasarProdANexT  '21763'

sp_helptext  xAMPasarProdANexT

alter  proc xAMPasarProdANexT @Invtid varchar (30)          
as      
begin      
select '' a       
--BEGIN DISTRIBUTED TRANSACTION      
--exec [192.168.10.9].DB_ALTOMAYO.dbo.xAMPasarProdANexT1 @Invtid        
  end



select * from inventory  where InvtID  ='21763'

SELECT  'exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] ''' + rtrim(ltrim(invtid)) + ''''  FROM [AM2017APP].[dbo].[inventory] where classid =21 and  invtid   
 in ('21577','21764','21765','21766','21767','21768','21769','21770','21771' )
  







exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21766'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21764'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21765'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21766'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21767'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21768'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21769'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21770'
exec [192.168.10.9].[DB_ALTOMAYO].[dbo].[xAMPasarProdANexT1] '21771'











