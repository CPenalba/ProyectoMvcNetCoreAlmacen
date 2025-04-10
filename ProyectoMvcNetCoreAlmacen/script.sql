USE [master]
GO
/****** Object:  Database [ALMACEN]    Script Date: 14/03/2025 9:40:35 ******/
CREATE DATABASE [ALMACEN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ALMACEN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ALMACEN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ALMACEN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ALMACEN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ALMACEN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ALMACEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ALMACEN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ALMACEN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ALMACEN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ALMACEN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ALMACEN] SET ARITHABORT OFF 
GO
ALTER DATABASE [ALMACEN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ALMACEN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ALMACEN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ALMACEN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ALMACEN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ALMACEN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ALMACEN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ALMACEN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ALMACEN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ALMACEN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ALMACEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ALMACEN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ALMACEN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ALMACEN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ALMACEN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ALMACEN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ALMACEN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ALMACEN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ALMACEN] SET  MULTI_USER 
GO
ALTER DATABASE [ALMACEN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ALMACEN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ALMACEN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ALMACEN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ALMACEN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ALMACEN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ALMACEN] SET QUERY_STORE = ON
GO
ALTER DATABASE [ALMACEN] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ALMACEN]
GO
/****** Object:  Table [dbo].[AlertaStock]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertaStock](
	[Id] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[FechaAlerta] [datetime] NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[Id] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[IdProducto] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[PrecioTotalVenta] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[FechaPedido] [datetime] NULL,
	[FechaEntrega] [datetime] NULL,
	[Estado] [nvarchar](50) NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[PrecioTotalPedido] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Stock] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Imagen] [nvarchar](255) NULL,
	[Marca] [nvarchar](100) NOT NULL,
	[Modelo] [nvarchar](100) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/03/2025 9:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](255) NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
	[Codigo_Jefe] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (1, 1, 1, CAST(N'2025-01-03T09:00:00.000' AS DateTime), N'Hacer pedido de Laptop DELL', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (2, 2, 2, CAST(N'2025-02-03T10:00:00.000' AS DateTime), N'Hacer pedido de Monitor ACER', N'Resuelto')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (3, 3, 3, CAST(N'2025-03-03T11:00:00.000' AS DateTime), N'Hacer pedido de Teclado LOGITECH', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (4, 4, 4, CAST(N'2025-04-03T13:00:00.000' AS DateTime), N'Hacer pedido de Impresora HP', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (5, 5, 5, CAST(N'2025-05-03T14:00:00.000' AS DateTime), N'Hacer pedido de Raton Razer', N'Resuelto')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (134, 1, 1, CAST(N'2025-11-12T14:02:00.000' AS DateTime), N'Hacer pedido de teclado asus', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (876, 4545, 1, CAST(N'2025-04-03T14:02:00.000' AS DateTime), N'Hcaer pedido de carolina', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (3222, 2, 1, CAST(N'2025-04-02T15:08:00.000' AS DateTime), N'Hacer pedido de raton', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43223, 12, 1, CAST(N'2024-03-05T12:04:00.000' AS DateTime), N'Hacer pedido de teclado patata', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43224, 1, 1, CAST(N'2025-11-12T15:07:00.000' AS DateTime), N'rgttrgr', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43225, 1, 1, CAST(N'2025-03-14T18:05:00.000' AS DateTime), N'Hacer pedido de bajaa', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43226, 345, 1, CAST(N'2025-03-20T16:05:00.000' AS DateTime), N'Hacer pedido de carolininhi ', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43227, 3, 1, CAST(N'2025-03-24T14:07:00.000' AS DateTime), N'rgrtdr', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43229, 2425, 1, CAST(N'2025-03-18T17:05:00.000' AS DateTime), N'efcefefc', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43230, 243243535, 1, CAST(N'2024-06-04T05:02:00.000' AS DateTime), N'fgbgr', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43231, 4545, 1, CAST(N'2025-02-14T20:05:00.000' AS DateTime), N'ththtf', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43232, 12, 1, CAST(N'2025-02-06T14:02:00.000' AS DateTime), N'rgref', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43233, 4545, 1, CAST(N'2025-02-12T14:02:00.000' AS DateTime), N'ghnhg', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43234, 644, 1, CAST(N'2024-06-14T14:52:00.000' AS DateTime), N'cbfgbf', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43235, 243243535, 1, CAST(N'2024-04-12T14:05:00.000' AS DateTime), N'ddfvdfv', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43236, 1, 1, CAST(N'2025-05-04T04:07:00.000' AS DateTime), N'vdfvdf', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43237, 2425, 1, CAST(N'2025-08-14T14:02:00.000' AS DateTime), N'dfvcxfv', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43238, 4545, 1, CAST(N'2025-06-05T04:05:00.000' AS DateTime), N'hacer uñas', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43239, 32, 12, CAST(N'2025-03-14T14:05:00.000' AS DateTime), N'Hacer pedido de altavoces Logitech', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (43240, 876, 12, CAST(N'2025-03-20T04:08:00.000' AS DateTime), N'Hacer pedido de Portatil HP', N'Pendiente')
GO
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (1, CAST(N'2025-01-03T10:00:00.000' AS DateTime), 1, 1, 2, CAST(1200.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (2, CAST(N'2025-02-03T11:00:00.000' AS DateTime), 2, 2, 1, CAST(180.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (3, CAST(N'2025-03-03T12:00:00.000' AS DateTime), 3, 3, 3, CAST(70.00 AS Decimal(10, 2)), CAST(210.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (4, CAST(N'2025-04-03T14:00:00.000' AS DateTime), 4, 4, 1, CAST(250.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (5, CAST(N'2025-05-03T15:00:00.000' AS DateTime), 5, 5, 5, CAST(60.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (1, 1, 1, 1, CAST(N'2025-01-03T09:00:00.000' AS DateTime), CAST(N'2025-10-03T10:00:00.000' AS DateTime), N'Pendiente', 20, CAST(1200.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (2, 2, 2, 2, CAST(N'2025-02-03T10:00:00.000' AS DateTime), CAST(N'2025-12-03T11:00:00.000' AS DateTime), N'En proceso', 50, CAST(180.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (3, 3, 3, 3, CAST(N'2025-03-03T11:00:00.000' AS DateTime), CAST(N'2025-04-03T12:00:00.000' AS DateTime), N'Enviado', 100, CAST(70.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (4, 4, 4, 4, CAST(N'2025-04-03T13:00:00.000' AS DateTime), CAST(N'2025-05-03T14:00:00.000' AS DateTime), N'Entregado', 10, CAST(250.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (5, 5, 5, 5, CAST(N'2025-05-03T14:00:00.000' AS DateTime), CAST(N'2025-06-03T15:00:00.000' AS DateTime), N'Pendiente', 30, CAST(60.00 AS Decimal(10, 2)), CAST(1800.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (27, 1, 1, 1, CAST(N'2024-05-04T15:02:00.000' AS DateTime), CAST(N'2025-05-15T14:34:00.000' AS DateTime), N'En proceso', 4, CAST(2.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (665, 1, 1, 1, CAST(N'2025-11-12T14:20:00.000' AS DateTime), CAST(N'2025-11-15T19:06:00.000' AS DateTime), N'En proceso', 4, CAST(56.00 AS Decimal(10, 2)), CAST(586.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (874, 2, 12, 876, CAST(N'2025-03-14T09:29:00.000' AS DateTime), CAST(N'2025-03-21T09:29:00.000' AS DateTime), N'Pendiente', 5, CAST(2750.14 AS Decimal(10, 2)), CAST(13750.70 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (875, 2, 1, 345, CAST(N'2025-02-10T14:02:00.000' AS DateTime), CAST(N'2025-02-17T14:02:00.000' AS DateTime), N'En proceso', 6, CAST(19.25 AS Decimal(10, 2)), CAST(115.50 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (986, 234326, 12, 32, CAST(N'2025-04-02T13:31:00.000' AS DateTime), CAST(N'2025-04-09T13:31:00.000' AS DateTime), N'Pendiente', 10, CAST(27.00 AS Decimal(10, 2)), CAST(270.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (96854, 1, 1, 1, CAST(N'2025-04-21T04:02:00.000' AS DateTime), CAST(N'2025-04-24T05:02:00.000' AS DateTime), N'En proceso', 9, CAST(8.00 AS Decimal(10, 2)), CAST(72.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (435345, 1, 1, 1, CAST(N'2025-01-14T12:54:00.000' AS DateTime), CAST(N'2025-01-19T03:55:00.000' AS DateTime), N'En proceso', 4, CAST(1200.00 AS Decimal(10, 2)), CAST(4800.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (1, N'Laptop Dell XPS 13', N'Laptop ultradelgada, 16GB RAM, 512GB SSD', 60, CAST(2.00 AS Decimal(10, 2)), N'laptop_dell_xps13.jpg', N'Dell', N'XPS 13', 1, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (2, N'bajaa', N'eeee', 26, CAST(12.98 AS Decimal(10, 2)), N'cupra.jpg', N'iiiiii', N'ooooooo', 4, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (3, N'ñoño', N'eferfer', 21, CAST(19.25 AS Decimal(10, 2)), N'florRoja.jpg', N'aaa', N'eeee', 3, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (4, N'Impresora HP LaserJet', N'Impresora láser, monocromática', 75, CAST(250.00 AS Decimal(10, 2)), N'impresora_hp_laserjet.jpg', N'HP', N'LaserJet M203', 5, 4)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (5, N'Ratón Razer DeathAdder', N'Ratón ergonómico RGB, 16,000 DPI', 100, CAST(60.00 AS Decimal(10, 2)), N'raton_razer_deathadder.jpg', N'Razer', N'DeathAdder V2', 3, 5)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (12, N'aaaa', N'eeee', 23, CAST(12.98 AS Decimal(10, 2)), N'raton1.jpg', N'iiiiii', N'ooooooo', 1, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (32, N'Altavoces Logitech', N'Ofrecen 6 vatios de potencia de cresta total y sonido estéreo nítido.', 13, CAST(27.00 AS Decimal(10, 2)), N'altavoces1.jpg', N'Logitech', N'Z150 ', 234326, 12)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (98, N'Ratón óptico Exon', N'DPI ajustable On-The-Fly: 200 DPI - 5000 DPI', 16, CAST(9.90 AS Decimal(10, 2)), N'raton1.jpg', N'Exon', N'V30 5000', 3, 12)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (345, N'ñoño', N'eferfer', 256, CAST(19.25 AS Decimal(10, 2)), N'florRoja.jpg', N'aaa', N'eeee', 2, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (644, N'caroliu', N'rfrferfer', 184, CAST(12.98 AS Decimal(10, 2)), N'bmw.jpg', N'wwdw', N'ecvevev', 5, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (695, N'fvdfv', N'dfcedfces', 5, CAST(123.00 AS Decimal(10, 2)), NULL, N'oooo', N'jjjjj', 234324, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (876, N'Portátil HP', N'Transmite contenido 4K de manera fluida y juega a tus juegos favoritos en 720p', 6, CAST(2750.14 AS Decimal(10, 2)), N'ordendor2.jpg', N'HP', N'15-fd0167ns ', 2, 12)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (2425, N'dff', N'dssccdsa', 2, CAST(12.00 AS Decimal(10, 2)), N'ordendor2.jpg', N'qwss', N'wdwdw', 2, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (4545, N'jyujy', N'jyjyj', 45, CAST(1234.00 AS Decimal(10, 2)), NULL, N'rerf', N'rgreg', 5, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (456456, N'gfhgfb', N'grtdggr', 69, CAST(69.00 AS Decimal(10, 2)), N'Fondo de informatico.png', N'gfbbv', N'ffvdfvdf', 234325, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda]) VALUES (243243535, N'egregreg', N'rgrgrg', 5444, CAST(34.00 AS Decimal(10, 2)), N'altavoces1.jpg', N'tgtrg', N'regregfrg', 4, 1)
GO
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (1, N'Proveedor CPU', N'912345678', N'cpusupplier@correo.com', N'Calle de la Tecnología, 10, Madrid')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (2, N'Proveedor Monitores', N'933456789', N'monitorprovider@correo.com', N'Avenida Diagonal, 200, Barcelona')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (3, N'Proveedor Tecladitos', N'913456789', N'keyboardprovider@correo.com', N'Calle del Sol, 55, Madrid')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (4, N'Proveedor Software', N'952345678', N'softwareprovider@correo.com', N'Calle de la Constitución, 500, Málaga')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (5, N'Proveedor Impresoras', N'951234567', N'printerprovider@correo.com', N'Avenida de las Cortes, 800, Sevilla')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (234324, N'Proveedor Carolina', N'658054050', N'carolina@gmail.com', N'Madrid')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (234325, N'dfvsdvs', N'232423', N'aaaa@gmail.com', N'Granada')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (234326, N'Proveedor Logitech', N'658458712', N'logitech@gmail.com', N'Santander')
GO
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (1, N'Informatica A', N'Calle Gran Vía, 55, Madrid', N'tiendainformaticaA@correo.com', N'1234')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (2, N'Informatica B', N'Avenida Diagonal, 605, Barcelona', N'tiendainformaticaB@correo.com', N'contrasena456')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (3, N'Informatica C', N'Calle de Fuencarral, 123, Madrid', N'tiendainformaticaC@correo.com', N'contrasena789')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (4, N'Informatica D', N'Calle de Alcalá, 85, Madrid', N'tiendainformaticaD@correo.com', N'contrasena101')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (5, N'Informatica E', N'Avenida de la Constitución, 150, Sevilla', N'tiendainformaticaE@correo.com', N'contrasena202')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (6, N'carolina', N'Calle maria moliner, Rivas Vaciamadrid', N'tiendacarolina@gmail.com', N'1234')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (7, N'aaaaaa', N'Calle maria moliner, Rivas Vaciamadrid', N'aaa@gmail.com', N'1234')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (8, N'tyhtyhyt', N'Calle maria moliner, Rivas Vaciamadrid', N'ecewcwdew@gmail.com', N'1234')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (9, N'trgergerg', N'gtregfetgftre', N'xswdwedwed@gmail.com', N'1234')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (10, N'sofiaa', N'Calle maria moliner, Rivas Vaciamadrid', N'sofia@gmail.com', N'$2a$11$c3Z1LxbdzVubnR7hhKNf2.JMKeCB3ixFKK5qaL6vKghkOC8kAL/FC')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (11, N'wefewfwe', N'fewfqewdf', N'pepe@gmail.com', N'$2a$11$wgSZsU7G5qFvqCpbQV9NO.KzJDxg.TZ2Thl14Ocn8J0Mcd/wpKNNm')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (12, N'Pc Components', N'Calle Pedro Laborde, Madrid', N'pccomponents@gmail.com', N'$2a$11$2f/Nh1nSF8Uq.W6OKl0CAuXUvomIPKsRPb10a.PoX4spXsg/kvnJ6')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Correo], [Contraseña], [Rol], [Codigo_Jefe], [IdTienda]) VALUES (1, N'José Martínez', N'jose.martinez@correo.com', N'contrasenaJose', N'Jefe', 0, 1)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Correo], [Contraseña], [Rol], [Codigo_Jefe], [IdTienda]) VALUES (2, N'Carlos López', N'carlos.lopez@correo.com', N'contrasenaCarlos', N'Trabajador', 1, 2)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Correo], [Contraseña], [Rol], [Codigo_Jefe], [IdTienda]) VALUES (3, N'Lucía Pérez', N'lucia.perez@correo.com', N'contrasenaLucia', N'Jefe', 0, 3)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Correo], [Contraseña], [Rol], [Codigo_Jefe], [IdTienda]) VALUES (4, N'Roberto Sánchez', N'roberto.sanchez@correo.com', N'contrasenaRoberto', N'Trabajador', 3, 4)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Correo], [Contraseña], [Rol], [Codigo_Jefe], [IdTienda]) VALUES (5, N'Marta Ruiz', N'marta.ruiz@correo.com', N'contrasenaMarta', N'Trabajador', 3, 5)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Proveedo__60695A19572F7029]    Script Date: 14/03/2025 9:40:35 ******/
ALTER TABLE [dbo].[Proveedor] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tienda__60695A193A7374C7]    Script Date: 14/03/2025 9:40:35 ******/
ALTER TABLE [dbo].[Tienda] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__60695A19DF971A5A]    Script Date: 14/03/2025 9:40:35 ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlertaStock] ADD  DEFAULT (getdate()) FOR [FechaAlerta]
GO
ALTER TABLE [dbo].[AlertaStock] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[DetalleVenta] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[AlertaStock]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[AlertaStock]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tienda] ([Id])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tienda] ([Id])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tienda] ([Id])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tienda] ([Id])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tienda] ([Id])
GO
ALTER TABLE [dbo].[AlertaStock]  WITH CHECK ADD CHECK  (([Estado]='Resuelto' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD CHECK  (([Precio]>(0)))
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD CHECK  (([PrecioTotalVenta]>(0)))
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD CHECK  (([Estado]='Entregado' OR [Estado]='Enviado' OR [Estado]='En proceso' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD CHECK  (([Precio]>(0)))
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD CHECK  (([PrecioTotalPedido]>(0)))
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD CHECK  (([Precio]>(0)))
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD CHECK  (([Stock]>=(0)))
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD CHECK  (([Rol]='Trabajador' OR [Rol]='Jefe'))
GO
USE [master]
GO
ALTER DATABASE [ALMACEN] SET  READ_WRITE 
GO
