USE [Line2u_Peter]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountGroup]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[GroupNO] [nvarchar](100) NULL,
	[GroupName] [nvarchar](200) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AccountGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountPermission]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountPermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpperGuid] [nvarchar](40) NULL,
	[AccountID] [int] NULL,
	[CodeNO] [nvarchar](25) NULL,
	[Guid] [nvarchar](40) NULL,
 CONSTRAINT [PK_AccountPermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountRole]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountGuid] [nvarchar](40) NULL,
	[AccountID] [int] NULL,
	[CodeNO] [nvarchar](25) NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_AccountRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[NO] [nvarchar](20) NULL,
	[RFID] [nvarchar](20) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[AccountRole] [char](1) NULL,
	[LicensePath] [nvarchar](100) NULL,
	[PhotoPath] [nvarchar](100) NULL,
	[Comment] [ntext] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[LastLogin] [datetime2](7) NULL,
	[LastUse] [datetime2](7) NULL,
	[PigAppLoginErrorTimes] [int] NOT NULL,
	[EquipmentAppLoginErrorTimes] [int] NOT NULL,
	[WebLoginErrorTimes] [int] NOT NULL,
	[PigAppLockedAt] [datetime2](7) NULL,
	[EquipmentAppLockedAt] [datetime2](7) NULL,
	[AccountTypeID] [int] NULL,
	[AccountGroupID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Guid] [nvarchar](40) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](100) NULL,
 CONSTRAINT [PK_AccountTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionInFunctionSystem]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionInFunctionSystem](
	[FunctionSystemID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
 CONSTRAINT [PK_ActionInFunctionSystem] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[FunctionSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[VN] [nvarchar](max) NULL,
	[CN] [nvarchar](200) NULL,
	[EN] [nvarchar](200) NULL,
	[Sequence] [int] NOT NULL,
	[TW] [nvarchar](200) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOM]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FoodID] [int] NOT NULL,
	[PigKindID] [int] NOT NULL,
	[VaccineID] [int] NULL,
	[FeedingID] [int] NOT NULL,
	[MethodID] [int] NULL,
	[DailyFeeding] [float] NOT NULL,
	[FromDaysOld] [float] NOT NULL,
	[ToDaysOld] [float] NOT NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_BOM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodePermission]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodePermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](25) NULL,
	[Name] [nvarchar](20) NULL,
	[NO] [nvarchar](20) NULL,
	[Comment] [ntext] NULL,
	[CodeNameEN] [nvarchar](255) NULL,
	[CodeNameCN] [nvarchar](255) NULL,
	[CodeNameVN] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_CodePermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[NO] [nvarchar](20) NULL,
	[Sex] [bit] NOT NULL,
	[NickName] [nvarchar](20) NULL,
	[Tel] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[AddressDomicile] [nvarchar](100) NULL,
	[IDCard] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Comment] [ntext] NULL,
	[Unit] [nvarchar](100) NULL,
	[Dept] [nvarchar](100) NULL,
	[Level] [nvarchar](20) NULL,
	[ContactName] [nvarchar](100) NULL,
	[ContactTel] [nvarchar](20) NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmAccount]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FarmID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_FarmAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feeding]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeding](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Feeding] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunctionSystem]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionSystem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NULL,
	[VN] [nvarchar](200) NULL,
	[EN] [nvarchar](200) NULL,
	[CN] [nvarchar](200) NULL,
	[TW] [nvarchar](200) NULL,
	[Level] [int] NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Sequence] [int] NOT NULL,
	[Icon] [nvarchar](100) NULL,
	[ParentID] [int] NULL,
	[ModuleID] [int] NULL,
 CONSTRAINT [PK_FunctionSystem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Methods]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Methods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Methods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[VN] [nvarchar](200) NULL,
	[EN] [nvarchar](200) NULL,
	[CN] [nvarchar](200) NULL,
	[TW] [nvarchar](200) NULL,
	[Url] [nvarchar](200) NULL,
	[Icon] [nvarchar](200) NULL,
	[Sequence] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultiChoiceCountyTownShip]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiChoiceCountyTownShip](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpperGuid] [nvarchar](40) NULL,
	[AccountGuid] [nvarchar](40) NULL,
	[AccountID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[TownShipID] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateBy] [int] NOT NULL,
 CONSTRAINT [PK_MultiChoiceCountyTownShip] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OC]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NO] [nvarchar](100) NULL,
	[Type] [nvarchar](20) NULL,
	[Name] [nvarchar](200) NULL,
	[Principal] [nvarchar](200) NULL,
	[Level] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[GGP] [int] NOT NULL,
	[GP] [int] NOT NULL,
	[PMPF] [int] NOT NULL,
	[Semen] [int] NOT NULL,
	[Nursery] [int] NOT NULL,
	[Grower] [int] NOT NULL,
	[Comment] [ntext] NULL,
	[ParentID] [int] NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
	[Latitude] [nvarchar](100) NULL,
	[Longtitude] [nvarchar](100) NULL,
	[TemptureLowLimit] [nvarchar](100) NULL,
	[TemptureTopLimit] [nvarchar](100) NULL,
	[PhotoPath] [nvarchar](100) NULL,
 CONSTRAINT [PK_OC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[RoleID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
	[FunctionSystemID] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[FunctionSystemID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PigKind]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PigKind](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PigKind] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pigs]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pigs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[PigKindID] [int] NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Pigs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicCodeType]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicCodeType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NULL,
	[NO] [varchar](10) NULL,
	[CancelFlag] [char](1) NOT NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PublicCodeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicCountyTownShip]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicCountyTownShip](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [varchar](10) NULL,
	[TownShip] [varchar](10) NULL,
	[UpperGuid] [nvarchar](40) NULL,
	[CancelFlag] [char](1) NOT NULL,
	[Guid] [nvarchar](40) NULL,
 CONSTRAINT [PK_PublicCountyTownShip] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicMemo]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicMemo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpperGuid] [nvarchar](40) NULL,
	[MemoProject] [nvarchar](40) NULL,
	[Memo] [ntext] NULL,
	[MemoYearsStart] [int] NULL,
	[MemoYearsEnd] [int] NULL,
	[MemoDate] [datetime2](7) NULL,
	[PaymentCode] [nvarchar](40) NULL,
	[AccountID] [int] NOT NULL,
	[Guid] [nvarchar](40) NULL,
	[CancelFlag] [char](1) NULL,
	[Temp_Flag] [bit] NOT NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PublicMemo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicPaymentCode]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicPaymentCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpperGuid] [nvarchar](40) NULL,
	[AccountGuid] [nvarchar](40) NULL,
	[PaymentCode] [nvarchar](40) NULL,
	[AccountID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PublicPaymentCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicReaded]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicReaded](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpperGuid] [nvarchar](40) NULL,
	[AccountGuid] [nvarchar](40) NULL,
	[AccountID] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PublicReaded] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Token] [nvarchar](450) NOT NULL,
	[JwtId] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[Used] [bit] NOT NULL,
	[Invalidated] [bit] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[VN] [nvarchar](200) NULL,
	[EN] [nvarchar](200) NULL,
	[CN] [nvarchar](200) NULL,
	[TW] [nvarchar](200) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](25) NULL,
	[Value] [nvarchar](10) NULL,
	[NO] [nvarchar](20) NULL,
	[Sort] [int] NOT NULL,
	[WebBuildingID] [int] NOT NULL,
	[Comment] [ntext] NULL,
	[AccountID] [int] NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemLanguage]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemLanguage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SLPage] [nvarchar](50) NULL,
	[SLType] [nvarchar](50) NULL,
	[SLKey] [nvarchar](50) NULL,
	[Comment] [nvarchar](100) NULL,
	[SLTW] [nvarchar](500) NULL,
	[SLEN] [nvarchar](500) NULL,
	[SLCN] [nvarchar](500) NULL,
	[SLVN] [nvarchar](500) NULL,
 CONSTRAINT [PK_SystemLanguage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemLogUser]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemLogUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Page] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Key] [nvarchar](50) NULL,
	[Comment] [nvarchar](100) NULL,
	[TW] [nvarchar](500) NULL,
	[EN] [nvarchar](500) NULL,
	[CN] [nvarchar](500) NULL,
	[VN] [nvarchar](500) NULL,
 CONSTRAINT [PK_SystemLogUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccines]    Script Date: 11/20/2021 16:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[DeleteBy] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Vaccines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211117032802_InitialDb', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211117151011_UpdateOC', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211118063350_UpdateOcV5', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211119091829_AddPermission', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120063339_UpdateAction', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120063701_UpdateActionv2', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[AccountGroup] ON 

