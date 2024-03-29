USE [master]
GO
/****** Object:  Database [Assignment1]    Script Date: 10/17/2019 10:03:55 AM ******/
CREATE DATABASE [Assignment1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Assignment1.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Assignment1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment1] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Assignment1]
GO
/****** Object:  Schema [production]    Script Date: 10/17/2019 10:03:55 AM ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 10/17/2019 10:03:55 AM ******/
CREATE SCHEMA [sales]
GO
/****** Object:  Table [production].[brands]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[categories]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[products]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [varchar](10) NULL,
	[list_price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[stocks]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[customer]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
	[street] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](20) NULL,
	[zip_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unique_phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[order_items]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[quantity] [int] NULL,
	[list_price] [int] NULL,
	[item_amount]  AS ([quantity]*[list_price]-[discount]),
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[orders]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [varchar](10) NOT NULL,
	[order_date] [date] NULL,
	[required_date] [date] NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[staff]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[staff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](10) NOT NULL,
	[active] [varchar](20) NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[stores]    Script Date: 10/17/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
	[street] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](20) NULL,
	[zip_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [production].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_brand] FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
GO
ALTER TABLE [production].[products] CHECK CONSTRAINT [fk_products_brand]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_category] FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
GO
ALTER TABLE [production].[products] CHECK CONSTRAINT [fk_products_category]
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD  CONSTRAINT [fk_stocks_product] FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
GO
ALTER TABLE [production].[stocks] CHECK CONSTRAINT [fk_stocks_product]
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD  CONSTRAINT [fk_stocks_store] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [production].[stocks] CHECK CONSTRAINT [fk_stocks_store]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD  CONSTRAINT [fk_order_itens_orders] FOREIGN KEY([order_id])
REFERENCES [sales].[orders] ([order_id])
GO
ALTER TABLE [sales].[order_items] CHECK CONSTRAINT [fk_order_itens_orders]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD  CONSTRAINT [fk_order_itens_product] FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
GO
ALTER TABLE [sales].[order_items] CHECK CONSTRAINT [fk_order_itens_product]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_customer] FOREIGN KEY([customer_id])
REFERENCES [sales].[customer] ([customer_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [fk_orders_customer]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_staff] FOREIGN KEY([staff_id])
REFERENCES [sales].[staff] ([staff_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [fk_orders_staff]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_store] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [fk_orders_store]
GO
ALTER TABLE [sales].[staff]  WITH CHECK ADD  CONSTRAINT [fk_staffs_stores] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [sales].[staff] CHECK CONSTRAINT [fk_staffs_stores]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD CHECK  (([list_price]>(0)))
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Assignment1] SET  READ_WRITE 
GO
