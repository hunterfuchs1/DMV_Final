USE [master]
GO
/****** Object:  Database [DMV_DB]    Script Date: 5/12/2022 11:00:01 PM ******/
CREATE DATABASE [DMV_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMV_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMV_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DMV_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMV_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMV_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMV_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMV_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMV_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMV_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMV_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMV_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMV_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMV_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMV_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMV_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMV_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMV_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMV_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMV_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMV_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMV_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMV_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMV_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMV_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMV_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMV_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMV_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [DMV_DB] SET  MULTI_USER 
GO
ALTER DATABASE [DMV_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMV_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMV_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMV_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMV_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DMV_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMV_DB', N'ON'
GO
ALTER DATABASE [DMV_DB] SET QUERY_STORE = OFF
GO
USE [DMV_DB]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 5/12/2022 11:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[driverID] [varchar](10) NOT NULL,
	[firstName] [varchar](10) NOT NULL,
	[lastName] [varchar](10) NOT NULL,
	[socialSecurity] [int] NOT NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[driverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driverVehicle]    Script Date: 5/12/2022 11:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driverVehicle](
	[driverID] [varchar](10) NOT NULL,
	[vehicleID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_driverVehicle] PRIMARY KEY CLUSTERED 
(
	[driverID] ASC,
	[vehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/12/2022 11:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](10) NOT NULL,
	[firstName] [varchar](30) NOT NULL,
	[lastName] [varchar](30) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[position] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 5/12/2022 11:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[vehicleID] [varchar](10) NOT NULL,
	[make] [varchar](30) NOT NULL,
	[model] [varchar](30) NOT NULL,
	[plateNumber] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[vehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D001', N'John', N'Johnson', 123456789)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D002', N'Bob', N'Bobson', 234567899)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D003', N'Tom', N'Tomson', 345678999)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D004', N'Ron', N'Ronson', 456789999)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D005', N'Von', N'Vonson', 567899999)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D006', N'Lil', N'Baby', 123412344)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D007', N'Lil', N'Wayne', 981234098)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D008', N'Lil', N'Dirk', 123412356)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D009', N'Chief', N'Keef', 625235454)
INSERT [dbo].[Drivers] ([driverID], [firstName], [lastName], [socialSecurity]) VALUES (N'D010', N'Kendrick', N'Lamar', 912354812)
GO
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D001', N'V001')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D002', N'V002')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D003', N'V003')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D004', N'V004')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D005', N'V005')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D006', N'V006')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D007', N'V007')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D008', N'V008')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D009', N'V009')
INSERT [dbo].[driverVehicle] ([driverID], [vehicleID]) VALUES (N'D010', N'V010')
GO
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U001', N'David', N'son', N'david', N'son', N'DMV')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U002', N'Law', N'lawson', N'law', N'lawson', N'LAW')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U003', N'Tanner', N'Smith', N'tan', N'smith', N'DMV')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U004', N'Will', N'Kels', N'will', N'kels', N'DMV')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U005', N'Eric', N'Hove', N'eric', N'hove', N'LAW')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U006', N'Dillin', N'Edwards', N'dillin', N'edwards', N'LAW')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U007', N'Joseph', N'Silman', N'joe', N'silman', N'DMW')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U008', N'Kory', N'Yage', N'kory', N'yage', N'LAW')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U009', N'Fillup', N'Bonk', N'fill', N'bonk', N'DMV')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [username], [password], [position]) VALUES (N'U010', N'Yasuo', N'Doe', N'yasuo', N'doe', N'DMV')
GO
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V001', N'Poniac', N'Grand Prix', N'ABC1234')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V002', N'Chevy', N'Silverado', N'DEF1234')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V003', N'Nissan', N'Altima', N'GHI1234')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V004', N'Toyota', N'Camry', N'JKL1234')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V005', N'Audi', N'R8', N'MNO1234')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V006', N'Toyota', N'Corona', N'MDN1423')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V007', N'Honda', N'Civic', N'EYB4125')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V008', N'Chevy', N'Cruze', N'JMN5242')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V009', N'Hyundai', N'Sonata', N'QNT9192')
INSERT [dbo].[Vehicles] ([vehicleID], [make], [model], [plateNumber]) VALUES (N'V010', N'Kia', N'Soul', N'ZRD2134')
GO
ALTER TABLE [dbo].[driverVehicle]  WITH CHECK ADD  CONSTRAINT [FK_driverVehicle_Drivers1] FOREIGN KEY([driverID])
REFERENCES [dbo].[Drivers] ([driverID])
GO
ALTER TABLE [dbo].[driverVehicle] CHECK CONSTRAINT [FK_driverVehicle_Drivers1]
GO
ALTER TABLE [dbo].[driverVehicle]  WITH CHECK ADD  CONSTRAINT [FK_driverVehicle_Vehicles1] FOREIGN KEY([vehicleID])
REFERENCES [dbo].[Vehicles] ([vehicleID])
GO
ALTER TABLE [dbo].[driverVehicle] CHECK CONSTRAINT [FK_driverVehicle_Vehicles1]
GO
USE [master]
GO
ALTER DATABASE [DMV_DB] SET  READ_WRITE 
GO