INSERT [dbo].[AccountGroup] ([ID], [ZoneID], [BuildingID], [GroupNO], [GroupName], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (1, 1, 1, N'ADMIN', N'Admin', 1, 3, 3, NULL, CAST(N'2021-11-18T09:30:20.4677656' AS DateTime2), CAST(N'2021-11-19T13:46:11.5518529' AS DateTime2), NULL)
INSERT [dbo].[AccountGroup] ([ID], [ZoneID], [BuildingID], [GroupNO], [GroupName], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (2, 0, 0, N'USER_NORMAL', N'User Normal', 1, 3, NULL, NULL, CAST(N'2021-11-20T00:49:08.1125530' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[AccountGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountPermission] ON 

INSERT [dbo].[AccountPermission] ([ID], [UpperGuid], [AccountID], [CodeNO], [Guid]) VALUES (2, N'1', NULL, N'1', NULL)
SET IDENTITY_INSERT [dbo].[AccountPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountRole] ON 

INSERT [dbo].[AccountRole] ([ID], [AccountGuid], [AccountID], [CodeNO], [RoleID]) VALUES (1, N'Admin', NULL, N'Admin', 0)
INSERT [dbo].[AccountRole] ([ID], [AccountGuid], [AccountID], [CodeNO], [RoleID]) VALUES (2, N'User', NULL, N'User', 0)
SET IDENTITY_INSERT [dbo].[AccountRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([ID], [Name], [NO], [RFID], [Username], [Password], [AccountRole], [LicensePath], [PhotoPath], [Comment], [StartDate], [EndDate], [LastLogin], [LastUse], [PigAppLoginErrorTimes], [EquipmentAppLoginErrorTimes], [WebLoginErrorTimes], [PigAppLockedAt], [EquipmentAppLockedAt], [AccountTypeID], [AccountGroupID], [EmployeeID], [Guid], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (3, N'peter', N'1', N'1', N'peter', N'8Azyga8DO7g=', NULL, NULL, N'', NULL, NULL, NULL, CAST(N'2021-11-20T16:26:07.2829683' AS DateTime2), CAST(N'2021-11-20T16:25:45.6524586' AS DateTime2), 0, 0, 0, NULL, NULL, NULL, 1, 1, NULL, 1, 3, 0, NULL, CAST(N'2021-11-15T09:49:07.6378428' AS DateTime2), CAST(N'2021-11-20T16:26:07.2865689' AS DateTime2), NULL)
INSERT [dbo].[Accounts] ([ID], [Name], [NO], [RFID], [Username], [Password], [AccountRole], [LicensePath], [PhotoPath], [Comment], [StartDate], [EndDate], [LastLogin], [LastUse], [PigAppLoginErrorTimes], [EquipmentAppLoginErrorTimes], [WebLoginErrorTimes], [PigAppLockedAt], [EquipmentAppLockedAt], [AccountTypeID], [AccountGroupID], [EmployeeID], [Guid], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (6, N'leo', N'leo', NULL, N'leo', N'8Azyga8DO7g=', NULL, NULL, NULL, N'a', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 1, 2, NULL, 1, 3, NULL, NULL, CAST(N'2021-11-18T11:19:26.1734518' AS DateTime2), NULL, NULL)
INSERT [dbo].[Accounts] ([ID], [Name], [NO], [RFID], [Username], [Password], [AccountRole], [LicensePath], [PhotoPath], [Comment], [StartDate], [EndDate], [LastLogin], [LastUse], [PigAppLoginErrorTimes], [EquipmentAppLoginErrorTimes], [WebLoginErrorTimes], [PigAppLockedAt], [EquipmentAppLockedAt], [AccountTypeID], [AccountGroupID], [EmployeeID], [Guid], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (7, N'henry', N'henry', NULL, N'henry', N'8Azyga8DO7g=', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-20T16:25:49.5627349' AS DateTime2), CAST(N'2021-11-20T16:26:03.9968787' AS DateTime2), 0, 0, 0, NULL, NULL, NULL, 2, 3, NULL, 1, 3, 7, NULL, CAST(N'2021-11-18T15:15:28.9315641' AS DateTime2), CAST(N'2021-11-20T16:26:03.9987132' AS DateTime2), NULL)
INSERT [dbo].[Accounts] ([ID], [Name], [NO], [RFID], [Username], [Password], [AccountRole], [LicensePath], [PhotoPath], [Comment], [StartDate], [EndDate], [LastLogin], [LastUse], [PigAppLoginErrorTimes], [EquipmentAppLoginErrorTimes], [WebLoginErrorTimes], [PigAppLockedAt], [EquipmentAppLockedAt], [AccountTypeID], [AccountGroupID], [EmployeeID], [Guid], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (8, N'Cherry', N'Cherry', NULL, N'Cherry', N'8Azyga8DO7g=', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 1, 3, NULL, 1, 3, 3, NULL, CAST(N'2021-11-20T00:33:30.4834143' AS DateTime2), CAST(N'2021-11-20T00:43:59.2488011' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountTypes] ON 

INSERT [dbo].[AccountTypes] ([ID], [Name], [Code]) VALUES (1, N'1', N'12345')
INSERT [dbo].[AccountTypes] ([ID], [Name], [Code]) VALUES (2, N'a', N'a')
SET IDENTITY_INSERT [dbo].[AccountTypes] OFF
GO
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (4, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (5, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (6, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (7, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (8, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (9, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (10, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (11, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (12, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (13, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (24, 1)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (4, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (5, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (6, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (7, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (8, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (9, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (10, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (11, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (12, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (13, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (24, 2)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (4, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (5, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (6, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (7, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (8, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (9, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (10, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (11, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (12, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (13, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (24, 3)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (4, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (5, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (6, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (7, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (8, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (9, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (10, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (11, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (12, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (13, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (24, 4)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (4, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (5, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (6, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (7, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (8, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (9, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (10, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (11, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (12, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (13, 5)
INSERT [dbo].[ActionInFunctionSystem] ([FunctionSystemID], [ActionID]) VALUES (24, 5)
GO
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([ID], [Code], [VN], [CN], [EN], [Sequence], [TW]) VALUES (1, N'Read', N'Read', N'Read', N'Read', 0, N'Read')
INSERT [dbo].[Actions] ([ID], [Code], [VN], [CN], [EN], [Sequence], [TW]) VALUES (2, N'Add', N'Add', N'Add', N'Add', 0, N'Add')
INSERT [dbo].[Actions] ([ID], [Code], [VN], [CN], [EN], [Sequence], [TW]) VALUES (3, N'Edit', N'Edit', N'Edit', N'Edit', 0, N'Edit')
INSERT [dbo].[Actions] ([ID], [Code], [VN], [CN], [EN], [Sequence], [TW]) VALUES (4, N'Delete', N'Delete', N'Delete', N'Delete', 0, N'Delete')
INSERT [dbo].[Actions] ([ID], [Code], [VN], [CN], [EN], [Sequence], [TW]) VALUES (5, N'ExcelExport', N'Excel Export', N'Excel Export', N'Excel Export', 0, N'Excel Export')
SET IDENTITY_INSERT [dbo].[Actions] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [Name], [NO], [Sex], [NickName], [Tel], [Mobile], [Address], [AddressDomicile], [IDCard], [Email], [Comment], [Unit], [Dept], [Level], [ContactName], [ContactTel], [BirthDay], [StartDate], [EndDate], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (1, N'peter2', N'PETER2', 0, N'Tran Phuong Thanh', NULL, NULL, NULL, NULL, N'60212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-13T20:00:00.0000000' AS DateTime2), NULL, NULL, 1, 0, 0, NULL, CAST(N'2021-11-15T09:50:06.4356728' AS DateTime2), CAST(N'2021-11-18T10:22:51.0201380' AS DateTime2), NULL)
INSERT [dbo].[Employees] ([ID], [Name], [NO], [Sex], [NickName], [Tel], [Mobile], [Address], [AddressDomicile], [IDCard], [Email], [Comment], [Unit], [Dept], [Level], [ContactName], [ContactTel], [BirthDay], [StartDate], [EndDate], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (2, N'Leo', N'Leo', 0, N'Leo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, 0, NULL, 3, CAST(N'2021-11-18T10:23:11.6406153' AS DateTime2), NULL, CAST(N'2021-11-18T18:28:18.0088129' AS DateTime2))
INSERT [dbo].[Employees] ([ID], [Name], [NO], [Sex], [NickName], [Tel], [Mobile], [Address], [AddressDomicile], [IDCard], [Email], [Comment], [Unit], [Dept], [Level], [ContactName], [ContactTel], [BirthDay], [StartDate], [EndDate], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (3, N'henry', N'henry', 0, N'henry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, 0, NULL, NULL, CAST(N'2021-11-18T16:38:05.8680338' AS DateTime2), NULL, NULL)
INSERT [dbo].[Employees] ([ID], [Name], [NO], [Sex], [NickName], [Tel], [Mobile], [Address], [AddressDomicile], [IDCard], [Email], [Comment], [Unit], [Dept], [Level], [ContactName], [ContactTel], [BirthDay], [StartDate], [EndDate], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate]) VALUES (4, N'swook', N'swook', 0, N'swook', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 0, NULL, 3, CAST(N'2021-11-18T18:19:31.4461359' AS DateTime2), NULL, CAST(N'2021-11-18T18:30:03.0568098' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[FarmAccount] ON 

INSERT [dbo].[FarmAccount] ([ID], [FarmID], [AccountID]) VALUES (12, 1, 3)
INSERT [dbo].[FarmAccount] ([ID], [FarmID], [AccountID]) VALUES (13, 1, 8)
INSERT [dbo].[FarmAccount] ([ID], [FarmID], [AccountID]) VALUES (14, 9, 7)
SET IDENTITY_INSERT [dbo].[FarmAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[FunctionSystem] ON 

INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (4, N'Account Type', N'Account Type', N'Account Type', N'Account Type', N'Account Type', 1, N'/system/account-type', 1, N'fas fa-caret-right', NULL, 2)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (5, N'Account Role', N'Account Role', N'Account Role', N'Account Role', N'Account Role', 1, N'/system/account-role', 2, N'fas fa-caret-right', NULL, 2)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (6, N'Account Group', N'Account Group', N'Account Group', N'Account Group', N'Account Group', 1, N'/system/account-group', 3, N'fas fa-caret-right', NULL, 2)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (7, N'Account Permission', N'Account Permission', N'Account Permission', N'Account Permission', N'Account Permission', 1, N'/system/account-permission', 4, N'fas fa-caret-right', NULL, 2)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (8, N'Employee', N'Employee', N'Employee', N'Employee', N'Employee', 1, N'/system/employee', 5, N'fas fa-caret-right', NULL, 2)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (9, N'Account', N'Account', N'Account', N'Account', N'Account', 1, N'/system/account', 6, N'fas fa-caret-right', NULL, 2)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (10, N'Farm', N'Farm', N'Farm', N'Farm', N'Farm', 1, N'/system/farm-setting', 1, N'fas fa-caret-right', NULL, 3)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (11, N'Module', N'Module', N'Module', N'Module', N'Module', 1, N'/system/module', 1, N'fas fa-caret-right', NULL, 8)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (12, N'Action', N'Action', N'Action', N'Action', N'Action', 1, N'/system/action', 1, N'fas fa-caret-right', NULL, 8)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (13, N'Function System', N'Function System', N'Function System', N'Function System', N'Function System', 1, N'/system/function-system', 1, N'fas fa-caret-right', NULL, 8)
INSERT [dbo].[FunctionSystem] ([ID], [Code], [VN], [EN], [CN], [TW], [Level], [Url], [Sequence], [Icon], [ParentID], [ModuleID]) VALUES (24, N'System Language', N'System Language', N'System Language', N'System Language', N'System Language', 1, N'/system/system-language', 1, N'fas fa-caret-right', NULL, 8)
SET IDENTITY_INSERT [dbo].[FunctionSystem] OFF
GO
SET IDENTITY_INSERT [dbo].[Module] ON 

INSERT [dbo].[Module] ([ID], [Code], [VN], [EN], [CN], [TW], [Url], [Icon], [Sequence], [CreatedTime]) VALUES (2, N'Account Setting', N'1. Account Setting', N'1. Account Setting', N'Account Setting', N'1. Account Setting', N'/system
', N'fas fa-users', 1, CAST(N'2021-11-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Module] ([ID], [Code], [VN], [EN], [CN], [TW], [Url], [Icon], [Sequence], [CreatedTime]) VALUES (3, N'Farm Setting', N'2. Farm Setting', N'2. Farm Setting', N'2. Farm Setting', N'2. Farm Setting', N'/system/farm-setting', N'fas fa-tools', 2, CAST(N'2021-11-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Module] ([ID], [Code], [VN], [EN], [CN], [TW], [Url], [Icon], [Sequence], [CreatedTime]) VALUES (4, N'BOM', N'3.BOM', N'3.BOM', N'3.BOM', N'3.BOM', N'/system
', N'fas fa-calendar-check', 3, CAST(N'2021-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Module] ([ID], [Code], [VN], [EN], [CN], [TW], [Url], [Icon], [Sequence], [CreatedTime]) VALUES (5, N'System Language', N'4. System Language', N'4. System Language', N'4. System Language', N'4. System Language', N'/system/system-language', N'fa-cogs fas', 4, CAST(N'2021-11-22T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Module] ([ID], [Code], [VN], [EN], [CN], [TW], [Url], [Icon], [Sequence], [CreatedTime]) VALUES (8, N'System', N'0. System', N'0. System', N'0. System', N'0. System', NULL, N'fa-cogs fas', 0, CAST(N'2021-11-22T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Module] OFF
GO
SET IDENTITY_INSERT [dbo].[OC] ON 

INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (1, N'1', N'1', N'Farm 1', N'1', 1, 10, 10, 0, 0, 0, 0, 0, 0, N'', NULL, 1, 3, 3, NULL, CAST(N'2021-11-17T10:31:37.0025519' AS DateTime2), CAST(N'2021-11-18T08:44:42.2533107' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (2, N'', N'', N'Farm 2', N'', 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', NULL, 0, 3, NULL, 3, CAST(N'2021-11-17T10:31:43.5341365' AS DateTime2), NULL, CAST(N'2021-11-18T11:05:04.3757615' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (3, N'', N'', N'Farm 3', N'', 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', NULL, 0, 3, NULL, 3, CAST(N'2021-11-17T10:31:48.6731143' AS DateTime2), NULL, CAST(N'2021-11-18T08:35:25.5288159' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (4, NULL, NULL, N'Area', NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 3, 0, NULL, CAST(N'2021-11-17T13:36:30.9223160' AS DateTime2), CAST(N'2021-11-18T16:37:40.1806065' AS DateTime2), NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (5, NULL, NULL, N'Barn', NULL, 3, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 4, 1, 3, 0, NULL, CAST(N'2021-11-18T10:21:23.7065854' AS DateTime2), CAST(N'2021-11-18T16:36:02.5395356' AS DateTime2), NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (6, NULL, NULL, N'Room', NULL, 4, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 5, 1, 3, 3, NULL, CAST(N'2021-11-18T10:21:38.1701064' AS DateTime2), CAST(N'2021-11-18T16:31:38.3977846' AS DateTime2), NULL, NULL, NULL, NULL, NULL, N'/FileUploads/images/farm/avatar/HLvy0zPUC0TACZGeEqhG202111181631383870.jpg')
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (8, NULL, NULL, N'Culling Tank', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 3, 3, 3, CAST(N'2021-11-18T14:02:17.9016207' AS DateTime2), CAST(N'2021-11-18T15:35:54.1962818' AS DateTime2), CAST(N'2021-11-18T15:39:34.2961223' AS DateTime2), NULL, NULL, NULL, NULL, N'/FileUploads/images/farm/avatar/LMP8kTsBpIQsfDalgvDy202111181535536242.png')
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (9, NULL, NULL, N'Farm 2', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 3, NULL, NULL, CAST(N'2021-11-20T00:26:18.2025192' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, N'/FileUploads/images/farm/avatar/h34rSePY5UiYZTC3JJy1202111200026178881.png')
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (10, NULL, NULL, N'Farm 3', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 3, NULL, NULL, CAST(N'2021-11-20T00:32:59.2749252' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (11, NULL, NULL, N'Area 2', NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 9, 1, 3, NULL, NULL, CAST(N'2021-11-20T07:49:46.8849721' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OC] ([ID], [NO], [Type], [Name], [Principal], [Level], [Length], [Width], [GGP], [GP], [PMPF], [Semen], [Nursery], [Grower], [Comment], [ParentID], [Status], [CreateBy], [UpdateBy], [DeleteBy], [CreateDate], [UpdateDate], [DeleteDate], [Latitude], [Longtitude], [TemptureLowLimit], [TemptureTopLimit], [PhotoPath]) VALUES (12, NULL, NULL, N'Area 3', NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 10, 1, 3, NULL, NULL, CAST(N'2021-11-20T07:49:55.3595082' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OC] OFF
GO
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 4)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 5)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 6)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 7)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 8)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 9)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 10)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (2, 1, 10)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 11)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 12)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 13)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 1, 24)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 4)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 5)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 6)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 7)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 8)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 9)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (2, 2, 10)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 11)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 12)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 13)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 2, 24)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 4)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 5)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 6)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 7)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 8)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 9)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (2, 3, 10)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 11)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 12)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 13)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 3, 24)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 4)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 5)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 6)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 7)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 8)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 9)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (2, 4, 10)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 11)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 12)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 13)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 4, 24)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 4)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 5)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 6)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 7)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 8)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 9)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (2, 5, 10)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 11)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 12)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 13)
INSERT [dbo].[Permissions] ([RoleID], [ActionID], [FunctionSystemID]) VALUES (1, 5, 24)
GO
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'008c7946-47ca-4041-8170-7ccee23eb089', N'ee98c080-01ba-4322-a406-6e7e761eba42', CAST(N'2021-11-20T10:54:12.9846158' AS DateTime2), CAST(N'2022-05-20T10:54:12.9847266' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'00a45887-5aa1-400d-b066-1fe8bb571b78', N'ba8eef46-2ecf-409c-95b8-3d937b73f88b', CAST(N'2021-11-20T07:59:06.4958844' AS DateTime2), CAST(N'2022-05-20T07:59:06.4958872' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'013c2e8a-979b-42ca-bddf-3410d8a6791b', N'e1439464-e087-4102-8e44-60f4b58d2ab4', CAST(N'2021-11-18T18:17:42.7637176' AS DateTime2), CAST(N'2022-05-18T18:17:42.7637182' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'02f3d4c2-f5c7-4c2b-8cc7-a5ed9120a34e', N'8271c9e9-c3f7-4541-ab2f-eaac36f6e70e', CAST(N'2021-11-20T16:20:44.2149021' AS DateTime2), CAST(N'2022-05-20T16:20:44.2149058' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'05b64237-0940-43f8-bd05-ac03e492d44e', N'36b60219-431e-489c-9947-5c7872fe135a', CAST(N'2021-11-19T09:50:52.7171405' AS DateTime2), CAST(N'2022-05-19T09:50:52.7171430' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'07517e03-d4e8-489f-b10f-f1dc44135f71', N'13662c62-a5e7-4368-810a-480465222c09', CAST(N'2021-11-19T08:25:10.7214356' AS DateTime2), CAST(N'2022-05-19T08:25:10.7214369' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'0e8a75af-11da-4a0f-9591-33bd332f8344', N'6775629a-f829-4cdb-a43b-0a1a12740c6d', CAST(N'2021-11-18T08:24:54.2145510' AS DateTime2), CAST(N'2022-05-18T08:24:54.2145544' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'0f9e0c8a-4809-458b-acd9-67f416b9f899', N'4bd53ecf-a00b-4ba1-a481-4fbe6d7a5acd', CAST(N'2021-11-20T16:02:03.4675139' AS DateTime2), CAST(N'2022-05-20T16:02:03.4675152' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'15a2de9b-8bf8-4b19-b00c-42784ff289c1', N'22f98d4f-7176-4e3f-93e0-22fd998c7f04', CAST(N'2021-11-19T08:19:14.4236589' AS DateTime2), CAST(N'2022-05-19T08:19:14.4236601' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'161d28f3-56d3-4fe3-b6b6-c3b40afed13b', N'da5286c3-251b-47ff-b7b6-ae41aa20e50d', CAST(N'2021-11-20T16:11:54.0883840' AS DateTime2), CAST(N'2022-05-20T16:11:54.0883872' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'19d11c51-5340-4d7b-a2f5-5ca8380d5092', N'c61670d4-05df-473d-b0e7-ec7694380e16', CAST(N'2021-11-20T16:07:27.4138484' AS DateTime2), CAST(N'2022-05-20T16:07:27.4138496' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'1ef40d37-b770-4e7c-9cc4-df9f1c09161b', N'c0b1aa1a-0b85-4ab3-bdcf-836fcad8ab27', CAST(N'2021-11-20T16:06:16.6090732' AS DateTime2), CAST(N'2022-05-20T16:06:16.6090756' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'203b69bf-d87e-4af9-9837-9cc3b1f9b480', N'c5270e00-cfa6-4515-a743-7e89ea620c7c', CAST(N'2021-11-19T08:18:28.1075784' AS DateTime2), CAST(N'2022-05-19T08:18:28.1075795' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'22bfe71f-206c-4456-b78e-e877b0322c17', N'3e2c12e2-8f0f-4c4f-a090-c945a619c9e1', CAST(N'2021-11-20T15:13:49.5739141' AS DateTime2), CAST(N'2022-05-20T15:13:49.5739158' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'240c6423-c668-4e7f-91ac-f333cbb31663', N'87fe78b7-c691-4170-ad08-9d0ad2043bcb', CAST(N'2021-11-18T18:08:35.7766966' AS DateTime2), CAST(N'2022-05-18T18:08:35.7766973' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'2707e1da-c5bd-43dd-83d3-33a0efe1c25f', N'0803f8ff-5f6e-43de-96f6-e1df53402081', CAST(N'2021-11-20T07:50:12.8038623' AS DateTime2), CAST(N'2022-05-20T07:50:12.8038647' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'28132192-a996-4cfc-843c-c4ceb43c60f6', N'e577a21d-760c-4e12-93ad-d26efc29b7fc', CAST(N'2021-11-18T19:18:24.6711813' AS DateTime2), CAST(N'2022-05-18T19:18:24.6712326' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'29430867-8558-4797-8a14-bcbc8701b00c', N'9234e760-d3f7-4bc7-b82e-0a02a2e05a25', CAST(N'2021-11-20T10:55:07.7415796' AS DateTime2), CAST(N'2022-05-20T10:55:07.7415815' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'2b2b2f76-d602-49d8-a0de-da99c38c270c', N'6c248f3b-ab2f-402e-a8f8-7d58bf7aff97', CAST(N'2021-11-18T19:18:42.0162382' AS DateTime2), CAST(N'2022-05-18T19:18:42.0162394' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'2cfcf621-7025-41cc-8c13-fcc4051258ac', N'e881d497-c93c-4587-8af2-95278de91678', CAST(N'2021-11-19T08:30:35.2142468' AS DateTime2), CAST(N'2022-05-19T08:30:35.2142498' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'2f54ae3a-df5e-4ffe-b3b5-56784a9b715a', N'93a24677-caa4-4e32-868c-7d237608bf6c', CAST(N'2021-11-19T10:11:28.2394952' AS DateTime2), CAST(N'2022-05-19T10:11:28.2394978' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'2fd27a1c-b25a-4dff-a2e8-6ff4a3e04172', N'd1289430-a254-4663-929b-d91122ca85cd', CAST(N'2021-11-20T12:08:13.1334717' AS DateTime2), CAST(N'2022-05-20T12:08:13.1336881' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'31abe072-d7ae-47ca-a443-834efd62e6be', N'29f1e43f-cf04-4861-9bd1-f562aa3776be', CAST(N'2021-11-19T11:31:23.6808890' AS DateTime2), CAST(N'2022-05-19T11:31:23.6810542' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'337dcbef-63d7-421d-8448-046fede605c8', N'ef26d069-4869-44f4-8109-149107b9c293', CAST(N'2021-11-18T18:05:21.7193379' AS DateTime2), CAST(N'2022-05-18T18:05:21.7193785' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'33fa37c8-e9e8-43d2-9836-51aaaf2bcbc8', N'57c2dda5-1cf1-49a9-ad59-42544a4b94b9', CAST(N'2021-11-18T21:13:15.4615306' AS DateTime2), CAST(N'2022-05-18T21:13:15.4615340' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'37af21b4-2faf-4436-a6a2-7a11f9e734e2', N'7fb769e0-1503-4f0c-9fee-b204f54854a7', CAST(N'2021-11-19T08:29:07.7875005' AS DateTime2), CAST(N'2022-05-19T08:29:07.7875012' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'37bd2e4a-519d-4f68-9352-62ac048f9fe8', N'ae2c927d-9b9e-415b-bec6-9901aec24b32', CAST(N'2021-11-18T08:25:48.0680905' AS DateTime2), CAST(N'2022-05-18T08:25:48.0680931' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3992e1f9-e844-4e11-92af-b6c2fbb10284', N'eb815ab4-3a40-4bad-b1d1-a6a9ae73fd84', CAST(N'2021-11-18T21:15:46.2087686' AS DateTime2), CAST(N'2022-05-18T21:15:46.2087693' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'39f78231-12f4-47e5-ab29-1b92f7697d4f', N'3a6355d3-0d2a-431d-889e-fe66fed2f206', CAST(N'2021-11-20T16:08:27.5242202' AS DateTime2), CAST(N'2022-05-20T16:08:27.5242216' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3a6c2291-d489-4f08-9047-1ae653bb9b43', N'02cd73b1-e4bf-4ef3-a72c-3bd407c4cc73', CAST(N'2021-11-17T13:39:54.5467002' AS DateTime2), CAST(N'2022-05-17T13:39:54.5467020' AS DateTime2), 1, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3adaf144-5a90-4a83-a49d-8726c4161ee9', N'b4535393-b621-4dba-9703-2fd23d6f399c', CAST(N'2021-11-18T18:11:19.8583597' AS DateTime2), CAST(N'2022-05-18T18:11:19.8583601' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3d980f2f-c9d0-4dc2-bd4a-81db37f36f27', N'45fff4f8-f2ce-440b-9792-ee8fd8f54b0f', CAST(N'2021-11-20T01:03:52.4723213' AS DateTime2), CAST(N'2022-05-20T01:03:52.4724314' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3dbc126e-0c3e-457d-8dc7-c80b998d504b', N'90c87fa7-653d-4849-8300-39c54aac8591', CAST(N'2021-11-17T12:20:45.8634154' AS DateTime2), CAST(N'2022-05-17T12:20:45.8635914' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3ec610be-3348-4391-9a5f-5ddaade9d97f', N'4dadf4e3-db17-4d6d-8218-d522afef4905', CAST(N'2021-11-20T16:23:34.3856927' AS DateTime2), CAST(N'2022-05-20T16:23:34.3856943' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3f055160-e68d-4f8e-a16a-835ff9a37f70', N'541b8c49-f8b7-4562-880a-70de3c86c102', CAST(N'2021-11-18T20:39:09.5409754' AS DateTime2), CAST(N'2022-05-18T20:39:09.5410944' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'3fc53d90-2a40-466d-9882-76d5af991a2a', N'77af4ce3-e231-4a88-94c4-37936bae0bea', CAST(N'2021-11-18T18:16:38.7010047' AS DateTime2), CAST(N'2022-05-18T18:16:38.7010489' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'42e738be-b288-43c9-9a8e-3117c36f45ad', N'9ff5e0b5-e20b-4797-9152-85da0b09abfd', CAST(N'2021-11-19T22:13:16.2226193' AS DateTime2), CAST(N'2022-05-19T22:13:16.2226198' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'44dd2751-32ac-477a-9e88-da9ca9aa1412', N'f22f2424-7b76-4917-a2e9-b9014e21c450', CAST(N'2021-11-18T18:09:17.3038758' AS DateTime2), CAST(N'2022-05-18T18:09:17.3038765' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'48981c6a-c2cb-4919-8e30-b877c99cf23c', N'7c472b49-442e-49ab-a1cd-850ab15f2390', CAST(N'2021-11-20T15:11:13.3729373' AS DateTime2), CAST(N'2022-05-20T15:11:13.3730779' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'48e31d52-8c81-416c-bab6-eb3603cb85e5', N'a41feaa2-becb-4ac2-9c4f-8adbf1403fe7', CAST(N'2021-11-18T18:17:30.5043896' AS DateTime2), CAST(N'2022-05-18T18:17:30.5043903' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'4ddaf70d-1876-4cc2-a3dc-50eeb2538941', N'a2ce0e73-27b3-4fbb-acc1-6c4c6f9ddfeb', CAST(N'2021-11-19T10:08:38.8581209' AS DateTime2), CAST(N'2022-05-19T10:08:38.8581264' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'51561f72-4979-4792-b760-d417b4c27916', N'30e65499-473f-42a5-879c-7cc0321badb2', CAST(N'2021-11-19T10:09:07.7120730' AS DateTime2), CAST(N'2022-05-19T10:09:07.7120772' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'51b4983c-7d5d-4118-8460-c2b035e33bff', N'6260597b-0ce2-4033-b2e9-c3b72b818d6c', CAST(N'2021-11-20T16:24:46.1122198' AS DateTime2), CAST(N'2022-05-20T16:24:46.1122212' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'51c36280-1b44-40cd-afcb-6db14929dde6', N'02ddca31-047a-4ec3-861a-550311d53c4d', CAST(N'2021-11-20T16:03:58.1249256' AS DateTime2), CAST(N'2022-05-20T16:03:58.1249274' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'51d8ba7f-e241-49ef-a94a-3173d2ab23c6', N'6cf73077-0368-4702-bb52-cb407f3f32be', CAST(N'2021-11-18T08:24:50.1194519' AS DateTime2), CAST(N'2022-05-18T08:24:50.1194565' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'56285ef1-f3e1-40a0-930a-2201f93abe09', N'3a0e03c9-b6bd-491b-ac5a-a019536bef9f', CAST(N'2021-11-18T08:26:30.4733221' AS DateTime2), CAST(N'2022-05-18T08:26:30.4733238' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'5653af39-dbc5-445a-8fa5-c4fb537433b0', N'538bf313-530f-48a9-9394-9ebeaf8b609f', CAST(N'2021-11-19T08:17:26.5869608' AS DateTime2), CAST(N'2022-05-19T08:17:26.5869639' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'58542a2d-5c67-49e7-964e-83628d600025', N'2139c07f-4c9d-4fe4-8209-74f0a64bb823', CAST(N'2021-11-19T09:45:38.6231141' AS DateTime2), CAST(N'2022-05-19T09:45:38.6231162' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'5ad37d77-9b7b-4701-be0e-8a7d10d7daeb', N'3c9e94f6-1492-4e77-ac41-ab257e74a052', CAST(N'2021-11-20T11:10:47.9231227' AS DateTime2), CAST(N'2022-05-20T11:10:47.9231252' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'5c582978-5af8-4bd9-bac4-5e4c23786083', N'31bee7d4-2577-4801-8841-a12ba0c2d145', CAST(N'2021-11-18T08:23:06.8114713' AS DateTime2), CAST(N'2022-05-18T08:23:06.8114747' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'60ff4514-49cb-4d7d-99b9-c66396502617', N'cbbda68e-bb58-4569-89bb-54ca925b1d5f', CAST(N'2021-11-18T18:11:54.5763018' AS DateTime2), CAST(N'2022-05-18T18:11:54.5763026' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'64d598fd-ca71-4d9a-9f7f-2797fcfb68ff', N'e9095b77-387d-441e-90ac-b0574105ce7c', CAST(N'2021-11-18T11:58:42.1467229' AS DateTime2), CAST(N'2022-05-18T11:58:42.1467237' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'6627e489-ec25-4509-8384-bb39622a50c9', N'd887651f-d03c-44ee-8d5c-15c2a44c76d4', CAST(N'2021-11-18T18:17:53.4916050' AS DateTime2), CAST(N'2022-05-18T18:17:53.4916095' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'66c26bce-c7e5-4d1a-9097-c969c4009db2', N'2c58d7de-85f3-4e9d-8572-21bc1cf25cf4', CAST(N'2021-11-20T16:09:50.8080808' AS DateTime2), CAST(N'2022-05-20T16:09:50.8080824' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'67597630-0d3a-47e3-9eca-3c8cbb643370', N'6c44d5a4-9e70-4ff7-b445-6cb69506fd7a', CAST(N'2021-11-19T22:48:04.9051145' AS DateTime2), CAST(N'2022-05-19T22:48:04.9051512' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'6b145f98-ab72-48af-9218-1f4374b91ed0', N'076d5d87-14d8-4012-8cb6-df74250fa0e3', CAST(N'2021-11-18T11:58:25.0095475' AS DateTime2), CAST(N'2022-05-18T11:58:25.0095490' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'6dfbd530-0582-4fd1-bd6c-9e3576bbb93c', N'2d4b2f1a-f1dc-4c61-a9f7-54600854bd52', CAST(N'2021-11-18T18:13:46.5620844' AS DateTime2), CAST(N'2022-05-18T18:13:46.5620851' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'759990a1-5577-4f8c-979e-f09505904589', N'e2564156-957a-4778-b32d-8a7845cfb9cb', CAST(N'2021-11-18T18:10:34.2667706' AS DateTime2), CAST(N'2022-05-18T18:10:34.2667711' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'791b332a-466d-451b-90b3-0bbe8cec3cc0', N'bb75e370-65e6-4c4b-aeba-24ddeb3fb7f2', CAST(N'2021-11-20T15:22:19.2008764' AS DateTime2), CAST(N'2022-05-20T15:22:19.2008778' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'79b1731e-a400-4566-868a-c7a3eaf221b4', N'ba7c43c6-e025-4622-b933-1b61a6557079', CAST(N'2021-11-18T11:59:57.3105298' AS DateTime2), CAST(N'2022-05-18T11:59:57.3105305' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'79c25a18-177c-42b0-a70d-dab34882414e', N'd9e620e3-cb41-40b5-bb6f-c5d46b738691', CAST(N'2021-11-18T18:09:51.6632110' AS DateTime2), CAST(N'2022-05-18T18:09:51.6632120' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'7a583cf7-8b26-48dc-8bf8-0a8a8b0c9d23', N'9806e305-6b30-4b0f-95df-1def1d7dc0d0', CAST(N'2021-11-20T11:11:39.1420254' AS DateTime2), CAST(N'2022-05-20T11:11:39.1420281' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'7a71656a-6988-4e54-8723-86ac4c48d501', N'da62f7c2-3542-4545-bcc6-c7c18d2d6df1', CAST(N'2021-11-19T22:57:03.6310470' AS DateTime2), CAST(N'2022-05-19T22:57:03.6310477' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'7e16c910-0673-4262-948c-9c76fba4ed5b', N'9940e208-2e56-47c7-baae-90ed90299de0', CAST(N'2021-11-19T10:17:45.6223958' AS DateTime2), CAST(N'2022-05-19T10:17:45.6223994' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'7fb09c03-320e-4c79-9c19-cc8edcf6d6c1', N'02b34ac7-534c-45f4-bc21-7fd38b28b2ea', CAST(N'2021-11-19T08:24:43.0950128' AS DateTime2), CAST(N'2022-05-19T08:24:43.0950136' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'7ff800e2-c759-42ca-94e6-a259c80811f4', N'17909c71-85a9-44cd-a984-18e93b74a6e8', CAST(N'2021-11-19T08:12:58.9249548' AS DateTime2), CAST(N'2022-05-19T08:12:58.9249558' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'80c88486-6320-49bb-83f6-41d59b176946', N'fefcc3ce-4afd-4274-baca-07ecd86ec45a', CAST(N'2021-11-19T10:14:28.5887419' AS DateTime2), CAST(N'2022-05-19T10:14:28.5887452' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'83d52474-3946-414e-b4ee-79c1a3dd3076', N'81064a67-b5d4-4428-8a61-929632078b45', CAST(N'2021-11-20T16:12:56.8351007' AS DateTime2), CAST(N'2022-05-20T16:12:56.8351037' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'83e75c91-981f-45a1-899d-3093e22264eb', N'b77cdcc1-1267-4b7d-8650-916aae595619', CAST(N'2021-11-19T08:08:37.2794385' AS DateTime2), CAST(N'2022-05-19T08:08:37.2794418' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'880e1a16-f2d5-4f2a-a568-ebe16ba4fb9b', N'b96dddfd-3e7f-4e7a-87f4-2e89c416199c', CAST(N'2021-11-18T18:08:33.4105317' AS DateTime2), CAST(N'2022-05-18T18:08:33.4105322' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'8c0df65b-13c6-4f76-9848-48318c876851', N'5bd0b557-8268-43fe-ab8e-6977583bb0ee', CAST(N'2021-11-19T08:31:26.2226163' AS DateTime2), CAST(N'2022-05-19T08:31:26.2226188' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'8ef4868f-1433-46e7-a308-9191ca6fb1c2', N'4d78f47f-3207-45c1-af1c-809284269eb1', CAST(N'2021-11-20T00:57:26.3700898' AS DateTime2), CAST(N'2022-05-20T00:57:26.3701457' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'958f5bff-68dd-4936-ace0-425b8fc0e29b', N'028548f8-60fb-41d9-9ca1-4a6525dd7dc5', CAST(N'2021-11-20T16:04:18.9173099' AS DateTime2), CAST(N'2022-05-20T16:04:18.9173125' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'96b9d2b3-c4a6-4046-b9f3-90ac2f342e7c', N'03ab5468-2542-46e0-a900-28bfe09bbfb0', CAST(N'2021-11-19T09:51:08.4326155' AS DateTime2), CAST(N'2022-05-19T09:51:08.4326176' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'977fba66-bd9c-4040-bfd9-5a7a25dfd6ab', N'f0d57a24-2947-4ce5-90e0-fe74645fdb70', CAST(N'2021-11-19T09:45:24.3491789' AS DateTime2), CAST(N'2022-05-19T09:45:24.3492888' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'98103af9-9211-421d-b313-04a653dc100d', N'51395e0a-d734-471d-bae4-482f2b80b7f2', CAST(N'2021-11-19T08:30:18.0806676' AS DateTime2), CAST(N'2022-05-19T08:30:18.0806685' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'9e827fb9-6f92-4749-8491-36f27ad45b1c', N'61f45931-3afe-45a9-aea6-82cdacc651c2', CAST(N'2021-11-18T19:18:39.3506683' AS DateTime2), CAST(N'2022-05-18T19:18:39.3506688' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'a4341303-09ae-4b4b-a326-9b5ccd7c5d69', N'a4db9a39-d2e9-4fe9-87a2-41fdbf813f2c', CAST(N'2021-11-17T13:33:57.0010464' AS DateTime2), CAST(N'2022-05-17T13:33:57.0010500' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'a50d49b0-1d6c-4d0a-a335-8cb47c262ef6', N'80cef11c-fc56-4be9-8f3c-cfddf670560a', CAST(N'2021-11-20T16:08:10.4972136' AS DateTime2), CAST(N'2022-05-20T16:08:10.4972144' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'a5c02cce-9915-46d9-9c51-898368385dc5', N'1301ed83-f209-4003-b6ca-4d2129a82730', CAST(N'2021-11-19T08:29:44.6574822' AS DateTime2), CAST(N'2022-05-19T08:29:44.6574829' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'a7ca43fd-a66d-4140-b1f9-b51c7685cc20', N'634f5bef-c975-450d-9bc1-97fea921a79c', CAST(N'2021-11-20T16:04:50.1183688' AS DateTime2), CAST(N'2022-05-20T16:04:50.1183722' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'a8cbbbbf-3c5a-457b-afd4-a60f416553c9', N'd1f8898f-c716-4094-bc01-fff36116fbf6', CAST(N'2021-11-18T18:10:54.8507390' AS DateTime2), CAST(N'2022-05-18T18:10:54.8507393' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'af0b8c75-5531-4b99-a22e-b22e09a4f40f', N'fc21404f-86fb-4222-a58e-497364167dc2', CAST(N'2021-11-18T19:18:45.7485781' AS DateTime2), CAST(N'2022-05-18T19:18:45.7485786' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'af18e8fe-a8a6-4fb5-a618-a45a5cb61a25', N'3fdd5f2b-0396-4b28-99b1-86c20c93f41a', CAST(N'2021-11-19T08:27:27.3233949' AS DateTime2), CAST(N'2022-05-19T08:27:27.3233962' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'afc055f1-58d3-45dd-876c-e61ae8f76881', N'e0aed254-1258-45ec-a338-2aef2d173ef4', CAST(N'2021-11-18T18:17:37.4216631' AS DateTime2), CAST(N'2022-05-18T18:17:37.4216638' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'b044ba86-22fe-46e6-85ef-b57cf848c60f', N'93e82d41-8efd-4265-bc81-84ba3fd91128', CAST(N'2021-11-20T15:16:18.8307824' AS DateTime2), CAST(N'2022-05-20T15:16:18.8307842' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'b0ca6fc4-3905-4483-bf39-e8f89636f92f', N'94c8c037-fd74-4f0f-8b6e-6d37f71fed79', CAST(N'2021-11-20T07:42:11.8861633' AS DateTime2), CAST(N'2022-05-20T07:42:11.8861641' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'b10bb813-b45f-4942-b563-466fc47c7ec0', N'edf8107b-2a19-4f48-80ec-bf1bf78c3755', CAST(N'2021-11-19T09:50:37.5719398' AS DateTime2), CAST(N'2022-05-19T09:50:37.5719429' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'b20a0cb1-9d30-40bc-832d-22fd5fee8195', N'5be1b73e-c247-485a-b7b7-9a1411fdfde9', CAST(N'2021-11-19T21:53:26.3919105' AS DateTime2), CAST(N'2022-05-19T21:53:26.3919109' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'b51803bf-8418-459f-ae40-e8cbeb15c7cd', N'8b262ab4-3671-4789-9909-82cde19f4972', CAST(N'2021-11-20T16:23:24.2707161' AS DateTime2), CAST(N'2022-05-20T16:23:24.2707177' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'b9ca43d1-b492-4b5a-9a2a-845d560be22c', N'0951a061-e891-47df-818c-71fa9c1287e0', CAST(N'2021-11-19T10:14:11.7721180' AS DateTime2), CAST(N'2022-05-19T10:14:11.7721774' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'bc999720-ca89-464e-b461-1b0375edf041', N'10f1f125-0e02-4c56-951c-2036837a02d2', CAST(N'2021-11-18T18:08:39.2295811' AS DateTime2), CAST(N'2022-05-18T18:08:39.2295817' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'be625eec-c7d0-4b53-bd4c-68b565529c6b', N'bd8f1124-9057-427e-adb4-25e44de2add0', CAST(N'2021-11-18T12:16:32.7013654' AS DateTime2), CAST(N'2022-05-18T12:16:32.7013675' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'bf0c78ec-79cb-4cd4-bf0f-d1ab03de8a74', N'0002b6fe-08af-4b70-b582-1a8bae38a87b', CAST(N'2021-11-18T15:39:01.1378813' AS DateTime2), CAST(N'2022-05-18T15:39:01.1380179' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'bfae752c-a3f5-4bcd-b887-e59bd6ea8817', N'0059f1af-71cf-4915-8c82-e064b323e3ce', CAST(N'2021-11-20T15:19:22.7202701' AS DateTime2), CAST(N'2022-05-20T15:19:22.7202724' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'c7f1efce-f187-44d7-acdf-0644fe0ff69e', N'542deffb-75e2-496c-91de-f7431555607f', CAST(N'2021-11-18T19:28:23.6282772' AS DateTime2), CAST(N'2022-05-18T19:28:23.6282784' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'c9d508af-f97a-4035-915e-0ade760f322e', N'0b4b73fa-ded6-40dc-9397-f71ac303b1da', CAST(N'2021-11-20T16:25:49.5475125' AS DateTime2), CAST(N'2022-05-20T16:25:49.5475155' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'ce3fda39-ed91-48ff-b12a-22ca660a547c', N'cb6dafae-bd95-40ff-9fb0-c1c21240659c', CAST(N'2021-11-18T15:39:01.4004983' AS DateTime2), CAST(N'2022-05-18T15:39:01.4005001' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'd32532b8-1e73-4d0b-8850-f511c17e9609', N'f8a17f02-5a31-46c3-8d62-8503aad37c01', CAST(N'2021-11-20T16:26:07.2725210' AS DateTime2), CAST(N'2022-05-20T16:26:07.2725228' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'd375153d-0ec2-4f08-9896-031bf073c2cc', N'316e9e0d-6145-4370-aca6-baaea1b35e80', CAST(N'2021-11-17T14:26:40.3360207' AS DateTime2), CAST(N'2022-05-17T14:26:40.3360236' AS DateTime2), 1, 0, 3)
GO
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'd4faeb32-10e3-443f-82f9-24e09ac4e3ce', N'22ab955f-cc80-4cae-b45a-d80dda076756', CAST(N'2021-11-18T08:09:47.5495400' AS DateTime2), CAST(N'2022-05-18T08:09:47.5497015' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'd7b51427-9ab6-4cfe-8afe-f3ba6fa185c8', N'eb546e38-cd71-4d3a-9a92-805f8cf755df', CAST(N'2021-11-18T08:27:05.0569836' AS DateTime2), CAST(N'2022-05-18T08:27:05.0569860' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'daddb953-471f-49ba-afb0-8ffaf0d000ef', N'1304d8f8-36bd-4480-91c9-7a633c6acb11', CAST(N'2021-11-20T13:01:22.0885459' AS DateTime2), CAST(N'2022-05-20T13:01:22.0886956' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'dfea697f-52b2-4344-8f01-f387ace36d0f', N'ea92f672-69a4-474d-83ea-988e12178bd9', CAST(N'2021-11-19T10:08:26.6479844' AS DateTime2), CAST(N'2022-05-19T10:08:26.6481517' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'e3e22acd-4b47-4b18-af82-d186e28a75e1', N'173d7619-0ad0-4c84-a820-877e6fa77a57', CAST(N'2021-11-19T09:50:59.6871273' AS DateTime2), CAST(N'2022-05-19T09:50:59.6871297' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'e5147033-683d-4f2d-a2ab-b3367e851b6d', N'ead1fc57-8731-4ea4-a6a3-c384a01fb2fc', CAST(N'2021-11-18T12:00:16.1512725' AS DateTime2), CAST(N'2022-05-18T12:00:16.1512738' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'eeb73775-fd60-4353-8a3b-e6b8fbc0da1d', N'01ee12d3-53d5-471a-bea6-39450e7a6f81', CAST(N'2021-11-18T22:37:32.3791011' AS DateTime2), CAST(N'2022-05-18T22:37:32.3791696' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'ef2d82f8-c6c1-4867-9dc9-8e105136b7c9', N'ecd0d676-e818-456f-a927-a2594cdf094f', CAST(N'2021-11-20T16:19:51.9183593' AS DateTime2), CAST(N'2022-05-20T16:19:51.9185718' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'f2c5fd1e-fe2a-4831-923c-5c991077155b', N'77fe30c3-164f-46d5-a9e7-857f61418ae1', CAST(N'2021-11-20T08:55:17.6091064' AS DateTime2), CAST(N'2022-05-20T08:55:17.6092113' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'f3ad85ee-453b-44f5-9966-6fea5cdc7034', N'16bef4c1-f116-4772-a682-f4880d321278', CAST(N'2021-11-19T08:10:37.8613389' AS DateTime2), CAST(N'2022-05-19T08:10:37.8613434' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'f8d2804a-ed8a-4ee5-9082-bf62c59278df', N'5c925be5-1177-4d2c-893d-060281ec725d', CAST(N'2021-11-18T11:57:45.2801935' AS DateTime2), CAST(N'2022-05-18T11:57:45.2802747' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'fdf6b4f3-5155-4bd2-9d32-fb457b2982ec', N'02318c71-9e85-4f54-8842-f784fecdf5aa', CAST(N'2021-11-19T08:15:03.4870959' AS DateTime2), CAST(N'2022-05-19T08:15:03.4870983' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [AccountID]) VALUES (N'ffad91db-d95c-4d0d-b830-67c26ad78286', N'15ed8f46-1bc5-44d9-8978-b51b0c4a11e2', CAST(N'2021-11-18T08:27:30.7259567' AS DateTime2), CAST(N'2022-05-18T08:27:30.7259593' AS DateTime2), 0, 0, 3)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Code], [VN], [EN], [CN], [TW]) VALUES (1, N'Amin', N'Admin', N'Admin', N'Admin', N'Admin')
INSERT [dbo].[Roles] ([ID], [Code], [VN], [EN], [CN], [TW]) VALUES (2, N'User', N'User', N'User', N'User', N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemLanguage] ON 

INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (1, N'Account Type', NULL, N'ACCOUNT_TYPE_ADD', NULL, N'Add', NULL, N'Add', N'Add')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (2, N'Account Type', NULL, N'ACCOUNT_TYPE_DELETE', NULL, N'Delete', NULL, N'Delete', N'Delete')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (3, N'Account Type', NULL, N'ACCOUNT_TYPE_EDIT', NULL, N'Edit', NULL, N'Edit', N'Edit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (4, N'Account type', NULL, N'ACCOUNT_TYPE_CODE', NULL, N'Code', N'Code', N'Code vn', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (5, N'Account Type', NULL, N'ACCOUNT_TYPE_NAME', NULL, N'Name', N'Name', N'Name', N'Name vn')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (6, N'Account Type', NULL, N'ACCOUNT_TYPE_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (7, N'Account Role', NULL, N'ACCOUNT_ROLE_ADD', NULL, N'Add', N'Add', N'Add', N'Add')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (8, N'Account Role', NULL, N'ACCOUNT_ROLE_DELETE', NULL, N'Delete', N'Delete', N'Delete', N'Delete')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (9, N'Account Role', NULL, N'ACCOUNT_ROLE_EDIT', NULL, N'Edit', N'Edit', N'Edit', N'Edit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (10, N'Account Role', NULL, N'ACCOUNT_ROLE_CODE', NULL, N'Code', N'Code', N'Code', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (11, N'Account Role', NULL, N'ACCOUNT_ROLE_NAME', NULL, N'Name', N'Name', N'Name', N'Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (12, N'Account Role', NULL, N'ACCOUNT_ROLE_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (13, N'Account Group', NULL, N'ACCOUNT_GROUP_ADD', NULL, N'Add', N'Add', N'Add', N'Add')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (14, N'Account Group', NULL, N'ACCOUNT_GROUP_DELETE', NULL, N'Delete', N'Delete', N'Delete', N'Delete')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (15, N'Account Group', NULL, N'ACCOUNT_GROUP_EDIT', NULL, N'Edit', N'Edit', N'Edit', N'Edit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (16, N'Account Group', NULL, N'ACCOUNT_GROUP_CODE', NULL, N'Code', N'Code', N'Code', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (17, N'Account Group', NULL, N'ACCOUNT_GROUP_NAME', NULL, N'Name', N'Name', N'Name', N'Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (18, N'Account Group', NULL, N'ACCOUNT_GROUP_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (19, N'Account Permission', NULL, N'ACCOUNT_PERMISSION_ADD', NULL, N'Add', N'Add', N'Add', N'Add')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (20, N'Account Permission', NULL, N'AACCOUNT_PERMISSION_DELETE', NULL, N'Delete', N'Delete', N'Delete', N'Delete')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (21, N'Account Permission', NULL, N'ACCOUNT_PERMISSION_EDIT', NULL, N'Edit', N'Edit', N'Edit', N'Edit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (22, N'Account Permission', NULL, N'ACCOUNT_PERMISSION_CODE', NULL, N'Code', N'Code', N'Code', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (23, N'Account Permission', NULL, N'ACCOUNT_PERMISSION_NAME', NULL, N'Name', N'Name', N'Name', N'Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (24, N'Account', NULL, N'ACCOUNT_PERMISSION_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (25, N'Account', NULL, N'ACCOUNT_ADD', NULL, N'Add tw', N'Add en', N'Add cn', N'Add vn')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (26, N'Account', NULL, N'ACCOUNT_DELETE', NULL, N'Delete', N'Delete', N'Delete', N'Delete')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (27, N'Account', NULL, N'ACCOUNT_EDIT', NULL, N'Edit', N'Edit', N'Edit', N'Edit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (28, N'Account', NULL, N'ACCOUNT_NO', NULL, N'NO', N'NO', N'NO', N'NO')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (29, N'Account', NULL, N'ACCOUNT_NAME', NULL, N'Name TW', N'Name EN', N'Name', N'Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (30, N'Account', NULL, N'ACCOUNT_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (31, N'Account', NULL, N'ACCOUNT_USERNAME', NULL, N'Username', N'Username', N'Username', N'Username')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (32, N'Account', NULL, N'ACCOUNT_PASSWORD', NULL, N'Password', N'Password', N'Password', N'Password')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (33, N'Account', NULL, N'ACCOUNT_LICENSE_PATH', NULL, N'License Path', N'License Path', N'License Path', N'License Path')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (34, N'Account', NULL, N'ACCOUNT_RFID', NULL, N'RFID', N'RFID', N'RFID', N'RFID')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (35, N'Account', NULL, N'ACCOUNT_EMPLOYEE', NULL, N'Employee', N'Employee', N'Employee', N'Employee')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (36, N'Account', NULL, N'ACCOUNT_FARM', NULL, N'
Farm', N'
Farm', N'
Farm', N'
Farm')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (37, N'Account', NULL, N'ACCOUNT_ACCOUNT_GROUP', NULL, N'Account Group', N'Account Group', N'Account Group', N'Account Group')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (38, N'Account', NULL, N'ACCOUNT_COMMENT', NULL, N'Comment', N'Comment', N'Comment', N'Comment')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (39, N'Account', NULL, N'ACCOUNT_CLOSE', NULL, N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (40, N'Account', NULL, N'ACCOUNT_SAVE', NULL, N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (41, N'Employee', N'', N'EMPLOYEE_SAVE', N'', N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (42, N'Employee', N'', N'EMPLOYEE_CLOSE', N'', N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (43, N'Employee', N'', N'EMPLOYEE_NO', N'', N'Employee NO', N'Employee NO', N'Employee NO', N'Employee NO')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (44, N'Employee', N'', N'EMPLOYEE_NAME', N'', N'Employee Name', N'Employee Name', N'Employee Name', N'Employee Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (45, N'Employee', N'', N'EMPLOYEE_NICKNAME', N'', N'Nickname', N'Nickname', N'Nickname', N'Nickname')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (46, N'Employee', N'', N'EMPLOYEE_IDCARD', N'', N'ID Card', N'ID Card', N'ID Card', N'ID Card')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (47, N'Employee', N'', N'EMPLOYEE_EMAIL', N'', N'Email', N'Email', N'Email', N'Email')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (48, N'Employee', N'', N'EMPLOYEE_TEL', N'', N'Tel', N'Tel', N'Tel', N'Tel')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (49, N'Employee', N'', N'EMPLOYEE_MOBILE', N'', N'Mobile', N'Mobile', N'Mobile', N'Mobile')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (50, N'Employee', N'', N'EMPLOYEE_LEVEL', N'', N'Level', N'Level', N'Level', N'Level')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (51, N'Employee', N'', N'EMPLOYEE_UNIT', N'', N'Unit', N'Unit', N'Unit', N'Unit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (52, N'Employee', N'', N'EMPLOYEE_DEPT', N'', N'Dept.', N'Dept.', N'Dept.', N'Dept.')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (53, N'Employee', N'', N'EMPLOYEE_CONTACT_NAME', N'', N'Contact Name', N'Contact Name', N'Contact Name', N'Contact Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (54, N'Employee', N'', N'EMPLOYEE__CONTACT_NO', N'', N'Contact Tel', N'Contact Tel', N'Contact Tel', N'Contact Tel')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (55, N'Employee', N'', N'EMPLOYEE_ADDRESS', N'', N'Address', N'Address', N'Address', N'Address')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (56, N'Employee', N'', N'EMPLOYEE_ADDRESS_DOMICILE', N'', N'Address Domicile', N'Address Domicile', N'Address Domicile', N'Address Domicile')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (57, N'Employee', N'', N'EMPLOYEE_BIRTHDAY', N'', N'Birthday', N'Birthday', N'Birthday', N'Birthday')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (58, N'Employee', N'', N'EMPLOYEE_COMMENT', N'', N'Comment', N'Comment', N'Comment', N'Comment')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (59, N'Employee', N'', N'EMPLOYEE_ADD_MODAL', N'', N' Add employee', N' Add employee', N' Add employee', N' Add employee')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (60, N'Employee', N'', N'EMPLOYEE_EDIT_MODAL', N'', N'Edit employee', N'Edit employee', N'Edit employee', N'Edit employee')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (61, N'Farm Setting', N'', N'FARM_SETTING_SAVE', N'', N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (62, N'Farm Setting', N'', N'FARM_SETTING_CLOSE', N'', N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (63, N'Farm Setting', N'', N'FARM_SETTING_NO', N'', N'NO', N'NO', N'NO', N'NO')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (64, N'Farm Setting', N'', N'FARM_SETTING_NAME', N'', N'Name', N'Name', N'Name', N'Name')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (65, N'Farm Setting', N'', N'FARM_SETTING_TYPE', N'', N'Type', N'Type', N'Type', N'Type')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (66, N'Farm Setting', N'', N'FARM_SETTING_PRINCIPLE', N'', N'Principle', N'Principle', N'Principle', N'Principle')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (67, N'Farm Setting', N'', N'FARM_SETTING_LENGTH', N'', N'Length', N'Length', N'Length', N'Length')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (68, N'Farm Setting', N'', N'FARM_SETTING_WIDTH', N'', N'Width', N'Width', N'Width', N'Width')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (69, N'Farm Setting', N'', N'FARM_SETTING_GGP', N'', N'GGP', N'GGP', N'GGP', N'GGP')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (70, N'Farm Setting', N'', N'FARM_SETTING_GP', N'', N'GP', N'GP', N'GP', N'GP')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (71, N'Farm Setting', N'', N'FARM_SETTING_LONGTITUDE', N'', N'Longtitude', N'Longtitude', N'Longtitude', N'Longtitude')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (72, N'Farm Setting', N'', N'FARM_SETTING_LATITUDE', N'', N'Latitude', N'Latitude', N'Latitude', N'Latitude')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (73, N'Farm Setting', N'', N'FARM_SETTING_TEMPTURE_TOP_LIMIT', N'', N'Tempture Top Limit', N'Tempture Top Limit', N'Tempture Top Limit', N'Tempture Top Limit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (74, N'Farm Setting', N'', N'FARM_SETTING_TEMPTURE_LOW_LIMIT', N'', N'Tempture Low Limit', N'Tempture Low Limit', N'Tempture Low Limit', N'Tempture Low Limit')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (75, N'Farm Setting', N'', N'FARM_SETTING_PMPF', N'', N'PMPF', N'PMPF', N'PMPF', N'PMPF')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (76, N'Farm Setting', N'', N'FARM_SETTING_SEMEN', N'', N'Semen', N'Semen', N'Semen', N'Semen')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (77, N'Farm Setting', N'', N'FARM_SETTING_NURSERY', N'', N'Nursery', N'Nursery', N'Nursery', N'Nursery')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (78, N'Farm Setting', N'', N'FARM_SETTING_GROWER', N'', N'Grower', N'Grower', N'Grower', N'Grower')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (79, N'Farm Setting', N'', N'FARM_SETTING_COMMENT', N'', N'Comment', N'Comment', N'Comment', N'Comment')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (80, N'SYSTEM_NAME', N'', N'SYSTEM_NAME', N'', N'New Generation Ranch System', N'New Generation Ranch System', N'New Generation Ranch System', N'New Generation Ranch System')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (81, N'Farm Setting', N'', N'FARM_SETTING_OPTION', N'', N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (82, N'Farm Setting', N'', N'FARM_SETTING_LEVEL', N'', N'Level', N'Level', N'Level', N'Level')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (83, N'Account Group', NULL, N'ACCOUNT_GROUP_NO', NULL, N'No', N'NO', N'NO', N'NO')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (84, N'', N'GRID', N'EmptyRecord', N'', N'No records to display', N'No records to display', N'No records to display', N'No records to display')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (85, N'', N'GRID', N'Search', N'', N'Search', N'Search', N'Search', N'Search')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (86, N'', N'PAGER', N'currentPageInfo', N'', N'{0} of {1} pages', N'{0} of {1} pages', N'{0} of {1} pages', N'{0} of {1} pages')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (87, N'', N'PAGER', N'totalItemsInfo', N'', N'({0} items)', N'({0} items)', N'({0} items)', N'({0} items)')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (88, N'', N'PAGER', N'totalItemInfo', N'', N'({0} item)', N'({0} item)', N'({0} item)', N'({0} item)')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (89, N'', N'PAGER', N'pagerDropDown', N'', N'Items per page', N'Items per page', N'Items per page', N'Items per page')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (90, N'', N'PAGER', N'pagerAllDropDown', N'', N'Items', N'Items', N'Items', N'Items')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (91, N'', N'PAGER', N'All', N'', N'All', N'All', N'All', N'All')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (92, N'Account', N'GRID', N'Add', N'', N'Add', N'Add', N'Add', N'Add 2')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (93, N'', N'GRID', N'Excelexport', N'', N'Excel Export', N'Excel Export', N'Excel Export', N'Excel Export')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (94, N'System Language', N'GRID', N'SYSTEM_LANGUAGE_ADD', NULL, N'Add', N'Add', N'Add', N'Add')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (95, N'System Language', NULL, N'SYSTEM_LANGUAGE_KEY', NULL, N'Key', N'Key', N'Key', N'Key')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (96, N'System Language', NULL, N'SYSTEM_LANGUAGE_PAGE', NULL, N'Page', N'Page', N'Page', N'Page')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (97, N'System Language', NULL, N'SYSTEM_LANGUAGE_EN', NULL, N'EN', N'EN', N'EN', N'EN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (98, N'System Language', NULL, N'SYSTEM_LANGUAGE_VN', NULL, N'VN', N'VN', N'VN', N'VN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (99, N'System Language', NULL, N'SYSTEM_LANGUAGE_TW', NULL, N'TW', N'TW', N'TW', N'TW')
GO
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (100, N'System Language', NULL, N'SYSTEM_LANGUAGE_CN', NULL, N'CN', N'CN', N'CN', N'CN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (101, N'System Language', NULL, N'SYSTEM_LANGUAGE_COMMENT', NULL, N'Comment', N'Comment', N'Comment', N'Comment')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (102, N'System Language', NULL, N'SYSTEM_LANGUAGE_SAVE', NULL, N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (103, N'System Language', NULL, N'SYSTEM_LANGUAGE_CLOSE', NULL, N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (104, N'System Language', NULL, N'SYSTEM_LANGUAGE_ADD_MODAL', NULL, N'Add system language', N'Add system language', N'Add system language', N'Add system language')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (105, N'System Language', NULL, N'SYSTEM_LANGUAGE_EDIT_MODAL', NULL, N'Edit system language', N'Edit system language', N'Edit system language', N'Edit system language')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (106, N'System Language', NULL, N'SYSTEM_LANGUAGE_TYPE', NULL, N'Type', N'Type', N'Type', N'Type')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (107, N'System Language', NULL, N'SYSTEM_LANGUAGE_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (108, N'Function System', NULL, N'FUNCTION_SYSTEM_CODE', NULL, N'Code', N'Code', N'Code', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (109, N'Function System', NULL, N'FUNCTION_SYSTEM_EN', NULL, N'EN', N'EN', N'EN', N'EN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (110, N'Function System', NULL, N'FUNCTION_SYSTEM_VN', NULL, N'VN', N'VN', N'VN', N'VN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (111, N'Function System', NULL, N'FUNCTION_SYSTEM_TW', NULL, N'TW', N'TW', N'TW', N'TW')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (112, N'Function System', NULL, N'FUNCTION_SYSTEM_CN', NULL, N'CN', N'CN', N'CN', N'CN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (113, N'Function System', NULL, N'FUNCTION_SYSTEM_SAVE', NULL, N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (114, N'Function System', NULL, N'FUNCTION_SYSTEM_CLOSE', NULL, N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (115, N'Function System', NULL, N'FUNCTION_SYSTEM_ADD_MODAL', NULL, N'Add function system', N'Add function system', N'Add function system', N'Add function system')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (116, N'Function System', NULL, N'FUNCTION_SYSTEM_EDIT_MODAL', NULL, N'Edit function system', N'Edit function system', N'Edit function system', N'Edit function system')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (119, N'Function System', NULL, N'FUNCTION_SYSTEM_SEQUENCE', NULL, N'Sequence', N'Sequence', N'Sequence', N'Sequence')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (120, N'Function System', NULL, N'FUNCTION_SYSTEM_ICON', NULL, N'Icon', N'Icon', N'Icon', N'Icon')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (121, N'Module', NULL, N'MODULE_CODE', NULL, N'Code', N'Code', N'Code', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (122, N'Module', NULL, N'MODULE_EN', NULL, N'EN', N'EN', N'EN', N'EN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (123, N'Module', NULL, N'MODULE_VN', NULL, N'VN', N'VN', N'VN', N'VN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (124, N'Module', NULL, N'MODULE_TW', NULL, N'TW', N'TW', N'TW', N'TW')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (125, N'Module', NULL, N'MODULE_CN', NULL, N'CN', N'CN', N'CN', N'CN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (126, N'Module', NULL, N'MODULE_SAVE', NULL, N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (127, N'Module', NULL, N'MODULE_CLOSE', NULL, N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (128, N'Module', NULL, N'MODULE_ADD_MODAL', NULL, N'Add module', N'Add module', N'Add module', N'Add module')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (129, N'Module', NULL, N'MODULE_EDIT_MODAL', NULL, N'Edit module', N'Edit module', N'Edit module', N'Edit module')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (130, N'Module', NULL, N'MODULE_SEQUENCE', NULL, N'Sequence', N'Sequence', N'Sequence', N'Sequence')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (131, N'Module', NULL, N'MODULE_ICON', NULL, N'Icon', N'Icon', N'Icon', N'Icon')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (132, N'Function System', NULL, N'FUNCTION_SYSTEM_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (133, N'Module', NULL, N'MODULE_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (134, N'Action', NULL, N'ACTION_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (135, N'Action', NULL, N'ACTION_CODE', NULL, N'Code', N'Code', N'Code', N'Code')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (136, N'Action', NULL, N'ACTION_EN', NULL, N'EN', N'EN', N'EN', N'EN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (137, N'Action', NULL, N'ACTION_VN', NULL, N'VN', N'VN', N'VN', N'VN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (138, N'Action', NULL, N'ACTION_TW', NULL, N'TW', N'TW', N'TW', N'TW')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (139, N'Action', NULL, N'ACTION_CN', NULL, N'CN', N'CN', N'CN', N'CN')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (140, N'Action', NULL, N'ACTION_SAVE', NULL, N'Save', N'Save', N'Save', N'Save')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (141, N'Action', NULL, N'ACTION_CLOSE', NULL, N'Close', N'Close', N'Close', N'Close')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (142, N'Action', NULL, N'ACTION_ADD_MODAL', NULL, N'Add action', N'Add action', N'Add action', N'Add action')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (143, N'Action', NULL, N'ACTION_EDIT_MODAL', NULL, N'Edit action', N'Edit action', N'Edit action', N'Edit action')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (144, N'Action', NULL, N'ACTION_SEQUENCE', NULL, N'Sequence', N'Sequence', N'Sequence', N'Sequence')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (145, N'Action', NULL, N'ACTION_ICON', NULL, N'Icon', N'Icon', N'Icon', N'Icon')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (146, N'Farm Setting', N'GRID', N'FARM_SETTING_ADD', N'', N'Add', N'Add tree', N'Add', N'Add')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (147, N'Farm Setting', N'GRID', N'FARM_SETTING_SEARCH', N'', N'Search tree', N'Search tree', N'Search tree', N'Search tree')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (148, N'Farm Setting', N'GRID', N'FARM_SETTING_EXPAND_ALL', N'', N'Expand All', N'Expand All', N'Expand All', N'Expand All')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (149, N'Farm Setting', N'GRID', N'FARM_SETTING_COLLAPSE_ALL', N'', N'Collapse All', N'Collapse All', N'Collapse All', N'Collapse All')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (150, N'Account Role', N'', N'ACCOUNT_ROLE_ACCOUNT_GUID', N'', N'Account Guid', N'Account Guid', N'Account Guid', N'Account Guid')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (151, N'Employee', NULL, N'EMPLOYEE_OPTION', NULL, N'Option', N'Option', N'Option', N'Option')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (152, N'Employee', NULL, N'EMPLOYEE_CONTACT_TEL', NULL, N'Contact Tel', N'Contact Tel', N'Contact Tel', N'Contact Tel')
INSERT [dbo].[SystemLanguage] ([ID], [SLPage], [SLType], [SLKey], [Comment], [SLTW], [SLEN], [SLCN], [SLVN]) VALUES (153, N'', N'', N'SIGN_OUT', N'', N'Sign out', N'Sign out', N'Sign out', N'Sign out')
SET IDENTITY_INSERT [dbo].[SystemLanguage] OFF
GO
ALTER TABLE [dbo].[AccountRole] ADD  DEFAULT ((0)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Actions] ADD  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[AccountPermission]  WITH CHECK ADD  CONSTRAINT [FK_AccountPermission_Accounts_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[AccountPermission] CHECK CONSTRAINT [FK_AccountPermission_Accounts_AccountID]
GO
ALTER TABLE [dbo].[AccountRole]  WITH CHECK ADD  CONSTRAINT [FK_AccountRole_Accounts_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[AccountRole] CHECK CONSTRAINT [FK_AccountRole_Accounts_AccountID]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_AccountGroup_AccountGroupID] FOREIGN KEY([AccountGroupID])
REFERENCES [dbo].[AccountGroup] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_AccountGroup_AccountGroupID]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_AccountTypes_AccountTypeID] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountTypes] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_AccountTypes_AccountTypeID]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Employees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Employees_EmployeeID]
GO
ALTER TABLE [dbo].[ActionInFunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_ActionInFunctionSystem_Actions_ActionID] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionInFunctionSystem] CHECK CONSTRAINT [FK_ActionInFunctionSystem_Actions_ActionID]
GO
ALTER TABLE [dbo].[ActionInFunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_ActionInFunctionSystem_FunctionSystem_FunctionSystemID] FOREIGN KEY([FunctionSystemID])
REFERENCES [dbo].[FunctionSystem] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionInFunctionSystem] CHECK CONSTRAINT [FK_ActionInFunctionSystem_FunctionSystem_FunctionSystemID]
GO
ALTER TABLE [dbo].[BOM]  WITH CHECK ADD  CONSTRAINT [FK_BOM_Feeding_FeedingID] FOREIGN KEY([FeedingID])
REFERENCES [dbo].[Feeding] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOM] CHECK CONSTRAINT [FK_BOM_Feeding_FeedingID]
GO
ALTER TABLE [dbo].[BOM]  WITH CHECK ADD  CONSTRAINT [FK_BOM_Foods_FoodID] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOM] CHECK CONSTRAINT [FK_BOM_Foods_FoodID]
GO
ALTER TABLE [dbo].[BOM]  WITH CHECK ADD  CONSTRAINT [FK_BOM_Methods_MethodID] FOREIGN KEY([MethodID])
REFERENCES [dbo].[Methods] ([ID])
GO
ALTER TABLE [dbo].[BOM] CHECK CONSTRAINT [FK_BOM_Methods_MethodID]
GO
ALTER TABLE [dbo].[BOM]  WITH CHECK ADD  CONSTRAINT [FK_BOM_PigKind_PigKindID] FOREIGN KEY([PigKindID])
REFERENCES [dbo].[PigKind] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOM] CHECK CONSTRAINT [FK_BOM_PigKind_PigKindID]
GO
ALTER TABLE [dbo].[BOM]  WITH CHECK ADD  CONSTRAINT [FK_BOM_Vaccines_VaccineID] FOREIGN KEY([VaccineID])
REFERENCES [dbo].[Vaccines] ([ID])
GO
ALTER TABLE [dbo].[BOM] CHECK CONSTRAINT [FK_BOM_Vaccines_VaccineID]
GO
ALTER TABLE [dbo].[FarmAccount]  WITH CHECK ADD  CONSTRAINT [FK_FarmAccount_Accounts_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FarmAccount] CHECK CONSTRAINT [FK_FarmAccount_Accounts_AccountID]
GO
ALTER TABLE [dbo].[FarmAccount]  WITH CHECK ADD  CONSTRAINT [FK_FarmAccount_OC_FarmID] FOREIGN KEY([FarmID])
REFERENCES [dbo].[OC] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FarmAccount] CHECK CONSTRAINT [FK_FarmAccount_OC_FarmID]
GO
ALTER TABLE [dbo].[FunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_FunctionSystem_FunctionSystem_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[FunctionSystem] ([ID])
GO
ALTER TABLE [dbo].[FunctionSystem] CHECK CONSTRAINT [FK_FunctionSystem_FunctionSystem_ParentID]
GO
ALTER TABLE [dbo].[FunctionSystem]  WITH CHECK ADD  CONSTRAINT [FK_FunctionSystem_Module_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Module] ([ID])
GO
ALTER TABLE [dbo].[FunctionSystem] CHECK CONSTRAINT [FK_FunctionSystem_Module_ModuleID]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions_ActionID] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Actions_ActionID]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_FunctionSystem_FunctionSystemID] FOREIGN KEY([FunctionSystemID])
REFERENCES [dbo].[FunctionSystem] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_FunctionSystem_FunctionSystemID]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Roles_RoleID]
GO
ALTER TABLE [dbo].[Pigs]  WITH CHECK ADD  CONSTRAINT [FK_Pigs_PigKind_PigKindID] FOREIGN KEY([PigKindID])
REFERENCES [dbo].[PigKind] ([ID])
GO
ALTER TABLE [dbo].[Pigs] CHECK CONSTRAINT [FK_Pigs_PigKind_PigKindID]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_RefreshTokens_Accounts_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_RefreshTokens_Accounts_AccountID]
GO
ALTER TABLE [dbo].[SystemConfig]  WITH CHECK ADD  CONSTRAINT [FK_SystemConfig_Accounts_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[SystemConfig] CHECK CONSTRAINT [FK_SystemConfig_Accounts_AccountID]
GO
