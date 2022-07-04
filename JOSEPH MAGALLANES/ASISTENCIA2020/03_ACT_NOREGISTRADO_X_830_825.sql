USE [msdb]
GO

/****** Object:  Job [03_ACT_NOREGISTRADO_X_830_825]    Script Date: 25/01/2020 00:26:19 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 25/01/2020 00:26:19 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'03_ACT_NOREGISTRADO_X_830_825', 
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
/****** Object:  Step [EJECUTE]    Script Date: 25/01/2020 00:26:19 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'EJECUTE', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
UPDATE ASISTENCIA_TEMP SET 
COMENTARIO = '''', 
HORA_ENT = CONVERT(SMALLDATETIME,(CONVERT(VARCHAR(10),GETDATE(),120) + '' ''+''08:30:00.000'')), 
HORA_ORIG_ENT = CONVERT(SMALLDATETIME,(CONVERT(VARCHAR(10),GETDATE(),120) + '' ''+''08:30:00.000''))
WHERE COMENTARIO = LTRIM(RTRIM(''NO REGISTRADO'')) AND FECHA = CONVERT(VARCHAR(10),GETDATE(),120)

--UPDATE ASISTENCIA_TEMP SET HORA_ENT = CONVERT(SMALLDATETIME,(CONVERT(VARCHAR(10),GETDATE(),120) + '' ''+''08:30:00.000''))
--WHERE COMENTARIO = LTRIM(RTRIM(''PERMISO'')) AND FECHA = CONVERT(VARCHAR(10),GETDATE(),120)

--UPDATE ASISTENCIA_TEMP SET HORA_ENT = CONVERT(SMALLDATETIME,(CONVERT(VARCHAR(10),GETDATE(),120) + '' ''+''08:30:00.000''))
--WHERE COMENTARIO = LTRIM(RTRIM(''COMISION'')) AND FECHA = CONVERT(VARCHAR(10),GETDATE(),120)
', 
		@database_name=N'ASISTENCIA_AM', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'SOLO_01_VEZ', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=126, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20180604, 
		@active_end_date=99991231, 
		@active_start_time=82515, 
		@active_end_time=235959, 
		@schedule_uid=N'8f2b85d8-69a6-4f8b-993f-a120ff6d1350'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


