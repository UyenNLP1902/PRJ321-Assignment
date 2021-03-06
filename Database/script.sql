USE [master]
GO
/****** Object:  Database [SE1401]    Script Date: 3/21/2020 4:49:53 PM ******/
CREATE DATABASE [SE1401]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SE1401', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\SE1401.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SE1401_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\SE1401_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SE1401] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE1401].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE1401] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE1401] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE1401] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE1401] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE1401] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE1401] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE1401] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE1401] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE1401] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE1401] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE1401] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE1401] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE1401] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE1401] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE1401] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE1401] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE1401] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE1401] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE1401] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE1401] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE1401] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE1401] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE1401] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SE1401] SET  MULTI_USER 
GO
ALTER DATABASE [SE1401] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE1401] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE1401] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE1401] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SE1401] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SE1401] SET QUERY_STORE = OFF
GO
USE [SE1401]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 3/21/2020 4:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[quantity] [int] NULL,
	[customer] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistration]    Script Date: 3/21/2020 4:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistration](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NULL,
	[lastname] [nvarchar](250) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_tblRegistration] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCart] ON 

INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (1, N'Servlet', 2, N'v')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (2, N'JSP', 1, N'v')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (5, N'Servlet', 4, N'A')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (6, N'Servlet', 1, N'R')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (7, N'Java', 1, N'R')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (8, N'Servlet', 1, N's')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (9, N'Servlet', 3, N's')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (10, N'Servlet', 1, N's')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (11, N'JSP', 2, N'pos')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (12, N'EL', 1, N'pos')
INSERT [dbo].[tblCart] ([id], [title], [quantity], [customer]) VALUES (13, N'Servlet', 1, N's')
SET IDENTITY_INSERT [dbo].[tblCart] OFF
INSERT [dbo].[tblRegistration] ([username], [password], [lastname], [isAdmin]) VALUES (N'aaaaaa', N'eeeeee', N'ee', 0)
INSERT [dbo].[tblRegistration] ([username], [password], [lastname], [isAdmin]) VALUES (N'aaaaaab', N'aaabbb', N'aaaaaa', 0)
INSERT [dbo].[tblRegistration] ([username], [password], [lastname], [isAdmin]) VALUES (N'admin', N'admin', N'admin', 1)
INSERT [dbo].[tblRegistration] ([username], [password], [lastname], [isAdmin]) VALUES (N'nguyen', N'nguyen', N'haa', 0)
INSERT [dbo].[tblRegistration] ([username], [password], [lastname], [isAdmin]) VALUES (N'u', N'u', N'u', 1)
INSERT [dbo].[tblRegistration] ([username], [password], [lastname], [isAdmin]) VALUES (N'user', N'user', N'user', 0)
USE [master]
GO
ALTER DATABASE [SE1401] SET  READ_WRITE 
GO
