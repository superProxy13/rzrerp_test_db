USE [TEST.USERMNGMNT]
GO
/****** Object:  User [superproxy]    Script Date: 8/8/2024 8:03:34 AM ******/
CREATE USER [superproxy] FOR LOGIN [superproxy] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [superproxy]
GO
/****** Object:  Table [dbo].[APP_USERS]    Script Date: 8/8/2024 8:03:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APP_USERS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_APP_USERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_COMPANIES]    Script Date: 8/8/2024 8:03:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_COMPANIES](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CompanyDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_USER_COMPANIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_ROLES]    Script Date: 8/8/2024 8:03:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_ROLES](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[RoleDescription] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_USER_ROLES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[APP_USERS] ON 

INSERT [dbo].[APP_USERS] ([Id], [Username], [Password], [RoleId], [CompanyId], [DateUpdated]) VALUES (1, N'Administrator', N'03bb8694d3f6abbcc258ca5c94776db51eb9d336bc584bb6ca56f1e7497e5c8d', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[APP_USERS] OFF
GO
SET IDENTITY_INSERT [dbo].[USER_COMPANIES] ON 

INSERT [dbo].[USER_COMPANIES] ([Id], [CompanyId], [CompanyDescription]) VALUES (1, 0, N'Unspecified')
INSERT [dbo].[USER_COMPANIES] ([Id], [CompanyId], [CompanyDescription]) VALUES (2, 1, N'ABC Inc.')
INSERT [dbo].[USER_COMPANIES] ([Id], [CompanyId], [CompanyDescription]) VALUES (3, 2, N'XYZ Group, Inc.')
SET IDENTITY_INSERT [dbo].[USER_COMPANIES] OFF
GO
SET IDENTITY_INSERT [dbo].[USER_ROLES] ON 

INSERT [dbo].[USER_ROLES] ([Id], [RoleId], [RoleDescription]) VALUES (1, 0, N'Unspecified')
INSERT [dbo].[USER_ROLES] ([Id], [RoleId], [RoleDescription]) VALUES (2, 1, N'Admin')
INSERT [dbo].[USER_ROLES] ([Id], [RoleId], [RoleDescription]) VALUES (3, 2, N'Users')
SET IDENTITY_INSERT [dbo].[USER_ROLES] OFF
GO
ALTER TABLE [dbo].[APP_USERS] ADD  CONSTRAINT [DF_APP_USERS_RoleId]  DEFAULT ((0)) FOR [RoleId]
GO
ALTER TABLE [dbo].[APP_USERS] ADD  CONSTRAINT [DF_APP_USERS_CompanyId]  DEFAULT ((0)) FOR [CompanyId]
GO
