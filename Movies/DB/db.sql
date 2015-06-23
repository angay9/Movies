USE [Movies];
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Role] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[MovieId] [int] NULL,
	[Comment] [varchar](max) NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Year] [int] NULL,
	[Released] [datetime] NULL,
	[Runtime] [int] NULL,
	[Director] [varchar](100) NULL,
	[Writer] [varchar](100) NULL,
	[Actors] [varchar](max) NULL,
	[Language] [varchar](20) NULL,
	[Country] [varchar](100) NULL,
	[Awards] [varchar](255) NULL,
	[Poster] [varchar](255) NULL,
	[ImdbRating] [decimal](2, 1) NULL,
	[ImdbVotes] [int] NULL,
	[ImdbId] [varchar](255) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/23/2015 11:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[MovieId] [int] NULL,
	[Returned] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201506222032246_Init_AutomaticMigration', N'Movies.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4941488653B2FA9B19BC059DBADD1D80EB24E5E035AE2AE894A942A725DFBDBFAD04FEA2F94D495122FA256DA5B5E02AF349C19CE1C0E6F47F9EF9F7F271F9EA3D079822941319EBA2747C7AE03B11F07082FA7EE8A2EDEBC733FBCFFF9A7C965103D3BDF4AB9B75C8EB5C464EA3E529A9C791EF11F6104C85184FC3426F1821EF971E48120F64E8F8F7FF54E4E3CC854B84C97E34CBEAC304511CC7EB09FB318FB30A12B10DEC4010C49F19CBD99675A9D5B104192001F4EDD9BF8094172940BBACE79880073620EC385EB008C630A2873F1EC2B81739AC678394FD80310DEBF2490C92D404860E1FA592D6EDB8BE353DE0BAF6EB85614DCAA7FAC87972C12F485BB97F572EA5E07307BF4250EA128C964FF802F8D07ECD1E7344E60CAA4E1A26AEF3A5EB39DD76E583513DA7017582069CA52EF3A37E0F913C44BFAC84071FACE75AED0330CCA274514BF62C490C21AD174C57EDEAEC2103C84B07AEF196DF27F0D56D99FC3AD4EBC3ABCC6A09F274988FC2CA50C39A9EB7C040416BE31681D9549C95E1ABB95A5ADE8D635A66F4FC7725174611602146D1F1CBAFE08E36E4EE314FE06314C0185C16740294C71ED7C1728B28E71632320C3C2D23710AE3660EA163CA165168F96D11C5B5F6098BD248F2851E02BF3EC7B2E7A95C611479422FD99C4F779BC4A7DDE85D828760FD225A42320EF47AE48BC7F235525B3A1CF8090BFE334F81D90C78D1B9B437F95B2ECCD2988922D623D431F1917ED258C3BD05E0E0A5B573FC54B84BB5DCDC48CAED612465705B1BEAE7265DD9E7229A3A39580D1CF5A4AE5E65AF523EBFA3A458437960B895234B3C11E3FA18047C0A24529CC3CE95FAA4ACFB65DAE5ADDDCB6F946CC366E7CD894DA6BE49AA654C5001F3C24D65DE8F71811DCC43AB3F0AEA05DFABB3B58E5CB789B329B4B1ACA6CF68F0954B5940A5383C1DF6332E8F4B237F2CF09897D94B9A79B0DBE2BD695973870EC06A97A8F964F33CECD2AA488EFECD8E3A9FB8B14D84E33D5ECA8D90AB62C9CB8EDB178872F60082974CEFDFCA06106880F0219892C7E41F3091BBE30E5B6403863C9A5294098CA631D611F2520B4EA47ABB5E56A9D7B57D969BFB98009C4DCA855BE6C1CD0D635AFB2D50A5D57A4269E00437B74D6C3DB06358AB1AE064D5E30D683A65C2A14465406F60B995237B60C4C295736F6D593E8AE70695D3415D57D43B83CFC8A29756317B83CD87A296CE56D30A33AC55283263FEE5C139AAAE3836D63531BD07CD1C49240590A602A9F465F3CF097F0994A21E50DE79036CF05EA4598724E9002D6542285CDA451484C0FB55D1A7B292BCF6D8C1A8BA5600FB55DB1AC8B654BA9906483C3C55A5C1036EF58DB20B45E1B577D54474DAA17D6AB618D62496703F64CBC67B484ED9539589A855A8FA59AA64705122C23252FCE04B54A556304C8064D9A15438F35C37801DA0592C4436673A47473589F594CD3A9B2A25A064B316F8D10AD729F5E4D39F55DBB975FB69797F29EE6567E72039204E1A5704B5F3C71E6F915FDECCDBCFFBD7894EBF07CA2B81EAFBCAD2CD138054BD87ACB4C334FAF504AE805A0E001F0139F591049627D26D8D2A438CFCA192CA78A529AFF9DB76810169AF3B1BCBA2B9A5FB1CE457C89985DA72AD2AE6EEE70C2040841AAB84C9BC5E12AC2FA15ABBE757E2526B6CF9FC81A265ECB7F69452A054A5A3635A36E9593E658583F376D12C0FAE95137DF4C7AF209526CAF5A9B141A18D603942DDFB3AB6F05F141547481889FA20861C0FAB9898477A4E79AF0BFEF16AFD463883BFCFA40B2C46DC903A97E6AAFA979792C6A6BBEB1D7D8BA211655B65E6D1D01FAC4EF5FDEA5B1D5DCD76C75608D50498BE5CA38D95210967AA74CA36333E3552022894A84C73D751554234959F17C2F2150EC14C78180E2E6BF3704343A4C45B70D03DD69995E4BEB9E5D54D6C134D0EB6C5C9E376AB89E89B027A0186B05ACBEFAEE0D897E2BE1711051DE04B4175D6A2D9BCE5973AFD751D08B4DB075CD2EE47BD765BEA9950AB269732B87CDAAAA672AD4A7DF82076B3BA73D865F7BCAD1FBD5DEB5CBC99636EF6D910A6AD526BEB5599F141BE76E9EBDB493CE455CA7AC506C71F842288C8EB8C0D1FCAF70162216C35AE00660B48084DEC77F423C754F8F4F4E5B7CFD35B8F31E2141B8CF047AFC0452FF11A4325D65003FBE54FA2A02CFAF3741283FE038D57BA88E58ADCBCC1DA450C9BE1DA451FCC000F1F1D6AF796BEB31281987F4ED4216AACEAF137A624FFA5C615066E54F1206A9ABA6C6EDE7F88767F98E56BD9424DED1B42B38BADB84C1C1305B470B7893B83A72AC47E552EE86A163B8621ECAE51C4CFED9093BF2B0183EF68C487195B25D72A2FEEA7920F36D10C034271D1B6793FDC8CCC67D2A61BBC6D72E0A9835BEF6A67EF56428EE13C00AAADD3086E4C1414C776FA4C698E620707490B54EE1CAED9BC43DD19CADABCEA9BA989BF9E9DBD40D1E6206827CE9784E925B48D5C4329DB11CBD5A63C569AFD6989A6E64325620D368B190319B55D3A7BAF9A176F450B36D3565B293446AC521355B5667779744532D0DAD1FA3D44C4F3D0426A99861999CD5871369A4571E0A6774382EB61D8A0DB2428707A3513735776E1BA17DCA37446CA614FEBF26365F13B4AC5570DE0B867E638EAC64AEF1222EE7EA9647A548EB04E5065210B009F43CA568017CCA5EFB9090EC03E0825773193DC0E01ADFAD68B2A2ACCB307A081B277A7CCA37D9CFB8AD4D9F277749F609ED185D606E22D60578873FAE5018547E5F298E7A342AF85AA238A7E6B9A4FCBC7AF95269BA8DB1A5A2227CD512E81E4649C894913B3C074F50EF5B770C9B119B5C20B04C41440A1D757BF693C12F889EDFFF0F6B9D53ED714C0000, N'6.0.0-20911')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201506222032247_Init', N'Movies.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4941488653B2FA9B19BC059DBADD1D80EB24E5E035AE2AE894A942A725DFBDBFAD04FEA2F94D495122FA256DA5B5E02AF349C19CE1C0E6F47F9EF9F7F271F9EA3D079822941319EBA2747C7AE03B11F07082FA7EE8A2EDEBC733FBCFFF9A7C965103D3BDF4AB9B75C8EB5C464EA3E529A9C791EF11F6104C85184FC3426F1821EF971E48120F64E8F8F7FF54E4E3CC854B84C97E34CBEAC304511CC7EB09FB318FB30A12B10DEC4010C49F19CBD99675A9D5B104192001F4EDD9BF8094172940BBACE79880073620EC385EB008C630A2873F1EC2B81739AC678394FD80310DEBF2490C92D404860E1FA592D6EDB8BE353DE0BAF6EB85614DCAA7FAC87972C12F485BB97F572EA5E07307BF4250EA128C964FF802F8D07ECD1E7344E60CAA4E1A26AEF3A5EB39DD76E583513DA7017582069CA52EF3A37E0F913C44BFAC84071FACE75AED0330CCA274514BF62C490C21AD174C57EDEAEC2103C84B07AEF196DF27F0D56D99FC3AD4EBC3ABCC6A09F274988FC2CA50C39A9EB7C040416BE31681D9549C95E1ABB95A5ADE8D635A66F4FC7725174611602146D1F1CBAFE08E36E4EE314FE06314C0185C16740294C71ED7C1728B28E71632320C3C2D23710AE3660EA163CA165168F96D11C5B5F6098BD248F2851E02BF3EC7B2E7A95C611479422FD99C4F779BC4A7DDE85D828760FD225A42320EF47AE48BC7F235525B3A1CF8090BFE334F81D90C78D1B9B437F95B2ECCD2988922D623D431F1917ED258C3BD05E0E0A5B573FC54B84BB5DCDC48CAED612465705B1BEAE7265DD9E7229A3A39580D1CF5A4AE5E65AF523EBFA3A458437960B895234B3C11E3FA18047C0A24529CC3CE95FAA4ACFB65DAE5ADDDCB6F946CC366E7CD894DA6BE49AA654C5001F3C24D65DE8F71811DCC43AB3F0AEA05DFABB3B58E5CB789B329B4B1ACA6CF68F0954B5940A5383C1DF6332E8F4B237F2CF09897D94B9A79B0DBE2BD695973870EC06A97A8F964F33CECD2AA488EFECD8E3A9FB8B14D84E33D5ECA8D90AB62C9CB8EDB178872F60082974CEFDFCA06106880F0219892C7E41F3091BBE30E5B6403863C9A5294098CA631D611F2520B4EA47ABB5E56A9D7B57D969BFB98009C4DCA855BE6C1CD0D635AFB2D50A5D57A4269E00437B74D6C3DB06358AB1AE064D5E30D683A65C2A14465406F60B995237B60C4C295736F6D593E8AE70695D3415D57D43B83CFC8A29756317B83CD87A296CE56D30A33AC55283263FEE5C139AAAE3836D63531BD07CD1C49240590A602A9F465F3CF097F0994A21E50DE79036CF05EA4598724E9002D6542285CDA451484C0FB55D1A7B292BCF6D8C1A8BA5600FB55DB1AC8B654BA9906483C3C55A5C1036EF58DB20B45E1B577D54474DAA17D6AB618D62496703F64CBC67B484ED9539589A855A8FA59AA64705122C23252FCE04B54A556304C8064D9A15438F35C37801DA0592C4436673A47473589F594CD3A9B2A25A064B316F8D10AD729F5E4D39F55DBB975FB69797F29EE6567E72039204E1A5704B5F3C71E6F915FDECCDBCFFBD7894EBF07CA2B81EAFBCAD2CD138054BD87ACB4C334FAF504AE805A0E001F0139F591049627D26D8D2A438CFCA192CA78A529AFF9DB76810169AF3B1BCBA2B9A5FB1CE457C89985DA72AD2AE6EEE70C2040841AAB84C9BC5E12AC2FA15ABBE757E2526B6CF9FC81A265ECB7F69452A054A5A3635A36E9593E658583F376D12C0FAE95137DF4C7AF209526CAF5A9B141A18D603942DDFB3AB6F05F141547481889FA20861C0FAB9898477A4E79AF0BFEF16AFD463883BFCFA40B2C46DC903A97E6AAFA979792C6A6BBEB1D7D8BA211655B65E6D1D01FAC4EF5FDEA5B1D5DCD76C75608D50498BE5CA38D95210967AA74CA36333E3552022894A84C73D751554234959F17C2F2150EC14C78180E2E6BF3704343A4C45B70D03DD69995E4BEB9E5D54D6C134D0EB6C5C9E376AB89E89B027A0186B05ACBEFAEE0D897E2BE1711051DE04B4175D6A2D9BCE5973AFD751D08B4DB075CD2EE47BD765BEA9950AB269732B87CDAAAA672AD4A7DF82076B3BA73D865F7BCAD1FBD5DEB5CBC99636EF6D910A6AD526BEB5599F141BE76E9EBDB493CE455CA7AC506C71F842288C8EB8C0D1FCAF70162216C35AE00660B48084DEC77F423C754F8F4F4E5B7CFD35B8F31E2141B8CF047AFC0452FF11A4325D65003FBE54FA2A02CFAF3741283FE038D57BA88E58ADCBCC1DA450C9BE1DA451FCC000F1F1D6AF796BEB31281987F4ED4216AACEAF137A624FFA5C615066E54F1206A9ABA6C6EDE7F88767F98E56BD9424DED1B42B38BADB84C1C1305B470B7893B83A72AC47E552EE86A163B8621ECAE51C4CFED9093BF2B0183EF68C487195B25D72A2FEEA7920F36D10C034271D1B6793FDC8CCC67D2A61BBC6D72E0A9835BEF6A67EF56428EE13C00AAADD3086E4C1414C776FA4C698E620707490B54EE1CAED9BC43DD19CADABCEA9BA989BF9E9DBD40D1E6206827CE9784E925B48D5C4329DB11CBD5A63C569AFD6989A6E64325620D368B190319B55D3A7BAF9A176F450B36D3565B293446AC521355B5667779744532D0DAD1FA3D44C4F3D0426A99861999CD5871369A4571E0A6774382EB61D8A0DB2428707A3513735776E1BA17DCA37446CA614FEBF26365F13B4AC5570DE0B867E638EAC64AEF1222EE7EA9647A548EB04E5065210B009F43CA568017CCA5EFB9090EC03E0825773193DC0E01ADFAD68B2A2ACCB307A081B277A7CCA37D9CFB8AD4D9F277749F609ED185D606E22D60578873FAE5018547E5F298E7A342AF85AA238A7E6B9A4FCBC7AF95269BA8DB1A5A2227CD512E81E4649C894913B3C074F50EF5B770C9B119B5C20B04C41440A1D757BF693C12F889EDFFF0F6B9D53ED714C0000, N'6.0.0-20911')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Role], [Discriminator]) VALUES (N'0b835574-2fa1-4d3d-bf36-9e692212a164', N'user', N'AMpDfR2R18IMpAJX9csWIkQ80dUYwk5Aoql+afOmBljHU+wL4DpwOwAIUGm4uL1wRg==', N'6f092ac5-29bf-45fb-b966-96e6a0d2149f', 0, N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Role], [Discriminator]) VALUES (N'ccb764af-70fd-44da-b3dc-b348353556a4', N'admin', N'AMbc/ATJbiOYXdTiWC31j8qvkXrDOjD46FWVvddsMjffV/KzjEpmgoJ2II+GGnqK/Q==', N'79e88ed9-0a27-47ce-8b68-a28ceff3e3c2', 1, N'ApplicationUser')
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Title], [Year], [Released], [Runtime], [Director], [Writer], [Actors], [Language], [Country], [Awards], [Poster], [ImdbRating], [ImdbVotes], [ImdbId]) VALUES (1, N'Mad Max 2: The Road Warrior', 1981, CAST(0x0000758A00000000 AS DateTime), 95, N'George Miller', N'Terry Hayes (screenplay), George Miller (screenplay)', N'Mel Gibson, Bruce Spence, Michael Preston, Max Phipps', N'English', N'Australia', N'8 wins & 9 nominations.', N'http://ia.media-imdb.com/images/M/MV5BMTcxMDUyODY1OF5BMl5BanBnXkFtZTYwOTQzNDk4._V1_SX300.jpg', CAST(7.6 AS Decimal(2, 1)), 110413, N'tt0082694')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Released], [Runtime], [Director], [Writer], [Actors], [Language], [Country], [Awards], [Poster], [ImdbRating], [ImdbVotes], [ImdbId]) VALUES (2, N'Harry Potter and the Sorcerer''s Stone', 2001, CAST(0x0000915900000000 AS DateTime), 152, N'Chris Columbus', N'J.K. Rowling (novel), Steve Kloves (screenplay)', N'Richard Harris, Maggie Smith, Robbie Coltrane, Saunders Triplets', N'English', N'UK, USA', N'Nominated for 3 Oscars. Another 15 wins & 59 nominations.', N'http://ia.media-imdb.com/images/M/MV5BMTYwNTM5NDkzNV5BMl5BanBnXkFtZTYwODQ4MzY5._V1_SX300.jpg', CAST(7.5 AS Decimal(2, 1)), 386302, N'tt0241527')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Released], [Runtime], [Director], [Writer], [Actors], [Language], [Country], [Awards], [Poster], [ImdbRating], [ImdbVotes], [ImdbId]) VALUES (3, N'Rocky Balboa', 2006, CAST(0x0000989D00000000 AS DateTime), 102, N'Sylvester Stallone', N'Sylvester Stallone, Sylvester Stallone (characters)', N'Sylvester Stallone, Burt Young, Antonio Tarver, Geraldine Hughes', N'English, Spanish', N'USA', N'1 nomination.', N'http://ia.media-imdb.com/images/M/MV5BMTM2OTUzNDE3NV5BMl5BanBnXkFtZTcwODczMzkzMQ@@._V1_SX300.jpg', CAST(7.2 AS Decimal(2, 1)), 140069, N'tt0479143')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Released], [Runtime], [Director], [Writer], [Actors], [Language], [Country], [Awards], [Poster], [ImdbRating], [ImdbVotes], [ImdbId]) VALUES (4, N'Rambo', 1986, CAST(0x00007B1A00000000 AS DateTime), 30, N'N/A', N'N/A', N'Neil Ross, James Avery, Mona Marshall, Alan Oppenheimer', N'English', N'USA', N'N/A', N'N/A', CAST(6.7 AS Decimal(2, 1)), 307, N'tt0222619')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [UserId], [MovieId], [Returned]) VALUES (1, N'0b835574-2fa1-4d3d-bf36-9e692212a164', 2, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__MovieI__4222D4EF] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK__Feedback__MovieI__4222D4EF]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__UserId__412EB0B6] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK__Feedback__UserId__412EB0B6]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__MovieId__619B8048] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__MovieId__619B8048]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__UserId__628FA481] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__UserId__628FA481]
GO
