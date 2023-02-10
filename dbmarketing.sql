USE [master]
GO
/****** Object:  Database [dbmarketing]    Script Date: 10/2/2023 3:33:11 PM ******/
CREATE DATABASE [dbmarketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbmarketing', FILENAME = N'C:\Users\tywon\dbmarketing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbmarketing_log', FILENAME = N'C:\Users\tywon\dbmarketing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbmarketing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbmarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbmarketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbmarketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbmarketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbmarketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbmarketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbmarketing] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbmarketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbmarketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbmarketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbmarketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbmarketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbmarketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbmarketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbmarketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbmarketing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbmarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbmarketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbmarketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbmarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbmarketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbmarketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbmarketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbmarketing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbmarketing] SET  MULTI_USER 
GO
ALTER DATABASE [dbmarketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbmarketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbmarketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbmarketing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbmarketing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbmarketing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbmarketing] SET QUERY_STORE = OFF
GO
USE [dbmarketing]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 10/2/2023 3:33:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_username] [nvarchar](50) NOT NULL,
	[ad_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ad_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 10/2/2023 3:33:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_image] [nvarchar](max) NOT NULL,
	[cat_fk_ad] [int] NULL,
	[cat_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cat_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 10/2/2023 3:33:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[pro_image] [nvarchar](max) NOT NULL,
	[pro_des] [nvarchar](max) NOT NULL,
	[pro_price] [int] NULL,
	[pro_fk_cat] [int] NULL,
	[pro_fk_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[pro_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 10/2/2023 3:33:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](50) NOT NULL,
	[u_email] [nvarchar](50) NOT NULL,
	[u_password] [nvarchar](50) NOT NULL,
	[u_image] [nvarchar](max) NOT NULL,
	[u_contact] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[u_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[u_contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_category]  WITH CHECK ADD FOREIGN KEY([cat_fk_ad])
REFERENCES [dbo].[tbl_admin] ([ad_id])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([pro_fk_cat])
REFERENCES [dbo].[tbl_category] ([cat_id])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([pro_fk_user])
REFERENCES [dbo].[tbl_user] ([u_id])
GO
USE [master]
GO
ALTER DATABASE [dbmarketing] SET  READ_WRITE 
GO
