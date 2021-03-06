USE [CA2015APP]
GO
/****** Object:  Table [dbo].[tb_exp_compras]    Script Date: 01/15/2016 17:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_exp_compras](
	[LOTE] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Correlativo] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvcDate] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DueDate] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[tipodoc] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[nroserie] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Anio] [int] NULL,
	[NroComp] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Consolidado] [int] NOT NULL,
	[Tipo] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ruc] [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Proveedor] [varchar](61) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GBase] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GIGV] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GNBase] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GNGIGV] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NGBase] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NGIGV] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Afecto] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ISC] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OtraTax] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TipoCambio] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FechaFactRela] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TipoCodFactRela] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SerFactRela] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CodDepnAdua] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FactRel] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NoDomiciliado] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FechaDetrac] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumeroDetrac] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Retencion] [int] NOT NULL,
	[Oportunidad] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


ALTER TABLE tb_exp_compras
  ADD tstamp timestamp;
