USE [msdb]
GO

/****** Object:  Job [AM_INSERT PERSONAL DEL SOLOMON]    Script Date: 25/01/2020 00:27:19 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 25/01/2020 00:27:19 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'AM_INSERT PERSONAL DEL SOLOMON', 
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
/****** Object:  Step [STEP1]    Script Date: 25/01/2020 00:27:20 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'STEP1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'TRUNCATE TABLE Personal_SOLIV

INSERT INTO Personal_SOLIV (PERID, PERTIPODOC, PERPATERNO, PERMATERNO, PERNOMBRE,  
peremail, perrefzona, percargo, perdir, perdoc, peremp, perfend, perfing, perfnac, perhijos, perruc, perstatus, persexo, perzonaid, Crtd_DateTime, Crtd_User, LUpd_DateTime, LUpd_User, User1)

select 
PERID, PERTIPODOC, PERPATERNO, PERMATERNO, PERNOMBRE,  
peremail, perrefzona, percargo, perdir, perdoc, peremp, perfend, perfing, perfnac, perhijos, perruc, perstatus, persexo, perzonaid, GETDATE(), ''SUPERADMIN'', GETDATE(), ''SUPERADMIN'', User1
 from [ALTOMAYO-WEB].[AM2019APP].dbo.Personal where perstatus <> ''R''

--SELECT * 
--DELETE
--FROM HORARIOS WHERE PERID COLLATE SQL_Latin1_General_CP1_CI_AS IN  (SELECT PERID FROM [ALTOMAYO-WEB].[AM2019APP].dbo.Personal where perstatus = ''R'')

--SELECT * 
UPDATE PERSONAL SET PER_STATUS = ''I''
FROM PERSONAL WHERE PER_COD COLLATE SQL_Latin1_General_CP1_CI_AS IN  (SELECT PERID FROM [ALTOMAYO-WEB].[AM2019APP].dbo.Personal where perstatus = ''R'')', 
		@database_name=N'ASISTENCIA_AM', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'DIARIO', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20190102, 
		@active_end_date=99991231, 
		@active_start_time=71000, 
		@active_end_time=235959, 
		@schedule_uid=N'6ae3aa63-c286-4f90-9561-8ad3217fa592'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


