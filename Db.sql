USE [MIAP_Join4Talk_Project]
GO
/****** Object:  Table [dbo].[Material_Wsn_Content]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Wsn_Content](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[SubTitle] [nvarchar](max) NOT NULL,
	[Target] [int] NOT NULL,
	[Examined] [bit] NOT NULL,
	[ImagePath] [nvarchar](256) NOT NULL,
	[Content] [ntext] NOT NULL,
	[AudioPath] [nvarchar](512) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Wsn_Content] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻所属栏目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'Title'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'Title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'SubTitle'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻副标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'SubTitle'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'Target'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻发布目标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'Target'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'Examined'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻是否通过审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'Examined'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'ImagePath'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'ImagePath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'Content'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'Content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'AudioPath'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'声音文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'AudioPath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Content', N'COLUMN',N'CreateTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Content', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
/****** Object:  Table [dbo].[Material_Wsn_Category]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Wsn_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](256) NOT NULL,
	[Target] [int] NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Wsn_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Category', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容分类编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Category', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Category', N'COLUMN',N'CategoryName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Category', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Category', N'COLUMN',N'Target'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类所属内容类型：0-词，1-句子，2-新闻（阅读）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Category', @level2type=N'COLUMN',@level2name=N'Target'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Category', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Category', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Wsn_Category', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Wsn_Category', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Enum_ResRange]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Enum_ResRange](
	[RangeId] [int] NOT NULL,
	[RangeName] [nvarchar](32) NOT NULL,
	[RangeIcon] [nvarchar](256) NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[ForumId] [int] NOT NULL,
	[SchoolForumId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Enum_ResRange] PRIMARY KEY CLUSTERED 
(
	[RangeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'RangeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源内容面向目标序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'RangeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'RangeName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源内容面向对象名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'RangeName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'RangeIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源内容面向对象图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'RangeIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源内容面向对象描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'ForumId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该资源对象范围对应的讨论论坛版块编号（针对非学校用户）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'ForumId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'SchoolForumId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该资源类型对应的讨论论坛版块编号（针对学校用户）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'SchoolForumId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResRange', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResRange', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Enum_ResMode]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResMode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Enum_ResMode](
	[ModeId] [int] NOT NULL,
	[ModeName] [nvarchar](32) NOT NULL,
	[ModeIcon] [nvarchar](256) NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Enum_ResMode] PRIMARY KEY CLUSTERED 
(
	[ModeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResMode', N'COLUMN',N'ModeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源打开模式序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResMode', @level2type=N'COLUMN',@level2name=N'ModeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResMode', N'COLUMN',N'ModeName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源打开模式名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResMode', @level2type=N'COLUMN',@level2name=N'ModeName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResMode', N'COLUMN',N'ModeIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源打开模式图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResMode', @level2type=N'COLUMN',@level2name=N'ModeIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResMode', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源打开模式描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResMode', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResMode', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResMode', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Enum_ResLevel]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Enum_ResLevel](
	[LevelId] [int] NOT NULL,
	[LevelName] [nvarchar](32) NOT NULL,
	[LevelIcon] [nvarchar](256) NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResLevel', N'COLUMN',N'LevelId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源难度级别序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResLevel', @level2type=N'COLUMN',@level2name=N'LevelId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResLevel', N'COLUMN',N'LevelName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源难度级别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResLevel', @level2type=N'COLUMN',@level2name=N'LevelName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResLevel', N'COLUMN',N'LevelIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源难度级别图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResLevel', @level2type=N'COLUMN',@level2name=N'LevelIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResLevel', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源难度级别描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResLevel', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Enum_ResLevel', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Enum_ResLevel', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Dict_EC]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Dict_EC](
	[Word] [nvarchar](256) NOT NULL,
	[PhonicsEn] [nvarchar](256) NOT NULL,
	[PhonicsUs] [nvarchar](256) NOT NULL,
	[AudioEn] [nvarchar](256) NOT NULL,
	[AudioUs] [nvarchar](256) NOT NULL,
	[TransBase] [varbinary](max) NOT NULL,
	[Explication] [varbinary](max) NOT NULL,
	[Example] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Material_Dict_EC] PRIMARY KEY CLUSTERED 
(
	[Word] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'Word'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单词' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'Word'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'PhonicsEn'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英式音标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'PhonicsEn'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'PhonicsUs'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'美式音标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'PhonicsUs'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'AudioEn'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英式发音文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'AudioEn'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'AudioUs'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'美式发音声音文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'AudioUs'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'TransBase'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基本释义结果Protobuf序列化内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'TransBase'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'Explication'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'词语讲解结果Protobuf序列化内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'Explication'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_EC', N'COLUMN',N'Example'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用例句Protobuf序列化内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_EC', @level2type=N'COLUMN',@level2name=N'Example'
GO
/****** Object:  Table [dbo].[Material_Dict_CE]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Dict_CE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Dict_CE](
	[Word] [nvarchar](256) NOT NULL,
	[Translation] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Material_Dict_CE] PRIMARY KEY CLUSTERED 
(
	[Word] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_CE', N'COLUMN',N'Word'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'词' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_CE', @level2type=N'COLUMN',@level2name=N'Word'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Dict_CE', N'COLUMN',N'Translation'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'翻译结果Protobuf序列化内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Dict_CE', @level2type=N'COLUMN',@level2name=N'Translation'
GO
/****** Object:  Table [dbo].[Material_Data_UserItemLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Data_UserItemLogs](
	[ItemId] [int] NOT NULL,
	[DataId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[TestScore] [int] NOT NULL,
	[TestResult] [image] NULL,
	[LastTestDate] [datetime] NOT NULL,
	[GameScore] [int] NOT NULL,
	[GameResult] [image] NULL,
	[LastGameDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'ItemId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'DataId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'DataId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'TestScore'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本文件用户测试得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'TestScore'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'TestResult'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本文件用户练习结果二进制存储' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'TestResult'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'LastTestDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户最后一次测试时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'LastTestDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'GameScore'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本文件用户游戏得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'GameScore'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'GameResult'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本文件用户游戏结果二进制存储' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'GameResult'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserItemLogs', N'COLUMN',N'LastGameDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本文件用户最后一次游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserItemLogs', @level2type=N'COLUMN',@level2name=N'LastGameDate'
GO
/****** Object:  Table [dbo].[Material_Data_UserDataLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Data_UserDataLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Data_UserDataLogs](
	[DataId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Completeness] [decimal](5, 2) NOT NULL,
	[Score] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserDataLogs', N'COLUMN',N'DataId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserDataLogs', @level2type=N'COLUMN',@level2name=N'DataId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserDataLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserDataLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserDataLogs', N'COLUMN',N'Completeness'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserDataLogs', @level2type=N'COLUMN',@level2name=N'Completeness'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserDataLogs', N'COLUMN',N'Score'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserDataLogs', @level2type=N'COLUMN',@level2name=N'Score'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserDataLogs', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserDataLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Data_UserBuyDataLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Data_UserBuyDataLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Data_UserBuyDataLogs](
	[DataId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserBuyDataLogs', N'COLUMN',N'DataId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserBuyDataLogs', @level2type=N'COLUMN',@level2name=N'DataId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserBuyDataLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserBuyDataLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserBuyDataLogs', N'COLUMN',N'Price'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserBuyDataLogs', @level2type=N'COLUMN',@level2name=N'Price'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_UserBuyDataLogs', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_UserBuyDataLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Data_ResItem]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Data_ResItem](
	[ItemId] [int] IDENTITY(10000,1) NOT NULL,
	[DataId] [int] NOT NULL,
	[ItemName] [nvarchar](256) NOT NULL,
	[Intro] [nvarchar](512) NOT NULL,
	[FilePath] [nvarchar](512) NOT NULL,
	[ItemIcon] [nvarchar](512) NOT NULL,
	[DownloadCount] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Data_ResItem] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'ItemId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件序号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'DataId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件所属资源数据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'DataId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'ItemName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'Intro'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'Intro'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'FilePath'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件下载URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'FilePath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'ItemIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'ItemIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'DownloadCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件下载次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'DownloadCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源文件排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResItem', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResItem', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Data_ResData]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Data_ResData](
	[DataId] [int] IDENTITY(1000,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ModeId] [int] NOT NULL,
	[LevelId] [int] NOT NULL,
	[RangeId] [int] NOT NULL,
	[DataName] [nvarchar](256) NOT NULL,
	[DataIcon] [nvarchar](256) NOT NULL,
	[Intro] [nvarchar](512) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[SchoolPrice] [int] NOT NULL,
	[SourceName] [nvarchar](512) NOT NULL,
	[SourceId] [int] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[IsRefined] [bit] NOT NULL,
	[IsPreset] [bit] NOT NULL,
	[DownloadCount] [int] NOT NULL,
	[IsEanbled] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Data_ResData] PRIMARY KEY CLUSTERED 
(
	[DataId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'DataId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'DataId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源所属分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'ModeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据打开方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'ModeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'LevelId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源难度级别序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'LevelId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'RangeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源内容对象序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'RangeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'DataName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'DataName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'DataIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据图表文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'DataIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'Intro'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'Intro'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源详细介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'Price'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据价格，采用虚拟币计价，因此为整数单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'Price'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'SchoolPrice'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源学校用户价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'SchoolPrice'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'SourceName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源来源名称（如果来自学校，则为学校名称）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'SourceName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'SourceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源来源序号（只针对学校）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'SourceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'IsPublic'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'如果来自学校，是否同意公开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'IsPublic'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'IsRefined'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为精品资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'IsRefined'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'IsPreset'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为预置资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'IsPreset'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'DownloadCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'DownloadCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'IsEanbled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'IsEanbled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResData', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源数据创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResData', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Material_Data_ResCategory]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Data_ResCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Material_Data_ResCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](32) NOT NULL,
	[ModeId] [int] NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Material_Data_ResCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResCategory', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源分类序号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResCategory', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResCategory', N'COLUMN',N'CategoryName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResCategory', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResCategory', N'COLUMN',N'ModeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类下资源对应的打开模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResCategory', @level2type=N'COLUMN',@level2name=N'ModeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResCategory', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源分类描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResCategory', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Material_Data_ResCategory', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material_Data_ResCategory', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserVirtualCoinChanged]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserVirtualCoinChanged]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserVirtualCoinChanged](
	[UserId] [int] NOT NULL,
	[VirtualCoinChanged] [int] NOT NULL,
	[Comment] [nvarchar](512) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserVirtualCoinChanged]') AND name = N'PK_Logs_UserVirtualCoinChanged_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserVirtualCoinChanged_UserId] ON [dbo].[Logs_UserVirtualCoinChanged] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserVirtualCoinChanged', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserVirtualCoinChanged', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserVirtualCoinChanged', N'COLUMN',N'VirtualCoinChanged'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'虚拟币变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserVirtualCoinChanged', @level2type=N'COLUMN',@level2name=N'VirtualCoinChanged'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserVirtualCoinChanged', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'虚拟币值变化原因说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserVirtualCoinChanged', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserVirtualCoinChanged', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserVirtualCoinChanged', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserStatusChanged]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserStatusChanged]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserStatusChanged](
	[UserId] [int] NOT NULL,
	[Action] [int] NOT NULL,
	[Comment] [nvarchar](512) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserStatusChanged]') AND name = N'PK_Logs_UserStatusChanged_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserStatusChanged_UserId] ON [dbo].[Logs_UserStatusChanged] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserStatusChanged', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserStatusChanged', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserStatusChanged', N'COLUMN',N'Action'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作：0-锁定，1-解锁，后续可扩展' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserStatusChanged', @level2type=N'COLUMN',@level2name=N'Action'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserStatusChanged', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserStatusChanged', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserStatusChanged', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserStatusChanged', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserPasswordChanaged]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserPasswordChanaged]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserPasswordChanaged](
	[UserId] [int] NOT NULL,
	[MethodType] [int] NOT NULL,
	[Comment] [nvarchar](512) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserPasswordChanaged]') AND name = N'PK_Logs_UserPasswordChanaged_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserPasswordChanaged_UserId] ON [dbo].[Logs_UserPasswordChanaged] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPasswordChanaged', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志目标用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPasswordChanaged', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPasswordChanaged', N'COLUMN',N'MethodType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改方式：0-APP终端修改，1-WEB网站修改，2-学校平台修改，3-管理后台修改。。。后续扩展' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPasswordChanaged', @level2type=N'COLUMN',@level2name=N'MethodType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPasswordChanaged', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPasswordChanaged', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPasswordChanaged', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPasswordChanaged', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserPagePv]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserPagePv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserPagePv](
	[UserId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserPagePv]') AND name = N'PK_Logs_UserPagePv_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserPagePv_UserId] ON [dbo].[Logs_UserPagePv] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPagePv', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPagePv', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPagePv', N'COLUMN',N'VisitorId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问着用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPagePv', @level2type=N'COLUMN',@level2name=N'VisitorId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserPagePv', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserPagePv', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserLogin]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserLogin](
	[UserId] [int] NOT NULL,
	[LogType] [int] NOT NULL,
	[DeviceId] [int] NOT NULL,
	[AccountChannel] [int] NOT NULL,
	[LoginAccount] [nvarchar](128) NOT NULL,
	[AppChannel] [nvarchar](128) NOT NULL,
	[AppVersion] [nvarchar](128) NOT NULL,
	[NetworkType] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]') AND name = N'PK_Logs_UserLogin_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserLogin_UserId] ON [dbo].[Logs_UserLogin] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'LogType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志类型：
0：未知
1：注册
2：登录
3：退出登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'LogType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'DeviceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'软件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'AccountChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'AccountChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'LoginAccount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'LoginAccount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'AppChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属渠道编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'AppChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'AppVersion'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'AppVersion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'NetworkType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联网方式：
0：未知网络
1：电信CDMA
2：电信CDMA2000
3：移动GSM
4：移动3G
5：联通GSM
6：联通WCDMA
7：无线网络
8：有线网络
9：其他' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'NetworkType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserLogin', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserLogin', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserInfoUpdateLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserInfoUpdateLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserInfoUpdateLogs](
	[UserId] [int] NOT NULL,
	[InfoType] [int] NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserInfoUpdateLogs]') AND name = N'PK_Logs_UserInfoUpdateLogs')
CREATE NONCLUSTERED INDEX [PK_Logs_UserInfoUpdateLogs] ON [dbo].[Logs_UserInfoUpdateLogs] 
(
	[UserId] ASC,
	[InfoType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserInfoUpdateLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserInfoUpdateLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserInfoUpdateLogs', N'COLUMN',N'InfoType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新信息类型：0-背景图片，1-头像，2-个人信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserInfoUpdateLogs', @level2type=N'COLUMN',@level2name=N'InfoType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserInfoUpdateLogs', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserInfoUpdateLogs', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserInfoUpdateLogs', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserInfoUpdateLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserExpChanged]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserExpChanged]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserExpChanged](
	[UserId] [int] NOT NULL,
	[ExpChanged] [int] NOT NULL,
	[Comment] [nvarchar](512) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserExpChanged]') AND name = N'PK_Logs_UserExpChanged_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserExpChanged_UserId] ON [dbo].[Logs_UserExpChanged] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserExpChanged', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserExpChanged', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserExpChanged', N'COLUMN',N'ExpChanged'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserExpChanged', @level2type=N'COLUMN',@level2name=N'ExpChanged'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserExpChanged', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值变化原因说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserExpChanged', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserExpChanged', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserExpChanged', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_UserCoordChanged]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserCoordChanged](
	[UserId] [int] NOT NULL,
	[Method] [int] NOT NULL,
	[Longitude] [decimal](8, 5) NOT NULL,
	[Latitudes] [decimal](8, 5) NOT NULL,
	[CreateTime] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]') AND name = N'PK_Logs_UserCoordChanged_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserCoordChanged_UserId] ON [dbo].[Logs_UserCoordChanged] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCoordChanged', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCoordChanged', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCoordChanged', N'COLUMN',N'Method'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置定位方法：0-未知；1-GPS；2-基站；3-WIFI；4-IP；5-第三方SDK；6-其他
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCoordChanged', @level2type=N'COLUMN',@level2name=N'Method'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCoordChanged', N'COLUMN',N'Longitude'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置坐标：经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCoordChanged', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCoordChanged', N'COLUMN',N'Latitudes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置坐标：纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCoordChanged', @level2type=N'COLUMN',@level2name=N'Latitudes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCoordChanged', N'COLUMN',N'CreateTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCoordChanged', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
/****** Object:  Table [dbo].[Logs_UserCmdQuery]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_UserCmdQuery](
	[UserId] [int] NOT NULL,
	[Command] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](512) NOT NULL,
	[AppChannel] [nvarchar](128) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]') AND name = N'PK_Logs_UserCmdQuery_Command')
CREATE NONCLUSTERED INDEX [PK_Logs_UserCmdQuery_Command] ON [dbo].[Logs_UserCmdQuery] 
(
	[Command] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]') AND name = N'PK_Logs_UserCmdQuery_UserId')
CREATE NONCLUSTERED INDEX [PK_Logs_UserCmdQuery_UserId] ON [dbo].[Logs_UserCmdQuery] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCmdQuery', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCmdQuery', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCmdQuery', N'COLUMN',N'Command'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求的命令' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCmdQuery', @level2type=N'COLUMN',@level2name=N'Command'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCmdQuery', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCmdQuery', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCmdQuery', N'COLUMN',N'AppChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用渠道标示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCmdQuery', @level2type=N'COLUMN',@level2name=N'AppChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_UserCmdQuery', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_UserCmdQuery', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Logs_AdvertPv]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Logs_AdvertPv](
	[AdvertId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AppChannel] [nvarchar](128) NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]') AND name = N'PK_Logs_AdvertPv_AdvertId')
CREATE NONCLUSTERED INDEX [PK_Logs_AdvertPv_AdvertId] ON [dbo].[Logs_AdvertPv] 
(
	[AdvertId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_AdvertPv', N'COLUMN',N'AdvertId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_AdvertPv', @level2type=N'COLUMN',@level2name=N'AdvertId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_AdvertPv', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_AdvertPv', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_AdvertPv', N'COLUMN',N'AppChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用渠道' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_AdvertPv', @level2type=N'COLUMN',@level2name=N'AppChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_AdvertPv', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_AdvertPv', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Logs_AdvertPv', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logs_AdvertPv', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Forum_UserUpdateTopicCountLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateTopicCountLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_UserUpdateTopicCountLogs](
	[UserId] [int] NOT NULL,
	[DeviceId] [int] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateTopicCountLogs]') AND name = N'PK_Forum_UserUpdateTopicCountLogs_UserIdAndDeviceId')
CREATE NONCLUSTERED INDEX [PK_Forum_UserUpdateTopicCountLogs_UserIdAndDeviceId] ON [dbo].[Forum_UserUpdateTopicCountLogs] 
(
	[UserId] ASC,
	[DeviceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserUpdateTopicCountLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserUpdateTopicCountLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserUpdateTopicCountLogs', N'COLUMN',N'DeviceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前使用的设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserUpdateTopicCountLogs', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
/****** Object:  Table [dbo].[Forum_UserUpdateForumLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateForumLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_UserUpdateForumLogs](
	[UserId] [int] NOT NULL,
	[DeviceId] [int] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateForumLogs]') AND name = N'PK_Forum_UserUpdateForumLogs_UserIdAndDeviceId')
CREATE NONCLUSTERED INDEX [PK_Forum_UserUpdateForumLogs_UserIdAndDeviceId] ON [dbo].[Forum_UserUpdateForumLogs] 
(
	[UserId] ASC,
	[DeviceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserUpdateForumLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserUpdateForumLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserUpdateForumLogs', N'COLUMN',N'DeviceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前使用的设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserUpdateForumLogs', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserUpdateForumLogs', N'COLUMN',N'LastUpdateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserUpdateForumLogs', @level2type=N'COLUMN',@level2name=N'LastUpdateDate'
GO
/****** Object:  Table [dbo].[Forum_UserFavoured]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_UserFavoured](
	[TopicId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]') AND name = N'PK_Forum_UserFavoured_PostId')
CREATE NONCLUSTERED INDEX [PK_Forum_UserFavoured_PostId] ON [dbo].[Forum_UserFavoured] 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]') AND name = N'PK_Forum_UserFavoured_TopicId')
CREATE NONCLUSTERED INDEX [PK_Forum_UserFavoured_TopicId] ON [dbo].[Forum_UserFavoured] 
(
	[TopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]') AND name = N'PK_Forum_UserFavoured_UserId')
CREATE NONCLUSTERED INDEX [PK_Forum_UserFavoured_UserId] ON [dbo].[Forum_UserFavoured] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoured', N'COLUMN',N'TopicId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoured', @level2type=N'COLUMN',@level2name=N'TopicId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoured', N'COLUMN',N'PostId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoured', @level2type=N'COLUMN',@level2name=N'PostId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoured', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoured', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoured', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点“赞”时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoured', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Forum_UserFavoritedTopics]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoritedTopics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_UserFavoritedTopics](
	[UserId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoritedTopics]') AND name = N'PK_Forum_UserFavoritedTopics_UserId')
CREATE NONCLUSTERED INDEX [PK_Forum_UserFavoritedTopics_UserId] ON [dbo].[Forum_UserFavoritedTopics] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoritedTopics', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoritedTopics', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoritedTopics', N'COLUMN',N'TopicId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoritedTopics', @level2type=N'COLUMN',@level2name=N'TopicId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_UserFavoritedTopics', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子收藏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_UserFavoritedTopics', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Forum_Forums]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Forums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_Forums](
	[ForumId] [int] NOT NULL,
	[BindSchool] [bit] NOT NULL,
	[ForumName] [nvarchar](64) NOT NULL,
	[ForumIcon] [nvarchar](512) NOT NULL,
	[AllowPost] [int] NOT NULL,
	[AllowPostType] [int] NOT NULL,
	[LinkType] [int] NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Forum_Forums] PRIMARY KEY CLUSTERED 
(
	[ForumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'ForumId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题类型编号，101-108公众；201-208学校' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'ForumId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'BindSchool'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题分类是否绑定到学校：1是，0否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'BindSchool'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'ForumName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'ForumName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'ForumIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题类型图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'ForumIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'AllowPost'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题是否允许发帖：
0：均不允许
1：可自由发帖
2：只允许老师发帖
4：只允许管理后台发帖

位运算结果
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'AllowPost'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'AllowPostType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该板块下允许发帖类型：
1-普通帖
2-问答贴：提问题，可以设置最佳答案，并奖励积分
4-悬赏帖：提问题，可以设置最佳回答，并奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'AllowPostType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'LinkType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题链接功能类型：
0：正常论坛功能
1：课程列表功能入口
2：客服列表功能入口
3：我的课表功能入口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'LinkType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Forums', N'COLUMN',N'LastChangeDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Forums', @level2type=N'COLUMN',@level2name=N'LastChangeDate'
GO
/****** Object:  Table [dbo].[Extend_UserApply]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Extend_UserApply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](128) NOT NULL,
	[Telphone] [nvarchar](16) NOT NULL,
	[AreaCity] [nvarchar](64) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[SourceAd] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[HandleInfo] [nvarchar](256) NOT NULL,
	[HandleDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Extend_UserApply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名信息编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'Id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名的用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'UserName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'UserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'Telphone'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名人联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'Telphone'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'AreaCity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名人所在城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'AreaCity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名的目标学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'CourseId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名的目标课程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'CourseId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'SourceAd'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名信息来源广告编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'SourceAd'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名状态：0-待处理，1-处理中，2-已处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名信息说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'HandleInfo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'HandleInfo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_UserApply', N'COLUMN',N'HandleDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_UserApply', @level2type=N'COLUMN',@level2name=N'HandleDate'
GO
/****** Object:  Table [dbo].[Extend_Adverts]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Extend_Adverts](
	[AdvertId] [int] IDENTITY(100,1) NOT NULL,
	[IsSysAd] [bit] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[AppChannelCategoryId] [int] NOT NULL,
	[AppChannel] [nvarchar](128) NOT NULL,
	[AdName] [nvarchar](128) NOT NULL,
	[SmallerIcon] [nvarchar](512) NOT NULL,
	[LargerIcon] [nvarchar](512) NOT NULL,
	[ShowInTime] [bit] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[AdType] [int] NOT NULL,
	[AdContent] [nvarchar](max) NOT NULL,
	[AdUrl] [nvarchar](512) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Extend_Adverts] PRIMARY KEY CLUSTERED 
(
	[AdvertId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AdvertId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AdvertId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'IsSysAd'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为系统广告，系统广告不区分账号，全部统一显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'IsSysAd'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为学校广告，0为公共广告。学校广告仅在学校账号登录后显示。非学校广告反之。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AppChannelCategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告针对的应用渠道分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AppChannelCategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AppChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告特定渠道标示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AppChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AdName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AdName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'SmallerIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'SmallerIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'LargerIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告图片文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'LargerIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'ShowInTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否限时显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'ShowInTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'StartTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限时显示开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'EndTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限时显示结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AdType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告内容打开类型：
0：调用外部浏览器打开AdUrl字段指定的页面
1：应用内嵌WEB控件打开AdUrl字段指定的页面' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AdType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AdContent'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告详细内容介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AdContent'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'AdUrl'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告详情URL（如果需要利用WEB打开的话）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'AdUrl'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Extend_Adverts', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extend_Adverts', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Chat_Groups]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chat_Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chat_Groups](
	[GroupId] [int] IDENTITY(1000,1) NOT NULL,
	[GroupName] [nvarchar](128) NOT NULL,
	[GroupIcon] [nvarchar](512) NOT NULL,
	[Comment] [nvarchar](512) NOT NULL,
	[MaxMemberCount] [int] NOT NULL,
	[MemberCount] [int] NOT NULL,
	[GroupType] [int] NOT NULL,
	[CreatorId] [int] NOT NULL,
	[InterestCode] [nvarchar](64) NOT NULL,
	[QuickJoinCode] [nvarchar](16) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Chat_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chat_Groups]') AND name = N'PK_Char_Groups_InterestCode')
CREATE NONCLUSTERED INDEX [PK_Char_Groups_InterestCode] ON [dbo].[Chat_Groups] 
(
	[InterestCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chat_Groups]') AND name = N'PK_Chat_Groups_QuickJoinCode')
CREATE UNIQUE NONCLUSTERED INDEX [PK_Chat_Groups_QuickJoinCode] ON [dbo].[Chat_Groups] 
(
	[QuickJoinCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'GroupId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'GroupName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'GroupIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'GroupIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'MaxMemberCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大成员数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'MaxMemberCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'MemberCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已有成员数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'MemberCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'GroupType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群类型：0-普通群，1-系统群' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'GroupType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'CreatorId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'CreatorId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'InterestCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群所属的兴趣组内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'InterestCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'QuickJoinCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快速加入编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'QuickJoinCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Groups', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Groups', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[School_SchoolBase](
	[SchoolId] [int] IDENTITY(1000,1) NOT NULL,
	[FullName] [nvarchar](128) NOT NULL,
	[ShortName] [nvarchar](128) NOT NULL,
	[EnglishName] [nvarchar](128) NOT NULL,
	[LargerLogo] [nvarchar](512) NOT NULL,
	[SmallerLogo] [nvarchar](512) NOT NULL,
	[SceneryLogo] [nvarchar](512) NOT NULL,
	[AreaCity] [nvarchar](128) NOT NULL,
	[AreaAddress] [nvarchar](256) NOT NULL,
	[Contacter] [nvarchar](128) NOT NULL,
	[Telphone] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[WebSite] [nvarchar](128) NOT NULL,
	[Introduce] [ntext] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_School_SchoolBase] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'FullName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校全称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'FullName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'ShortName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校建成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'EnglishName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校英文名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'EnglishName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'LargerLogo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理平台的学校LOGO图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'LargerLogo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'SmallerLogo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于终端应用的学校LOGO图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'SmallerLogo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'SceneryLogo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校剪影图片文件路径，可用于学员头像背景' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'SceneryLogo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'AreaCity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校所在城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'AreaCity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'AreaAddress'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校所在地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'AreaAddress'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'Contacter'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'Contacter'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'Telphone'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'Telphone'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'WebSite'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'WebSite'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'Introduce'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校详细介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'Introduce'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_SchoolBase', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_SchoolBase', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_UserBase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_UserBase](
	[UserId] [int] IDENTITY(10000,1) NOT NULL,
	[UserName] [nvarchar](128) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedDate] [datetime] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[LastLockedoutDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LoginCount] [int] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User_UserBase] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'UserName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'UserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'Password'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'Password'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'PasswordFormat'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账户密码加密类型：0-明文密码，1-MD5加密，2-Sha1加密，3-加Salt后MD5加密，4-加Salt后Sha1加密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'PasswordFormat'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'PasswordSalt'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码加密混淆码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'PasswordSalt'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'LastPasswordChangedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次更改密码时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'LastPasswordChangedDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'IsApproved'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户书否通过验证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'IsApproved'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'ApprovedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户通过验证时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'ApprovedDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'IsLocked'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户是否被锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'IsLocked'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'LastLockedoutDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户最后一次锁定解锁时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'LastLockedoutDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'LoginCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户登录次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'LoginCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserBase', N'COLUMN',N'LastLoginDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户最后一次登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserBase', @level2type=N'COLUMN',@level2name=N'LastLoginDate'
GO
/****** Object:  Table [dbo].[User_Followers]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Followers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Followers](
	[UserId] [int] NOT NULL,
	[FollowedUserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User_Followers]') AND name = N'PK_User_Followers_FollowedUserId')
CREATE NONCLUSTERED INDEX [PK_User_Followers_FollowedUserId] ON [dbo].[User_Followers] 
(
	[FollowedUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User_Followers]') AND name = N'PK_User_Followers_UserId')
CREATE NONCLUSTERED INDEX [PK_User_Followers_UserId] ON [dbo].[User_Followers] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Followers', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Followers', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Followers', N'COLUMN',N'FollowedUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注目标用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Followers', @level2type=N'COLUMN',@level2name=N'FollowedUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Followers', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Followers', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[User_ExpGrades]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_ExpGrades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_ExpGrades](
	[GradeId] [int] NOT NULL,
	[GradeName] [nvarchar](50) NOT NULL,
	[GradeIcon] [nvarchar](256) NOT NULL,
	[ExpLBound] [int] NOT NULL,
	[ExpUBound] [int] NOT NULL,
 CONSTRAINT [PK_User_ExpGrades] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_ExpGrades', N'COLUMN',N'GradeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级序号，如1、2、3、4、5等' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_ExpGrades', @level2type=N'COLUMN',@level2name=N'GradeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_ExpGrades', N'COLUMN',N'GradeName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_ExpGrades', @level2type=N'COLUMN',@level2name=N'GradeName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_ExpGrades', N'COLUMN',N'GradeIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_ExpGrades', @level2type=N'COLUMN',@level2name=N'GradeIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_ExpGrades', N'COLUMN',N'ExpLBound'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级对应经验值下限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_ExpGrades', @level2type=N'COLUMN',@level2name=N'ExpLBound'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_ExpGrades', N'COLUMN',N'ExpUBound'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级对应经验值上限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_ExpGrades', @level2type=N'COLUMN',@level2name=N'ExpUBound'
GO
/****** Object:  Table [dbo].[User_Devices]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Devices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Devices](
	[DeviceId] [int] IDENTITY(100000,1) NOT NULL,
	[IMSI] [nvarchar](128) NOT NULL,
	[IMEI] [nvarchar](128) NOT NULL,
	[MSID] [nvarchar](128) NOT NULL,
	[Platform] [int] NOT NULL,
	[OS] [nvarchar](128) NOT NULL,
	[Code] [nvarchar](256) NOT NULL,
	[Token] [nvarchar](256) NOT NULL,
	[ChannelCode] [nvarchar](128) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Devices] PRIMARY KEY CLUSTERED 
(
	[DeviceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'DeviceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号，用户设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'IMSI'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户设备卡串号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'IMSI'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'IMEI'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户设备机身串号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'IMEI'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'MSID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码等移动台串号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'MSID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'Platform'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备操作系统平台：1-IOS，2-Android，3-WP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'Platform'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'OS'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备操作系统及版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'OS'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'Code'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备型号、名称等信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'Code'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'Token'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备授权码，IOS设备特有' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'Token'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'ChannelCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备所属的渠道标示码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'ChannelCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_Devices', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Devices', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[User_CheckedInLogs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_CheckedInLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_CheckedInLogs](
	[UserId] [int] NOT NULL,
	[AppChannel] [nvarchar](128) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User_CheckedInLogs]') AND name = N'PK_User_CheckedInLogs_UserIdAndDate')
CREATE UNIQUE CLUSTERED INDEX [PK_User_CheckedInLogs_UserIdAndDate] ON [dbo].[User_CheckedInLogs] 
(
	[UserId] ASC,
	[CreateDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_CheckedInLogs', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_CheckedInLogs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_CheckedInLogs', N'COLUMN',N'AppChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时的应用渠道标示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_CheckedInLogs', @level2type=N'COLUMN',@level2name=N'AppChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_CheckedInLogs', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_CheckedInLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Support_AreaProvince]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AreaProvince](
	[ProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [nvarchar](128) NOT NULL,
	[ProvinceShortName] [nvarchar](128) NOT NULL,
	[ProvinceEName] [nvarchar](128) NOT NULL,
	[ProvinceCode] [nvarchar](128) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AreaProvince] PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'ProvinceName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省份名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'ProvinceName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'ProvinceShortName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省份简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'ProvinceShortName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'ProvinceEName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省份英文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'ProvinceEName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'ProvinceCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省份编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'ProvinceCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaProvince', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaProvince', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Support_AppChannelCategory]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AppChannelCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AppChannelCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryComment] [nvarchar](256) NOT NULL,
	[SubCount] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AppChannelCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannelCategory', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道分类编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannelCategory', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannelCategory', N'COLUMN',N'CategoryName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannelCategory', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannelCategory', N'COLUMN',N'CategoryComment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道分类描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannelCategory', @level2type=N'COLUMN',@level2name=N'CategoryComment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannelCategory', N'COLUMN',N'SubCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下级数据总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannelCategory', @level2type=N'COLUMN',@level2name=N'SubCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannelCategory', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannelCategory', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannelCategory', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道分类数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannelCategory', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Support_InterestType]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_InterestType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_InterestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](16) NOT NULL,
	[Comment] [nvarchar](128) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_InterestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestType', N'COLUMN',N'Name'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兴趣分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestType', @level2type=N'COLUMN',@level2name=N'Name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestType', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestType', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestType', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestType', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestType', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestType', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestType', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestType', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Support_SensitiveWord]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_SensitiveWord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_SensitiveWord](
	[Word] [nvarchar](30) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Support_SensitiveWord] PRIMARY KEY CLUSTERED 
(
	[Word] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_SensitiveWord', N'COLUMN',N'Word'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏感词语内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_SensitiveWord', @level2type=N'COLUMN',@level2name=N'Word'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_SensitiveWord', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_SensitiveWord', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
/****** Object:  Table [dbo].[Support_InterestWord]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_InterestWord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Word] [nvarchar](16) NOT NULL,
	[Comment] [nvarchar](128) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_InterestWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestWord', N'COLUMN',N'TypeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属的兴趣类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestWord', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestWord', N'COLUMN',N'Word'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兴趣关键字名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestWord', @level2type=N'COLUMN',@level2name=N'Word'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestWord', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestWord', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestWord', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestWord', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestWord', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestWord', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_InterestWord', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_InterestWord', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_GetUsersFollowedList]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_GetUsersFollowedList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-24
-- 用  途：获取指定用户的关注关系数据列表
-- 返回值：关注关系数据列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Social_GetUsersFollowedList]
    (
      @UserId INT ,
      @Action TINYINT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @Action = 0
            SELECT  UserId ,
                    FollowedUserId ,
                    CreateDate
            FROM    User_Followers
            WHERE   UserId = @UserId
            ORDER BY CreateDate DESC 
        ELSE
            SELECT  UserId ,
                    FollowedUserId ,
                    CreateDate
            FROM    User_Followers
            WHERE   FollowedUserId = @UserId
            ORDER BY CreateDate DESC 
					    
    END' 
END
GO
/****** Object:  Table [dbo].[User_UserInfo]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_UserInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_UserInfo](
	[UserId] [int] NOT NULL,
	[NickName] [nvarchar](128) NOT NULL,
	[RealName] [nvarchar](128) NOT NULL,
	[BackIcon] [nvarchar](512) NOT NULL,
	[HeadIcon] [nvarchar](512) NOT NULL,
	[Signature] [nvarchar](max) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Gender] [int] NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[UserAge]  AS (datediff(year,[Birthday],getdate())),
	[IDCardNo] [nvarchar](18) NOT NULL,
	[Area] [nvarchar](256) NOT NULL,
	[Address] [nvarchar](256) NOT NULL,
	[PostCode] [nvarchar](6) NOT NULL,
	[Industry] [nvarchar](256) NOT NULL,
	[Company] [nvarchar](256) NOT NULL,
	[JobPosition] [nvarchar](256) NOT NULL,
	[Interests] [nvarchar](256) NOT NULL,
	[WebSite] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Mobile] [nvarchar](16) NOT NULL,
	[Telphone] [nvarchar](16) NOT NULL,
	[QQ] [nvarchar](16) NOT NULL,
	[MSN] [nvarchar](256) NOT NULL,
	[OtherInfo] [nvarchar](max) NOT NULL,
	[LastChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User_UsersInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'NickName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'NickName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'RealName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'RealName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'BackIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人主页背景图片文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'BackIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'HeadIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'HeadIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Signature'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Signature'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人资料介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Gender'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户性别：1-男，2-女，0-保密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Gender'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Birthday'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'UserAge'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'UserAge'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'IDCardNo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'IDCardNo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Area'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在地区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Area'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Address'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Address'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'PostCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮政编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'PostCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Industry'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属行业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Industry'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Company'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Company'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'JobPosition'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'JobPosition'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Interests'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人兴趣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Interests'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'WebSite'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人网站' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'WebSite'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Mobile'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'Telphone'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'Telphone'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'QQ'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'QQ'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'MSN'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MSN账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'MSN'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'OtherInfo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'OtherInfo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserInfo', N'COLUMN',N'LastChangeDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次更新信息时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserInfo', @level2type=N'COLUMN',@level2name=N'LastChangeDate'
GO
/****** Object:  Table [dbo].[User_UserExt]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_UserExt]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_UserExt](
	[UserId] [int] NOT NULL,
	[UserSite] [int] NOT NULL,
	[UserRole] [int] NOT NULL,
	[UserAccess] [int] NOT NULL,
	[CreateDeviceId] [int] NOT NULL,
	[CreateAPPChannel] [nvarchar](128) NOT NULL,
	[CreateAccountChannel] [int] NOT NULL,
	[LastLoginDeviceId] [int] NOT NULL,
	[LastLoginAPPChannel] [nvarchar](128) NOT NULL,
	[LastLoginAccountChannel] [int] NOT NULL,
	[ExpLevel] [int] NOT NULL,
	[ExpScore] [int] NOT NULL,
	[GradeName] [nvarchar](50) NOT NULL,
	[GradeIcon] [nvarchar](256) NOT NULL,
	[VirtualCoinCount] [int] NOT NULL,
	[FansCount] [int] NOT NULL,
	[FollowedCount] [int] NOT NULL,
	[TopicCount] [int] NOT NULL,
	[ReplyCount] [int] NOT NULL,
 CONSTRAINT [PK_User_UserExt] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'UserSite'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户归属：大于0表示为编号为该值的学校用户，0-表示非学校用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'UserSite'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'UserRole'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户角色：
0-普通用户
1-学生
2-老师
3-客服
10-智能应答的系统用户
11-单向推送消息系统用户
20-系统管理员用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'UserRole'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'UserAccess'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限，以下枚举值的位运算结果：
1-可登录APP
2-可登录管理平台
4-可登录网站' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'UserAccess'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'CreateDeviceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户创建时使用的设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'CreateDeviceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'CreateAPPChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户创建时使用的应用渠道标示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'CreateAPPChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'CreateAccountChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户创建时使用的账户类型：' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'CreateAccountChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'LastLoginDeviceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户最后一次登录使用的设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'LastLoginDeviceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'LastLoginAPPChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户最后一次登录使用的应用渠道标示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'LastLoginAPPChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'LastLoginAccountChannel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户最后一次登录时使用的账户类型：' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'LastLoginAccountChannel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'ExpLevel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'ExpLevel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'ExpScore'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'ExpScore'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'GradeName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'GradeName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'GradeIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'GradeIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'VirtualCoinCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'VirtualCoinCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'FansCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'粉丝总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'FansCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'FollowedCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注对象总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'FollowedCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'TopicCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发帖总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'TopicCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserExt', N'COLUMN',N'ReplyCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserExt', @level2type=N'COLUMN',@level2name=N'ReplyCount'
GO
/****** Object:  Table [dbo].[User_UserCoords]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_UserCoords]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_UserCoords](
	[UserId] [int] NOT NULL,
	[Longitude] [decimal](8, 5) NOT NULL,
	[Latitudes] [decimal](8, 5) NOT NULL,
	[LastChangeTime] [datetime] NOT NULL,
 CONSTRAINT [PK_User_UserCoords] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserCoords', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserCoords', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserCoords', N'COLUMN',N'Longitude'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置坐标：经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserCoords', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserCoords', N'COLUMN',N'Latitudes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置坐标：纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserCoords', @level2type=N'COLUMN',@level2name=N'Latitudes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_UserCoords', N'COLUMN',N'LastChangeTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_UserCoords', @level2type=N'COLUMN',@level2name=N'LastChangeTime'
GO
/****** Object:  Table [dbo].[Support_AppChannel]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AppChannel](
	[CategoryId] [int] NOT NULL,
	[ChannelCode] [nvarchar](128) NOT NULL,
	[ChannelKey] [nvarchar](128) NOT NULL,
	[ChannelName] [nvarchar](128) NOT NULL,
	[ChannelComment] [nvarchar](256) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AppChannel] PRIMARY KEY CLUSTERED 
(
	[ChannelCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道所属分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'ChannelCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道标识码，具有唯一值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'ChannelCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'ChannelKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道校验码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'ChannelKey'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'ChannelName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'ChannelName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'ChannelComment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'ChannelComment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppChannel', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道信息数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppChannel', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Support_AreaCity]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AreaCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceId] [int] NULL,
	[CityName] [nvarchar](128) NOT NULL,
	[CityShortName] [nvarchar](128) NOT NULL,
	[CityEName] [nvarchar](128) NOT NULL,
	[CityCode] [nvarchar](128) NOT NULL,
	[Longitude] [decimal](8, 5) NOT NULL,
	[Latitude] [decimal](8, 5) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AreaCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'ProvinceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市所属省份编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'ProvinceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'CityName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'CityName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'CityShortName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'CityShortName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'CityEName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市英文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'CityEName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'CityCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'Longitude'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市中心经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'Latitude'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市中心纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCity', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCity', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[User_AppOptions]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_AppOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_AppOptions](
	[UserId] [int] NOT NULL,
	[RemindPrivateMessage] [bit] NOT NULL,
	[RemindGroupMessage] [bit] NOT NULL,
	[RemindBeFollowed] [bit] NOT NULL,
	[RemindTopicBeReply] [bit] NOT NULL,
	[LastChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User_AppOptions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_AppOptions', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_AppOptions', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_AppOptions', N'COLUMN',N'RemindPrivateMessage'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否接收私信提醒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_AppOptions', @level2type=N'COLUMN',@level2name=N'RemindPrivateMessage'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_AppOptions', N'COLUMN',N'RemindGroupMessage'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否接收群消息提醒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_AppOptions', @level2type=N'COLUMN',@level2name=N'RemindGroupMessage'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_AppOptions', N'COLUMN',N'RemindBeFollowed'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否接收被关注消息提醒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_AppOptions', @level2type=N'COLUMN',@level2name=N'RemindBeFollowed'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_AppOptions', N'COLUMN',N'RemindTopicBeReply'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否接收回帖提醒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_AppOptions', @level2type=N'COLUMN',@level2name=N'RemindTopicBeReply'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User_AppOptions', N'COLUMN',N'LastChangeDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次跟新设置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_AppOptions', @level2type=N'COLUMN',@level2name=N'LastChangeDate'
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_GetUserCheckedInLogs]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_GetUserCheckedInLogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：获取用户在指定天数内的签到记录列表
-- 返回值：用户在指定天数内的签到记录列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_GetUserCheckedInLogs]
    (
      @UserId INT ,
      @Days INT ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  UserId ,
                AppChannel ,
                CreateDate
        FROM    User_CheckedInLogs
        WHERE   UserId = @UserId
                AND DATEDIFF(DAY, CreateDate, @Date) <= @Days
        ORDER BY CreateDate DESC 
        	    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_GetUserCheckedInCountWithDay]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_GetUserCheckedInCountWithDay]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：获取用户在指定日期内签到总次数
-- 返回值：用户在指定日期内签到总次数
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_GetUserCheckedInCountWithDay]
    (
      @UserId INT ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  COUNT(0)
        FROM    User_CheckedInLogs
        WHERE   UserId = @UserId
                AND DATEDIFF(DAY, CreateDate, @Date) = 0
        	    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_ChangeUserPassword]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_ChangeUserPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：修改用户密码
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_ChangeUserPassword]
    (
      @UserId INT ,
      @Password NVARCHAR(128) ,
      @LastPasswordChangedDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserBase
        SET     [Password] = @Password ,
                LastPasswordChangedDate = @LastPasswordChangedDate
        WHERE   UserId = @UserId
        	    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Support_GetInterestTypeList]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Support_GetInterestTypeList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：查询所有兴趣组类型
-- 返回值：所有兴趣组类型名称和编号列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Support_GetInterestTypeList]
AS
    BEGIN
        SET NOCOUNT ON;
	
        SELECT  Id ,
                Name
        FROM    Support_InterestType
        WHERE   IsEnabled = 1
        ORDER BY Sort DESC ,
                Id DESC  
		
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Support_DeviceSetToken]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Support_DeviceSetToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：更新用户设备的授权码（IOS设备独有）
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Support_DeviceSetToken]
    (
      @DeviceId INT ,
      @Token NVARCHAR(256)
    )
AS
    BEGIN
        SET NOCOUNT ON;
	
        UPDATE  User_Devices
        SET     Token = @Token
        WHERE   DeviceId = @DeviceId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Support_DeviceCreate]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Support_DeviceCreate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户设备信息记录
-- 返回值：设备编号
-- =============================================
CREATE PROCEDURE [dbo].[SP_Support_DeviceCreate]
    (
      @IMSI NVARCHAR(128) ,
      @IMEI NVARCHAR(128) ,
      @MSID NVARCHAR(128) ,
      @Platform INT ,
      @OS NVARCHAR(128) ,
      @Code NVARCHAR(256) ,
      @Token NVARCHAR(256) ,
      @ChannelCode NVARCHAR(128) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
	
        INSERT  INTO User_Devices
                ( IMSI ,
                  IMEI ,
                  MSID ,
                  [Platform] ,
                  OS ,
                  Code ,
                  Token ,
                  ChannelCode ,
                  CreateDate
	            )
        VALUES  ( @IMSI ,
                  @IMEI ,
                  @MSID ,
                  @Platform ,
                  @OS ,
                  @Code ,
                  @Token ,
                  @ChannelCode ,
                  @CreateDate
	            )
	    
        IF @@ERROR <> 0
            OR @@ROWCOUNT = 0
            SELECT  0
        ELSE
            SELECT  SCOPE_IDENTITY()
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_UpdateGroupInfo]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_UpdateGroupInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：更新群组信息（图标和快速加入码）
-- 返回值：无
-- =======================================================
CREATE PROCEDURE [dbo].[SP_Social_UpdateGroupInfo]
    (
      @GroupId INT ,
      @GroupIcon NVARCHAR(512) ,
      @QuickJoinCode NVARCHAR(16)
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        UPDATE  Chat_Groups
        SET     GroupIcon = @GroupIcon ,
                QuickJoinCode = @QuickJoinCode
        WHERE   GroupId = @GroupId
        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UnLockUserAccount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UnLockUserAccount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：解锁被锁定的账户
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UnLockUserAccount] ( @UserId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserBase
        SET     IsLocked = 0
        WHERE   IsLocked = 1
                AND UserId = @UserId		
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UserCheckedIn]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UserCheckedIn]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：用户签到
-- 返回值：0-重复签到，1-签到成功
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UserCheckedIn]
    (
      @UserId INT ,
      @AppChannel NVARCHAR(128) ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF NOT EXISTS ( SELECT  1
                        FROM    User_CheckedInLogs
                        WHERE   UserId = @UserId
                                AND DATEDIFF(DAY, CreateDate, @Date) = 0 )
            BEGIN
                
                INSERT  INTO User_CheckedInLogs
                        ( UserId, AppChannel, CreateDate )
                VALUES  ( @UserId, @AppChannel, @Date )
                
                SELECT  1
                                
            END 
        ELSE
            SELECT  0
        	    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_BeFollowedWithTargetUser]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_BeFollowedWithTargetUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-24
-- 用  途：获取指定2个用户存在单向关注记录数
-- 返回值：0不存在，1存在
-- =============================================
CREATE PROCEDURE [dbo].[SP_Social_BeFollowedWithTargetUser]
    (
      @UserId INT ,
      @FollowedUserId INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF EXISTS ( SELECT  1
                    FROM    User_Followers
                    WHERE   UserId = @UserId
                            AND FollowedUserId = @FollowedUserId )
            SELECT  1
        ELSE
            SELECT  0        
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_GetGroupDetail]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_GetGroupDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：查询群信息
-- 返回值：群信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Social_GetGroupDetail]
    (
      @GroupId INT ,
      @QuickJoinCode NVARCHAR(16)
    )
AS
    BEGIN
        SET NOCOUNT ON;
                
        IF @GroupId > 0
            SELECT  GroupId ,
                    GroupName ,
                    GroupIcon ,
                    Comment ,
                    MaxMemberCount ,
                    MemberCount ,
                    GroupType ,
                    CreatorId ,
                    InterestCode ,
                    QuickJoinCode ,
                    CreateDate
            FROM    Chat_Groups
            WHERE   GroupId = @GroupId
        ELSE
            BEGIN
                IF @QuickJoinCode <> ''''
                    SELECT  GroupId ,
                            GroupName ,
                            GroupIcon ,
                            Comment ,
                            MaxMemberCount ,
                            MemberCount ,
                            GroupType ,
                            CreatorId ,
                            InterestCode ,
                            QuickJoinCode ,
                            CreateDate
                    FROM    Chat_Groups
                    WHERE   QuickJoinCode = @QuickJoinCode			
            END 					    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetUserFavouredCount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetUserFavouredCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-08
-- 用  途：查询指定用户对指定的目标数据“点赞”次数
-- 返回值：用户对指定的目标数据“点赞”次数
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetUserFavouredCount]
    (
      @UserId INT ,
      @TargetId INT ,
      @T TINYINT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @T = 1
            SELECT  COUNT(0)
            FROM    Forum_UserFavoured
            WHERE   UserId = @UserId
                    AND TopicId = @TargetId
                    AND PostId = 0
        ELSE
            SELECT  COUNT(0)
            FROM    Forum_UserFavoured
            WHERE   UserId = @UserId
                    AND PostId = @TargetId
							    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_School_GetDetail]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_School_GetDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-26
-- 用  途：查询指定的学校信息
-- 返回值：学校信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_School_GetDetail] ( @SchoolId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  SchoolId ,
                FullName ,
                ShortName ,
                EnglishName ,
                LargerLogo ,
                SmallerLogo ,
                SceneryLogo ,
                AreaCity ,
                AreaAddress ,
                Contacter ,
                Telphone ,
                Email ,
                WebSite ,
                Introduce ,
                CreateDate
        FROM    School_SchoolBase
        WHERE   SchoolId = @SchoolId
					    
    END' 
END
GO
/****** Object:  Table [dbo].[School_Users]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[School_Users](
	[UserId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[IsTrial] [bit] NOT NULL,
	[TrialedSource] [nvarchar](256) NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[ActivatedDate] [datetime] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[ExpiredDate] [datetime] NOT NULL,
	[StudNo] [nvarchar](64) NOT NULL,
	[ClassInfo] [nvarchar](128) NOT NULL,
	[Comment] [nvarchar](128) NOT NULL,
	[SyncForBbs] [bit] NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[School_Users]') AND name = N'PK_School_Users_SchoolId')
CREATE NONCLUSTERED INDEX [PK_School_Users_SchoolId] ON [dbo].[School_Users] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[School_Users]') AND name = N'PK_School_Users_UserId')
CREATE NONCLUSTERED INDEX [PK_School_Users_UserId] ON [dbo].[School_Users] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'IsTrial'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为试用账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'IsTrial'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'TrialedSource'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试用账户关联活动等' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'TrialedSource'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'IsActivated'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户是否已被激活' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'IsActivated'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'ActivatedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户激活时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'ActivatedDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'IsExpired'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户是否已经过期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'IsExpired'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'ExpiredDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户过期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'ExpiredDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'StudNo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'StudNo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'ClassInfo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在班级信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'ClassInfo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评语' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'SyncForBbs'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信息是否已同步至BBS（仅针对老师账号有效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'SyncForBbs'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Users', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学习状态，0-空闲中，1-学习中，2-已结业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Users', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[Course_Classes]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course_Classes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course_Classes](
	[ClassId] [int] IDENTITY(100000,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CourseCategoryId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClassName] [nvarchar](256) NOT NULL,
	[ClassCode] [nvarchar](256) NOT NULL,
	[ClassType] [int] NOT NULL,
	[StudentMax] [int] NOT NULL,
	[StudentCount] [int] NOT NULL,
	[ClassHourCount] [int] NOT NULL,
	[ClassHourOneDay] [int] NOT NULL,
	[LessonOneDay] [nvarchar](512) NOT NULL,
	[ClassStatus] [int] NOT NULL,
	[ClassStartDate] [date] NOT NULL,
	[ClassEndDate] [date] NOT NULL,
	[ClassTeacher] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[ClassAddress] [nvarchar](512) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Course_Classes] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course_Classes]') AND name = N'PK_Course_Classes_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Course_Classes_SchoolId] ON [dbo].[Course_Classes] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级自动编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级所属学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'CourseCategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'CourseCategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'CourseId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级所开课程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'CourseId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级编码，要求唯一，形式为：班级所属课程英文简称 + 年份(yyyy) + 该课程为当前年份内的第几次开班' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级开班类型：1-定期开班，2-满人开班，3-散班（散班不是实际存在的班级，只是一种数据形式，选择该班的学员可以自由选课）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'StudentMax'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级最多人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'StudentMax'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'StudentCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级实际人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'StudentCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassHourCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'共计课时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassHourCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassHourOneDay'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每日课时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassHourOneDay'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'LessonOneDay'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每日课程时间安排，如：09:-09:45;09:55-10:40等，多个以英文分号分隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'LessonOneDay'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级状态：0-未开课，1-已开课，2-已结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassStartDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开班日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassStartDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassEndDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassEndDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassTeacher'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级任课老师的用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassTeacher'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'BranchId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级所属学校分部编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'ClassAddress'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上课地点详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'ClassAddress'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Classes', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Classes', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Course_Category]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course_Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CategoryName] [nvarchar](256) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Course_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course_Category]') AND name = N'PK_Course_Category_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Course_Category_SchoolId] ON [dbo].[Course_Category] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Category', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Category', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Category', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Category', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Category', N'COLUMN',N'CategoryName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Category', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Category', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Category', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Category', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Category', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[School_Pictures]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School_Pictures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[School_Pictures](
	[PictureId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[PictureName] [nvarchar](128) NOT NULL,
	[PicturePath] [nvarchar](512) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEanbled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_School_Pictures] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[School_Pictures]') AND name = N'PK_School_Pictures_SchoolId')
CREATE NONCLUSTERED INDEX [PK_School_Pictures_SchoolId] ON [dbo].[School_Pictures] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'PictureId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'PictureId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片所属学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'BranchId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片所属分校区编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'PictureName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'PictureName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'PicturePath'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'PicturePath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'IsEanbled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'IsEanbled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Pictures', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Pictures', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[School_Branchs]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School_Branchs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[School_Branchs](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[BranchName] [nvarchar](128) NOT NULL,
	[AreaAddress] [nvarchar](256) NOT NULL,
	[Contacter] [nvarchar](128) NOT NULL,
	[Telphone] [nvarchar](128) NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_School_Branchs] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[School_Branchs]') AND name = N'PK_School_Branchs_SchoolId')
CREATE NONCLUSTERED INDEX [PK_School_Branchs_SchoolId] ON [dbo].[School_Branchs] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'BranchId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校分校区编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'BranchName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分校区名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'BranchName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'AreaAddress'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分校区地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'AreaAddress'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'Contacter'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分校区联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'Contacter'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'Telphone'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分校区联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'Telphone'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分校区描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'School_Branchs', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'School_Branchs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  StoredProcedure [dbo].[SP_Material_Wsn_GetNewsList]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Material_Wsn_GetNewsList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-13
-- 用  途：获取词、句、新闻信息可用数据列表
-- 返回值：信息可用数据列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Material_Wsn_GetNewsList]
    (
      @Target INT ,
      @PageIndex INT ,
      @PageSize INT ,
      @Sort INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @Sort = 1
            BEGIN
                SET ROWCOUNT @PageSize
                SELECT  *
                FROM    ( SELECT    C.CategoryName ,
                                    N.NewsId ,
                                    N.Title ,
                                    N.SubTitle ,
                                    N.ImagePath ,
                                    N.AudioPath ,
                                    ROW_NUMBER() OVER ( ORDER BY N.CreateTime DESC, N.NewsId DESC ) AS RowNum
                          FROM      Material_Wsn_Content N
                                    INNER JOIN Material_Wsn_Category C ON C.CategoryId = N.CategoryId
                                                              AND C.[Target] = N.[Target]
                                                              AND C.[Target] = @Target
                          WHERE     N.[Target] = @Target
                                    AND N.Examined = 1
                        ) AS List
                WHERE   List.RowNum > ( @PageIndex - 1 ) * @PageSize
                ORDER BY List.NewsId DESC
            END 
        ELSE
            BEGIN
                SET ROWCOUNT @PageSize
                SELECT  *
                FROM    ( SELECT    C.CategoryName ,
                                    N.NewsId ,
                                    N.Title ,
                                    N.SubTitle ,
                                    N.ImagePath ,
                                    N.AudioPath ,
                                    ROW_NUMBER() OVER ( ORDER BY N.CreateTime, N.NewsId ) AS RowNum
                          FROM      Material_Wsn_Content N
                                    INNER JOIN Material_Wsn_Category C ON C.CategoryId = N.CategoryId
                                                              AND C.[Target] = N.[Target]
                                                              AND C.[Target] = @Target
                          WHERE     N.[Target] = @Target
                                    AND N.Examined = 1
                        ) AS List
                WHERE   List.RowNum > ( @PageIndex - 1 ) * @PageSize
                ORDER BY List.NewsId	
            END	        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Material_Wsn_GetNewsCount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Material_Wsn_GetNewsCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-13
-- 用  途：获取词、句、新闻信息可用数据总数
-- 返回值：信息可用数据总数
-- =============================================
CREATE PROCEDURE [dbo].[SP_Material_Wsn_GetNewsCount] ( @Target INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  COUNT(0)
        FROM    Material_Wsn_Content
        WHERE   [Target] = @Target
                AND Examined = 1
		        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Material_Dict_QueryE2C]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Material_Dict_QueryE2C]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-14
-- 用  途：词典查询-英译汉
-- 返回值：翻译结果
-- =============================================
CREATE PROCEDURE [dbo].[SP_Material_Dict_QueryE2C] ( @Word NVARCHAR(256) )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  Word ,
                PhonicsEn ,
                PhonicsUs ,
                AudioEn ,
                AudioUs ,
                TransBase ,
                Explication ,
                Example
        FROM    Material_Dict_EC
        WHERE   Word = @Word
                				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Material_Dict_QueryC2E]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Material_Dict_QueryC2E]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-14
-- 用  途：词典查询-汉译英
-- 返回值：翻译结果
-- =============================================
CREATE PROCEDURE [dbo].[SP_Material_Dict_QueryC2E] ( @Word NVARCHAR(256) )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  Word ,
                Translation
        FROM    Material_Dict_CE
        WHERE   Word = @Word
                				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Material_Dict_ExtendQueryBySingleWord]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Material_Dict_ExtendQueryBySingleWord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-15
-- 用  途：词典查询-单个单词联想查询
-- 返回值：单个单词联想查询结果列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Material_Dict_ExtendQueryBySingleWord]
    (
      @Word NVARCHAR(256) ,
      @WordLike NVARCHAR(256) ,
      @FirstChar NVARCHAR(1) ,
      @Size INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF EXISTS ( SELECT  1
                    FROM    Material_Dict_EC
                    WHERE   Word = @Word )
            SELECT  Word ,
                    PhonicsEn ,
                    PhonicsUs ,
                    AudioEn ,
                    AudioUs ,
                    TransBase ,
                    Explication ,
                    Example ,
                    IsPureWord
            FROM    Material_Dict_EC
            WHERE   Word = @Word
        ELSE
            BEGIN
                IF EXISTS ( SELECT  1
                            FROM    Material_Dict_EC
                            WHERE   Word LIKE @WordLike )
                    BEGIN
                        SET ROWCOUNT @Size
                        SELECT  Word ,
                                PhonicsEn ,
                                PhonicsUs ,
                                AudioEn ,
                                AudioUs ,
                                TransBase ,
                                Explication ,
                                Example ,
                                IsPureWord
                        FROM    Material_Dict_EC
                        WHERE   Word LIKE @Word
                        ORDER BY Word			
                    END 
                ELSE
                    BEGIN
                        SET ROWCOUNT @Size
                        SELECT  Word ,
                                PhonicsEn ,
                                PhonicsUs ,
                                AudioEn ,
                                AudioUs ,
                                TransBase ,
                                Explication ,
                                Example ,
                                IsPureWord ,
                                ABS(LEN(word) - LEN(@Word)) AS DL
                        FROM    Material_Dict_EC
                        WHERE   IsPureWord = 1
                                AND DIFFERENCE(@Word, Word) = 4
                                AND Word LIKE @FirstChar
                        ORDER BY DL ,
                                Word				
                    END 	
            END 
                				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_GetUserInfoUpdatesCount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_GetUserInfoUpdatesCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：查询指定用户、指定个人信息类型的更新日志总数
-- 返回值：更新日志记录总数：INT
-- ===========================================================
CREATE PROCEDURE [dbo].[SP_Logs_GetUserInfoUpdatesCount]
    (
      @UserId INT ,
      @InfoType INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        SELECT  COUNT(0)
        FROM    Logs_UserInfoUpdateLogs
        WHERE   UserId = @UserId
                AND InfoType = @InfoType
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserVirtualCoinChangedLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserVirtualCoinChangedLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户虚拟币账户余额变更日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserVirtualCoinChangedLog]
    (
      @UserId INT ,
      @VirtualCoinChanged INT ,
      @Comment NVARCHAR(512) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserVirtualCoinChanged
                ( UserId ,
                  VirtualCoinChanged ,
                  Comment ,
                  CreateDate
                )
        VALUES  ( @UserId ,
                  @VirtualCoinChanged ,
                  @Comment ,
                  @CreateDate
                )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserStatusChangedLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserStatusChangedLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户账户状态变更日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserStatusChangedLog]
    (
      @UserId INT ,
      @Action INT ,
      @Comment NVARCHAR(512) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserStatusChanged
                ( UserId ,
                  [Action] ,
                  Comment ,
                  CreateDate
                )
        VALUES  ( @UserId ,
                  @Action ,
                  @Comment ,
                  @CreateDate
                )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserPasswordChanagedLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserPasswordChanagedLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户登录密码变更日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserPasswordChanagedLog]
    (
      @UserId INT ,
      @MethodType INT ,
      @Comment NVARCHAR(512) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserPasswordChanaged
                ( UserId ,
                  MethodType ,
                  Comment ,
                  CreateDate
                )
        VALUES  ( @UserId ,
                  @MethodType ,
                  @Comment ,
                  @CreateDate
                )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserPagePvLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserPagePvLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户个人主页访问日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserPagePvLog]
    (
      @UserId INT ,
      @VisitorId INT ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserPagePv
                ( UserId, VisitorId, CreateDate )
        VALUES  ( @UserId, @VisitorId, @CreateDate )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserLoginLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserLoginLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户登录日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserLoginLog]
    (
      @UserId INT ,
      @LogType INT ,
      @DeviceId INT ,
      @AccountChannel INT ,
      @LoginAccount NVARCHAR(128) ,
      @AppChannel NVARCHAR(128) ,
      @AppVersion NVARCHAR(128) ,
      @NetworkType INT ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserLogin
                ( UserId ,
                  LogType ,
                  DeviceId ,
                  AccountChannel ,
                  LoginAccount ,
                  AppChannel ,
                  AppVersion ,
                  NetworkType ,
                  CreateDate
                )
        VALUES  ( @UserId ,
                  @LogType ,
                  @DeviceId ,
                  @AccountChannel ,
                  @LoginAccount ,
                  @AppChannel ,
                  @AppVersion ,
                  @NetworkType ,
                  @CreateDate
                )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserInfoUpdateLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserInfoUpdateLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户个人信息更新日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserInfoUpdateLog]
    (
      @UserId INT ,
      @InfoType INT ,
      @Comment NVARCHAR(512) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserInfoUpdateLogs
                ( UserId ,
                  InfoType ,
                  Comment ,
                  CreateDate
                )
        VALUES  ( @UserId ,
                  @InfoType ,
                  @Comment ,
                  @CreateDate
                )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserExpChangedLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserExpChangedLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户经验值变更日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserExpChangedLog]
    (
      @UserId INT ,
      @ExpChanged INT ,
      @Comment NVARCHAR(512) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserExpChanged
                ( UserId ,
                  ExpChanged ,
                  Comment ,
                  CreateDate
                )
        VALUES  ( @UserId ,
                  @ExpChanged ,
                  @Comment ,
                  @CreateDate
                )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateUserCoordLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateUserCoordLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建用户位置坐标变更日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateUserCoordLog]
    (
      @UserId INT ,
      @Method INT ,
      @Longitude DECIMAL(8, 5) ,
      @Latitudes DECIMAL(8, 5) ,
      @CreateTime DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        INSERT  INTO Logs_UserCoordChanged
                ( UserId ,
                  Method ,
                  Longitude ,
                  Latitudes ,
                  CreateTime
		        )
        VALUES  ( @UserId ,
                  @Method ,
                  @Longitude ,
                  @Latitudes ,
                  @CreateTime
		        )
		        
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateCmdQueryLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateCmdQueryLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建命令号请求日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateCmdQueryLog]
    (
      @UserId INT ,
      @Command NVARCHAR(50) ,
      @Comment NVARCHAR(512) ,
      @AppChannel NVARCHAR(128) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
	
        INSERT  INTO Logs_UserCmdQuery
                ( UserId ,
                  Command ,
                  Comment ,
                  AppChannel ,
                  CreateDate
	            )
        VALUES  ( @UserId ,
                  @Command ,
                  @Comment ,
                  @AppChannel ,
                  @CreateDate
	            )
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logs_CreateAdvertPvLog]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Logs_CreateAdvertPvLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：创建广告浏览PV日志记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Logs_CreateAdvertPvLog]
    (
      @AdvertId INT ,
      @UserId INT ,
      @AppChannel NVARCHAR(128) ,
      @Comment NVARCHAR(256) ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
	
        INSERT  INTO Logs_AdvertPv
                ( AdvertId ,
                  UserId ,
                  AppChannel ,
                  Comment ,
                  CreateDate
	            )
        VALUES  ( @AdvertId ,
                  @UserId ,
                  @AppChannel ,
                  @Comment ,
                  @CreateDate
	            )
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Extend_SubmitUserApply]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Extend_SubmitUserApply]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-29
-- 用  途：写入用户报名信息
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Extend_SubmitUserApply]
    (
      @UserId INT ,
      @UserName NVARCHAR(128) ,
      @Telphone NVARCHAR(16) ,
      @AreaCity NVARCHAR(64) ,
      @SchoolId INT ,
      @CourseId INT ,
      @SourceAd INT ,
      @CreateDate DATETIME ,
      @Comment NVARCHAR(256)
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        IF NOT EXISTS ( SELECT  1
                        FROM    Extend_UserApply
                        WHERE   UserId = @UserId
                                AND UserName = @UserName
                                AND Telphone = @Telphone
                                AND SchoolId = @SchoolId
                                AND DATEDIFF(HOUR, CreateDate, @CreateDate) <= 24 )
            BEGIN
				
                INSERT  INTO Extend_UserApply
                        ( UserId ,
                          UserName ,
                          Telphone ,
                          AreaCity ,
                          SchoolId ,
                          CourseId ,
                          SourceAd ,
                          CreateDate ,
                          [Status] ,
                          Comment ,
                          HandleInfo ,
                          HandleDate
				        )
                VALUES  ( @UserId ,
                          @UserName ,
                          @Telphone ,
                          @AreaCity ,
                          @SchoolId ,
                          @CourseId ,
                          @SourceAd ,
                          @CreateDate ,
                          0 ,
                          @Comment ,
                          '''' ,
                          @CreateDate
				        )
				 
                IF @@ERROR <> 0
                    OR @@ROWCOUNT = 0
                    SELECT  -1
                ELSE
                    SELECT  SCOPE_IDENTITY()			
            END 		
        ELSE
            SELECT  0
          
    END' 
END
GO
/****** Object:  Table [dbo].[Chat_GroupMembers]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chat_GroupMembers](
	[GroupId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsCreator] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]') AND name = N'PK_Chat_GroupMembers_GroupId')
CREATE NONCLUSTERED INDEX [PK_Chat_GroupMembers_GroupId] ON [dbo].[Chat_GroupMembers] 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]') AND name = N'PK_Chat_GroupMembers_UserId')
CREATE NONCLUSTERED INDEX [PK_Chat_GroupMembers_UserId] ON [dbo].[Chat_GroupMembers] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_GroupMembers', N'COLUMN',N'GroupId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_GroupMembers', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_GroupMembers', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_GroupMembers', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_GroupMembers', N'COLUMN',N'IsCreator'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否群创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_GroupMembers', @level2type=N'COLUMN',@level2name=N'IsCreator'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_GroupMembers', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入群时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_GroupMembers', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Chat_Group_SchoolAndClass]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chat_Group_SchoolAndClass](
	[GroupId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassId] [int] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]') AND name = N'PK_Chat_Group_SchoolAndClass_ClassId')
CREATE NONCLUSTERED INDEX [PK_Chat_Group_SchoolAndClass_ClassId] ON [dbo].[Chat_Group_SchoolAndClass] 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]') AND name = N'PK_Chat_Group_SchoolAndClass_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Chat_Group_SchoolAndClass_SchoolId] ON [dbo].[Chat_Group_SchoolAndClass] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Group_SchoolAndClass', N'COLUMN',N'GroupId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Group_SchoolAndClass', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Group_SchoolAndClass', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Group_SchoolAndClass', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Chat_Group_SchoolAndClass', N'COLUMN',N'ClassId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应的班级编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Chat_Group_SchoolAndClass', @level2type=N'COLUMN',@level2name=N'ClassId'
GO
/****** Object:  Table [dbo].[Forum_Topics]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_Topics](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[ForumId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AttachContent] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Content] [ntext] NOT NULL,
	[Intro] [nvarchar](max) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
	[Voice] [nvarchar](max) NOT NULL,
	[Remark] [nvarchar](max) NOT NULL,
	[Reward] [int] NOT NULL,
	[IsQuestion] [bit] NOT NULL,
	[IsAllowReply] [bit] NOT NULL,
	[IsStick] [bit] NOT NULL,
	[IsRefined] [bit] NOT NULL,
	[AttrChangedMark] [nvarchar](max) NOT NULL,
	[ExpChanged] [int] NOT NULL,
	[VirtualCoinChanged] [int] NOT NULL,
	[BestAnswerId] [int] NOT NULL,
	[FavouredCount] [int] NOT NULL,
	[RepliedCount] [int] NOT NULL,
	[RepliedUserIds] [nvarchar](max) NOT NULL,
	[LastRepliedDate] [datetime] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[FavoritedCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ManageMark] [nvarchar](max) NOT NULL,
	[LastManageDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Forum_Topics] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Topics]') AND name = N'PK_Forum_Topics_CreateDate')
CREATE NONCLUSTERED INDEX [PK_Forum_Topics_CreateDate] ON [dbo].[Forum_Topics] 
(
	[CreateDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Topics]') AND name = N'PK_Forum_Topics_ForumId')
CREATE NONCLUSTERED INDEX [PK_Forum_Topics_ForumId] ON [dbo].[Forum_Topics] 
(
	[ForumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Topics]') AND name = N'PK_Forum_Topics_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Forum_Topics_SchoolId] ON [dbo].[Forum_Topics] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Topics]') AND name = N'PK_Forum_Topics_UserId')
CREATE NONCLUSTERED INDEX [PK_Forum_Topics_UserId] ON [dbo].[Forum_Topics] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'TopicId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'TopicId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'ForumId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题所属类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'ForumId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子发布人所属学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题发布人用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'AttachContent'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子附加内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'AttachContent'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Title'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Content'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子内容（以XML字符串格式存储）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Intro'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文字内容简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Intro'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Icon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子图标（内容中的第一张图片缩略图）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Icon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Voice'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子声音文件（内容中的声音文件中的第一个,XML字符串格式存储）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Voice'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Remark'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编辑说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Remark'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Reward'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子悬赏虚拟币金额总数，0为非悬赏帖。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Reward'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'IsQuestion'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为提问帖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'IsQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'IsAllowReply'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该主题是否允许用户回复：1是，0否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'IsAllowReply'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'IsStick'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'IsStick'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'IsRefined'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否精华帖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'IsRefined'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'AttrChangedMark'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性变化说明：如被标记为置顶、被标记为精华等。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'AttrChangedMark'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'ExpChanged'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值变化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'ExpChanged'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'VirtualCoinChanged'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'虚拟币变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'VirtualCoinChanged'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'BestAnswerId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最佳回复编号，0为没有，大于0表示为最佳回复的编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'BestAnswerId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'FavouredCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子点赞总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'FavouredCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'RepliedCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子回复总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'RepliedCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'RepliedUserIds'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新回复用户编号集合，多个以|分隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'RepliedUserIds'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'LastRepliedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'LastRepliedDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'ViewCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'ViewCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'FavoritedCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子被收藏次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'FavoritedCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子状态：0-未审核，1-正常，2-已结贴，3-已过期，4-已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'ManageMark'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子管理标记记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'ManageMark'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Topics', N'COLUMN',N'LastManageDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次管理时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topics', @level2type=N'COLUMN',@level2name=N'LastManageDate'
GO
/****** Object:  Table [dbo].[Forum_SchoolForums]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_SchoolForums](
	[SchoolId] [int] NOT NULL,
	[ForumId] [int] NOT NULL,
	[ForumName] [nvarchar](64) NOT NULL,
	[ForumIcon] [nvarchar](512) NOT NULL,
	[AllowPost] [int] NOT NULL,
	[AllowPostType] [int] NOT NULL,
	[LinkType] [int] NOT NULL,
	[Comment] [nvarchar](256) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastChangeDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]') AND name = N'PK_Forum_SchoolForums_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Forum_SchoolForums_SchoolId] ON [dbo].[Forum_SchoolForums] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'ForumId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'ForumId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'ForumName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校定制的论坛主题类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'ForumName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'ForumIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校定制的论坛主题类型图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'ForumIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'AllowPost'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题是否允许发帖：
0：均不允许
1：可自由发帖
2：只允许老师发帖
4：只允许管理后台发帖

位运算结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'AllowPost'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'AllowPostType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该板块下允许发帖类型：
0-普通帖
1-问答贴：提问题，可以设置最佳答案，并奖励积分
2-悬赏帖：提问题，可以设置最佳回答，并奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'AllowPostType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'LinkType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题链接功能类型：
0：正常论坛功能
1：课程列表功能入口
2：客服列表功能入口
3：我的课表功能入口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'LinkType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_SchoolForums', N'COLUMN',N'LastChangeDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_SchoolForums', @level2type=N'COLUMN',@level2name=N'LastChangeDate'
GO
/****** Object:  Table [dbo].[Forum_Posts]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Posts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forum_Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NOT NULL,
	[ForumId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Content] [ntext] NOT NULL,
	[FavouredCount] [int] NOT NULL,
	[ReplyForUserId] [int] NOT NULL,
	[IsBestReply] [bit] NOT NULL,
	[SetBestDate] [datetime] NOT NULL,
	[ExpChanged] [int] NOT NULL,
	[VirtualCoinChanged] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Remark] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ManageMark] [nvarchar](max) NOT NULL,
	[LastManageDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Forum_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Posts]') AND name = N'PK_Forum_Posts_CreateDate')
CREATE NONCLUSTERED INDEX [PK_Forum_Posts_CreateDate] ON [dbo].[Forum_Posts] 
(
	[CreateDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Posts]') AND name = N'PK_Forum_Posts_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Forum_Posts_SchoolId] ON [dbo].[Forum_Posts] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Posts]') AND name = N'PK_Forum_Posts_TopicId')
CREATE NONCLUSTERED INDEX [PK_Forum_Posts_TopicId] ON [dbo].[Forum_Posts] 
(
	[TopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forum_Posts]') AND name = N'PK_Forum_Posts_UserId')
CREATE NONCLUSTERED INDEX [PK_Forum_Posts_UserId] ON [dbo].[Forum_Posts] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'PostId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'PostId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'TopicId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'论坛主题所属类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'TopicId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'ForumId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复所属板块编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'ForumId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复发布人所属学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题发布人用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'Content'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖的内容（以XML字符串格式存储）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'Content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'FavouredCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子点赞总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'FavouredCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'ReplyForUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复针对的目标用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'ReplyForUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'IsBestReply'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'悬赏帖子，该回复是否被标记为最佳答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'IsBestReply'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'SetBestDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设为最佳回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'SetBestDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'ExpChanged'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复引发发布人经验值变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'ExpChanged'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'VirtualCoinChanged'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复引发发布人虚拟币变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'VirtualCoinChanged'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子状态：0-未审核，1-正常，2-已关闭，3-已过期，4-已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'Remark'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编辑说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'Remark'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'ManageMark'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子管理标记记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'ManageMark'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forum_Posts', N'COLUMN',N'LastManageDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次管理时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Posts', @level2type=N'COLUMN',@level2name=N'LastManageDate'
GO
/****** Object:  Table [dbo].[Course_Courses]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course_Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course_Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CourseName] [nvarchar](256) NOT NULL,
	[CourseCode] [nvarchar](16) NOT NULL,
	[CourseIcon] [nvarchar](512) NOT NULL,
	[Intro] [nvarchar](512) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[PriceName] [nvarchar](64) NOT NULL,
	[SalePriceName] [nvarchar](64) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Course_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course_Courses]') AND name = N'PK_Course_Courses_SchoolId')
CREATE NONCLUSTERED INDEX [PK_Course_Courses_SchoolId] ON [dbo].[Course_Courses] 
(
	[SchoolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'CourseId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'CourseId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'CategoryId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'SchoolId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属学校编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'CourseName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'CourseName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'CourseCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程标示码或者英文名之类的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'CourseCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'CourseIcon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程图标文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'CourseIcon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'Intro'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'Intro'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'Comment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程描述内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'PriceName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'PriceName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'SalePriceName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'SalePriceName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_Courses', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_Courses', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Course_ClassUsers]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course_ClassUsers](
	[ClassId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ApplyId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[UserStatus] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]') AND name = N'PK_Course_ClassUsers_ClassId')
CREATE NONCLUSTERED INDEX [PK_Course_ClassUsers_ClassId] ON [dbo].[Course_ClassUsers] 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]') AND name = N'PK_Course_ClassUsers_UserId')
CREATE NONCLUSTERED INDEX [PK_Course_ClassUsers_UserId] ON [dbo].[Course_ClassUsers] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'ClassId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'ClassId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'UserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'UserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'ApplyId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户报名记录编号，用于当班级信息发生变更时，将报名信息回滚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'ApplyId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'StartDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期，该时间和结束时间用于描述散班学员的学习时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'EndDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'UserStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级学员状态：0-尚未开始上课。1-上课中。2-已完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'UserStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassUsers', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户加入该班级时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassUsers', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Course_ClassLessons]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course_ClassLessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[LessonDate] [date] NOT NULL,
	[LessonStartTime] [time](0) NOT NULL,
	[LessonEndTime] [time](0) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Course_ClassLessons] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]') AND name = N'PK_Course_ClassLessons_ClassId')
CREATE NONCLUSTERED INDEX [PK_Course_ClassLessons_ClassId] ON [dbo].[Course_ClassLessons] 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'LessonId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课时编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'LessonId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'CourseId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课时所属课程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'CourseId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'ClassId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课时所属班级编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'ClassId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'LessonDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课时所在日期，yyyy-MM-dd格式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'LessonDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'LessonStartTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课时开始时间，HH:mm格式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'LessonStartTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'LessonEndTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课时开始时间，HH:mm格式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'LessonEndTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Course_ClassLessons', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Course_ClassLessons', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  StoredProcedure [dbo].[SP_Extend_GetTopAdverts]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Extend_GetTopAdverts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-28
-- 用  途：查询符合指定条件的广告数据
-- 返回值：广告数据
-- =============================================
CREATE PROCEDURE [dbo].[SP_Extend_GetTopAdverts]
    (
      @SchoolId INT ,
      @Size INT ,
      @ChannelCode NVARCHAR(128) ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        DECLARE @ChannelCategoryId INT 
        SELECT  @ChannelCategoryId = ISNULL(CategoryId, 0)
        FROM    Support_AppChannel
        WHERE   ChannelCode = @ChannelCode
		
        IF @SchoolId > 0
            BEGIN
                
                SET ROWCOUNT @Size
                SELECT  *
                FROM    Extend_Adverts
                WHERE   IsEnabled = 1
                        AND ( SchoolId = @SchoolId
                              OR ( SchoolId = 0
                                   AND IsSysAd = 1
                                 )
                            )
                        AND ( ShowInTime = 0
                              OR ( ShowInTime = 1
                                   AND StartTime <= @Date
                                   AND EndTime >= @Date
                                 )
                            )
                        AND ( AppChannelCategoryId = 0
                              OR ( AppChannelCategoryId = @ChannelCategoryId
                                   AND AppChannel = ''''
                                 )
                              OR ( AppChannelCategoryId = @ChannelCategoryId
                                   AND AppChannel = @ChannelCode
                                 )
                            )
                ORDER BY Sort DESC ,
                        CreateDate DESC ,
                        AdvertId DESC
            
            END   
        ELSE
            BEGIN
			
                SET ROWCOUNT @Size
                SELECT  *
                FROM    Extend_Adverts
                WHERE   IsEnabled = 1
                        AND SchoolId = 0
                        AND ( ShowInTime = 0
                              OR ( ShowInTime = 1
                                   AND StartTime <= @Date
                                   AND EndTime >= @Date
                                 )
                            )
                        AND ( AppChannelCategoryId = 0
                              OR ( AppChannelCategoryId = @ChannelCategoryId
                                   AND AppChannel = ''''
                                 )
                              OR ( AppChannelCategoryId = @ChannelCategoryId
                                   AND AppChannel = @ChannelCode
                                 )
                            )
                ORDER BY Sort DESC ,
                        CreateDate DESC ,
                        AdvertId DESC 
                               
            END   
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_UpdateTopicContent]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_UpdateTopicContent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：更新帖子内容、声音和图标
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_UpdateTopicContent]
    (
      @TopicId INT ,
      @Content NTEXT ,
      @Icon NVARCHAR(MAX) ,
      @Voice NVARCHAR(MAX)
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  Forum_Topics
        SET     Content = @Content ,
                Icon = @Icon ,
                Voice = @Voice
        WHERE   TopicId = @TopicId
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_CreateTopic]    Script Date: 07/20/2017 15:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_CreateTopic]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：创建帖子
-- 返回值：帖子编号
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_CreateTopic]
    (
      @ForumId INT ,
      @SchoolId INT ,
      @UserId INT ,
      @AttachContent NVARCHAR(MAX) ,
      @Title NVARCHAR(256) ,
      @Content NTEXT ,
      @Intro NVARCHAR(MAX) ,
      @Icon NVARCHAR(MAX) ,
      @Voice NVARCHAR(MAX) ,
      @Reward INT ,
      @IsQuestion BIT ,
      @IsAllowReply BIT ,
      @Status INT ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        INSERT  INTO Forum_Topics
                ( ForumId ,
                  SchoolId ,
                  UserId ,
                  AttachContent ,
                  Title ,
                  Content ,
                  Intro ,
                  Icon ,
                  Voice ,
                  Remark ,
                  Reward ,
                  IsQuestion ,
                  IsAllowReply ,
                  IsStick ,
                  IsRefined ,
                  AttrChangedMark ,
                  ExpChanged ,
                  VirtualCoinChanged ,
                  BestAnswerId ,
                  FavouredCount ,
                  RepliedCount ,
                  RepliedUserIds ,
                  LastRepliedDate ,
                  ViewCount ,
                  FavoritedCount ,
                  [Status] ,
                  CreateDate ,
                  ManageMark ,
                  LastManageDate
		        )
        VALUES  ( @ForumId ,
                  @SchoolId ,
                  @UserId ,
                  @AttachContent ,
                  @Title ,
                  @Content ,
                  @Intro ,
                  @Icon ,
                  @Voice ,
                  '''' ,
                  @Reward ,
                  @IsQuestion ,
                  @IsAllowReply ,
                  0 ,
                  0 ,
                  '''' ,
                  0 ,
                  0 ,
                  0 ,
                  0 ,
                  0 ,
                  '''' ,
                  @CreateDate ,
                  0 ,
                  0 ,
                  @Status ,
                  @CreateDate ,
                  '''' ,
                  @CreateDate
		        )
        
        DECLARE @TopicId INT
        
        IF @@ERROR <> 0
            OR @@ROWCOUNT = 0
            SELECT  @TopicId = 0
        ELSE
            SELECT  @TopicId = SCOPE_IDENTITY()
            
        IF @TopicId > 0
            UPDATE  User_UserExt
            SET     TopicCount = ( TopicCount + 1 )
            WHERE   UserId = @UserId
		
        SELECT  @TopicId				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_AddTopicViewCount]    Script Date: 07/20/2017 15:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_AddTopicViewCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：更新帖子浏览次数
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_AddTopicViewCount] ( @TopicId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  Forum_Topics
        SET     ViewCount = ( ViewCount + 1 )
        WHERE   TopicId = @TopicId
							    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetForumById]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetForumById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：查询指定的版块信息
-- 返回值：版块信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetForumById]
    (
      @ForumId INT ,
      @SchoolId INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @SchoolId > 0
            SELECT  ForumId ,
                    ForumName ,
                    ForumIcon ,
                    AllowPost ,
                    AllowPostType ,
                    LinkType
            FROM    Forum_SchoolForums
            WHERE   SchoolId = @SchoolId
                    AND ForumId = @ForumId 
        ELSE
            SELECT  ForumId ,
                    ForumName ,
                    ForumIcon ,
                    AllowPost ,
                    AllowPostType ,
                    LinkType
            FROM    Forum_Forums
            WHERE   ForumId = @ForumId
							    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetForumUpdated]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetForumUpdated]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-08
-- 用  途：用户查询距离上次查询后论坛版块更新信息
-- 返回值：更新的论坛版块信息列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetForumUpdated]
    (
      @UserId INT ,
      @DeviceId INT ,
      @SchoolId INT ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
		-- 查询
        IF NOT EXISTS ( SELECT  1
                        FROM    Forum_UserUpdateForumLogs
                        WHERE   UserId = @UserId
                                AND DeviceId = @DeviceId )
            BEGIN
                IF @SchoolId > 0
                    SELECT  ForumId ,
                            ForumName ,
                            ForumIcon ,
                            AllowPost ,
                            AllowPostType ,
                            LinkType
                    FROM    Forum_SchoolForums
                    WHERE   SchoolId = @SchoolId
                    ORDER BY Sort DESC ,
                            CreateDate DESC ,
                            ForumId DESC                    
                ELSE
                    SELECT  ForumId ,
                            ForumName ,
                            ForumIcon ,
                            AllowPost ,
                            AllowPostType ,
                            LinkType
                    FROM    Forum_Forums
                    WHERE   BindSchool = 0
                    ORDER BY Sort DESC ,
                            CreateDate DESC ,
                            ForumId DESC 				
            END 
        ELSE
            BEGIN
                DECLARE @LastDate DATETIME                
                
                SELECT TOP 1
                        @LastDate = LastUpdateDate
                FROM    Forum_UserUpdateForumLogs
                WHERE   UserId = @UserId
                        AND DeviceId = @DeviceId
                ORDER BY LastUpdateDate DESC 
				
                IF @SchoolId > 0
                    SELECT  ForumId ,
                            ForumName ,
                            ForumIcon ,
                            AllowPost ,
                            AllowPostType ,
                            LinkType
                    FROM    Forum_SchoolForums
                    WHERE   SchoolId = @SchoolId
                            AND LastChangeDate >= @LastDate
                    ORDER BY Sort DESC ,
                            CreateDate DESC ,
                            ForumId DESC
                ELSE
                    SELECT  ForumId ,
                            ForumName ,
                            ForumIcon ,
                            AllowPost ,
                            AllowPostType ,
                            LinkType
                    FROM    Forum_Forums
                    WHERE   BindSchool = 0
                            AND LastChangeDate >= @LastDate
                    ORDER BY Sort DESC ,
                            CreateDate DESC ,
                            ForumId DESC				
            END 
        --写入日志
        INSERT  INTO Forum_UserUpdateForumLogs
                ( UserId, DeviceId, LastUpdateDate )
        VALUES  ( @UserId, @DeviceId, @Date )				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetTopicById]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetTopicById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-09
-- 用  途：查询指定的帖子信息
-- 返回值：帖子信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetTopicById]
    (
      @TopicId INT ,
      @UpdateTopic BIT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @UpdateTopic = 1
            BEGIN
                UPDATE  Forum_Topics
                SET     RepliedUserIds = '''' ,
                        ViewCount = ( ViewCount + 1 )
                WHERE   TopicId = @TopicId		
            END 
		
        SELECT  TopicId ,
                UserId ,
                ForumId ,
                AttachContent ,
                Title ,
                Content ,
                Intro ,
                Icon ,
                Voice ,
                Remark ,
                Reward ,
                IsQuestion ,
                IsAllowReply ,
                IsStick ,
                IsRefined ,
                AttrChangedMark ,
                ExpChanged ,
                VirtualCoinChanged ,
                BestAnswerId ,
                FavouredCount ,
                RepliedCount ,
                ViewCount ,
                FavoritedCount ,
                CreateDate
        FROM    Forum_Topics
        WHERE   TopicId = @TopicId
							    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_School_GetCsUsers]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_School_GetCsUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-26
-- 用  途：查询指定学校的可用客服用户编号列表
-- 返回值：可用客服用户编号列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_School_GetCsUsers]
    (
      @SchoolId INT ,
      @UserRole INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  UserId
        FROM    User_UserExt
        WHERE   UserSite = @SchoolId
                AND UserRole = @UserRole		    
    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_CreateGroup]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_CreateGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：创建群组信息
-- 返回值：群组编号
-- =======================================================
CREATE PROCEDURE [dbo].[SP_Social_CreateGroup]
    (
      @GroupName NVARCHAR(128) ,
      @GroupIcon NVARCHAR(512) ,
      @Comment NVARCHAR(512) ,
      @MaxMemberCount INT ,
      @MemberCount INT ,
      @GroupType INT ,
      @CreatorId INT ,
      @InterestCode NVARCHAR(64) ,
      @QuickJoinCode NVARCHAR(16) ,
      @CreateDate DATETIME ,
      @IsCreator BIT ,
      @SchoolId INT ,
      @ClassId INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        DECLARE @GroupId INT
        
        INSERT  INTO Chat_Groups
                ( GroupName ,
                  GroupIcon ,
                  Comment ,
                  MaxMemberCount ,
                  MemberCount ,
                  GroupType ,
                  CreatorId ,
                  InterestCode ,
                  QuickJoinCode ,
                  CreateDate
		        )
        VALUES  ( @GroupName ,
                  @GroupIcon ,
                  @Comment ,
                  @MaxMemberCount ,
                  @MemberCount ,
                  @GroupType ,
                  @CreatorId ,
                  @InterestCode ,
                  @QuickJoinCode ,
                  @CreateDate
		        ) 
        IF @@ERROR <> 0
            OR @@ROWCOUNT = 0
            SET @GroupId = 0
        ELSE
            SET @GroupId = SCOPE_IDENTITY()
			
        IF @GroupId > 0
            BEGIN
				
                IF @CreatorId > 0
                    BEGIN
						
                        INSERT  INTO Chat_GroupMembers
                                ( GroupId ,
                                  UserId ,
                                  IsCreator ,
                                  CreateDate
                                )
                        VALUES  ( @GroupId ,
                                  @CreatorId ,
                                  @IsCreator ,
                                  @CreateDate
                                )
						
                        UPDATE  Chat_Groups
                        SET     MemberCount = MemberCount + 1
                        WHERE   GroupId = @GroupId
						
                    END 
                    
                IF @SchoolId > 0
                    INSERT  INTO Chat_Group_SchoolAndClass
                            ( GroupId, SchoolId, ClassId )
                    VALUES  ( @GroupId, @SchoolId, @ClassId )
				
            END
			
        SELECT  @GroupId
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_ChangedFollowedWithTargetUser]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_ChangedFollowedWithTargetUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-24
-- 用  途：改变指定的2个用户之间的单向“关注”关系
-- 返回值：0失败，1成功
-- =============================================
CREATE PROCEDURE [dbo].[SP_Social_ChangedFollowedWithTargetUser]
    (
      @UserId INT ,
      @FollowedUserId INT ,
      @CreateDate DATETIME ,
      @Action TINYINT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
		--新增
        IF @Action = 1
            BEGIN
                IF NOT EXISTS ( SELECT  1
                                FROM    User_Followers
                                WHERE   UserId = @UserId
                                        AND FollowedUserId = @FollowedUserId )
                    BEGIN
								
                        INSERT  INTO User_Followers
                                ( UserId ,
                                  FollowedUserId ,
                                  CreateDate
                                )
                        VALUES  ( @UserId ,
                                  @FollowedUserId ,
                                  @CreateDate
                                )
                                
                        UPDATE  User_UserExt
                        SET     FollowedCount = ( FollowedCount + 1 )
                        WHERE   UserId = @UserId
                        
                        UPDATE  User_UserExt
                        SET     FansCount = ( FansCount + 1 )
                        WHERE   UserId = @FollowedUserId
								
                        SELECT  1
                    
                    END 					
                ELSE
                    SELECT  0 			
            END 
		
		--移除
        IF @Action = 0
            BEGIN
                IF EXISTS ( SELECT  1
                            FROM    User_Followers
                            WHERE   UserId = @UserId
                                    AND FollowedUserId = @FollowedUserId )
                    BEGIN
								
                        DELETE  FROM User_Followers
                        WHERE   UserId = @UserId
                                AND FollowedUserId = @FollowedUserId
						
                        UPDATE  User_UserExt
                        SET     FollowedCount = ( FollowedCount - 1 )
                        WHERE   UserId = @UserId
                        
                        UPDATE  User_UserExt
                        SET     FansCount = ( FansCount - 1 )
                        WHERE   UserId = @FollowedUserId
								
                        SELECT  1
                    
                    END 					
                ELSE
                    SELECT  0 			
            END  			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UserAccountCreate]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UserAccountCreate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：创建用户记录
-- 返回值：用户编号
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UserAccountCreate]
    (
      @UserId INT ,
      @UserName NVARCHAR(128) ,
      @Password NVARCHAR(128) ,
      @PasswordFormat INT ,
      @PasswordSalt NVARCHAR(128) ,
      @LoginCount INT ,
      @CreateDate DATETIME ,
      @NickName NVARCHAR(128) ,
      @RealName NVARCHAR(128) ,
      @BackIcon NVARCHAR(512) ,
      @HeadIcon NVARCHAR(512) ,
      @Signature NVARCHAR(MAX) ,
      @Comment NVARCHAR(MAX) ,
      @Gender INT ,
      @Birthday DATETIME ,
      @IDCardNo NVARCHAR(18) ,
      @Area NVARCHAR(256) ,
      @Address NVARCHAR(256) ,
      @PostCode NVARCHAR(6) ,
      @Industry NVARCHAR(256) ,
      @Company NVARCHAR(256) ,
      @JobPosition NVARCHAR(256) ,
      @Interests NVARCHAR(256) ,
      @WebSite NVARCHAR(256) ,
      @Email NVARCHAR(256) ,
      @Mobile NVARCHAR(16) ,
      @Telphone NVARCHAR(16) ,
      @QQ NVARCHAR(16) ,
      @MSN NVARCHAR(256) ,
      @OtherInfo NVARCHAR(MAX) ,
      @UserSite INT ,
      @UserRole INT ,
      @UserAccess INT ,
      @CreateDeviceId INT ,
      @CreateAPPChannel NVARCHAR(128) ,
      @CreateAccountChannel INT ,
      @Longitude DECIMAL(8, 5) ,
      @Latitudes DECIMAL(8, 5) ,
      @RemindPrivateMessage BIT ,
      @RemindGroupMessage BIT ,
      @RemindBeFollowed BIT ,
      @RemindTopicBeReply BIT ,
      @SchoolId INT ,
      @IsTrial BIT ,
      @TrialedSource NVARCHAR(256) ,
      @IsActivated BIT ,
      @IsExpired BIT ,
      @StudNo NVARCHAR(64) ,
      @ClassInfo NVARCHAR(128) ,
      @SchoolComment NVARCHAR(128) ,
      @SyncForBbs BIT ,
      @Status INT        
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        BEGIN TRAN Trans 
		
        DECLARE @ErrorCode INT
        SET @ErrorCode = 0
        
        IF @UserId > 0
            BEGIN
                SET IDENTITY_INSERT [User_UserBase] ON 
			
                INSERT  INTO User_UserBase
                        ( UserId ,
                          UserName ,
                          [Password] ,
                          PasswordFormat ,
                          PasswordSalt ,
                          LastPasswordChangedDate ,
                          IsApproved ,
                          ApprovedDate ,
                          IsLocked ,
                          LastLockedoutDate ,
                          CreateDate ,
                          LoginCount ,
                          LastLoginDate
                        )
                VALUES  ( @UserId ,
                          @UserName ,
                          @Password ,
                          @PasswordFormat ,
                          @PasswordSalt ,
                          @CreateDate ,
                          1 ,
                          @CreateDate ,
                          0 ,
                          @CreateDate ,
                          @CreateDate ,
                          @LoginCount ,
                          @CreateDate
                        )   
                
                IF @@ERROR <> 0
                    OR @@ROWCOUNT = 0
                    SELECT  @UserId = 0                
            
                SET IDENTITY_INSERT [User_UserBase] OFF	
            END 
        ELSE
            BEGIN
                INSERT  INTO User_UserBase
                        ( UserName ,
                          [Password] ,
                          PasswordFormat ,
                          PasswordSalt ,
                          LastPasswordChangedDate ,
                          IsApproved ,
                          ApprovedDate ,
                          IsLocked ,
                          LastLockedoutDate ,
                          CreateDate ,
                          LoginCount ,
                          LastLoginDate
                        )
                VALUES  ( @UserName ,
                          @Password ,
                          @PasswordFormat ,
                          @PasswordSalt ,
                          @CreateDate ,
                          1 ,
                          @CreateDate ,
                          0 ,
                          @CreateDate ,
                          @CreateDate ,
                          @LoginCount ,
                          @CreateDate
                        )   
                
                IF @@ERROR <> 0
                    OR @@ROWCOUNT = 0
                    SELECT  @UserId = 0
                ELSE
                    SELECT  @UserId = SCOPE_IDENTITY()
            END 
         
        SELECT  @ErrorCode = @ErrorCode + @@ERROR
         
        IF @UserId > 0
            BEGIN
                INSERT  INTO User_UserInfo
                        ( UserId ,
                          NickName ,
                          RealName ,
                          BackIcon ,
                          HeadIcon ,
                          [Signature] ,
                          Comment ,
                          Gender ,
                          Birthday ,
                          IDCardNo ,
                          Area ,
                          [Address] ,
                          PostCode ,
                          Industry ,
                          Company ,
                          JobPosition ,
                          Interests ,
                          WebSite ,
                          Email ,
                          Mobile ,
                          Telphone ,
                          QQ ,
                          MSN ,
                          OtherInfo ,
                          LastChangeDate
				        )
                VALUES  ( @UserId ,
                          @NickName ,
                          @RealName ,
                          @BackIcon ,
                          @HeadIcon ,
                          @Signature ,
                          @Comment ,
                          @Gender ,
                          @Birthday ,
                          @IDCardNo ,
                          @Area ,
                          @Address ,
                          @PostCode ,
                          @Industry ,
                          @Company ,
                          @JobPosition ,
                          @Interests ,
                          @WebSite ,
                          @Email ,
                          @Mobile ,
                          @Telphone ,
                          @QQ ,
                          @MSN ,
                          @OtherInfo ,
                          @CreateDate
				        )
				        
                SELECT  @ErrorCode = @ErrorCode + @@ERROR
				
                INSERT  INTO User_UserExt
                        ( UserId ,
                          UserSite ,
                          UserRole ,
                          UserAccess ,
                          CreateDeviceId ,
                          CreateAPPChannel ,
                          CreateAccountChannel ,
                          LastLoginDeviceId ,
                          LastLoginAPPChannel ,
                          LastLoginAccountChannel ,
                          ExpLevel ,
                          ExpScore ,
                          GradeName ,
                          GradeIcon ,
                          VirtualCoinCount ,
                          FansCount ,
                          FollowedCount ,
                          TopicCount ,
                          ReplyCount
				        )
                VALUES  ( @UserId ,
                          @UserSite ,
                          @UserRole ,
                          @UserAccess ,
                          @CreateDeviceId ,
                          @CreateAPPChannel ,
                          @CreateAccountChannel ,
                          @CreateDeviceId ,
                          @CreateAPPChannel ,
                          @CreateAccountChannel ,
                          0 ,
                          0 ,
                          '''' ,
                          '''' ,
                          0 ,
                          0 ,
                          0 ,
                          0 ,
                          0
				        )
				        
                SELECT  @ErrorCode = @ErrorCode + @@ERROR       
                
                INSERT  INTO User_UserCoords
                        ( UserId ,
                          Longitude ,
                          Latitudes ,
                          LastChangeTime
				        )
                VALUES  ( @UserId ,
                          @Longitude ,
                          @Latitudes ,
                          @CreateDate
				        )
				
                SELECT  @ErrorCode = @ErrorCode + @@ERROR
				
                INSERT  INTO User_AppOptions
                        ( UserId ,
                          RemindPrivateMessage ,
                          RemindGroupMessage ,
                          RemindBeFollowed ,
                          RemindTopicBeReply ,
                          LastChangeDate
					    )
                VALUES  ( @UserId ,
                          @RemindPrivateMessage ,
                          @RemindGroupMessage ,
                          @RemindBeFollowed ,
                          @RemindTopicBeReply ,
                          @CreateDate
					    )	
				
                SELECT  @ErrorCode = @ErrorCode + @@ERROR
				
                IF @UserSite > 0
                    BEGIN
						
                        INSERT  INTO School_Users
                                ( UserId ,
                                  SchoolId ,
                                  IsTrial ,
                                  TrialedSource ,
                                  IsActivated ,
                                  ActivatedDate ,
                                  IsExpired ,
                                  ExpiredDate ,
                                  StudNo ,
                                  ClassInfo ,
                                  Comment ,
                                  SyncForBbs ,
                                  [Status]
						        )
                        VALUES  ( @UserId ,
                                  @SchoolId ,
                                  @IsTrial ,
                                  @TrialedSource ,
                                  @IsActivated ,
                                  @CreateDate ,
                                  @IsExpired ,
                                  @CreateDate ,
                                  @StudNo ,
                                  @ClassInfo ,
                                  @SchoolComment ,
                                  @SyncForBbs ,
                                  @Status
						        )
						 
                        SELECT  @ErrorCode = @ErrorCode + @@ERROR
					
                    END 
				
            END			
			
        IF @ErrorCode = 0
            BEGIN
                COMMIT TRAN
                SELECT  @UserId
            END 	
        ELSE
            BEGIN
                ROLLBACK TRAN
                SELECT  0
            END 
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UpdateUserWhenSignIn]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UpdateUserWhenSignIn]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：更新用户登录成功相关信息
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UpdateUserWhenSignIn]
    (
      @UserId INT ,
      @LastLoginDeviceId INT ,
      @LastLoginAPPChannel NVARCHAR(128) ,
      @LastLoginAccountChannel INT ,
      @LastLoginDate DATETIME 
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserBase
        SET     LoginCount = LoginCount + 1 ,
                LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId
        
        UPDATE  User_UserExt
        SET     LastLoginDeviceId = @LastLoginDeviceId ,
                LastLoginAPPChannel = @LastLoginAPPChannel ,
                LastLoginAccountChannel = @LastLoginAccountChannel
        WHERE   UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UpdateUserOptions]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UpdateUserOptions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：更新用户应用设置
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UpdateUserOptions]
    (
      @UserId INT ,
      @RemindPrivateMessage BIT ,
      @RemindGroupMessage BIT ,
      @RemindBeFollowed BIT ,
      @RemindTopicBeReply BIT ,
      @LastChangeDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_AppOptions
        SET     RemindPrivateMessage = @RemindPrivateMessage ,
                RemindGroupMessage = @RemindGroupMessage ,
                RemindBeFollowed = @RemindBeFollowed ,
                RemindTopicBeReply = @RemindTopicBeReply ,
                LastChangeDate = @LastChangeDate
        WHERE   UserId = @UserId
        	    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UpdateUserInfo]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UpdateUserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：更新用户个人信息
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UpdateUserInfo]
    (
      @UserId INT ,
      @NickName NVARCHAR(128) ,
      @Signature NVARCHAR(MAX) ,
      @Gender INT ,
      @Birthday DATETIME ,
      @Area NVARCHAR(256) ,
      @Interests NVARCHAR(256)
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserInfo
        SET     NickName = @NickName ,
                [Signature] = @Signature ,
                Gender = @Gender ,
                Birthday = @Birthday ,
                Area = @Area ,
                Interests = @Interests
        WHERE   UserId = @UserId
        	    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UpdateUserIcon]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UpdateUserIcon]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：更新用户图片信息
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UpdateUserIcon]
    (
      @UserId INT ,
      @IconUrl NVARCHAR(512) ,
      @Datetime DATETIME ,
      @T TINYINT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @T = 0
            UPDATE  User_UserInfo
            SET     HeadIcon = @IconUrl ,
                    LastChangeDate = @Datetime
            WHERE   UserId = @UserId
        ELSE
            UPDATE  User_UserInfo
            SET     BackIcon = @IconUrl ,
                    LastChangeDate = @Datetime
            WHERE   UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UpdateGuestAccount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UpdateGuestAccount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：更新游客账号用户名和昵称
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UpdateGuestAccount]
    (
      @UserId INT ,
      @UserName NVARCHAR(128) ,
      @NickName NVARCHAR(128)
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserBase
        SET     UserName = @UserName
        WHERE   UserId = @UserId
        
        UPDATE  User_UserInfo
        SET     NickName = @NickName
        WHERE   UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_SchoolTrialUserStatusChanged]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_SchoolTrialUserStatusChanged]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：更改学校试用账号状态
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_SchoolTrialUserStatusChanged]
    (
      @UserId INT ,
      @IsActivated BIT ,
      @ActivatedDate DATETIME ,
      @IsExpired BIT ,
      @ExpiredDate DATETIME ,
      @Action INT 
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        IF @Action = 0
            UPDATE  School_Users
            SET     IsActivated = @IsActivated ,
                    ActivatedDate = @ActivatedDate ,
                    IsExpired = @IsExpired ,
                    ExpiredDate = @ExpiredDate
            WHERE   UserId = @UserId
        ELSE
            UPDATE  School_Users
            SET     IsExpired = @IsExpired
            WHERE   UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_GetUserWithSchool]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_GetUserWithSchool]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：获取指定用户与学校相关的信息
-- 返回值：用户与学校相关的信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_GetUserWithSchool] ( @UserId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  UserId ,
                SchoolId ,
                IsTrial ,
                TrialedSource ,
                IsActivated ,
                ActivatedDate ,
                IsExpired ,
                ExpiredDate ,
                StudNo ,
                ClassInfo ,
                Comment ,
                SyncForBbs ,
                [Status]
        FROM    School_Users
        WHERE   UserId = @UserId		
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_GetUserVaildInfo]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_GetUserVaildInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：获取用户账户验证信息
-- 返回值：用户账户验证信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_GetUserVaildInfo]
    (
      @UserName NVARCHAR(128) ,
      @UserAccess INT 
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  U.UserId ,
                U.UserName ,
                U.[Password] ,
                U.PasswordSalt ,
                U.IsApproved ,
                U.ApprovedDate ,
                U.IsLocked ,
                U.LastLockedoutDate ,
                U.LoginCount ,
                U.LastLoginDate ,
                E.UserSite ,
                E.UserRole ,
                E.UserAccess ,
                E.LastLoginDeviceId
        FROM    User_UserBase U
                INNER JOIN User_UserExt E ON U.UserId = E.UserId
                                             AND ( E.UserAccess & @UserAccess ) = @UserAccess
        WHERE   U.UserName = @UserName
		
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_GetUserInfoForCache]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_GetUserInfoForCache]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-23
-- 用  途：获取指定用户用于缓存的相关信息
-- 返回值：用于缓存的用户相关信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_GetUserInfoForCache] ( @UserId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  U.UserId ,
                U.UserName ,
                I.NickName ,
                I.RealName ,
                I.BackIcon ,
                I.HeadIcon ,
                I.[Signature] ,
                I.Gender ,
                I.Area ,
                I.Birthday ,
                I.UserAge ,
                I.Interests ,
                E.UserSite ,
                E.UserRole ,
                E.UserAccess ,
                E.ExpScore ,
                E.ExpLevel ,
                E.GradeName ,
                E.GradeIcon ,
                E.VirtualCoinCount ,
                E.FansCount ,
                E.FollowedCount ,
                E.TopicCount ,
                E.ReplyCount ,
                O.RemindPrivateMessage ,
                O.RemindGroupMessage ,
                O.RemindBeFollowed ,
                O.RemindTopicBeReply ,
                D.[Platform] ,
                D.Token ,
                ISNULL(C.StudNo, '''') AS StudNo ,
                ISNULL(C.ClassInfo, '''') AS ClassInfo ,
                ISNULL(C.Comment, '''') AS Comment ,
                ISNULL(C.IsTrial, 0) AS IsTrial
        FROM    User_UserBase U
                INNER JOIN User_UserInfo I ON I.UserId = U.UserId
                INNER JOIN User_UserExt E ON E.UserId = U.UserId
                INNER JOIN User_AppOptions O ON O.UserId = U.UserId
                INNER JOIN User_Devices D ON E.LastLoginDeviceId = D.DeviceId
                LEFT JOIN School_Users C ON C.UserId = U.UserId
                                            AND E.UserSite = C.SchoolId
        WHERE   U.UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_QuitFromGroup]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_QuitFromGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：用户退出群组
-- 返回值：操作结果:-1-不是群组成员,0-群组解散，1-仅退出
-- =======================================================
CREATE PROCEDURE [dbo].[SP_Social_QuitFromGroup]
    (
      @GroupId INT ,
      @UserId INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        IF EXISTS ( SELECT  1
                    FROM    Chat_GroupMembers
                    WHERE   GroupId = @GroupId
                            AND UserId = @UserId )
            BEGIN
				--删除用户与群组关系
                DELETE  FROM Chat_GroupMembers
                WHERE   GroupId = @GroupId
                        AND UserId = @UserId
				
				--如果退出的用户是群组创建者，则删除群
                IF EXISTS ( SELECT  1
                            FROM    Chat_Groups
                            WHERE   GroupId = @GroupId
                                    AND CreatorId = @UserId )
                    BEGIN
						
                        DELETE  FROM Chat_Groups
                        WHERE   GroupId = @GroupId						
						
                        SELECT  0
						
                    END
                ELSE
                    BEGIN
						
						--减少群组成员数量
                        UPDATE  Chat_Groups
                        SET     MemberCount = MemberCount - 1
                        WHERE   GroupId = @GroupId
                        
                        SELECT  1 	
					
                    END 						
            END 
        ELSE
            SELECT  -1    
    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_JoinToGroup]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_JoinToGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：用户加入群组
-- 返回值：加入结果:0-目标群组已满员，1-加入成功， 2-用户已是群组成员
-- =============================================
CREATE PROCEDURE [dbo].[SP_Social_JoinToGroup]
    (
      @GroupId INT ,
      @UserId INT ,
      @IsCreator BIT ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
        
        IF EXISTS ( SELECT  1
                    FROM    Chat_Groups
                    WHERE   GroupId = @GroupId
                            AND MemberCount < MaxMemberCount )
            BEGIN
                IF NOT EXISTS ( SELECT  1
                                FROM    Chat_GroupMembers
                                WHERE   GroupId = @GroupId
                                        AND UserId = @UserId )
                    BEGIN
                        INSERT  INTO Chat_GroupMembers
                                ( GroupId ,
                                  UserId ,
                                  IsCreator ,
                                  CreateDate
                                )
                        VALUES  ( @GroupId ,
                                  @UserId ,
                                  @IsCreator ,
                                  @CreateDate
                                )
					
                        UPDATE  Chat_Groups
                        SET     MemberCount = MemberCount + 1
                        WHERE   GroupId = @GroupId
					
                        SELECT  1					
                    END 
                ELSE
                    SELECT  2			
            END 
        ELSE
            SELECT  0        
         					    
    END' 
END
GO
/****** Object:  Table [dbo].[Support_AreaCounty]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AreaCounty](
	[CountyId] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[CountyName] [nvarchar](128) NOT NULL,
	[CountyShortName] [nvarchar](128) NOT NULL,
	[CountyEName] [nvarchar](128) NOT NULL,
	[CountyCode] [nvarchar](128) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AreaCounty_1] PRIMARY KEY CLUSTERED 
(
	[CountyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'CityId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属城市编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'CityId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'CountyName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区县名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'CountyName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'CountyShortName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区县简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'CountyShortName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'CountyEName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区县简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'CountyEName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'CountyCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区县编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'CountyCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaCounty', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaCounty', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  Table [dbo].[Support_AppVersion]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AppVersion](
	[VersionId] [int] IDENTITY(1,1) NOT NULL,
	[ChannelCode] [nvarchar](128) NOT NULL,
	[VersionName] [nvarchar](16) NOT NULL,
	[PrevVersionId] [int] NOT NULL,
	[VersionComment] [nvarchar](max) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[UpgradeSource] [int] NOT NULL,
	[UpgradePath] [nvarchar](2000) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AppVersion] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'VersionId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用版本信息编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'VersionId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'ChannelCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本所属渠道标识码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'ChannelCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'VersionName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'VersionName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'PrevVersionId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本版本对应的上一个版本信息编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'PrevVersionId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'VersionComment'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'VersionComment'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'IsRequired'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为强制升级版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'IsRequired'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'UpgradeSource'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本升级途径：1-应用市场升级，2-自有升级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'UpgradeSource'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'UpgradePath'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本升级下载路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'UpgradePath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本信息是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AppVersion', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本信息数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AppVersion', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UserVirtualCoinChanged]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UserVirtualCoinChanged]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：更新用户虚拟币账户余额
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UserVirtualCoinChanged]
    (
      @UserId INT ,
      @CoinChanged INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserExt
        SET     VirtualCoinCount = ( VirtualCoinCount + @CoinChanged )
        WHERE   UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UserNameCount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UserNameCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：检测指定的用户名记录总数
-- 返回值：符合用户名的用户记录总数
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UserNameCount]
    (
      @UserName NVARCHAR(128) ,
      @UserAccess INT 
    )
AS
    BEGIN
        SET NOCOUNT ON;
	
        SELECT  COUNT(0)
        FROM    User_UserBase U
                INNER JOIN User_UserExt E ON U.UserId = E.UserId
                                             AND ( E.UserAccess & @UserAccess ) = @UserAccess
        WHERE   U.UserName = @UserName                
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UserExpChanged]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Users_UserExpChanged]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-22
-- 用  途：更新用户经验值
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_UserExpChanged]
    (
      @UserId INT ,
      @ExpChanged INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  User_UserExt
        SET     ExpScore = ( ExpScore + @ExpChanged )
        WHERE   UserId = @UserId
        
        UPDATE  U
        SET     U.ExpLevel = ISNULL(G.GradeId, 0) ,
                U.GradeName = ISNULL(G.GradeName, '''') ,
                U.GradeIcon = ISNULL(G.GradeIcon, '''')
        FROM    User_UserExt U
                LEFT JOIN User_ExpGrades G ON G.ExpLBound <= U.ExpScore
                                              AND G.ExpUBound > U.ExpScore
        WHERE   U.UserId = @UserId
			    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Support_GetInterestWordList]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Support_GetInterestWordList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：查询所有兴趣组
-- 返回值：所有兴趣组名称、类型和编号列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Support_GetInterestWordList]
AS
    BEGIN
        SET NOCOUNT ON;
	
        SELECT  Id ,
                TypeId ,
                Word
        FROM    Support_InterestWord
        WHERE   IsEnabled = 1
        ORDER BY Sort DESC ,
                Id DESC  
		
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_GetUserGroups]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_GetUserGroups]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：获取用户参与的所有群组列表
-- 返回值：群组列表
-- =======================================================
CREATE PROCEDURE [dbo].[SP_Social_GetUserGroups] ( @UserId INT )
AS
    BEGIN
        SET NOCOUNT ON;
        
        SELECT  M.GroupId
        FROM    Chat_GroupMembers M
                INNER JOIN Chat_Groups G ON G.GroupId = M.GroupId
        WHERE   M.UserId = @UserId
        ORDER BY G.CreateDate DESC ,
                G.GroupId DESC 
    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Social_GetGroupMembers]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Social_GetGroupMembers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-25
-- 用  途：获取指定群组成员列表
-- 返回值：群组成员列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Social_GetGroupMembers] ( @GroupId INT )
AS
    BEGIN
        SET NOCOUNT ON;
        
        SELECT  GroupId ,
                UserId ,
                IsCreator ,
                CreateDate
        FROM    Chat_GroupMembers
        WHERE   GroupId = @GroupId   
         					    
    END' 
END
GO
/****** Object:  Table [dbo].[Support_AreaTowns]    Script Date: 07/20/2017 15:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Support_AreaTowns](
	[TownId] [int] IDENTITY(1,1) NOT NULL,
	[CountyId] [int] NOT NULL,
	[TownName] [nvarchar](128) NOT NULL,
	[TownShortName] [nvarchar](128) NOT NULL,
	[TownEName] [nvarchar](128) NOT NULL,
	[TownCode] [nvarchar](128) NOT NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Support_AreaTowns] PRIMARY KEY CLUSTERED 
(
	[TownId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'TownId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乡镇编号，自动编号产生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'TownId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'CountyId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乡镇所属区县编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'TownName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乡镇名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'TownName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'TownShortName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乡镇简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'TownShortName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'TownEName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乡镇英文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'TownEName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'TownCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乡镇编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'TownCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'Sort'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'Sort'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'IsEnabled'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Support_AreaTowns', N'COLUMN',N'CreateDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Support_AreaTowns', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
/****** Object:  StoredProcedure [dbo].[SP_Support_GetNextVersion]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Support_GetNextVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-18
-- 用  途：查询是否存在下一个版本信息
-- 返回值：下一个版本信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Support_GetNextVersion]
    (
      @ChannelCode NVARCHAR(128) ,
      @VersionName NVARCHAR(16)
    )
AS
    BEGIN
        SET NOCOUNT ON;
	
        DECLARE @VersionId INT 
        SELECT  @VersionId = VersionId
        FROM    Support_AppVersion
        WHERE   ChannelCode = @ChannelCode
                AND VersionName = @VersionName
        IF @VersionId > 0
            SELECT  VersionName ,
                    VersionComment ,
                    IsRequired ,
                    UpgradeSource ,
                    UpgradePath
            FROM    Support_AppVersion
            WHERE   PrevVersionId = @VersionId
                    AND ChannelCode = @ChannelCode
                    AND IsEnabled = 1        
		
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_School_GetUserLessons]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_School_GetUserLessons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-26
-- 用  途：查询指定用户的课表信息
-- 返回值：用户的课表信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_School_GetUserLessons]
    (
      @SchoolId INT ,
      @UserId INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  L.LessonId ,
                L.CourseId ,
                L.ClassId ,
                L.LessonDate ,
                L.LessonStartTime ,
                L.LessonEndTime ,
                L.CreateDate ,
                C.ClassName
        FROM    Course_ClassLessons L
                INNER JOIN Course_Classes C ON C.ClassId = L.ClassId
                                               AND C.SchoolId = @SchoolId
                INNER JOIN Course_ClassUsers U ON U.ClassId = L.ClassId
                                                  AND U.UserId = @UserId
        ORDER BY L.LessonDate
    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_School_GetCourses]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_School_GetCourses]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-09-26
-- 用  途：查询指定学校的可用课程信息列表
-- 返回值：可用课程信息列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_School_GetCourses] ( @SchoolId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  CourseId ,
                CategoryId ,
                SchoolId ,
                CourseName ,
                CourseCode ,
                CourseIcon ,
                Intro ,
                Comment ,
                PriceName ,
                SalePriceName ,
                Sort ,
                IsEnabled ,
                CreateDate
        FROM    Course_Courses
        WHERE   SchoolId = @SchoolId
        ORDER BY Sort DESC ,
                CreateDate DESC ,
                CourseId DESC					    
    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetTopicPostList]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetTopicPostList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：查询帖子跟帖分页列表
-- 返回值：帖子跟帖分页列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetTopicPostList]
    (
      @TopicId INT ,
      @PageIndex INT ,
      @PageSize INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SET ROWCOUNT @PageSize 
        SELECT  *
        FROM    ( SELECT    TopicId ,
                            PostId ,
                            UserId ,
                            Content ,
                            FavouredCount ,
                            ReplyForUserId ,
                            IsBestReply ,
                            SetBestDate ,
                            ExpChanged ,
                            VirtualCoinChanged ,
                            CreateDate ,
                            ROW_NUMBER() OVER ( ORDER BY CreateDate DESC, PostId DESC ) AS RowNum
                  FROM      Forum_Posts
                  WHERE     [Status] = 1
                            AND TopicId = @TopicId
                ) AS List
        WHERE   List.RowNum > ( @PageIndex - 1 ) * @PageSize
        ORDER BY CreateDate DESC ,
                PostId DESC
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetTopicPostCount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetTopicPostCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：查询帖子跟帖数量
-- 返回值：帖子跟帖数量
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetTopicPostCount] ( @TopicId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  COUNT(0)
        FROM    Forum_Posts
        WHERE   TopicId = @TopicId
                AND [Status] = 1
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetPostById]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetPostById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：查询指定的回帖信息
-- 返回值：回帖信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetPostById] ( @PostId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  TopicId ,
                PostId ,
                UserId ,
                Content ,
                FavouredCount ,
                ReplyForUserId ,
                IsBestReply ,
                SetBestDate ,
                ExpChanged ,
                VirtualCoinChanged ,
                CreateDate
        FROM    Forum_Posts
        WHERE   PostId = @PostId
							    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetForumTopicCountUpdated]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetForumTopicCountUpdated]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================
-- 作  者：KEN
-- 日  期：2014-10-08
-- 用  途：用户查询距离上次查询后论坛版块帖子和回复更新数量信息
-- 返回值：论坛版块帖子和回复更新数量信息
-- ==============================================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetForumTopicCountUpdated]
    (
      @UserId INT ,
      @DeviceId INT ,
      @SchoolId INT ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
		-- 查询
        IF NOT EXISTS ( SELECT  1
                        FROM    Forum_UserUpdateTopicCountLogs
                        WHERE   UserId = @UserId
                                AND DeviceId = @DeviceId )
            BEGIN               
                IF @SchoolId > 0
                    SELECT  F.ForumId ,
                            ( ( SELECT  COUNT(0)
                                FROM    Forum_Topics
                                WHERE   ForumId = F.ForumId
                                        AND SchoolId = @SchoolId
                                        AND [Status] = 1
                              ) + ( SELECT  COUNT(0)
                                    FROM    Forum_Posts
                                    WHERE   ForumId = F.ForumId
                                            AND SchoolId = @SchoolId
                                            AND [Status] = 1
                                  ) ) AS TopicCount
                    FROM    Forum_SchoolForums F
                    WHERE   SchoolId = @SchoolId
                ELSE
                    SELECT  F.ForumId ,
                            ( ( SELECT  COUNT(0)
                                FROM    Forum_Topics
                                WHERE   ForumId = F.ForumId
                                        AND SchoolId = @SchoolId
                                        AND [Status] = 1
                              ) + ( SELECT  COUNT(0)
                                    FROM    Forum_Posts
                                    WHERE   ForumId = F.ForumId
                                            AND SchoolId = @SchoolId
                                            AND [Status] = 1
                                  ) ) AS TopicCount
                    FROM    Forum_Forums F
                    WHERE   BindSchool = 0               				
            END 
        ELSE
            BEGIN
                DECLARE @LastDate DATETIME                
                
                SELECT TOP 1
                        @LastDate = LastUpdateDate
                FROM    Forum_UserUpdateTopicCountLogs
                WHERE   UserId = @UserId
                        AND DeviceId = @DeviceId
                ORDER BY LastUpdateDate DESC 
				
                IF @SchoolId > 0
                    SELECT  F.ForumId ,
                            ( ( SELECT  COUNT(0)
                                FROM    Forum_Topics
                                WHERE   ForumId = F.ForumId
                                        AND SchoolId = @SchoolId
                                        AND CreateDate >= @LastDate
                                        AND [Status] = 1
                              ) + ( SELECT  COUNT(0)
                                    FROM    Forum_Posts
                                    WHERE   ForumId = F.ForumId
                                            AND SchoolId = @SchoolId
                                            AND CreateDate >= @LastDate
                                            AND [Status] = 1
                                  ) ) AS TopicCount
                    FROM    Forum_SchoolForums F
                    WHERE   SchoolId = @SchoolId
                ELSE
                    SELECT  F.ForumId ,
                            ( ( SELECT  COUNT(0)
                                FROM    Forum_Topics
                                WHERE   ForumId = F.ForumId
                                        AND SchoolId = @SchoolId
                                        AND CreateDate >= @LastDate
                                        AND [Status] = 1
                              ) + ( SELECT  COUNT(0)
                                    FROM    Forum_Posts
                                    WHERE   ForumId = F.ForumId
                                            AND SchoolId = @SchoolId
                                            AND CreateDate >= @LastDate
                                            AND [Status] = 1
                                  ) ) AS TopicCount
                    FROM    Forum_Forums F
                    WHERE   BindSchool = 0               				
            END 
        --写入日志
        INSERT  INTO Forum_UserUpdateTopicCountLogs
                ( UserId, DeviceId, LastUpdateDate )
        VALUES  ( @UserId, @DeviceId, @Date )				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_CreateUserFavoured]    Script Date: 07/20/2017 15:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_CreateUserFavoured]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-11
-- 用  途：创建用户点赞记录
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_CreateUserFavoured]
    (
      @UserId INT ,
      @DataId INT ,
      @T TINYINT ,
      @Date DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
		--帖子点赞
        IF @T = 1
            BEGIN
                INSERT  INTO Forum_UserFavoured
                        ( TopicId, PostId, UserId, CreateDate )
                VALUES  ( @DataId, 0, @UserId, @Date )
				
                UPDATE  Forum_Topics
                SET     FavouredCount = ( FavouredCount + 1 )
                WHERE   TopicId = @DataId			
            END 
		--跟帖点赞
        ELSE
            BEGIN
                INSERT  INTO Forum_UserFavoured
                        ( TopicId, PostId, UserId, CreateDate )
                VALUES  ( 0, @DataId, @UserId, @Date )
				
                UPDATE  Forum_Posts
                SET     FavouredCount = ( FavouredCount + 1 )
                WHERE   PostId = @DataId	
            END         				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_CreateTopicReply]    Script Date: 07/20/2017 15:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_CreateTopicReply]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：创建帖子跟帖信息
-- 返回值：跟帖信息编号
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_CreateTopicReply]
    (
      @TopicId INT ,
      @ForumId INT ,
      @SchoolId INT ,
      @UserId INT ,
      @Content NTEXT ,
      @ReplyForUserId INT ,
      @Status INT ,
      @CreateDate DATETIME
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        INSERT  INTO Forum_Posts
                ( TopicId ,
                  ForumId ,
                  SchoolId ,
                  UserId ,
                  Content ,
                  FavouredCount ,
                  ReplyForUserId ,
                  IsBestReply ,
                  SetBestDate ,
                  ExpChanged ,
                  VirtualCoinChanged ,
                  [Status] ,
                  Remark ,
                  CreateDate ,
                  ManageMark ,
                  LastManageDate
                )
        VALUES  ( @TopicId ,
                  @ForumId ,
                  @SchoolId ,
                  @UserId ,
                  @Content ,
                  0 ,
                  @ReplyForUserId ,
                  0 ,
                  @CreateDate ,
                  0 ,
                  0 ,
                  @Status ,
                  '''' ,
                  @CreateDate ,
                  '''' ,
                  @CreateDate
                )
                
        DECLARE @PostId INT 
        IF @@ERROR <> 0
            OR @@ROWCOUNT = 0
            SELECT  @PostId = 0
        ELSE
            SELECT  @PostId = SCOPE_IDENTITY()
            
        IF @PostId > 0
            BEGIN
			
                UPDATE  User_UserExt
                SET     ReplyCount = ( ReplyCount + 1 )
                WHERE   UserId = @UserId
			
                UPDATE  Forum_Topics
                SET     RepliedCount = ( RepliedCount + 1 )
                WHERE   TopicId = @TopicId
				
                DECLARE @TopicUserId INT ,
                    @RepliedUserIds NVARCHAR(MAX)
                SELECT  @TopicUserId = TopicId ,
                        @RepliedUserIds = RepliedUserIds
                FROM    Forum_Topics
                WHERE   TopicId = @TopicId
                
                IF @TopicUserId <> @UserId
                    BEGIN
                        IF @RepliedUserIds = ''''
                            SET @RepliedUserIds = CAST(@UserId AS NVARCHAR(10))
                        ELSE
                            SET @RepliedUserIds = @RepliedUserIds + '',''
                                + CAST(@UserId AS NVARCHAR(10))
					
                        UPDATE  Forum_Topics
                        SET     RepliedUserIds = @RepliedUserIds ,
                                LastRepliedDate = @CreateDate
                        WHERE   TopicId = @TopicId
                
                    END 
            END 
		
        SELECT  @PostId
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_UpdateReplyContent]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_UpdateReplyContent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-10
-- 用  途：更新跟帖内容
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_UpdateReplyContent]
    (
      @PostId INT ,
      @Content NTEXT 
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  Forum_Posts
        SET     Content = @Content
        WHERE   PostId = @PostId
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_SetBestReply]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_SetBestReply]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-11
-- 用  途：设置帖子回复为最佳回复
-- 返回值：无
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_SetBestReply]
    (
      @TopicId INT ,
      @PostId INT ,
      @Date DATETIME ,
      @ExpChanged INT ,
      @VirtualCoinChanged INT 
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        UPDATE  Forum_Topics
        SET     BestAnswerId = @PostId
        WHERE   TopicId = @TopicId
        
        UPDATE  Forum_Posts
        SET     IsBestReply = 1 ,
                SetBestDate = @Date ,
                ExpChanged = @ExpChanged ,
                VirtualCoinChanged = @VirtualCoinChanged
        WHERE   PostId = @PostId
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetUserRepliedTopicList]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetUserRepliedTopicList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-11
-- 用  途：查询指定用户回复过的帖子列表
-- 返回值：用户回复过的帖子列表
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetUserRepliedTopicList]
    (
      @UserId INT ,
      @PageSize INT ,
      @PageIndex INT
    )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SET ROWCOUNT @PageSize
        SELECT  *
        FROM    ( SELECT    T.TopicId ,
                            UserId ,
                            AttachContent ,
                            Title ,
                            Intro ,
                            Icon ,
                            Voice ,
                            Remark ,
                            Reward ,
                            IsQuestion ,
                            IsAllowReply ,
                            IsStick ,
                            IsRefined ,
                            AttrChangedMark ,
                            ExpChanged ,
                            VirtualCoinChanged ,
                            BestAnswerId ,
                            FavouredCount ,
                            RepliedCount ,
                            ViewCount ,
                            FavoritedCount ,
                            CreateDate ,
                            ROW_NUMBER() OVER ( ORDER BY CreateDate DESC, T.TopicId DESC ) AS RowNum
                  FROM      Forum_Topics T
                            INNER JOIN ( SELECT DISTINCT
                                                TopicId
                                         FROM   Forum_Posts
                                         WHERE  UserId = @UserId
                                                AND [Status] = 1
                                       ) AS P ON P.TopicId = T.TopicId
                  WHERE     T.[Status] = 1
                ) AS List
        WHERE   List.RowNum > ( @PageIndex - 1 ) * @PageSize
        ORDER BY List.CreateDate DESC ,
                List.TopicId DESC
        				    
    END' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bbs_GetUserRepliedTopicCount]    Script Date: 07/20/2017 15:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bbs_GetUserRepliedTopicCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- 作  者：KEN
-- 日  期：2014-10-11
-- 用  途：查询指定用户回复过的帖子总数
-- 返回值：用户回复过的帖子总数
-- =============================================
CREATE PROCEDURE [dbo].[SP_Bbs_GetUserRepliedTopicCount] ( @UserId INT )
AS
    BEGIN
        SET NOCOUNT ON;
		
        SELECT  COUNT(0)
        FROM    Forum_Topics T
                INNER JOIN ( SELECT DISTINCT
                                    TopicId
                             FROM   Forum_Posts
                             WHERE  UserId = @UserId
                                    AND [Status] = 1
                           ) AS P ON P.TopicId = T.TopicId
        WHERE   T.[Status] = 1
        				    
    END' 
END
GO
/****** Object:  Default [DF_Chat_Group_SchoolAndClass_GroupId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Group_SchoolAndClass_GroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Group_SchoolAndClass_GroupId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Group_SchoolAndClass] ADD  CONSTRAINT [DF_Chat_Group_SchoolAndClass_GroupId]  DEFAULT ((0)) FOR [GroupId]
END


End
GO
/****** Object:  Default [DF_Chat_Group_SchoolAndClass_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Group_SchoolAndClass_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Group_SchoolAndClass_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Group_SchoolAndClass] ADD  CONSTRAINT [DF_Chat_Group_SchoolAndClass_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Chat_Group_SchoolAndClass_ClassId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Group_SchoolAndClass_ClassId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Group_SchoolAndClass_ClassId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Group_SchoolAndClass] ADD  CONSTRAINT [DF_Chat_Group_SchoolAndClass_ClassId]  DEFAULT ((0)) FOR [ClassId]
END


End
GO
/****** Object:  Default [DF_Chat_GroupMembers_GroupId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_GroupMembers_GroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_GroupMembers_GroupId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_GroupMembers] ADD  CONSTRAINT [DF_Chat_GroupMembers_GroupId]  DEFAULT ((0)) FOR [GroupId]
END


End
GO
/****** Object:  Default [DF_Chat_GroupMembers_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_GroupMembers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_GroupMembers_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_GroupMembers] ADD  CONSTRAINT [DF_Chat_GroupMembers_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Chat_GroupMembers_IsCreator]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_GroupMembers_IsCreator]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_GroupMembers_IsCreator]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_GroupMembers] ADD  CONSTRAINT [DF_Chat_GroupMembers_IsCreator]  DEFAULT ((0)) FOR [IsCreator]
END


End
GO
/****** Object:  Default [DF_Chat_GroupMembers_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_GroupMembers_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_GroupMembers_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_GroupMembers] ADD  CONSTRAINT [DF_Chat_GroupMembers_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_GroupName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_GroupName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_GroupName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_GroupName]  DEFAULT ('') FOR [GroupName]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_GroupIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_GroupIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_GroupIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_GroupIcon]  DEFAULT ('') FOR [GroupIcon]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_MaxMemberCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_MaxMemberCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_MaxMemberCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_MaxMemberCount]  DEFAULT ((0)) FOR [MaxMemberCount]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_MemberCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_MemberCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_MemberCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_MemberCount]  DEFAULT ((0)) FOR [MemberCount]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_GroupType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_GroupType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_GroupType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_GroupType]  DEFAULT ((0)) FOR [GroupType]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_CreatorId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_CreatorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_CreatorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_CreatorId]  DEFAULT ((0)) FOR [CreatorId]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_InterestCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_InterestCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_InterestCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_InterestCode]  DEFAULT ('') FOR [InterestCode]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_QuickJoinCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_QuickJoinCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_QuickJoinCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_QuickJoinCode]  DEFAULT ('') FOR [QuickJoinCode]
END


End
GO
/****** Object:  Default [DF_Chat_Groups_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Chat_Groups_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Groups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Chat_Groups_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Chat_Groups] ADD  CONSTRAINT [DF_Chat_Groups_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Course_Category_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Category_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Category_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Category] ADD  CONSTRAINT [DF_Course_Category_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Course_Category_CategoryName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Category_CategoryName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Category_CategoryName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Category] ADD  CONSTRAINT [DF_Course_Category_CategoryName]  DEFAULT ('') FOR [CategoryName]
END


End
GO
/****** Object:  Default [DF_Course_Category_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Category_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Category_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Category] ADD  CONSTRAINT [DF_Course_Category_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Course_Category_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Category_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Category_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Category] ADD  CONSTRAINT [DF_Course_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Course_Classes_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Course_Classes_CourseCategoryId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_CourseCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_CourseCategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_CourseCategoryId]  DEFAULT ((0)) FOR [CourseCategoryId]
END


End
GO
/****** Object:  Default [DF_Course_Classes_CourseId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_CourseId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_CourseId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_CourseId]  DEFAULT ((0)) FOR [CourseId]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassName]  DEFAULT ('') FOR [ClassName]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassCode]  DEFAULT ('') FOR [ClassCode]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassType]  DEFAULT ((0)) FOR [ClassType]
END


End
GO
/****** Object:  Default [DF_Course_Classes_StudentMax]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_StudentMax]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_StudentMax]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_StudentMax]  DEFAULT ((0)) FOR [StudentMax]
END


End
GO
/****** Object:  Default [DF_Course_Classes_StudentCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_StudentCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_StudentCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_StudentCount]  DEFAULT ((0)) FOR [StudentCount]
END


End
GO
/****** Object:  Default [DF_Table_1_ClassHour]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ClassHour]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_ClassHour]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Table_1_ClassHour]  DEFAULT ((0)) FOR [ClassHourCount]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassHourOneDay]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassHourOneDay]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassHourOneDay]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassHourOneDay]  DEFAULT ((0)) FOR [ClassHourOneDay]
END


End
GO
/****** Object:  Default [DF_Course_Classes_LessonOneDay]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_LessonOneDay]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_LessonOneDay]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_LessonOneDay]  DEFAULT ('') FOR [LessonOneDay]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassStatus]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassStatus]  DEFAULT ((0)) FOR [ClassStatus]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassStartDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassStartDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassStartDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassStartDate]  DEFAULT (getdate()) FOR [ClassStartDate]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassEndDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassEndDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassEndDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassEndDate]  DEFAULT (getdate()) FOR [ClassEndDate]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassTeacher]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassTeacher]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassTeacher]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassTeacher]  DEFAULT ((0)) FOR [ClassTeacher]
END


End
GO
/****** Object:  Default [DF_Course_Classes_BranchId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_BranchId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_BranchId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_BranchId]  DEFAULT ((0)) FOR [BranchId]
END


End
GO
/****** Object:  Default [DF_Course_Classes_ClassAddress]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_ClassAddress]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_ClassAddress]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_ClassAddress]  DEFAULT ('') FOR [ClassAddress]
END


End
GO
/****** Object:  Default [DF_Course_Classes_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Classes_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Classes_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Classes] ADD  CONSTRAINT [DF_Course_Classes_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Course_ClassLessons_CourseId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassLessons_CourseId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassLessons_CourseId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassLessons] ADD  CONSTRAINT [DF_Course_ClassLessons_CourseId]  DEFAULT ((0)) FOR [CourseId]
END


End
GO
/****** Object:  Default [DF_Course_ClassLessons_ClassId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassLessons_ClassId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassLessons_ClassId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassLessons] ADD  CONSTRAINT [DF_Course_ClassLessons_ClassId]  DEFAULT ((0)) FOR [ClassId]
END


End
GO
/****** Object:  Default [DF_Course_ClassLessons_LessonDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassLessons_LessonDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassLessons_LessonDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassLessons] ADD  CONSTRAINT [DF_Course_ClassLessons_LessonDate]  DEFAULT (getdate()) FOR [LessonDate]
END


End
GO
/****** Object:  Default [DF_Course_ClassLessons_LessonStartTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassLessons_LessonStartTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassLessons_LessonStartTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassLessons] ADD  CONSTRAINT [DF_Course_ClassLessons_LessonStartTime]  DEFAULT (getdate()) FOR [LessonStartTime]
END


End
GO
/****** Object:  Default [DF_Course_ClassLessons_LessonEndTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassLessons_LessonEndTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassLessons_LessonEndTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassLessons] ADD  CONSTRAINT [DF_Course_ClassLessons_LessonEndTime]  DEFAULT (getdate()) FOR [LessonEndTime]
END


End
GO
/****** Object:  Default [DF_Course_ClassLessons_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassLessons_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassLessons_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassLessons] ADD  CONSTRAINT [DF_Course_ClassLessons_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_ClassId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_ClassId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_ClassId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_ClassId]  DEFAULT ((0)) FOR [ClassId]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_ApplyId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_ApplyId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_ApplyId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_ApplyId]  DEFAULT ((0)) FOR [ApplyId]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_StartDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_StartDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_StartDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_StartDate]  DEFAULT (getdate()) FOR [StartDate]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_EndDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_EndDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_EndDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_EndDate]  DEFAULT (getdate()) FOR [EndDate]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_UserStatus]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_UserStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_UserStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_UserStatus]  DEFAULT ((0)) FOR [UserStatus]
END


End
GO
/****** Object:  Default [DF_Course_ClassUsers_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_ClassUsers_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_ClassUsers_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_ClassUsers] ADD  CONSTRAINT [DF_Course_ClassUsers_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Course_Courses_CategoryId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
END


End
GO
/****** Object:  Default [DF_Course_Courses_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Course_Courses_CourseName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_CourseName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_CourseName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_CourseName]  DEFAULT ('') FOR [CourseName]
END


End
GO
/****** Object:  Default [DF_Course_Courses_CourseCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_CourseCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_CourseCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_CourseCode]  DEFAULT ('') FOR [CourseCode]
END


End
GO
/****** Object:  Default [DF_Course_Courses_CourseIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_CourseIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_CourseIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_CourseIcon]  DEFAULT ('') FOR [CourseIcon]
END


End
GO
/****** Object:  Default [DF_Course_Courses_Intro]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_Intro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_Intro]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_Intro]  DEFAULT ('') FOR [Intro]
END


End
GO
/****** Object:  Default [DF_Course_Courses_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Course_Courses_PriceName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_PriceName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_PriceName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_PriceName]  DEFAULT ('') FOR [PriceName]
END


End
GO
/****** Object:  Default [DF_Course_Courses_SalePriceName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_SalePriceName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_SalePriceName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_SalePriceName]  DEFAULT ('') FOR [SalePriceName]
END


End
GO
/****** Object:  Default [DF_Course_Courses_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Course_Courses_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Course_Courses_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Course_Courses_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Course_Courses] ADD  CONSTRAINT [DF_Course_Courses_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Table_1_Range]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Range]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_Range]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Table_1_Range]  DEFAULT ((0)) FOR [IsSysAd]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_AppChannelCategoryId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_AppChannelCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_AppChannelCategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_AppChannelCategoryId]  DEFAULT ((0)) FOR [AppChannelCategoryId]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_AppChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_AppChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_AppChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_AppChannel]  DEFAULT ('') FOR [AppChannel]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_AdName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_AdName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_AdName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_AdName]  DEFAULT ((0)) FOR [AdName]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_SmallerIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_SmallerIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_SmallerIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_SmallerIcon]  DEFAULT ('') FOR [SmallerIcon]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_LargerIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_LargerIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_LargerIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_LargerIcon]  DEFAULT ('') FOR [LargerIcon]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_ShowInTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_ShowInTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_ShowInTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_ShowInTime]  DEFAULT ((0)) FOR [ShowInTime]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_StartTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_StartTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_StartTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_StartTime]  DEFAULT (getdate()) FOR [StartTime]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_EndTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_EndTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_EndTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_EndTime]  DEFAULT (getdate()) FOR [EndTime]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_AdType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_AdType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_AdType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_AdType]  DEFAULT ((0)) FOR [AdType]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_AdContent]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_AdContent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_AdContent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_AdContent]  DEFAULT ('') FOR [AdContent]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_AdUrl]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_AdUrl]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_AdUrl]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_AdUrl]  DEFAULT ('') FOR [AdUrl]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Extend_Adverts_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_Adverts_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_Adverts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_Adverts_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_Adverts] ADD  CONSTRAINT [DF_Extend_Adverts_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_UserName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_UserName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_UserName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_UserName]  DEFAULT ('') FOR [UserName]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_Telphone]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_Telphone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_Telphone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_Telphone]  DEFAULT ('') FOR [Telphone]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_AreaCity]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_AreaCity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_AreaCity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_AreaCity]  DEFAULT ('') FOR [AreaCity]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_CourseId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_CourseId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_CourseId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_CourseId]  DEFAULT ((0)) FOR [CourseId]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_SourceAd]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_SourceAd]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_SourceAd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_SourceAd]  DEFAULT ((0)) FOR [SourceAd]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_Status]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_Status]  DEFAULT ((0)) FOR [Status]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_HandleInfo]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_HandleInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_HandleInfo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_HandleInfo]  DEFAULT ('') FOR [HandleInfo]
END


End
GO
/****** Object:  Default [DF_Extend_UserApply_HandleDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Extend_UserApply_HandleDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Extend_UserApply]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Extend_UserApply_HandleDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Extend_UserApply] ADD  CONSTRAINT [DF_Extend_UserApply_HandleDate]  DEFAULT (getdate()) FOR [HandleDate]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_BindSchool]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_BindSchool]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_BindSchool]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_BindSchool]  DEFAULT ((0)) FOR [BindSchool]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_ForumName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_ForumName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_ForumName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_ForumName]  DEFAULT ('') FOR [ForumName]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_ForumIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_ForumIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_ForumIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_ForumIcon]  DEFAULT ('') FOR [ForumIcon]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_AllowPost]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_AllowPost]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_AllowPost]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_AllowPost]  DEFAULT ((0)) FOR [AllowPost]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_IsAllowDeal]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_IsAllowDeal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_IsAllowDeal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_IsAllowDeal]  DEFAULT ((0)) FOR [AllowPostType]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_LinkType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_LinkType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_LinkType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_LinkType]  DEFAULT ((0)) FOR [LinkType]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Forum_Forums_LastChangeDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Forums_LastChangeDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Forums_LastChangeDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Forums] ADD  CONSTRAINT [DF_Forum_Forums_LastChangeDate]  DEFAULT (getdate()) FOR [LastChangeDate]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_ForumId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_ForumId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_ForumId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_ForumId]  DEFAULT ((0)) FOR [TopicId]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_ForumId_1]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_ForumId_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_ForumId_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_ForumId_1]  DEFAULT ((0)) FOR [ForumId]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_Content]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_Content]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_Content]  DEFAULT ('') FOR [Content]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_FavouredCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_FavouredCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_FavouredCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_FavouredCount]  DEFAULT ((0)) FOR [FavouredCount]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_ReplyForUserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_ReplyForUserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_ReplyForUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_ReplyForUserId]  DEFAULT ((0)) FOR [ReplyForUserId]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_IsBestReply]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_IsBestReply]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_IsBestReply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_IsBestReply]  DEFAULT ((0)) FOR [IsBestReply]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_SetBestDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_SetBestDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_SetBestDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_SetBestDate]  DEFAULT (getdate()) FOR [SetBestDate]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_ExpChanged]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_ExpChanged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_ExpChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_ExpChanged]  DEFAULT ((0)) FOR [ExpChanged]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_VirtualCoinChanged]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_VirtualCoinChanged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_VirtualCoinChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_VirtualCoinChanged]  DEFAULT ((0)) FOR [VirtualCoinChanged]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_Status]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_Status]  DEFAULT ((0)) FOR [Status]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_Remark]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_Remark]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_Remark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_Remark]  DEFAULT ('') FOR [Remark]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_ManageMark]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_ManageMark]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_ManageMark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_ManageMark]  DEFAULT ('') FOR [ManageMark]
END


End
GO
/****** Object:  Default [DF_Forum_Posts_LastManageDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Posts_LastManageDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Posts_LastManageDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Posts] ADD  CONSTRAINT [DF_Forum_Posts_LastManageDate]  DEFAULT (getdate()) FOR [LastManageDate]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_ForumId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_ForumId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_ForumId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_ForumId]  DEFAULT ((0)) FOR [ForumId]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_ForumName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_ForumName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_ForumName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_ForumName]  DEFAULT ('') FOR [ForumName]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_ForumIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_ForumIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_ForumIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_ForumIcon]  DEFAULT ('') FOR [ForumIcon]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_IsAllowPost]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_IsAllowPost]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_IsAllowPost]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_IsAllowPost]  DEFAULT ((0)) FOR [AllowPost]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_IsAllowDeal]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_IsAllowDeal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_IsAllowDeal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_IsAllowDeal]  DEFAULT ((0)) FOR [AllowPostType]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_LinkType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_LinkType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_LinkType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_LinkType]  DEFAULT ((0)) FOR [LinkType]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Forum_SchoolForums_LastChangeDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_SchoolForums_LastChangeDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_SchoolForums_LastChangeDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_SchoolForums] ADD  CONSTRAINT [DF_Forum_SchoolForums_LastChangeDate]  DEFAULT (getdate()) FOR [LastChangeDate]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_ForumId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_ForumId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_ForumId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_ForumId]  DEFAULT ((0)) FOR [ForumId]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_OwnerId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_OwnerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_OwnerId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_OwnerId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_AttachContent]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_AttachContent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_AttachContent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_AttachContent]  DEFAULT ('') FOR [AttachContent]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_Title]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_Title]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_Title]  DEFAULT ('') FOR [Title]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_Content]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_Content]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_Content]  DEFAULT ('') FOR [Content]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_Intro]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_Intro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_Intro]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_Intro]  DEFAULT ('') FOR [Intro]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_ImageUrls]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_ImageUrls]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_ImageUrls]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_ImageUrls]  DEFAULT ('') FOR [Icon]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_VoiceUrls]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_VoiceUrls]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_VoiceUrls]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_VoiceUrls]  DEFAULT ('') FOR [Voice]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_Remark]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_Remark]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_Remark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_Remark]  DEFAULT ('') FOR [Remark]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_Reward]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_Reward]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_Reward]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_Reward]  DEFAULT ((0)) FOR [Reward]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_IsQuestion]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_IsQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_IsQuestion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_IsQuestion]  DEFAULT ((0)) FOR [IsQuestion]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_IsAllowReply]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_IsAllowReply]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_IsAllowReply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_IsAllowReply]  DEFAULT ((0)) FOR [IsAllowReply]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_IsStick]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_IsStick]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_IsStick]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_IsStick]  DEFAULT ((0)) FOR [IsStick]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_IsRefined]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_IsRefined]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_IsRefined]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_IsRefined]  DEFAULT ((0)) FOR [IsRefined]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_AttrChangedMark]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_AttrChangedMark]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_AttrChangedMark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_AttrChangedMark]  DEFAULT ('') FOR [AttrChangedMark]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_ExpChanged]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_ExpChanged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_ExpChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_ExpChanged]  DEFAULT ((0)) FOR [ExpChanged]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_VirtualCoinChanged]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_VirtualCoinChanged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_VirtualCoinChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_VirtualCoinChanged]  DEFAULT ((0)) FOR [VirtualCoinChanged]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_HasBestAnswer]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_HasBestAnswer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_HasBestAnswer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_HasBestAnswer]  DEFAULT ((0)) FOR [BestAnswerId]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_FavouredCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_FavouredCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_FavouredCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_FavouredCount]  DEFAULT ((0)) FOR [FavouredCount]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_RepliedCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_RepliedCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_RepliedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_RepliedCount]  DEFAULT ((0)) FOR [RepliedCount]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_RepliedUserIds]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_RepliedUserIds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_RepliedUserIds]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_RepliedUserIds]  DEFAULT ('') FOR [RepliedUserIds]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_LastRepliedDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_LastRepliedDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_LastRepliedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_LastRepliedDate]  DEFAULT (getdate()) FOR [LastRepliedDate]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_ViewCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_ViewCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_ViewCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_FavoritedCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_FavoritedCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_FavoritedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_FavoritedCount]  DEFAULT ((0)) FOR [FavoritedCount]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_Status]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_Status]  DEFAULT ((0)) FOR [Status]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_ManageMark]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_ManageMark]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_ManageMark]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_ManageMark]  DEFAULT ('') FOR [ManageMark]
END


End
GO
/****** Object:  Default [DF_Forum_Topics_LastManageDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_Topics_LastManageDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_Topics_LastManageDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_Topics] ADD  CONSTRAINT [DF_Forum_Topics_LastManageDate]  DEFAULT (getdate()) FOR [LastManageDate]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoritedTopics_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoritedTopics_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoritedTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoritedTopics_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoritedTopics] ADD  CONSTRAINT [DF_Forum_UserFavoritedTopics_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoritedTopics_TopicId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoritedTopics_TopicId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoritedTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoritedTopics_TopicId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoritedTopics] ADD  CONSTRAINT [DF_Forum_UserFavoritedTopics_TopicId]  DEFAULT ((0)) FOR [TopicId]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoritedTopics_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoritedTopics_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoritedTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoritedTopics_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoritedTopics] ADD  CONSTRAINT [DF_Forum_UserFavoritedTopics_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoured_TopicId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoured_TopicId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoured_TopicId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoured] ADD  CONSTRAINT [DF_Forum_UserFavoured_TopicId]  DEFAULT ((0)) FOR [TopicId]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoured_PostId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoured_PostId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoured_PostId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoured] ADD  CONSTRAINT [DF_Forum_UserFavoured_PostId]  DEFAULT ((0)) FOR [PostId]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoured_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoured_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoured_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoured] ADD  CONSTRAINT [DF_Forum_UserFavoured_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Forum_UserFavoured_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserFavoured_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserFavoured]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserFavoured_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserFavoured] ADD  CONSTRAINT [DF_Forum_UserFavoured_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Forum_UserUpdateForumLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserUpdateForumLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateForumLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserUpdateForumLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserUpdateForumLogs] ADD  CONSTRAINT [DF_Forum_UserUpdateForumLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Forum_UserUpdateForumLogs_DeviceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserUpdateForumLogs_DeviceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateForumLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserUpdateForumLogs_DeviceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserUpdateForumLogs] ADD  CONSTRAINT [DF_Forum_UserUpdateForumLogs_DeviceId]  DEFAULT ((0)) FOR [DeviceId]
END


End
GO
/****** Object:  Default [DF_Forum_UserUpdateForumLogs_LastUpdateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserUpdateForumLogs_LastUpdateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateForumLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserUpdateForumLogs_LastUpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserUpdateForumLogs] ADD  CONSTRAINT [DF_Forum_UserUpdateForumLogs_LastUpdateDate]  DEFAULT (getdate()) FOR [LastUpdateDate]
END


End
GO
/****** Object:  Default [DF_Forum_UserUpdateTopicCountLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserUpdateTopicCountLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateTopicCountLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserUpdateTopicCountLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserUpdateTopicCountLogs] ADD  CONSTRAINT [DF_Forum_UserUpdateTopicCountLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Forum_UserUpdateTopicCountLogs_DeviceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forum_UserUpdateTopicCountLogs_DeviceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_UserUpdateTopicCountLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Forum_UserUpdateTopicCountLogs_DeviceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forum_UserUpdateTopicCountLogs] ADD  CONSTRAINT [DF_Forum_UserUpdateTopicCountLogs_DeviceId]  DEFAULT ((0)) FOR [DeviceId]
END


End
GO
/****** Object:  Default [DF_Logs_AdvertPv_AdvertId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_AdvertPv_AdvertId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_AdvertPv_AdvertId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_AdvertPv] ADD  CONSTRAINT [DF_Logs_AdvertPv_AdvertId]  DEFAULT ((0)) FOR [AdvertId]
END


End
GO
/****** Object:  Default [DF_Logs_AdvertPv_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_AdvertPv_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_AdvertPv_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_AdvertPv] ADD  CONSTRAINT [DF_Logs_AdvertPv_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_AdvertPv_AppChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_AdvertPv_AppChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_AdvertPv_AppChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_AdvertPv] ADD  CONSTRAINT [DF_Logs_AdvertPv_AppChannel]  DEFAULT ('') FOR [AppChannel]
END


End
GO
/****** Object:  Default [DF_Logs_AdvertPv_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_AdvertPv_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_AdvertPv_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_AdvertPv] ADD  CONSTRAINT [DF_Logs_AdvertPv_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_AdvertPv_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_AdvertPv_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_AdvertPv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_AdvertPv_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_AdvertPv] ADD  CONSTRAINT [DF_Logs_AdvertPv_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserCmdQuery_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCmdQuery_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCmdQuery_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCmdQuery] ADD  CONSTRAINT [DF_Logs_UserCmdQuery_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserCmdQuery_Command]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCmdQuery_Command]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCmdQuery_Command]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCmdQuery] ADD  CONSTRAINT [DF_Logs_UserCmdQuery_Command]  DEFAULT ('') FOR [Command]
END


End
GO
/****** Object:  Default [DF_Logs_UserCmdQuery_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCmdQuery_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCmdQuery_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCmdQuery] ADD  CONSTRAINT [DF_Logs_UserCmdQuery_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_UserCmdQuery_AppChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCmdQuery_AppChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCmdQuery_AppChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCmdQuery] ADD  CONSTRAINT [DF_Logs_UserCmdQuery_AppChannel]  DEFAULT ('') FOR [AppChannel]
END


End
GO
/****** Object:  Default [DF_Logs_UserCmdQuery_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCmdQuery_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCmdQuery]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCmdQuery_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCmdQuery] ADD  CONSTRAINT [DF_Logs_UserCmdQuery_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserCoordChanged_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCoordChanged_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCoordChanged_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCoordChanged] ADD  CONSTRAINT [DF_Logs_UserCoordChanged_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserCoordChanged_Method]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCoordChanged_Method]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCoordChanged_Method]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCoordChanged] ADD  CONSTRAINT [DF_Logs_UserCoordChanged_Method]  DEFAULT ((0)) FOR [Method]
END


End
GO
/****** Object:  Default [DF_Logs_UserCoordChanged_Longitude]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCoordChanged_Longitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCoordChanged_Longitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCoordChanged] ADD  CONSTRAINT [DF_Logs_UserCoordChanged_Longitude]  DEFAULT ((0)) FOR [Longitude]
END


End
GO
/****** Object:  Default [DF_Logs_UserCoordChanged_Latitudes]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCoordChanged_Latitudes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCoordChanged_Latitudes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCoordChanged] ADD  CONSTRAINT [DF_Logs_UserCoordChanged_Latitudes]  DEFAULT ((0)) FOR [Latitudes]
END


End
GO
/****** Object:  Default [DF_Logs_UserCoordChanged_CreateTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserCoordChanged_CreateTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserCoordChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserCoordChanged_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserCoordChanged] ADD  CONSTRAINT [DF_Logs_UserCoordChanged_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
END


End
GO
/****** Object:  Default [DF_Logs_UserExpChanged_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserExpChanged_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserExpChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserExpChanged_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserExpChanged] ADD  CONSTRAINT [DF_Logs_UserExpChanged_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserExpChanged_ExpChanged]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserExpChanged_ExpChanged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserExpChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserExpChanged_ExpChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserExpChanged] ADD  CONSTRAINT [DF_Logs_UserExpChanged_ExpChanged]  DEFAULT ((0)) FOR [ExpChanged]
END


End
GO
/****** Object:  Default [DF_Logs_UserExpChanged_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserExpChanged_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserExpChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserExpChanged_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserExpChanged] ADD  CONSTRAINT [DF_Logs_UserExpChanged_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_UserExpChanged_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserExpChanged_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserExpChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserExpChanged_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserExpChanged] ADD  CONSTRAINT [DF_Logs_UserExpChanged_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserInfoUpdateLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserInfoUpdateLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserInfoUpdateLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserInfoUpdateLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserInfoUpdateLogs] ADD  CONSTRAINT [DF_Logs_UserInfoUpdateLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserInfoUpdateLogs_InfoType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserInfoUpdateLogs_InfoType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserInfoUpdateLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserInfoUpdateLogs_InfoType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserInfoUpdateLogs] ADD  CONSTRAINT [DF_Logs_UserInfoUpdateLogs_InfoType]  DEFAULT ((0)) FOR [InfoType]
END


End
GO
/****** Object:  Default [DF_Logs_UserInfoUpdateLogs_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserInfoUpdateLogs_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserInfoUpdateLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserInfoUpdateLogs_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserInfoUpdateLogs] ADD  CONSTRAINT [DF_Logs_UserInfoUpdateLogs_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_UserInfoUpdateLogs_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserInfoUpdateLogs_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserInfoUpdateLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserInfoUpdateLogs_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserInfoUpdateLogs] ADD  CONSTRAINT [DF_Logs_UserInfoUpdateLogs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_LogType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_LogType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_LogType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_LogType]  DEFAULT ((0)) FOR [LogType]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_DeviceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_DeviceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_DeviceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_DeviceId]  DEFAULT ((0)) FOR [DeviceId]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_AccountChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_AccountChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_AccountChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_AccountChannel]  DEFAULT ((0)) FOR [AccountChannel]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_LoginAccount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_LoginAccount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_LoginAccount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_LoginAccount]  DEFAULT ('') FOR [LoginAccount]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_AppKey]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_AppKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_AppKey]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_AppKey]  DEFAULT ('') FOR [AppChannel]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_AppVersion]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_AppVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_AppVersion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_AppVersion]  DEFAULT ('') FOR [AppVersion]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_NetworkType]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_NetworkType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_NetworkType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_NetworkType]  DEFAULT ((0)) FOR [NetworkType]
END


End
GO
/****** Object:  Default [DF_Logs_UserLogin_LogDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserLogin_LogDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserLogin_LogDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserLogin] ADD  CONSTRAINT [DF_Logs_UserLogin_LogDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserPagePv_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserPagePv_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPagePv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserPagePv_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPagePv] ADD  CONSTRAINT [DF_Logs_UserPagePv_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserPagePv_VisitorId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserPagePv_VisitorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPagePv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserPagePv_VisitorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPagePv] ADD  CONSTRAINT [DF_Logs_UserPagePv_VisitorId]  DEFAULT ((0)) FOR [VisitorId]
END


End
GO
/****** Object:  Default [DF_Logs_UserPagePv_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserPagePv_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPagePv]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserPagePv_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPagePv] ADD  CONSTRAINT [DF_Logs_UserPagePv_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserPasswordChanaged_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserPasswordChanaged_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPasswordChanaged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserPasswordChanaged_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPasswordChanaged] ADD  CONSTRAINT [DF_Logs_UserPasswordChanaged_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Table_1_Method]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Method]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPasswordChanaged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_Method]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPasswordChanaged] ADD  CONSTRAINT [DF_Table_1_Method]  DEFAULT ((0)) FOR [MethodType]
END


End
GO
/****** Object:  Default [DF_Logs_UserPasswordChanaged_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserPasswordChanaged_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPasswordChanaged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserPasswordChanaged_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPasswordChanaged] ADD  CONSTRAINT [DF_Logs_UserPasswordChanaged_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_UserPasswordChanaged_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserPasswordChanaged_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserPasswordChanaged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserPasswordChanaged_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserPasswordChanaged] ADD  CONSTRAINT [DF_Logs_UserPasswordChanaged_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserStatusChanged_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserStatusChanged_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserStatusChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserStatusChanged_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserStatusChanged] ADD  CONSTRAINT [DF_Logs_UserStatusChanged_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserStatusChanged_Action]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserStatusChanged_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserStatusChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserStatusChanged_Action]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserStatusChanged] ADD  CONSTRAINT [DF_Logs_UserStatusChanged_Action]  DEFAULT ((0)) FOR [Action]
END


End
GO
/****** Object:  Default [DF_Logs_UserStatusChanged_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserStatusChanged_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserStatusChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserStatusChanged_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserStatusChanged] ADD  CONSTRAINT [DF_Logs_UserStatusChanged_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_UserStatusChanged_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserStatusChanged_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserStatusChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserStatusChanged_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserStatusChanged] ADD  CONSTRAINT [DF_Logs_UserStatusChanged_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Logs_UserVirtualCoinChanged_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserVirtualCoinChanged_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserVirtualCoinChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserVirtualCoinChanged_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserVirtualCoinChanged] ADD  CONSTRAINT [DF_Logs_UserVirtualCoinChanged_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Logs_UserVirtualCoinChanged_VirtualCoinChanged]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserVirtualCoinChanged_VirtualCoinChanged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserVirtualCoinChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserVirtualCoinChanged_VirtualCoinChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserVirtualCoinChanged] ADD  CONSTRAINT [DF_Logs_UserVirtualCoinChanged_VirtualCoinChanged]  DEFAULT ((0)) FOR [VirtualCoinChanged]
END


End
GO
/****** Object:  Default [DF_Logs_UserVirtualCoinChanged_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserVirtualCoinChanged_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserVirtualCoinChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserVirtualCoinChanged_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserVirtualCoinChanged] ADD  CONSTRAINT [DF_Logs_UserVirtualCoinChanged_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Logs_UserVirtualCoinChanged_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Logs_UserVirtualCoinChanged_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Logs_UserVirtualCoinChanged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Logs_UserVirtualCoinChanged_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Logs_UserVirtualCoinChanged] ADD  CONSTRAINT [DF_Logs_UserVirtualCoinChanged_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResCategory_CategoryName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResCategory_CategoryName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResCategory_CategoryName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResCategory] ADD  CONSTRAINT [DF_Material_Data_ResCategory_CategoryName]  DEFAULT ('') FOR [CategoryName]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResCategory_ModeId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResCategory_ModeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResCategory_ModeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResCategory] ADD  CONSTRAINT [DF_Material_Data_ResCategory_ModeId]  DEFAULT ((0)) FOR [ModeId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResCategory_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResCategory_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResCategory_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResCategory] ADD  CONSTRAINT [DF_Material_Data_ResCategory_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResCategory_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResCategory_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResCategory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResCategory] ADD  CONSTRAINT [DF_Material_Data_ResCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_CategoryId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_ModeId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_ModeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_ModeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_ModeId]  DEFAULT ((0)) FOR [ModeId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_LevelId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_LevelId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_LevelId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_LevelId]  DEFAULT ((0)) FOR [LevelId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_RangeId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_RangeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_RangeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_RangeId]  DEFAULT ((0)) FOR [RangeId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_DataName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_DataName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_DataName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_DataName]  DEFAULT ('') FOR [DataName]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_DataIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_DataIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_DataIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_DataIcon]  DEFAULT ('') FOR [DataIcon]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_Intro]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_Intro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_Intro]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_Intro]  DEFAULT ('') FOR [Intro]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_Price]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_Price]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_Price]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_Price]  DEFAULT ((0)) FOR [Price]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_SchoolPrice]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_SchoolPrice]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_SchoolPrice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_SchoolPrice]  DEFAULT ((0)) FOR [SchoolPrice]
END


End
GO
/****** Object:  Default [DF_Table_1_DataSource]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_DataSource]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Table_1_DataSource]  DEFAULT ('') FOR [SourceName]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_SourceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_SourceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_SourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_SourceId]  DEFAULT ((0)) FOR [SourceId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_IsPublic]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_IsPublic]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_IsPublic]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_IsRefined]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_IsRefined]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_IsRefined]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_IsRefined]  DEFAULT ((0)) FOR [IsRefined]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_IsPreset]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_IsPreset]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_IsPreset]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_IsPreset]  DEFAULT ((0)) FOR [IsPreset]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_DownloadCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_DownloadCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_DownloadCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_DownloadCount]  DEFAULT ((0)) FOR [DownloadCount]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_IsEanbled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_IsEanbled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_IsEanbled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_IsEanbled]  DEFAULT ((0)) FOR [IsEanbled]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResData_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResData_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResData_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResData] ADD  CONSTRAINT [DF_Material_Data_ResData_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_DataId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_DataId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_DataId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_DataId]  DEFAULT ((0)) FOR [DataId]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_ItemName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_ItemName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_ItemName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_ItemName]  DEFAULT ('') FOR [ItemName]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_Intro]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_Intro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_Intro]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_Intro]  DEFAULT ('') FOR [Intro]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_FilePath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_FilePath]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_FilePath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_FilePath]  DEFAULT ('') FOR [FilePath]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_ItemIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_ItemIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_ItemIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_ItemIcon]  DEFAULT ('') FOR [ItemIcon]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_DownloadCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_DownloadCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_DownloadCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_DownloadCount]  DEFAULT ((0)) FOR [DownloadCount]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Material_Data_ResItem_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_ResItem_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_ResItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_ResItem_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_ResItem] ADD  CONSTRAINT [DF_Material_Data_ResItem_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserBuyDataLogs_DataId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserBuyDataLogs_DataId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserBuyDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserBuyDataLogs_DataId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserBuyDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserBuyDataLogs_DataId]  DEFAULT ((0)) FOR [DataId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserBuyDataLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserBuyDataLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserBuyDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserBuyDataLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserBuyDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserBuyDataLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserBuyDataLogs_Price]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserBuyDataLogs_Price]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserBuyDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserBuyDataLogs_Price]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserBuyDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserBuyDataLogs_Price]  DEFAULT ((0)) FOR [Price]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserBuyDataLogs_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserBuyDataLogs_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserBuyDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserBuyDataLogs_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserBuyDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserBuyDataLogs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserDataLogs_DataId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserDataLogs_DataId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserDataLogs_DataId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserDataLogs_DataId]  DEFAULT ((0)) FOR [DataId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserDataLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserDataLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserDataLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserDataLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserDataLogs_Completeness]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserDataLogs_Completeness]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserDataLogs_Completeness]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserDataLogs_Completeness]  DEFAULT ((0)) FOR [Completeness]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserDataLogs_Score]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserDataLogs_Score]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserDataLogs_Score]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserDataLogs_Score]  DEFAULT ((0)) FOR [Score]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserDataLogs_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserDataLogs_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserDataLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserDataLogs_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserDataLogs] ADD  CONSTRAINT [DF_Material_Data_UserDataLogs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_ItemId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_ItemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_ItemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_ItemId]  DEFAULT ((0)) FOR [ItemId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_DataId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_DataId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_DataId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_DataId]  DEFAULT ((0)) FOR [DataId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_TestScore]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_TestScore]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_TestScore]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_TestScore]  DEFAULT ((0)) FOR [TestScore]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_LastTestDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_LastTestDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_LastTestDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_LastTestDate]  DEFAULT (getdate()) FOR [LastTestDate]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_GameScore]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_GameScore]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_GameScore]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_GameScore]  DEFAULT ((0)) FOR [GameScore]
END


End
GO
/****** Object:  Default [DF_Material_Data_UserItemLogs_LastGameDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Data_UserItemLogs_LastGameDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Data_UserItemLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Data_UserItemLogs_LastGameDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Data_UserItemLogs] ADD  CONSTRAINT [DF_Material_Data_UserItemLogs_LastGameDate]  DEFAULT (getdate()) FOR [LastGameDate]
END


End
GO
/****** Object:  Default [DF_Material_Dict_CE_Word]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_CE_Word]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_CE]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_CE_Word]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_CE] ADD  CONSTRAINT [DF_Material_Dict_CE_Word]  DEFAULT ('') FOR [Word]
END


End
GO
/****** Object:  Default [DF_Material_Dict_CE_Translation]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_CE_Translation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_CE]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_CE_Translation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_CE] ADD  CONSTRAINT [DF_Material_Dict_CE_Translation]  DEFAULT (0x) FOR [Translation]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_Word]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_Word]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_Word]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_Word]  DEFAULT ('') FOR [Word]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_PhonicsEn]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_PhonicsEn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_PhonicsEn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_PhonicsEn]  DEFAULT ('') FOR [PhonicsEn]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_PhonicsUs]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_PhonicsUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_PhonicsUs]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_PhonicsUs]  DEFAULT ('') FOR [PhonicsUs]
END


End
GO
/****** Object:  Default [DF_Table_1_AudioEN]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_AudioEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_AudioEN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Table_1_AudioEN]  DEFAULT ('') FOR [AudioEn]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_AudioUs]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_AudioUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_AudioUs]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_AudioUs]  DEFAULT ('') FOR [AudioUs]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_TransBase]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_TransBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_TransBase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_TransBase]  DEFAULT (0x) FOR [TransBase]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_TransFull]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_TransFull]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_TransFull]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_TransFull]  DEFAULT (0x) FOR [Explication]
END


End
GO
/****** Object:  Default [DF_Material_Dict_EC_Example]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Dict_EC_Example]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Dict_EC]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Dict_EC_Example]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Dict_EC] ADD  CONSTRAINT [DF_Material_Dict_EC_Example]  DEFAULT (0x) FOR [Example]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResLevel_LevelId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResLevel_LevelId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResLevel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResLevel_LevelId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResLevel] ADD  CONSTRAINT [DF_Material_Enum_ResLevel_LevelId]  DEFAULT ((0)) FOR [LevelId]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResLevel_LevelName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResLevel_LevelName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResLevel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResLevel_LevelName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResLevel] ADD  CONSTRAINT [DF_Material_Enum_ResLevel_LevelName]  DEFAULT ('') FOR [LevelName]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResLevel_LevelIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResLevel_LevelIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResLevel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResLevel_LevelIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResLevel] ADD  CONSTRAINT [DF_Material_Enum_ResLevel_LevelIcon]  DEFAULT ('') FOR [LevelIcon]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResLevel_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResLevel_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResLevel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResLevel_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResLevel] ADD  CONSTRAINT [DF_Material_Enum_ResLevel_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResLevel_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResLevel_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResLevel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResLevel_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResLevel] ADD  CONSTRAINT [DF_Material_Enum_ResLevel_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResMode_ModeId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResMode_ModeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResMode]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResMode_ModeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResMode] ADD  CONSTRAINT [DF_Material_Enum_ResMode_ModeId]  DEFAULT ((0)) FOR [ModeId]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResMode_ModeName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResMode_ModeName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResMode]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResMode_ModeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResMode] ADD  CONSTRAINT [DF_Material_Enum_ResMode_ModeName]  DEFAULT ('') FOR [ModeName]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResMode_ModeIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResMode_ModeIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResMode]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResMode_ModeIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResMode] ADD  CONSTRAINT [DF_Material_Enum_ResMode_ModeIcon]  DEFAULT ('') FOR [ModeIcon]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResMode_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResMode_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResMode]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResMode_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResMode] ADD  CONSTRAINT [DF_Material_Enum_ResMode_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResMode_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResMode_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResMode]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResMode_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResMode] ADD  CONSTRAINT [DF_Material_Enum_ResMode_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Table_1_TargetId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_TargetId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_TargetId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Table_1_TargetId]  DEFAULT ((0)) FOR [RangeId]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResRange_RangeName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResRange_RangeName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResRange_RangeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Material_Enum_ResRange_RangeName]  DEFAULT ('') FOR [RangeName]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResRange_RangeIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResRange_RangeIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResRange_RangeIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Material_Enum_ResRange_RangeIcon]  DEFAULT ('') FOR [RangeIcon]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResRange_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResRange_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResRange_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Material_Enum_ResRange_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResRange_ForumId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResRange_ForumId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResRange_ForumId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Material_Enum_ResRange_ForumId]  DEFAULT ((0)) FOR [ForumId]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResRange_SchoolForumId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResRange_SchoolForumId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResRange_SchoolForumId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Material_Enum_ResRange_SchoolForumId]  DEFAULT ((0)) FOR [SchoolForumId]
END


End
GO
/****** Object:  Default [DF_Material_Enum_ResRange_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Enum_ResRange_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Enum_ResRange]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Enum_ResRange_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Enum_ResRange] ADD  CONSTRAINT [DF_Material_Enum_ResRange_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Category_CategoryName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Category_CategoryName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Category_CategoryName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Category] ADD  CONSTRAINT [DF_Material_Wsn_Category_CategoryName]  DEFAULT ('') FOR [CategoryName]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Category_Target]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Category_Target]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Category_Target]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Category] ADD  CONSTRAINT [DF_Material_Wsn_Category_Target]  DEFAULT ((0)) FOR [Target]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Category_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Category_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Category_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Category] ADD  CONSTRAINT [DF_Material_Wsn_Category_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Category_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Category_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Category]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Category_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Category] ADD  CONSTRAINT [DF_Material_Wsn_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_CategoryId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_Title]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_Title]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_Title]  DEFAULT ('') FOR [Title]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_SubTitle]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_SubTitle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_SubTitle]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_SubTitle]  DEFAULT ('') FOR [SubTitle]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_Target]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_Target]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_Target]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_Target]  DEFAULT ((0)) FOR [Target]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_Examined]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_Examined]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_Examined]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_Examined]  DEFAULT ((0)) FOR [Examined]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_ImagePath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_ImagePath]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_ImagePath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_ImagePath]  DEFAULT ('') FOR [ImagePath]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_Content]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_Content]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_Content]  DEFAULT ('') FOR [Content]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_AudioPath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_AudioPath]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_AudioPath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_AudioPath]  DEFAULT ('') FOR [AudioPath]
END


End
GO
/****** Object:  Default [DF_Material_Wsn_Content_CreateTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Material_Wsn_Content_CreateTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Material_Wsn_Content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Material_Wsn_Content_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Material_Wsn_Content] ADD  CONSTRAINT [DF_Material_Wsn_Content_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
END


End
GO
/****** Object:  Default [DF_School_Branchs_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_School_Branchs_BranchName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_BranchName]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_BranchName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_BranchName]  DEFAULT ('') FOR [BranchName]
END


End
GO
/****** Object:  Default [DF_School_Branchs_AreaAddress]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_AreaAddress]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_AreaAddress]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_AreaAddress]  DEFAULT ('') FOR [AreaAddress]
END


End
GO
/****** Object:  Default [DF_School_Branchs_Contacter]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_Contacter]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_Contacter]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_Contacter]  DEFAULT ('') FOR [Contacter]
END


End
GO
/****** Object:  Default [DF_School_Branchs_Telphone]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_Telphone]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_Telphone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_Telphone]  DEFAULT ('') FOR [Telphone]
END


End
GO
/****** Object:  Default [DF_School_Branchs_Introduce]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_Introduce]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_Introduce]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_Introduce]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_School_Branchs_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Branchs_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Branchs_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Branchs] ADD  CONSTRAINT [DF_School_Branchs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_School_Pictures_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_School_Pictures_BranchId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_BranchId]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_BranchId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_BranchId]  DEFAULT ((0)) FOR [BranchId]
END


End
GO
/****** Object:  Default [DF_School_Pictures_PictureName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_PictureName]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_PictureName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_PictureName]  DEFAULT ('') FOR [PictureName]
END


End
GO
/****** Object:  Default [DF_School_Pictures_PicturePath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_PicturePath]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_PicturePath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_PicturePath]  DEFAULT ('') FOR [PicturePath]
END


End
GO
/****** Object:  Default [DF_School_Pictures_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_School_Pictures_IsEanbled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_IsEanbled]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_IsEanbled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_IsEanbled]  DEFAULT ((0)) FOR [IsEanbled]
END


End
GO
/****** Object:  Default [DF_School_Pictures_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Pictures_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Pictures_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Pictures] ADD  CONSTRAINT [DF_School_Pictures_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_FullName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_FullName]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_FullName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_FullName]  DEFAULT ('') FOR [FullName]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_ShortName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_ShortName]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_ShortName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_ShortName]  DEFAULT ('') FOR [ShortName]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_EnglishName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_EnglishName]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_EnglishName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_EnglishName]  DEFAULT ('') FOR [EnglishName]
END


End
GO
/****** Object:  Default [DF_Table_1_LogoPath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_LogoPath]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_LogoPath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_Table_1_LogoPath]  DEFAULT ('') FOR [LargerLogo]
END


End
GO
/****** Object:  Default [DF_Table_1_LogoPathForApp]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_LogoPathForApp]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_LogoPathForApp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_Table_1_LogoPathForApp]  DEFAULT ('') FOR [SmallerLogo]
END


End
GO
/****** Object:  Default [DF_Table_1_SceneryIconPath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_SceneryIconPath]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_SceneryIconPath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_Table_1_SceneryIconPath]  DEFAULT ('') FOR [SceneryLogo]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_AreaCity]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_AreaCity]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_AreaCity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_AreaCity]  DEFAULT ('') FOR [AreaCity]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_AreaAddress]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_AreaAddress]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_AreaAddress]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_AreaAddress]  DEFAULT ('') FOR [AreaAddress]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_Contacter]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_Contacter]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_Contacter]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_Contacter]  DEFAULT ('') FOR [Contacter]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_Telphone]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_Telphone]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_Telphone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_Telphone]  DEFAULT ('') FOR [Telphone]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_Email]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_Email]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_Email]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_Email]  DEFAULT ('') FOR [Email]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_WebSite]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_WebSite]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_WebSite]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_WebSite]  DEFAULT ('') FOR [WebSite]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_Introduce]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_Introduce]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_Introduce]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_Introduce]  DEFAULT ('') FOR [Introduce]
END


End
GO
/****** Object:  Default [DF_School_SchoolBase_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_SchoolBase_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_SchoolBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_SchoolBase_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_SchoolBase] ADD  CONSTRAINT [DF_School_SchoolBase_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_School_Users_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_School_Users_SchoolId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_SchoolId]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_SchoolId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_SchoolId]  DEFAULT ((0)) FOR [SchoolId]
END


End
GO
/****** Object:  Default [DF_School_Users_IsTrial]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_IsTrial]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_IsTrial]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_IsTrial]  DEFAULT ((0)) FOR [IsTrial]
END


End
GO
/****** Object:  Default [DF_School_Users_TrialedSource]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_TrialedSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_TrialedSource]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_TrialedSource]  DEFAULT ('') FOR [TrialedSource]
END


End
GO
/****** Object:  Default [DF_School_Users_IsActivated]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_IsActivated]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_IsActivated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_IsActivated]  DEFAULT ((0)) FOR [IsActivated]
END


End
GO
/****** Object:  Default [DF_School_Users_ActivatedDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_ActivatedDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_ActivatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_ActivatedDate]  DEFAULT (getdate()) FOR [ActivatedDate]
END


End
GO
/****** Object:  Default [DF_School_Users_IsExpired]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_IsExpired]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_IsExpired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_IsExpired]  DEFAULT ((0)) FOR [IsExpired]
END


End
GO
/****** Object:  Default [DF_School_Users_ExpiredDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_ExpiredDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_ExpiredDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_ExpiredDate]  DEFAULT (getdate()) FOR [ExpiredDate]
END


End
GO
/****** Object:  Default [DF_School_Users_StudNo]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_StudNo]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_StudNo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_StudNo]  DEFAULT ('') FOR [StudNo]
END


End
GO
/****** Object:  Default [DF_School_Users_ClassInfo]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_ClassInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_ClassInfo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_ClassInfo]  DEFAULT ('') FOR [ClassInfo]
END


End
GO
/****** Object:  Default [DF_School_Users_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_School_Users_SyncForBbs]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_SyncForBbs]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_SyncForBbs]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_SyncForBbs]  DEFAULT ((0)) FOR [SyncForBbs]
END


End
GO
/****** Object:  Default [DF_School_Users_Status]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_School_Users_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_School_Users_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[School_Users] ADD  CONSTRAINT [DF_School_Users_Status]  DEFAULT ((0)) FOR [Status]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_CategoryId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_ChannelCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_ChannelCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_ChannelCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_ChannelCode]  DEFAULT ('') FOR [ChannelCode]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_ChannelKey]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_ChannelKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_ChannelKey]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_ChannelKey]  DEFAULT ('') FOR [ChannelKey]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_ChannelName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_ChannelName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_ChannelName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_ChannelName]  DEFAULT ('') FOR [ChannelName]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_ChannelComment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_ChannelComment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_ChannelComment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_ChannelComment]  DEFAULT ('') FOR [ChannelComment]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_AppChannel_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannel_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannel_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannel] ADD  CONSTRAINT [DF_Support_AppChannel_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_AppChannelCategory_CategoryName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannelCategory_CategoryName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannelCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannelCategory_CategoryName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannelCategory] ADD  CONSTRAINT [DF_Support_AppChannelCategory_CategoryName]  DEFAULT ('') FOR [CategoryName]
END


End
GO
/****** Object:  Default [DF_Support_AppChannelCategory_CategoryComent]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannelCategory_CategoryComent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannelCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannelCategory_CategoryComent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannelCategory] ADD  CONSTRAINT [DF_Support_AppChannelCategory_CategoryComent]  DEFAULT ('') FOR [CategoryComment]
END


End
GO
/****** Object:  Default [DF_Support_AppChannelCategory_SubCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannelCategory_SubCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannelCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannelCategory_SubCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannelCategory] ADD  CONSTRAINT [DF_Support_AppChannelCategory_SubCount]  DEFAULT ((0)) FOR [SubCount]
END


End
GO
/****** Object:  Default [DF_Support_AppChannelCategory_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannelCategory_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannelCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannelCategory_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannelCategory] ADD  CONSTRAINT [DF_Support_AppChannelCategory_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_AppChannelCategory_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppChannelCategory_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannelCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppChannelCategory_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppChannelCategory] ADD  CONSTRAINT [DF_Support_AppChannelCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_ChannelCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_ChannelCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_ChannelCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_ChannelCode]  DEFAULT ('') FOR [ChannelCode]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_VersionName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_VersionName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_VersionName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_VersionName]  DEFAULT ('') FOR [VersionName]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_PrevVersionId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_PrevVersionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_PrevVersionId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_PrevVersionId]  DEFAULT ((0)) FOR [PrevVersionId]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_VersionComment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_VersionComment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_VersionComment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_VersionComment]  DEFAULT ('') FOR [VersionComment]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_IsRequired]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_IsRequired]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_IsRequired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_IsRequired]  DEFAULT ((0)) FOR [IsRequired]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_UpgradeSource]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_UpgradeSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_UpgradeSource]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_UpgradeSource]  DEFAULT ((0)) FOR [UpgradeSource]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_UpgradePath]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_UpgradePath]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_UpgradePath]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_UpgradePath]  DEFAULT ('') FOR [UpgradePath]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_AppVersion_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AppVersion_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AppVersion_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AppVersion] ADD  CONSTRAINT [DF_Support_AppVersion_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_ProvinceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_ProvinceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_ProvinceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_ProvinceId]  DEFAULT ((0)) FOR [ProvinceId]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CityName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CityName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CityName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CityName]  DEFAULT ('') FOR [CityName]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CityShortName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CityShortName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CityShortName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CityShortName]  DEFAULT ('') FOR [CityShortName]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CityEName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CityEName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CityEName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CityEName]  DEFAULT ('') FOR [CityEName]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CityCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CityCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CityCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CityCode]  DEFAULT ('') FOR [CityCode]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CityLongitude]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CityLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CityLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CityLongitude]  DEFAULT ((0)) FOR [Longitude]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CityLatitude]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CityLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CityLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CityLatitude]  DEFAULT ((0)) FOR [Latitude]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_AreaCity_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCity_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCity_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCity] ADD  CONSTRAINT [DF_Support_AreaCity_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_CityName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_CityName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_CityName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_CityName]  DEFAULT ((0)) FOR [CityId]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_CountyName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_CountyName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_CountyName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_CountyName]  DEFAULT ('') FOR [CountyName]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_CountyShortName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_CountyShortName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_CountyShortName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_CountyShortName]  DEFAULT ('') FOR [CountyShortName]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_CountyEName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_CountyEName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_CountyEName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_CountyEName]  DEFAULT ('') FOR [CountyEName]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_CountyCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_CountyCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_CountyCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_CountyCode]  DEFAULT ('') FOR [CountyCode]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_AreaCounty_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaCounty_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaCounty_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaCounty] ADD  CONSTRAINT [DF_Support_AreaCounty_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_ProvinceName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_ProvinceName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_ProvinceName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_ProvinceName]  DEFAULT ('') FOR [ProvinceName]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_ProvinceShortName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_ProvinceShortName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_ProvinceShortName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_ProvinceShortName]  DEFAULT ('') FOR [ProvinceShortName]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_ProvinceEName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_ProvinceEName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_ProvinceEName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_ProvinceEName]  DEFAULT ('') FOR [ProvinceEName]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_ProvinceCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_ProvinceCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_ProvinceCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_ProvinceCode]  DEFAULT ('') FOR [ProvinceCode]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_AreaProvince_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaProvince_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaProvince]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaProvince_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaProvince] ADD  CONSTRAINT [DF_Support_AreaProvince_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_CountyId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_CountyId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_CountyId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_CountyId]  DEFAULT ((0)) FOR [CountyId]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_TownName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_TownName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_TownName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_TownName]  DEFAULT ('') FOR [TownName]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_TownShortName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_TownShortName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_TownShortName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_TownShortName]  DEFAULT ('') FOR [TownShortName]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_TownEName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_TownEName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_TownEName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_TownEName]  DEFAULT ('') FOR [TownEName]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_TownCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_TownCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_TownCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_TownCode]  DEFAULT ('') FOR [TownCode]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_AreaTowns_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_AreaTowns_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_AreaTowns_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_AreaTowns] ADD  CONSTRAINT [DF_Support_AreaTowns_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_InterestType_Name]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestType_Name]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestType_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestType] ADD  CONSTRAINT [DF_Support_InterestType_Name]  DEFAULT ('') FOR [Name]
END


End
GO
/****** Object:  Default [DF_Support_InterestType_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestType_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestType_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestType] ADD  CONSTRAINT [DF_Support_InterestType_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Support_InterestType_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestType_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestType_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestType] ADD  CONSTRAINT [DF_Support_InterestType_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_InterestType_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestType_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestType_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestType] ADD  CONSTRAINT [DF_Support_InterestType_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_InterestType_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestType_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestType_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestType] ADD  CONSTRAINT [DF_Support_InterestType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_InterestWord_TypeId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestWord_TypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestWord_TypeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestWord] ADD  CONSTRAINT [DF_Support_InterestWord_TypeId]  DEFAULT ((0)) FOR [TypeId]
END


End
GO
/****** Object:  Default [DF_Support_InterestWord_Word]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestWord_Word]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestWord_Word]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestWord] ADD  CONSTRAINT [DF_Support_InterestWord_Word]  DEFAULT ('') FOR [Word]
END


End
GO
/****** Object:  Default [DF_Support_InterestWord_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestWord_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestWord_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestWord] ADD  CONSTRAINT [DF_Support_InterestWord_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_Support_InterestWord_Sort]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestWord_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestWord_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestWord] ADD  CONSTRAINT [DF_Support_InterestWord_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_Support_InterestWord_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestWord_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestWord_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestWord] ADD  CONSTRAINT [DF_Support_InterestWord_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_Support_InterestWord_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_InterestWord_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_InterestWord_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_InterestWord] ADD  CONSTRAINT [DF_Support_InterestWord_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_Support_SensitiveWord_Word]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_SensitiveWord_Word]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_SensitiveWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_SensitiveWord_Word]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_SensitiveWord] ADD  CONSTRAINT [DF_Support_SensitiveWord_Word]  DEFAULT ('') FOR [Word]
END


End
GO
/****** Object:  Default [DF_Support_SensitiveWord_IsEnabled]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Support_SensitiveWord_IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_SensitiveWord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Support_SensitiveWord_IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Support_SensitiveWord] ADD  CONSTRAINT [DF_Support_SensitiveWord_IsEnabled]  DEFAULT ((0)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF_User_AppOptions_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_AppOptions_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_AppOptions_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_AppOptions] ADD  CONSTRAINT [DF_User_AppOptions_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_User_AppOptions_RemindPrivateMessage]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_AppOptions_RemindPrivateMessage]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_AppOptions_RemindPrivateMessage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_AppOptions] ADD  CONSTRAINT [DF_User_AppOptions_RemindPrivateMessage]  DEFAULT ((0)) FOR [RemindPrivateMessage]
END


End
GO
/****** Object:  Default [DF_User_AppOptions_RemindGroupMessage]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_AppOptions_RemindGroupMessage]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_AppOptions_RemindGroupMessage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_AppOptions] ADD  CONSTRAINT [DF_User_AppOptions_RemindGroupMessage]  DEFAULT ((0)) FOR [RemindGroupMessage]
END


End
GO
/****** Object:  Default [DF_User_AppOptions_RemindBeFollowed]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_AppOptions_RemindBeFollowed]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_AppOptions_RemindBeFollowed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_AppOptions] ADD  CONSTRAINT [DF_User_AppOptions_RemindBeFollowed]  DEFAULT ((0)) FOR [RemindBeFollowed]
END


End
GO
/****** Object:  Default [DF_User_AppOptions_RemindTopicBeReply]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_AppOptions_RemindTopicBeReply]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_AppOptions_RemindTopicBeReply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_AppOptions] ADD  CONSTRAINT [DF_User_AppOptions_RemindTopicBeReply]  DEFAULT ((0)) FOR [RemindTopicBeReply]
END


End
GO
/****** Object:  Default [DF_User_AppOptions_LastChangeDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_AppOptions_LastChangeDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_AppOptions_LastChangeDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_AppOptions] ADD  CONSTRAINT [DF_User_AppOptions_LastChangeDate]  DEFAULT (getdate()) FOR [LastChangeDate]
END


End
GO
/****** Object:  Default [DF_User_CheckedInLogs_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_CheckedInLogs_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_CheckedInLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CheckedInLogs_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_CheckedInLogs] ADD  CONSTRAINT [DF_User_CheckedInLogs_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_User_CheckedInLogs_AppChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_CheckedInLogs_AppChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_CheckedInLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CheckedInLogs_AppChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_CheckedInLogs] ADD  CONSTRAINT [DF_User_CheckedInLogs_AppChannel]  DEFAULT ('') FOR [AppChannel]
END


End
GO
/****** Object:  Default [DF_User_CheckedInLogs_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_CheckedInLogs_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_CheckedInLogs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CheckedInLogs_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_CheckedInLogs] ADD  CONSTRAINT [DF_User_CheckedInLogs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_User_Devices_IMSI]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_IMSI]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_IMSI]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_IMSI]  DEFAULT ('') FOR [IMSI]
END


End
GO
/****** Object:  Default [DF_User_Devices_IMEI]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_IMEI]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_IMEI]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_IMEI]  DEFAULT ('') FOR [IMEI]
END


End
GO
/****** Object:  Default [DF_User_Devices_MSID]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_MSID]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_MSID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_MSID]  DEFAULT ('') FOR [MSID]
END


End
GO
/****** Object:  Default [DF_User_Devices_Platform]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_Platform]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_Platform]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_Platform]  DEFAULT ((0)) FOR [Platform]
END


End
GO
/****** Object:  Default [DF_User_Devices_OS]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_OS]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_OS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_OS]  DEFAULT ('') FOR [OS]
END


End
GO
/****** Object:  Default [DF_User_Devices_Equipment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_Equipment]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_Equipment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_Equipment]  DEFAULT ('') FOR [Code]
END


End
GO
/****** Object:  Default [DF_EndPoint_Sortware_Token]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_EndPoint_Sortware_Token]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_EndPoint_Sortware_Token]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_EndPoint_Sortware_Token]  DEFAULT ('') FOR [Token]
END


End
GO
/****** Object:  Default [DF_User_Devices_ChannelCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_ChannelCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_ChannelCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_ChannelCode]  DEFAULT ('') FOR [ChannelCode]
END


End
GO
/****** Object:  Default [DF_User_Devices_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Devices_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Devices_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Devices] ADD  CONSTRAINT [DF_User_Devices_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_User_ExpGrades_GradeId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_ExpGrades_GradeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_ExpGrades]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_ExpGrades_GradeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_ExpGrades] ADD  CONSTRAINT [DF_User_ExpGrades_GradeId]  DEFAULT ((0)) FOR [GradeId]
END


End
GO
/****** Object:  Default [DF_User_ExpGrades_GradeName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_ExpGrades_GradeName]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_ExpGrades]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_ExpGrades_GradeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_ExpGrades] ADD  CONSTRAINT [DF_User_ExpGrades_GradeName]  DEFAULT ('') FOR [GradeName]
END


End
GO
/****** Object:  Default [DF_User_ExpGrades_GradeIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_ExpGrades_GradeIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_ExpGrades]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_ExpGrades_GradeIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_ExpGrades] ADD  CONSTRAINT [DF_User_ExpGrades_GradeIcon]  DEFAULT ('') FOR [GradeIcon]
END


End
GO
/****** Object:  Default [DF_User_ExpGrades_ExpLBound]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_ExpGrades_ExpLBound]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_ExpGrades]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_ExpGrades_ExpLBound]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_ExpGrades] ADD  CONSTRAINT [DF_User_ExpGrades_ExpLBound]  DEFAULT ((0)) FOR [ExpLBound]
END


End
GO
/****** Object:  Default [DF_User_ExpGrades_ExpUBound]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_ExpGrades_ExpUBound]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_ExpGrades]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_ExpGrades_ExpUBound]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_ExpGrades] ADD  CONSTRAINT [DF_User_ExpGrades_ExpUBound]  DEFAULT ((0)) FOR [ExpUBound]
END


End
GO
/****** Object:  Default [DF_User_Followers_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Followers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Followers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Followers_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Followers] ADD  CONSTRAINT [DF_User_Followers_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_User_Followers_FollowedUserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Followers_FollowedUserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Followers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Followers_FollowedUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Followers] ADD  CONSTRAINT [DF_User_Followers_FollowedUserId]  DEFAULT ((0)) FOR [FollowedUserId]
END


End
GO
/****** Object:  Default [DF_User_Followers_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Followers_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Followers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Followers_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_Followers] ADD  CONSTRAINT [DF_User_Followers_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_User_UserBase_UserName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_UserName]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_UserName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_UserName]  DEFAULT ('') FOR [UserName]
END


End
GO
/****** Object:  Default [DF_User_UserBase_Password]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_Password]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_Password]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_Password]  DEFAULT ('') FOR [Password]
END


End
GO
/****** Object:  Default [DF_User_UserBase_PasswordFormat]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_PasswordFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_PasswordFormat]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_PasswordFormat]  DEFAULT ((0)) FOR [PasswordFormat]
END


End
GO
/****** Object:  Default [DF_User_UserBase_PasswordSalt]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_PasswordSalt]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_PasswordSalt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_PasswordSalt]  DEFAULT ('') FOR [PasswordSalt]
END


End
GO
/****** Object:  Default [DF_User_UserBase_LastPasswordChangedDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_LastPasswordChangedDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_LastPasswordChangedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_LastPasswordChangedDate]  DEFAULT (getdate()) FOR [LastPasswordChangedDate]
END


End
GO
/****** Object:  Default [DF_User_UserBase_IsApproved]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_IsApproved]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_IsApproved]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_IsApproved]  DEFAULT ((1)) FOR [IsApproved]
END


End
GO
/****** Object:  Default [DF_User_UserBase_ApprovedDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_ApprovedDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_ApprovedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_ApprovedDate]  DEFAULT (getdate()) FOR [ApprovedDate]
END


End
GO
/****** Object:  Default [DF_User_UserBase_IsLocked]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_IsLocked]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_IsLocked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
END


End
GO
/****** Object:  Default [DF_User_UserBase_LastLockedoutDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_LastLockedoutDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_LastLockedoutDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_LastLockedoutDate]  DEFAULT (getdate()) FOR [LastLockedoutDate]
END


End
GO
/****** Object:  Default [DF_User_UserBase_CreateDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_User_UserBase_LoginCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_LoginCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_LoginCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_LoginCount]  DEFAULT ((0)) FOR [LoginCount]
END


End
GO
/****** Object:  Default [DF_User_UserBase_LastLoginDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserBase_LastLoginDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserBase]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserBase_LastLoginDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserBase] ADD  CONSTRAINT [DF_User_UserBase_LastLoginDate]  DEFAULT (getdate()) FOR [LastLoginDate]
END


End
GO
/****** Object:  Default [DF_User_UserCoords_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserCoords_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserCoords]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserCoords_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserCoords] ADD  CONSTRAINT [DF_User_UserCoords_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_User_UserCoords_Longitude]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserCoords_Longitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserCoords]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserCoords_Longitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserCoords] ADD  CONSTRAINT [DF_User_UserCoords_Longitude]  DEFAULT ((0)) FOR [Longitude]
END


End
GO
/****** Object:  Default [DF_User_UserCoords_Latitudes]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserCoords_Latitudes]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserCoords]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserCoords_Latitudes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserCoords] ADD  CONSTRAINT [DF_User_UserCoords_Latitudes]  DEFAULT ((0)) FOR [Latitudes]
END


End
GO
/****** Object:  Default [DF_User_UserCoords_LastChangeTime]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserCoords_LastChangeTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserCoords]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserCoords_LastChangeTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserCoords] ADD  CONSTRAINT [DF_User_UserCoords_LastChangeTime]  DEFAULT (getdate()) FOR [LastChangeTime]
END


End
GO
/****** Object:  Default [DF_User_UserExt_UserSite]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_UserSite]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_UserSite]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_UserSite]  DEFAULT ((0)) FOR [UserSite]
END


End
GO
/****** Object:  Default [DF_User_UserExt_UserRole]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_UserRole]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_UserRole]  DEFAULT ((0)) FOR [UserRole]
END


End
GO
/****** Object:  Default [DF_User_UserExt_UserAccess]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_UserAccess]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_UserAccess]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_UserAccess]  DEFAULT ((0)) FOR [UserAccess]
END


End
GO
/****** Object:  Default [DF_User_UserExt_CreateDeviceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_CreateDeviceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_CreateDeviceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_CreateDeviceId]  DEFAULT ((0)) FOR [CreateDeviceId]
END


End
GO
/****** Object:  Default [DF_User_UserExt_CreateAPPChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_CreateAPPChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_CreateAPPChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_CreateAPPChannel]  DEFAULT ('') FOR [CreateAPPChannel]
END


End
GO
/****** Object:  Default [DF_User_UserExt_CreateAccountChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_CreateAccountChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_CreateAccountChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_CreateAccountChannel]  DEFAULT ((0)) FOR [CreateAccountChannel]
END


End
GO
/****** Object:  Default [DF_User_UserExt_LastLoginDeviceId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_LastLoginDeviceId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_LastLoginDeviceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_LastLoginDeviceId]  DEFAULT ((0)) FOR [LastLoginDeviceId]
END


End
GO
/****** Object:  Default [DF_User_UserExt_LastLoginAPPChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_LastLoginAPPChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_LastLoginAPPChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_LastLoginAPPChannel]  DEFAULT ('') FOR [LastLoginAPPChannel]
END


End
GO
/****** Object:  Default [DF_User_UserExt_LastLoginAccountChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_LastLoginAccountChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_LastLoginAccountChannel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_LastLoginAccountChannel]  DEFAULT ((0)) FOR [LastLoginAccountChannel]
END


End
GO
/****** Object:  Default [DF_User_UserExt_ExpLevel]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_ExpLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_ExpLevel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_ExpLevel]  DEFAULT ((0)) FOR [ExpLevel]
END


End
GO
/****** Object:  Default [DF_User_UserExt_ExpScore]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_ExpScore]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_ExpScore]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_ExpScore]  DEFAULT ((0)) FOR [ExpScore]
END


End
GO
/****** Object:  Default [DF_User_UserExt_GradeName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_GradeName]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_GradeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_GradeName]  DEFAULT ('') FOR [GradeName]
END


End
GO
/****** Object:  Default [DF_User_UserExt_GradeIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_GradeIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_GradeIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_GradeIcon]  DEFAULT ('') FOR [GradeIcon]
END


End
GO
/****** Object:  Default [DF_User_UserExt_VirtualCoinCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_VirtualCoinCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_VirtualCoinCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_VirtualCoinCount]  DEFAULT ((0)) FOR [VirtualCoinCount]
END


End
GO
/****** Object:  Default [DF_User_UserExt_FansCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_FansCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_FansCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_FansCount]  DEFAULT ((0)) FOR [FansCount]
END


End
GO
/****** Object:  Default [DF_User_UserExt_FollowedCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_FollowedCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_FollowedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_FollowedCount]  DEFAULT ((0)) FOR [FollowedCount]
END


End
GO
/****** Object:  Default [DF_User_UserExt_TopicCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_TopicCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_TopicCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_TopicCount]  DEFAULT ((0)) FOR [TopicCount]
END


End
GO
/****** Object:  Default [DF_User_UserExt_ReplyCount]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserExt_ReplyCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserExt_ReplyCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserExt] ADD  CONSTRAINT [DF_User_UserExt_ReplyCount]  DEFAULT ((0)) FOR [ReplyCount]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_UserId]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_UserId]  DEFAULT ((0)) FOR [UserId]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_NiceName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_NiceName]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_NiceName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_NiceName]  DEFAULT ('') FOR [NickName]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_RealName]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_RealName]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_RealName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_RealName]  DEFAULT ('') FOR [RealName]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_BackIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_BackIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_BackIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_BackIcon]  DEFAULT ('') FOR [BackIcon]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_HeadIcon]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_HeadIcon]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_HeadIcon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_HeadIcon]  DEFAULT ('') FOR [HeadIcon]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Signature]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Signature]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Signature]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Signature]  DEFAULT ('') FOR [Signature]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Comment]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Comment]  DEFAULT ('') FOR [Comment]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Gender]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Gender]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Gender]  DEFAULT ((0)) FOR [Gender]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Birthday]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Birthday]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Birthday]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Birthday]  DEFAULT (getdate()) FOR [Birthday]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_IDCardNo]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_IDCardNo]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_IDCardNo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_IDCardNo]  DEFAULT ('') FOR [IDCardNo]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Area]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Area]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Area]  DEFAULT ('') FOR [Area]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Address]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Address]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Address]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Address]  DEFAULT ('') FOR [Address]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_PostCode]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_PostCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_PostCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_PostCode]  DEFAULT ('') FOR [PostCode]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Industry]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Industry]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Industry]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Industry]  DEFAULT ('') FOR [Industry]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Company]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Company]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Company]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Company]  DEFAULT ('') FOR [Company]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_JobPosition]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_JobPosition]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_JobPosition]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_JobPosition]  DEFAULT ('') FOR [JobPosition]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Interests]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Interests]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Interests]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Interests]  DEFAULT ('') FOR [Interests]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_WebSite]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_WebSite]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_WebSite]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_WebSite]  DEFAULT ('') FOR [WebSite]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Email]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Email]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Email]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Email]  DEFAULT ('') FOR [Email]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Mobile]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Mobile]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Mobile]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Mobile]  DEFAULT ('') FOR [Mobile]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_Telphone]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_Telphone]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_Telphone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_Telphone]  DEFAULT ('') FOR [Telphone]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_QQ]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_QQ]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_QQ]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_QQ]  DEFAULT ('') FOR [QQ]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_MSN]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_MSN]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_MSN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_MSN]  DEFAULT ('') FOR [MSN]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_OtherInfo]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_OtherInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_OtherInfo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_OtherInfo]  DEFAULT ('') FOR [OtherInfo]
END


End
GO
/****** Object:  Default [DF_User_UserInfo_LastChangeDate]    Script Date: 07/20/2017 15:46:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_UserInfo_LastChangeDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserInfo_LastChangeDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User_UserInfo] ADD  CONSTRAINT [DF_User_UserInfo_LastChangeDate]  DEFAULT (getdate()) FOR [LastChangeDate]
END


End
GO
/****** Object:  ForeignKey [FK_Chat_Group_SchoolAndClass_Chat_Groups]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chat_Group_SchoolAndClass_Chat_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]'))
ALTER TABLE [dbo].[Chat_Group_SchoolAndClass]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Group_SchoolAndClass_Chat_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Chat_Groups] ([GroupId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chat_Group_SchoolAndClass_Chat_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_Group_SchoolAndClass]'))
ALTER TABLE [dbo].[Chat_Group_SchoolAndClass] CHECK CONSTRAINT [FK_Chat_Group_SchoolAndClass_Chat_Groups]
GO
/****** Object:  ForeignKey [FK_Chat_GroupMembers_Chat_Groups]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chat_GroupMembers_Chat_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
ALTER TABLE [dbo].[Chat_GroupMembers]  WITH CHECK ADD  CONSTRAINT [FK_Chat_GroupMembers_Chat_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Chat_Groups] ([GroupId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chat_GroupMembers_Chat_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
ALTER TABLE [dbo].[Chat_GroupMembers] CHECK CONSTRAINT [FK_Chat_GroupMembers_Chat_Groups]
GO
/****** Object:  ForeignKey [FK_Chat_GroupMembers_User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chat_GroupMembers_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
ALTER TABLE [dbo].[Chat_GroupMembers]  WITH CHECK ADD  CONSTRAINT [FK_Chat_GroupMembers_User_UserBase] FOREIGN KEY([UserId])
REFERENCES [dbo].[User_UserBase] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chat_GroupMembers_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chat_GroupMembers]'))
ALTER TABLE [dbo].[Chat_GroupMembers] CHECK CONSTRAINT [FK_Chat_GroupMembers_User_UserBase]
GO
/****** Object:  ForeignKey [FK_Course_Category_School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_Category_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Category]'))
ALTER TABLE [dbo].[Course_Category]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category_School_SchoolBase] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School_SchoolBase] ([SchoolId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_Category_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Category]'))
ALTER TABLE [dbo].[Course_Category] CHECK CONSTRAINT [FK_Course_Category_School_SchoolBase]
GO
/****** Object:  ForeignKey [FK_Course_Classes_School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_Classes_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
ALTER TABLE [dbo].[Course_Classes]  WITH CHECK ADD  CONSTRAINT [FK_Course_Classes_School_SchoolBase] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School_SchoolBase] ([SchoolId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_Classes_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Classes]'))
ALTER TABLE [dbo].[Course_Classes] CHECK CONSTRAINT [FK_Course_Classes_School_SchoolBase]
GO
/****** Object:  ForeignKey [FK_Course_ClassLessons_Course_Classes]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_ClassLessons_Course_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
ALTER TABLE [dbo].[Course_ClassLessons]  WITH CHECK ADD  CONSTRAINT [FK_Course_ClassLessons_Course_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Course_Classes] ([ClassId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_ClassLessons_Course_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassLessons]'))
ALTER TABLE [dbo].[Course_ClassLessons] CHECK CONSTRAINT [FK_Course_ClassLessons_Course_Classes]
GO
/****** Object:  ForeignKey [FK_Course_ClassUsers_Course_Classes]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_ClassUsers_Course_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
ALTER TABLE [dbo].[Course_ClassUsers]  WITH CHECK ADD  CONSTRAINT [FK_Course_ClassUsers_Course_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Course_Classes] ([ClassId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_ClassUsers_Course_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_ClassUsers]'))
ALTER TABLE [dbo].[Course_ClassUsers] CHECK CONSTRAINT [FK_Course_ClassUsers_Course_Classes]
GO
/****** Object:  ForeignKey [FK_Course_Courses_Course_Category]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_Courses_Course_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
ALTER TABLE [dbo].[Course_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Course_Courses_Course_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Course_Category] ([CategoryId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course_Courses_Course_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course_Courses]'))
ALTER TABLE [dbo].[Course_Courses] CHECK CONSTRAINT [FK_Course_Courses_Course_Category]
GO
/****** Object:  ForeignKey [FK_Forum_Posts_Forum_Topics]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_Posts_Forum_Topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
ALTER TABLE [dbo].[Forum_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Forum_Posts_Forum_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Forum_Topics] ([TopicId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_Posts_Forum_Topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Posts]'))
ALTER TABLE [dbo].[Forum_Posts] CHECK CONSTRAINT [FK_Forum_Posts_Forum_Topics]
GO
/****** Object:  ForeignKey [FK_Forum_SchoolForums_Forum_Forums]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_SchoolForums_Forum_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
ALTER TABLE [dbo].[Forum_SchoolForums]  WITH CHECK ADD  CONSTRAINT [FK_Forum_SchoolForums_Forum_Forums] FOREIGN KEY([ForumId])
REFERENCES [dbo].[Forum_Forums] ([ForumId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_SchoolForums_Forum_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
ALTER TABLE [dbo].[Forum_SchoolForums] CHECK CONSTRAINT [FK_Forum_SchoolForums_Forum_Forums]
GO
/****** Object:  ForeignKey [FK_Forum_SchoolForums_School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_SchoolForums_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
ALTER TABLE [dbo].[Forum_SchoolForums]  WITH CHECK ADD  CONSTRAINT [FK_Forum_SchoolForums_School_SchoolBase] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School_SchoolBase] ([SchoolId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_SchoolForums_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_SchoolForums]'))
ALTER TABLE [dbo].[Forum_SchoolForums] CHECK CONSTRAINT [FK_Forum_SchoolForums_School_SchoolBase]
GO
/****** Object:  ForeignKey [FK_Forum_Topics_Forum_Forums]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_Topics_Forum_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
ALTER TABLE [dbo].[Forum_Topics]  WITH CHECK ADD  CONSTRAINT [FK_Forum_Topics_Forum_Forums] FOREIGN KEY([ForumId])
REFERENCES [dbo].[Forum_Forums] ([ForumId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forum_Topics_Forum_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forum_Topics]'))
ALTER TABLE [dbo].[Forum_Topics] CHECK CONSTRAINT [FK_Forum_Topics_Forum_Forums]
GO
/****** Object:  ForeignKey [FK_School_Branchs_School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Branchs_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
ALTER TABLE [dbo].[School_Branchs]  WITH CHECK ADD  CONSTRAINT [FK_School_Branchs_School_SchoolBase] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School_SchoolBase] ([SchoolId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Branchs_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Branchs]'))
ALTER TABLE [dbo].[School_Branchs] CHECK CONSTRAINT [FK_School_Branchs_School_SchoolBase]
GO
/****** Object:  ForeignKey [FK_School_Pictures_School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Pictures_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
ALTER TABLE [dbo].[School_Pictures]  WITH CHECK ADD  CONSTRAINT [FK_School_Pictures_School_SchoolBase] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School_SchoolBase] ([SchoolId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Pictures_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Pictures]'))
ALTER TABLE [dbo].[School_Pictures] CHECK CONSTRAINT [FK_School_Pictures_School_SchoolBase]
GO
/****** Object:  ForeignKey [FK_School_Users_School_SchoolBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Users_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
ALTER TABLE [dbo].[School_Users]  WITH CHECK ADD  CONSTRAINT [FK_School_Users_School_SchoolBase] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School_SchoolBase] ([SchoolId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Users_School_SchoolBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
ALTER TABLE [dbo].[School_Users] CHECK CONSTRAINT [FK_School_Users_School_SchoolBase]
GO
/****** Object:  ForeignKey [FK_School_Users_User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Users_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
ALTER TABLE [dbo].[School_Users]  WITH CHECK ADD  CONSTRAINT [FK_School_Users_User_UserBase] FOREIGN KEY([UserId])
REFERENCES [dbo].[User_UserBase] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School_Users_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[School_Users]'))
ALTER TABLE [dbo].[School_Users] CHECK CONSTRAINT [FK_School_Users_User_UserBase]
GO
/****** Object:  ForeignKey [FK_Support_AppChannel_Support_AppChannelCategory]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AppChannel_Support_AppChannelCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
ALTER TABLE [dbo].[Support_AppChannel]  WITH CHECK ADD  CONSTRAINT [FK_Support_AppChannel_Support_AppChannelCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Support_AppChannelCategory] ([CategoryId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AppChannel_Support_AppChannelCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppChannel]'))
ALTER TABLE [dbo].[Support_AppChannel] CHECK CONSTRAINT [FK_Support_AppChannel_Support_AppChannelCategory]
GO
/****** Object:  ForeignKey [FK_Support_AppVersion_Support_AppChannel]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AppVersion_Support_AppChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
ALTER TABLE [dbo].[Support_AppVersion]  WITH CHECK ADD  CONSTRAINT [FK_Support_AppVersion_Support_AppChannel] FOREIGN KEY([ChannelCode])
REFERENCES [dbo].[Support_AppChannel] ([ChannelCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AppVersion_Support_AppChannel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AppVersion]'))
ALTER TABLE [dbo].[Support_AppVersion] CHECK CONSTRAINT [FK_Support_AppVersion_Support_AppChannel]
GO
/****** Object:  ForeignKey [FK_Support_AreaCity_Support_AreaProvince]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AreaCity_Support_AreaProvince]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
ALTER TABLE [dbo].[Support_AreaCity]  WITH CHECK ADD  CONSTRAINT [FK_Support_AreaCity_Support_AreaProvince] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Support_AreaProvince] ([ProvinceId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AreaCity_Support_AreaProvince]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCity]'))
ALTER TABLE [dbo].[Support_AreaCity] CHECK CONSTRAINT [FK_Support_AreaCity_Support_AreaProvince]
GO
/****** Object:  ForeignKey [FK_Support_AreaCounty_Support_AreaCity]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AreaCounty_Support_AreaCity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
ALTER TABLE [dbo].[Support_AreaCounty]  WITH CHECK ADD  CONSTRAINT [FK_Support_AreaCounty_Support_AreaCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[Support_AreaCity] ([CityId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AreaCounty_Support_AreaCity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaCounty]'))
ALTER TABLE [dbo].[Support_AreaCounty] CHECK CONSTRAINT [FK_Support_AreaCounty_Support_AreaCity]
GO
/****** Object:  ForeignKey [FK_Support_AreaTowns_Support_AreaCounty]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AreaTowns_Support_AreaCounty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
ALTER TABLE [dbo].[Support_AreaTowns]  WITH CHECK ADD  CONSTRAINT [FK_Support_AreaTowns_Support_AreaCounty] FOREIGN KEY([CountyId])
REFERENCES [dbo].[Support_AreaCounty] ([CountyId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_AreaTowns_Support_AreaCounty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_AreaTowns]'))
ALTER TABLE [dbo].[Support_AreaTowns] CHECK CONSTRAINT [FK_Support_AreaTowns_Support_AreaCounty]
GO
/****** Object:  ForeignKey [FK_Support_InterestWord_Support_InterestType]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_InterestWord_Support_InterestType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
ALTER TABLE [dbo].[Support_InterestWord]  WITH CHECK ADD  CONSTRAINT [FK_Support_InterestWord_Support_InterestType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Support_InterestType] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Support_InterestWord_Support_InterestType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Support_InterestWord]'))
ALTER TABLE [dbo].[Support_InterestWord] CHECK CONSTRAINT [FK_Support_InterestWord_Support_InterestType]
GO
/****** Object:  ForeignKey [FK_User_AppOptions_User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_AppOptions_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
ALTER TABLE [dbo].[User_AppOptions]  WITH CHECK ADD  CONSTRAINT [FK_User_AppOptions_User_UserBase] FOREIGN KEY([UserId])
REFERENCES [dbo].[User_UserBase] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_AppOptions_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_AppOptions]'))
ALTER TABLE [dbo].[User_AppOptions] CHECK CONSTRAINT [FK_User_AppOptions_User_UserBase]
GO
/****** Object:  ForeignKey [FK_User_UserCoords_User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserCoords_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserCoords]'))
ALTER TABLE [dbo].[User_UserCoords]  WITH CHECK ADD  CONSTRAINT [FK_User_UserCoords_User_UserBase] FOREIGN KEY([UserId])
REFERENCES [dbo].[User_UserBase] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserCoords_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserCoords]'))
ALTER TABLE [dbo].[User_UserCoords] CHECK CONSTRAINT [FK_User_UserCoords_User_UserBase]
GO
/****** Object:  ForeignKey [FK_User_UserExt_User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserExt_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
ALTER TABLE [dbo].[User_UserExt]  WITH CHECK ADD  CONSTRAINT [FK_User_UserExt_User_UserBase] FOREIGN KEY([UserId])
REFERENCES [dbo].[User_UserBase] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserExt_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserExt]'))
ALTER TABLE [dbo].[User_UserExt] CHECK CONSTRAINT [FK_User_UserExt_User_UserBase]
GO
/****** Object:  ForeignKey [FK_User_UserInfo_User_UserBase]    Script Date: 07/20/2017 15:46:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserInfo_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
ALTER TABLE [dbo].[User_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_User_UserInfo_User_UserBase] FOREIGN KEY([UserId])
REFERENCES [dbo].[User_UserBase] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserInfo_User_UserBase]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_UserInfo]'))
ALTER TABLE [dbo].[User_UserInfo] CHECK CONSTRAINT [FK_User_UserInfo_User_UserBase]
GO
