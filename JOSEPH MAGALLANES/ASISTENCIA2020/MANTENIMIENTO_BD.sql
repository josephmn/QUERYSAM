USE [msdb]
GO

/****** Object:  Job [MANTENIMIENTO_BD]    Script Date: 25/01/2020 00:29:28 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 25/01/2020 00:29:28 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'MANTENIMIENTO_BD', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [MANTENIENTO 2019]    Script Date: 25/01/2020 00:29:28 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'MANTENIENTO 2019', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'truncate table BaseDatos

insert into BaseDatos (database_id, Name, Estado, RMB)
select database_id, name, ''A'' Estado, 1 RMB 
from master.sys.databases where name not in (''master'',''tempdb'',''model'',''msdb'','''')

BEGIN      
DECLARE @name VARCHAR(30)

DECLARE BDAM2019 CURSOR FOR         

select ltrim(rtrim(Name)) Name from BaseDatos --where Name = ''AM2012APP''

		OPEN BDAM2019  FETCH BDAM2019 INTO @name
                          
        WHILE (@@FETCH_STATUS = 0 )                    
        BEGIN -- WHILE                                    

		declare @Ejecutar varchar(8000)

		set @ejecutar = 
		''USE ''+@name+''
			declare @dbfileslog varchar(50);
			set @dbfileslog = (select name from sys.database_files where file_id = 2);
			--print ''''update BD_Configuraciones..BaseDatos set name_dbfiles_log = ''''''''''''+@dbfileslog+'''''''''''' where name = ''''''''''+@name+''''''''''
			update BD_Configuraciones..BaseDatos set name_dbfiles_log = @dbfileslog where name = ''+ CHAR(39)+ @name +CHAR(39)
		EXEC (@ejecutar) 
         
              FETCH BDAM2019 INTO @name
              END-- END WHILE                  
      CLOSE BDAM2019                  
      DEALLOCATE BDAM2019                
END 



BEGIN      
DECLARE @BDName VARCHAR(30)
DECLARE @NameFilelog VARCHAR(30)
DECLARE @RMB CHAR(2)

DECLARE LOGBD2019 CURSOR FOR         

select LTRIM(RTRIM(Name)) Name, LTRIM(RTRIM(name_dbfiles_log)) name_dbfiles_log, RMB from BaseDatos where Estado = ''A'' --AND Name = ''AM2012SYS''

		OPEN LOGBD2019  FETCH LOGBD2019 INTO @BDName, @NameFilelog, @RMB
                          
        WHILE (@@FETCH_STATUS = 0 )                    
        BEGIN -- WHILE                                    

		declare @Execute varchar(8000)

		set @Execute = 
			''USE ''+@BDName+'';
			ALTER DATABASE ''+@BDName+'' SET RECOVERY SIMPLE;
			DBCC SHRINKFILE (''+@NameFilelog+'',''+@RMB+'');
			ALTER DATABASE ''+@BDName+'' SET RECOVERY FULL''

		--PRINT @Execute
		EXEC (@Execute) 
         
              FETCH LOGBD2019 INTO @BDName, @NameFilelog, @RMB
              END-- END WHILE                  
      CLOSE LOGBD2019                  
      DEALLOCATE LOGBD2019                
END', 
		@database_name=N'BD_Configuraciones', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'EJECUCION', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=6, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20180802, 
		@active_end_date=99991231, 
		@active_start_time=70000, 
		@active_end_time=10000, 
		@schedule_uid=N'd5273a25-3ae0-4cc4-978f-9cad95e8cfe5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


