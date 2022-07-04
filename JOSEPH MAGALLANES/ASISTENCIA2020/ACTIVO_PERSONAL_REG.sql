USE [msdb]
GO

/****** Object:  Job [ACTIVO_PERSONAL_REG]    Script Date: 25/01/2020 00:27:06 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 25/01/2020 00:27:06 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ACTIVO_PERSONAL_REG', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'master', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [INSERT_PERSONAL_NEW]    Script Date: 25/01/2020 00:27:06 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'INSERT_PERSONAL_NEW', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO Personal
([PER_COD], [PER_NOMBRE], [PER_APE_PA], [PER_APE_MA], [PER_DOC], [FEC_NAC], [EST_CIVIL], [SEXO], [DIRECCION], 
[LOCAL], [EMPRESA], [AREA], [CARGO], [CONTRATO], [REGISTRO_MARC], [FEC_ING], [MAR_DNI], [MAR_HUELLA], [COD_BARRA], 
[PER_STATUS], [BARRAS], [Picture], [Crtd_DateTime], [Crtd_User], [LUpd_DateTime], [LUpd_User])
SELECT 
[PER_COD], [PER_NOMBRE], [PER_APE_PA], [PER_APE_MA], [PER_DOC], [FEC_NAC], [EST_CIVIL], [SEXO], [DIRECCION], 
[LOCAL], [EMPRESA], [AREA], [CARGO], [CONTRATO], [REGISTRO_MARC], [FEC_ING], [MAR_DNI], [MAR_HUELLA], [COD_BARRA], 
[PER_STATUS], [BARRAS], [Picture], [Crtd_DateTime], [Crtd_User], [LUpd_DateTime], [LUpd_User]
FROM [ASISTENCIA_AM].dbo.[PERSONAL] 
WHERE LOCAL <> 5 AND PER_COD COLLATE SQL_Latin1_General_CP1_CI_AS NOT IN (SELECT PER_COD FROM PERSONAL)', 
		@database_name=N'EFESTOCOM2019', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'RECURRENTE', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200102, 
		@active_end_date=99991231, 
		@active_start_time=60000, 
		@active_end_time=230000, 
		@schedule_uid=N'efbb379c-41e3-43d4-bc4c-feaeb8fd4de5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


