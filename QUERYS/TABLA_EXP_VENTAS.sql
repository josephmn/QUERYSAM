USE [CA2015APP]
GO
/****** Object:  Table [dbo].[tb_exp_ventas]    Script Date: 01/15/2016 12:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_exp_ventas](
	[Lote] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Correlativo] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FechaEmision] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FechaVenc] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TipoDoc] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NroSerieS] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NroSerie] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Numero] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UltConsoli] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TipoDocIdent] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaxLocId] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Nomb_RazonSocial] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[valFacexp] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BaseImponible] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exonerada] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Inafecto] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IGV] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OtrosTributos] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Percepcion] [float] NOT NULL,
	[ImportTotal] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TipoCambio] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FR_Fecha] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TipoDocFactRel] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FR_SerieS] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FR_Serie] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FR_NroComprob] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValorFob] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Activo] [int] NOT NULL,

) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

ALTER TABLE tb_exp_ventas
  ADD tstamp timestamp;
