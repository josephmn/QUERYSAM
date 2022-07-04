

insert into gltran ([Acct]
      ,[AppliedDate]
      ,[BalanceType]
      ,[BaseCuryID]
      ,[BatNbr]
      ,[CpnyID]
      ,[CrAmt]
      ,[Crtd_DateTime]
      ,[Crtd_Prog]
      ,[Crtd_User]
      ,[CuryCrAmt]
      ,[CuryDrAmt]
      ,[CuryEffDate]
      ,[CuryId]
      ,[CuryMultDiv]
      ,[CuryRate]
      ,[CuryRateType]
      ,[DrAmt]
      ,[EmployeeID]
      ,[ExtRefNbr]
      ,[FiscYr]
      ,[IC_Distribution]
      ,[Id]
      ,[JrnlType]
      ,[Labor_Class_Cd]
      ,[LedgerID]
      ,[LineId]
      ,[LineNbr]
      ,[LineRef]
      ,[LUpd_DateTime]
      ,[LUpd_Prog]
      ,[LUpd_User]
      ,[Module]
      ,[NoteID]
      ,[OrigAcct]
      ,[OrigBatNbr]
      ,[OrigCpnyID]
      ,[OrigSub]
      ,[PC_Flag]
      ,[PC_ID]
      ,[PC_Status]
      ,[PerEnt]
      ,[PerPost]
      ,[Posted]
      ,[ProjectID]
      ,[Qty]
      ,[RefNbr]
      ,[RevEntryOption]
      ,[Rlsed]
      ,[S4Future01]
      ,[S4Future02]
      ,[S4Future03]
      ,[S4Future04]
      ,[S4Future05]
      ,[S4Future06]
      ,[S4Future07]
      ,[S4Future08]
      ,[S4Future09]
      ,[S4Future10]
      ,[S4Future11]
      ,[S4Future12]
      ,[ServiceDate]
      ,[Sub]
      ,[TaskID]
      ,[TranDate]
      ,[TranDesc]
      ,[TranType]
      ,[Units]
      ,[User1]
      ,[User2]
      ,[User3]
      ,[User4]
      ,[User5]
      ,[User6]
      ,[User7]
      ,[User8])

SELECT [Acct]
      ,[AppliedDate]
      ,[BalanceType]
      ,[BaseCuryID]
      ,'000142'
      ,[CpnyID]
      ,[CrAmt]
      ,[Crtd_DateTime]
      ,[Crtd_Prog]
      ,[Crtd_User]
      ,[CuryCrAmt]
      ,[CuryDrAmt]
      ,[CuryEffDate]
      ,[CuryId]
      ,[CuryMultDiv]
      ,[CuryRate]
      ,[CuryRateType]
      ,[DrAmt]
      ,[EmployeeID]
      ,[ExtRefNbr]
      ,[FiscYr]
      ,[IC_Distribution]
      ,[Id]
      ,[JrnlType]
      ,[Labor_Class_Cd]
      ,[LedgerID]
      ,[LineId]
      ,[LineNbr]
      ,[LineRef]
      ,[LUpd_DateTime]
      ,[LUpd_Prog]
      ,[LUpd_User]
      ,[Module]
      ,[NoteID]
      ,[OrigAcct]
      ,[OrigBatNbr]
      ,[OrigCpnyID]
      ,[OrigSub]
      ,[PC_Flag]
      ,[PC_ID]
      ,[PC_Status]
      ,[PerEnt]
      ,[PerPost]
      ,[Posted]
      ,[ProjectID]
      ,[Qty]
      ,'AI00000011'
      ,[RevEntryOption]
      ,[Rlsed]
      ,[S4Future01]
      ,[S4Future02]
      ,[S4Future03]
      ,[S4Future04]
      ,[S4Future05]
      ,[S4Future06]
      ,[S4Future07]
      ,[S4Future08]
      ,[S4Future09]
      ,[S4Future10]
      ,[S4Future11]
      ,[S4Future12]
      ,[ServiceDate]
      ,[Sub]
      ,[TaskID]
      ,[TranDate]
      ,[TranDesc]
      ,[TranType]
      ,[Units]
      ,[User1]
      ,[User2]
      ,[User3]
      ,[User4]
      ,[User5]
      ,[User6]
      ,[User7]
      ,[User8]
      
  FROM [AMCAF2017APP].[dbo].[GLTran] where BatNbr  ='000001' and TranDesc  ='VINAGRE BLANCO'
GO



UPDATE GLTran set Sub  ='CAC2000RE000' , TranDate  ='2017-01-02' , CrAmt  = 1.28 , CurycrAmt  = 1.28 , DrAmt  = 0  , CuryDrAmt  = 0 where BatNbr  ='000142' and TranDesc  ='VINAGRE BLANCO'
and Acct  ='251101'

UPDATE GLTran set Sub  ='CAC2000RE000' , TranDate  ='2017-01-02' , CrAmt  = 0 , CurycrAmt  = 0, DrAmt  = 1.28  , CuryDrAmt  = 1.28  where BatNbr  ='000142' and TranDesc  ='VINAGRE BLANCO'
and Acct  ='711101'
