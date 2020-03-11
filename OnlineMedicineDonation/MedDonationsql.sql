USE [medbox]
GO

/****** Object:  Table [dbo].[disasters]    Script Date: 3/11/2020 10:06:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[disasters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dis_name] [varchar](100) NOT NULL,
	[dis_desc] [varchar](500) NOT NULL,
	[dis_url] [varchar](300) NOT NULL,
	[dis_img] [varchar](100) NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO

USE [medbox]
GO

/****** Object:  Table [dbo].[donations]    Script Date: 3/11/2020 10:07:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[donations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[goal] [bigint] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO

USE [medbox]
GO

/****** Object:  Table [dbo].[meds]    Script Date: 3/11/2020 10:08:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[meds](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[med_name] [varchar](100) NOT NULL,
	[med_desc] [varchar](500) NOT NULL,
	[med_quantity] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO

USE [medbox]
GO

/****** Object:  Table [dbo].[users]    Script Date: 3/11/2020 10:09:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](40) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO



