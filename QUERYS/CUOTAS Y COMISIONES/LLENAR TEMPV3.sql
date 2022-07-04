USE [RES2016APP]
GO

/****** Object:  Table [dbo].[TEMPFV3]    Script Date: 07/21/2016 09:32:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TEMPFV3](
	[Periodo] [varchar](6) NULL,
	[id_sup] [varchar](6) NULL,
	[nombreSup] [varchar](100) NULL,
	[vend] [varchar](6) NULL,
	[nomVen] [varchar](100) NULL,
	[zona] [varchar](6) NULL,
	[NombreZona] [varchar](100) NULL,
	[VtaTotal] [float] NULL,
	[VtaEfect] [float] NULL,
	[Avance] [float] NULL,
	[marca] [varchar](6) NULL,
	[cobT] [int] NULL,
	[cuoT] [float] NULL,
	[NumVta] [int] NULL,
	[NumDev] [int] NULL,
	[VtaALT] [float] NULL,
	[cuoALT] [float] NULL,
	[cobALT] [smallint] NULL,
	[VtaELB] [float] NULL,
	[cuoELB] [float] NULL,
	[cobELB] [smallint] NULL,
	[VtaKIM] [float] NULL,
	[cuoKIM] [float] NULL,
	[cobKIM] [smallint] NULL,
	[VtaMCH] [float] NULL,
	[cuoMCH] [float] NULL,
	[cobMCH] [smallint] NULL,
	[VtaMON] [float] NULL,
	[cuoMON] [float] NULL,
	[cobMON] [smallint] NULL,
	[VtaORI] [float] NULL,
	[cuoORI] [float] NULL,
	[cobORI] [smallint] NULL,
	[VtaOTR] [float] NULL,
	[cuoOTR] [float] NULL,
	[cobOTR] [smallint] NULL,
	[VtaRET] [float] NULL,
	[cuoRET] [float] NULL,
	[cobRET] [smallint] NULL,
	[RI_ID] [smallint] NULL,
	[fecha] [datetime] NULL,
	[VtaACL] [float] NULL,
	[cuoACL] [float] NULL,
	[cobACL] [smallint] NULL,
	[VtaATM] [float] NULL,
	[cuoATM] [float] NULL,
	[cobATM] [smallint] NULL,
	[VtaAGO] [float] NULL,
	[cuoAGO] [float] NULL,
	[cobAGO] [smallint] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TEMPFV3]
ADD [VtaACL] [float] NULL,
	[cuoACL] [float] NULL,
	[cobACL] [smallint] NULL,
	[VtaATM] [float] NULL,
	[cuoATM] [float] NULL,
	[cobATM] [smallint] NULL,
	[VtaAGO] [float] NULL,
	[cuoAGO] [float] NULL,
	[cobAGO] [smallint] NULL

[VtaACL] [float] NULL,
	[cuoACL] [float] NULL,
	[cobACL] [smallint] NULL,
	[VtaATM] [float] NULL,
	[cuoATM] [float] NULL,
	[cobATM] [smallint] NULL,
	[VtaAGO] [float] NULL,
	[cuoAGO] [float] NULL,
	[cobAGO] [smallint] NULL