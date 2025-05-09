/****** Object:  Table [dbo].[AlertaStock]    Script Date: 29/04/2025 12:58:45 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 29/04/2025 12:58:45 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 29/04/2025 12:58:45 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 29/04/2025 12:58:45 ******/
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
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 29/04/2025 12:58:45 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 29/04/2025 12:58:45 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/04/2025 12:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Imagen] [nvarchar](255) NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](255) NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdTienda] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (1, 1, 1, CAST(N'2025-01-03T09:00:00.000' AS DateTime), N'Hacer pedido de Laptop DELL', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (2, 2, 2, CAST(N'2025-02-03T10:00:00.000' AS DateTime), N'Hacer pedido de Monitor ACER', N'Resuelto')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (3, 3, 3, CAST(N'2025-03-03T11:00:00.000' AS DateTime), N'Hacer pedido de Teclado LOGITECH', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (4, 4, 4, CAST(N'2025-04-03T13:00:00.000' AS DateTime), N'Hacer pedido de Impresora HP', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (5, 5, 5, CAST(N'2025-05-03T14:00:00.000' AS DateTime), N'Hacer pedido de Raton Razer', N'Resuelto')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (7, 21, 7, CAST(N'2025-04-02T19:18:00.000' AS DateTime), N'tata', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (8, 5767654, 7, CAST(N'2025-03-31T20:19:00.000' AS DateTime), N'eeee', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (9, 23, 7, CAST(N'2025-05-14T18:41:00.000' AS DateTime), N'ervrev', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (10, 432, 7, CAST(N'2025-05-22T15:04:00.000' AS DateTime), N'cucu', N'Resuelto')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (11, 23, 7, CAST(N'2025-05-09T02:20:00.000' AS DateTime), N'chumino', N'Pendiente')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (12, 96, 7, CAST(N'2025-05-10T02:44:00.000' AS DateTime), N'vfrevvrfv', N'Resuelto')
INSERT [dbo].[AlertaStock] ([Id], [IdProducto], [IdTienda], [FechaAlerta], [Descripcion], [Estado]) VALUES (13, 345345, 7, CAST(N'2025-06-20T09:22:00.000' AS DateTime), N'aaa prueba', N'Pendiente')
GO
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (1, CAST(N'2025-01-03T10:00:00.000' AS DateTime), 1, 1, 2, CAST(1200.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (2, CAST(N'2025-02-03T11:00:00.000' AS DateTime), 2, 2, 1, CAST(180.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (3, CAST(N'2025-03-03T12:00:00.000' AS DateTime), 3, 3, 3, CAST(70.00 AS Decimal(10, 2)), CAST(210.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (4, CAST(N'2025-04-03T14:00:00.000' AS DateTime), 4, 4, 1, CAST(250.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (5, CAST(N'2025-05-03T15:00:00.000' AS DateTime), 5, 5, 5, CAST(60.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (12, CAST(N'2025-06-01T02:28:00.000' AS DateTime), 96, 7, 2, CAST(198.00 AS Decimal(10, 2)), CAST(396.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (23, CAST(N'2025-01-03T10:00:00.000' AS DateTime), 21, 7, 2, CAST(4.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (27, CAST(N'2025-05-15T02:45:00.000' AS DateTime), 5675, 7, 2, CAST(3.90 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (87, CAST(N'2025-02-03T11:00:00.000' AS DateTime), 96, 7, 2, CAST(198.00 AS Decimal(10, 2)), CAST(396.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (224, CAST(N'2024-02-05T17:35:00.000' AS DateTime), 23, 7, 4, CAST(2.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (343, CAST(N'2025-04-19T17:50:00.000' AS DateTime), 23, 7, 5, CAST(4.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (543, CAST(N'2025-04-30T20:14:00.000' AS DateTime), 96, 7, 2, CAST(198.00 AS Decimal(10, 2)), CAST(396.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (544, CAST(N'2025-04-24T00:00:00.000' AS DateTime), 21, 7, 2, CAST(4.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (1214, CAST(N'2025-05-03T18:05:00.000' AS DateTime), 96, 7, 2, CAST(198.00 AS Decimal(10, 2)), CAST(396.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (6676, CAST(N'2025-04-24T18:06:00.000' AS DateTime), 5654, 7, 2, CAST(24.00 AS Decimal(10, 2)), CAST(48.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [Fecha], [IdProducto], [IdTienda], [Cantidad], [Precio], [PrecioTotalVenta]) VALUES (6877, CAST(N'2025-05-01T15:05:00.000' AS DateTime), 2345, 7, 65, CAST(43.00 AS Decimal(10, 2)), CAST(2795.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (1, 1, 1, 1, CAST(N'2025-01-03T09:00:00.000' AS DateTime), CAST(N'2025-10-03T10:00:00.000' AS DateTime), N'Pendiente', 20, CAST(1200.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (2, 2, 2, 2, CAST(N'2025-02-03T10:00:00.000' AS DateTime), CAST(N'2025-12-03T11:00:00.000' AS DateTime), N'En proceso', 50, CAST(180.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (3, 3, 3, 3, CAST(N'2025-03-03T11:00:00.000' AS DateTime), CAST(N'2025-04-03T12:00:00.000' AS DateTime), N'Enviado', 100, CAST(70.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (4, 4, 4, 4, CAST(N'2025-04-03T13:00:00.000' AS DateTime), CAST(N'2025-05-03T14:00:00.000' AS DateTime), N'Entregado', 10, CAST(250.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (5, 5, 5, 5, CAST(N'2025-05-03T14:00:00.000' AS DateTime), CAST(N'2025-06-03T15:00:00.000' AS DateTime), N'Pendiente', 30, CAST(60.00 AS Decimal(10, 2)), CAST(1800.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (6, 3, 7, 21, CAST(N'2025-04-28T02:35:26.867' AS DateTime), CAST(N'2025-05-05T02:35:26.867' AS DateTime), N'Enviado', 2, CAST(4.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (198, 2, 7, 5767654, CAST(N'2025-04-15T20:14:04.583' AS DateTime), CAST(N'2025-04-22T20:14:04.583' AS DateTime), N'En proceso', 76, CAST(32.00 AS Decimal(10, 2)), CAST(2432.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (433, 2, 7, 5767654, CAST(N'2025-03-29T00:06:00.000' AS DateTime), CAST(N'2025-04-05T00:06:00.000' AS DateTime), N'Pendiente', 23, CAST(32.00 AS Decimal(10, 2)), CAST(736.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (999, 1, 7, 432, CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27T00:00:00.000' AS DateTime), N'Entregado', 10, CAST(15.99 AS Decimal(10, 2)), CAST(159.90 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (6543, 1, 7, 432, CAST(N'2025-04-27T15:04:26.963' AS DateTime), CAST(N'2025-05-04T15:04:26.963' AS DateTime), N'Entregado', 56, CAST(32.00 AS Decimal(10, 2)), CAST(1792.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (8745, 3, 7, 21, CAST(N'2025-04-28T09:35:11.920' AS DateTime), CAST(N'2025-05-05T09:35:11.920' AS DateTime), N'Pendiente', 56, CAST(4.00 AS Decimal(10, 2)), CAST(224.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (23678, 9, 7, 345345, CAST(N'2025-04-29T07:23:04.587' AS DateTime), CAST(N'2025-05-06T07:23:04.587' AS DateTime), N'Pendiente', 5, CAST(9.99 AS Decimal(10, 2)), CAST(49.95 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (53253, 3, 7, 21, CAST(N'2025-04-15T20:13:39.267' AS DateTime), CAST(N'2025-04-22T20:13:39.267' AS DateTime), N'Pendiente', 6, CAST(4.00 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (89894, 5, 7, 21, CAST(N'2025-04-05T00:00:00.000' AS DateTime), CAST(N'2025-05-03T00:00:00.000' AS DateTime), N'Pendiente', 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (232425, 3, 7, 21, CAST(N'2025-03-28T00:14:23.707' AS DateTime), CAST(N'2025-04-04T00:14:23.707' AS DateTime), N'En proceso', 23, CAST(4.00 AS Decimal(10, 2)), CAST(92.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (344332, 3, 7, 21, CAST(N'2025-04-01T19:10:00.000' AS DateTime), CAST(N'2025-04-08T19:10:00.000' AS DateTime), N'Enviado', 4, CAST(4.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([Id], [IdProveedor], [IdTienda], [IdProducto], [FechaPedido], [FechaEntrega], [Estado], [Cantidad], [Precio], [PrecioTotalPedido]) VALUES (34532234, 3, 7, 21, CAST(N'2025-04-28T02:44:37.307' AS DateTime), CAST(N'2025-05-05T02:44:37.307' AS DateTime), N'Pendiente', 45546, CAST(4.00 AS Decimal(10, 2)), CAST(182184.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (1, N'Laptop Dell XPS 13', N'Laptop ultradelgada, 16GB RAM, 512GB SSD', 50, CAST(1200.00 AS Decimal(10, 2)), N'laptop_dell_xps13.jpg', N'Dell', N'XPS 13', 1, 1, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (2, N'Monitor Acer 24" LED', N'Monitor Full HD, 75Hz, 1ms', 150, CAST(180.00 AS Decimal(10, 2)), N'monitor_acer_24.jpg', N'Acer', N'KG241Y', 2, 2, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (3, N'Teclado Mecánico Logitech', N'Teclado RGB, switches mecánicos', 200, CAST(70.00 AS Decimal(10, 2)), N'teclado_logitech.jpg', N'Logitech', N'G Pro X', 3, 3, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (4, N'Impresora HP LaserJet', N'Impresora láser, monocromática', 75, CAST(250.00 AS Decimal(10, 2)), N'impresora_hp_laserjet.jpg', N'HP', N'LaserJet M203', 5, 4, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (5, N'Ratón Razer DeathAdder', N'Ratón ergonómico RGB, 16,000 DPI', 100, CAST(60.00 AS Decimal(10, 2)), N'raton_razer_deathadder.jpg', N'Razer', N'DeathAdder V2', 3, 5, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (12, N'Ratón óptico Exon', N'aaaa', 12, CAST(12.98 AS Decimal(10, 2)), N'raton1.jpg', N'Exon', N'V30 5000', 1, 6, 0)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (21, N'sdcdsac', N'sdcdasc', 100, CAST(4.00 AS Decimal(10, 2)), N'Ordenador1.jpg', N'wdwsdcsd', N'sdscw', 3, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (23, N'Ratón óptico Exone', N'aaaaa', 34, CAST(12.98 AS Decimal(10, 2)), N'raton1.jpg', N'Exon', N'V30 5000', 1, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (65, N'vfdvdfv', N'dfvdfscdsc', 15, CAST(19.25 AS Decimal(10, 2)), N'ordendor2.jpg', N'wedwedw', N'dwwdewd', 2, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (90, N'con blob storage', N'vevevce', 6, CAST(34.99 AS Decimal(10, 2)), N'5a886cdb-ae92-4204-8768-f6dd0f5a57bd.jpg', N'rvrvr', N'efr3v3', 9, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (96, N'Smart Watch', N'wcwcwcwc', 7, CAST(198.00 AS Decimal(10, 2)), N'reloj.jpg', N'Apple', N'V532', 5, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (98, N'vfdvdf', N'dvdfvc', 32, CAST(2.00 AS Decimal(10, 2)), N'florAmarilla.jpeg', N'dcdc', N'sdcszc', 4, 7, 0)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (432, N'fvdfv', N'regfrewfew', 2, CAST(32.00 AS Decimal(10, 2)), N'cpu1.jpg', N'erferf', N'efef', 1, 7, 0)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (688, N'dscde', N'efccdec', 6, CAST(6.98 AS Decimal(10, 2)), N'ChatGPT Image 15 abr 2025, 18_43_24.png', N'dwcwc', N'edcce', 6, 7, 0)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (899, N'bgrbrf', N'gfrgrgr', 9, CAST(1.99 AS Decimal(10, 2)), NULL, N'carola', N'rge', 1, 1, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (999, N'erveveev', N'evvee', 8, CAST(9.88 AS Decimal(10, 2)), NULL, N'vevef', N'efrefe', 5, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (2345, N'sdcsacas', N'advssavasv', 65, CAST(43.00 AS Decimal(10, 2)), N'florRoja.jpg', N'bbfvsve', N'frerfewferw', 2, 7, 0)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (5654, N'rhtbhtrdgb', N'fgttregerf', 20, CAST(24.00 AS Decimal(10, 2)), N'altavoces1.jpg', N'd f svfvefv', N'evrvrverv', 5, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (5675, N'rvgrfvdgvr', N'gfbvgvgf', 522, CAST(3.90 AS Decimal(10, 2)), NULL, N'gerfvre', N'erfcefcc', 3, 7, 0)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (221312, N'ewvefvewv', N'vewvvv', 3, CAST(2.98 AS Decimal(10, 2)), NULL, N'dcec', N'evewc', 5, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (345345, N'producto de prueba', N'rwgregre', 5, CAST(9.99 AS Decimal(10, 2)), N'74fe1173-9796-4e72-9e00-308b283c6ac5.jpg', N'rferf', N'fr3f3f', 9, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (3333333, N'yupii funciona', N'vewferfw', 67, CAST(67.99 AS Decimal(10, 2)), N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/7c8e9deb-86d5-434d-aec2-50060b6f4b58.jpg', N'ceewev', N'erwvewvev', 10, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (5767654, N'rgrtgregergerg', N'rfr4rf43f', 4, CAST(32.00 AS Decimal(10, 2)), N'ordenador3.jpg', N'fgbdfvdr', N'vgefer', 2, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (55555555, N'gvrevev', N'vtgrfvev', 8, CAST(9.00 AS Decimal(10, 2)), N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/ba664cd7-4520-468f-aa39-e4cdc4ea6ec3.jpg', N'fveverwv', N'ecewr', 4, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (66555555, N'cucu', N'ereggr', 8, CAST(8.00 AS Decimal(10, 2)), N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/3072f12b-eced-43df-af23-fb91c9507d8d.jpg', N'rbrbve', N'rvfrvve', 10, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (88876666, N'carolinchiiiii', N'rvevevr', 4, CAST(4.99 AS Decimal(10, 2)), N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/c6f18788-b3fc-44a1-973c-9c9ca1506aee.png', N'fveve', N'erfc3r', 5, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (543452534, N'evrervev', N'rvr3v3rrv', 6, CAST(6.00 AS Decimal(10, 2)), N'a19759e3-b428-4b06-8426-05a4807a428a.jpg', N'vrgvrev', N'vtfrevf', 8, 7, 1)
INSERT [dbo].[Producto] ([Id], [Nombre], [Descripcion], [Stock], [Precio], [Imagen], [Marca], [Modelo], [IdProveedor], [IdTienda], [Estado]) VALUES (827343111, N'funciona el blob con contenedor', N'huvuyvuyvy', 7, CAST(7.00 AS Decimal(10, 2)), N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/ba89fc71-13fc-496d-a90c-6671b99c88c3.png', N'vfd gf ', N'rtvrv', 4, 7, 1)
GO
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (1, N'', N'', N'', N'')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (2, N'Proveedor Monitores', N'933456789', N'monitorprovider@correo.com', N'Avenida Diagonal, 200, Barcelona')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (3, N'Proveedor Teclados', N'913456789', N'keyboardprovider@correo.com', N'Calle del Sol, 55, Madrid')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (4, N'Proveedor Software', N'952345678', N'softwareprovider@correo.com', N'Calle de la Constitución, 500, Málaga')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (5, N'Proveedor Impresoras', N'951234567', N'printerprovider@correo.com', N'Avenida de las Cortes, 800, Sevilla')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (6, N'rtrthtrhtr', N'5564546547', N'logitech@gmail.com', N'Cordoba')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (7, N'fvev', N'658054050', N'aaa@gmail.com', N'Cuenca')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (8, N'Distribuciones carolonchi', N'555-123456', N'contacto@acme.com', N'Av. Principal 123')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (9, N'fvewvwrv', N'2131311', N'carol@gmail.com', N'Mojacar')
INSERT [dbo].[Proveedor] ([Id], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (10, N'Distribuciones pepe', N'658054050', N'pepe@gamil.com', N'Cordoba')
GO
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (1, N'', N'', N'', N'')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (2, N'Informatica B', N'Avenida Diagonal, 605, Barcelona', N'tiendainformaticaB@correo.com', N'contrasena456')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (3, N'Informatica C', N'Calle de Fuencarral, 123, Madrid', N'tiendainformaticaC@correo.com', N'contrasena789')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (4, N'Informatica D', N'Calle de Alcalá, 85, Madrid', N'tiendainformaticaD@correo.com', N'contrasena101')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (5, N'Informatica E', N'Avenida de la Constitución, 150, Sevilla', N'tiendainformaticaE@correo.com', N'contrasena202')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (6, N'carolina', N'Calle maria moliner, Rivas Vaciamadrid', N'carolina@gmail.com', N'$2a$11$54BGh/fFuwE2Mu5YtjF/QOEVv6veiL6BeGQMD55W3gp7FNp1HGDqi')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (7, N'nuria', N'Calle maria moliner, Rivas Vaciamadrid', N'nuria@gmail.com', N'$2a$11$zzXmhgkOdsYbrzmn1G.gheYzOQzN//saEqmP4WZV0E6YdK6SOYml.')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (8, N'tienda Roberto', N'Calle santa ana Huete', N'tiendaroberto@gmail.com', N'$2a$11$XdqlOa5mxgQeYtMKz.wC3uYwIRNsK5eXaGcz/d0mPmQv52Dl4u2QS')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (9, N'vdvds', N'scdscs', N'cscds@gmail.com', N'$2a$11$Rdf5JbcLX.HbsLtatyszYec2Aj6X1xc0BOz0Rvy6RbqQfNvjePAd.')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (10, N'carolinchi', N'Sevilla', N'carolinchi@gmail.com', N'$2a$11$LrO1KRVTFvighr5wzHyOxe5LXaHcncWia1w5XFZiFSTWVyWn1.BcW')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (11, N'pepe', N'Cuenca', N'aaaa@gmail.com', N'$2a$11$bZHmiCSedtH8rGGkRXULqOguoK4Hu.xkiK8j6qt53nHW9zHVLu9zu')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (12, N'aaaaaaaa', N'Toledo', N'uuuuuuu@gmail.com', N'$2a$11$Q8mw2KJrSNs8Cf6qDjbWzegv3kNwoSCGoW58Hc1vPokMb7PR.jES.')
INSERT [dbo].[Tienda] ([Id], [Nombre], [Direccion], [Correo], [Contraseña]) VALUES (13, N'vvrerv', N'Cazorla', N'pedo@gmail.com', N'$2a$11$yMwRKAN8Ksz4EPeKlpspfeVuQkuH8z9mp7/xU/H9VbFIKrS1j979q')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (1, N'Ana González', N'ana.jpg', N'ana@example.com', N'1234', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (2, N'Carlos Ramírez', N'carlos.jpg', N'carlos@example.com', N'1234', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (3, N'Lucía Méndez', N'lucia.jpg', N'lucia@example.com', N'1234', N'Trabajador', 0, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (4, N'Mario Torres', N'', N'mario@example.com', N'1234', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (5, N'Elena Rojas', N'', N'elena@example.com', N'1234', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (222, N'limon', N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/85bd1bdc-2640-4a53-ab4f-adae05befd72.png', N'limon@gmail.com', N'$2a$11$AYA92i.JKWAKOHjjNTz.6.L9K1kqHADSrgKA8m41h7lGNjswE/7Di', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (999, N'alfredoooooooooo', NULL, N'alfredo@gmail.com', N'$2a$11$ek6hcp51OTJxrgr2AADT9ufJ1gP6LIuUG0r94wb9TAMEN3vt4dqnu', N'Jefe', 1, 1)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (1111, N'agua', N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/2d397be7-c77b-4b2b-87a2-86f087edefdb.png', N'agua@gmail.com', N'$2a$11$969G/m1WRa3.EYyeUrT3Vu7pLx5rRabcN6dxBvfjdik.dLUILYXwu', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (3333, N'raton', NULL, N'raton@gmail.com', N'$2a$11$w0sKQ0UyAJh0u/TOQBHF.uoBzHoWV25aW4ecaZ1sU6ZDedp/NTGiG', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (3434, N'fvfve', NULL, N'efvevve@sss', N'$2a$11$Ad7wvfDUtgXyZY2q7yI82e1bj2I4sQ71yeuF808pSx1tu6OFuROS.', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (4554, N'ghnghngh', N'74fe1173-9796-4e72-9e00-308b283c6ac5.jpg', N'deve@gmail.com', N'$2a$11$GAoLSugxcz75RlOpwrwUBedMS3vYJBShVk8UHZ4aHIYG8GizVIHuW', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (12324, N'carolina', N'Imagen de WhatsApp 2024-05-10 a las 12.48.49_44125152.jpg', N'carolina@gmail.com', N'$2a$11$lj/kMvqFBZA6wac7YCwkE.FwTs2xFw1pgJppKix0SCY2OBO9aNhka', N'Trabajador', 0, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (42342, N'evevev', NULL, N'veveve', N'$2a$11$WFAvvW.NJ8cqSbLIayWuY.iAmM1XERuoUJOsBsefXhipLjdR2iXXm', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (65654, N'ervervrev', N'IMG_20230412_145316.jpg', N'aaa@gmail.com', N'$2a$11$I.xAIInO5vk.6PjJupVonOrBLfwGcczTaWYhxXHHTl915CpjOkz56', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (66666, N'altavoz', N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/c2b0806d-43ad-4da3-9d4a-b93bb2c98312.jpg', N'altavoz@gmail.com', N'$2a$11$AdaVL5JpHsSqwpvmFDVIT.rYfSEA3S2T/oMYoNVxm7eRSkKGdcXby', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (444444, N'lechuga', N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/31384805-c465-49ad-bf2c-cb833abae464.jpg', N'lechuga@gmail.com', N'$2a$11$.FwYBS4Zb6CBpBDsctZfJugSQgPzifYjRlF3rbcJc5OkCJgQi6q7W', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (888888, N'pepino', N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/72ecb264-ce3c-4a70-88fc-a9015396ab4c.jpg', N'pepino@gmail.com', N'$2a$11$NVZ/QVTIu3QrARQyFsX3EOib3/LbRs1ElSk9MJmprGxdouC58wXPm', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (1312323, N'eveve', N'ChatGPT Image 15 abr 2025, 18_43_24.png', N'cvecew', N'$2a$11$2XTltqrVkqYCo5d8D9isn.HO7GiGCOHh0UO8OplNsY/nM8Ytv8CY6', N'Trabajador', 0, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (3242342, N'fvfrvev', N'74fe1173-9796-4e72-9e00-308b283c6ac5.jpg', N'aaaamidowdi@gmail.com', N'$2a$11$7AM9bhhnuZwMMhgGrFdjretqHbLLYVTrO8m9Vt8w4O7SuzYIBwQBi', N'Trabajador', 0, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (3243223, N'grtgr', N'Captura de pantalla 2024-01-14 171828.png', N'bregre', N'$2a$11$eT3OWEznUueVSQeyyNHAmORFnkahsmrRBmdCVxSoF8yH0SnfDj3eO', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (4432342, N'ubiueivu', NULL, N'ewcewv', N'$2a$11$1dbVKxobEuUoBMtEr5r1COXYAo.ZxYSnvjFkYPFS1v5BwV4GIDZ7u', N'Jefe', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (8867786, N'lucia', NULL, N'lucia@gmail.com', N'$2a$11$BIAiQCndbMF0g3rQ1189.OTlV5J509qE.sncaoVKii7j52hPAyrPS', N'Trabajador', 1, 7)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Imagen], [Correo], [Contraseña], [Rol], [Estado], [IdTienda]) VALUES (873723458, N'juanjo', N'https://storagealmacencpc.blob.core.windows.net/imagenes-productos/58e77ab4-ceda-41eb-8f88-6258119f5ed0.png', N'juanjo@gmail.com', N'$2a$11$bSWNNlhAvF3UkF1VhAfG2O5VRzdapGL4rfdl8sXeMMBkyPUGLhjBW', N'Jefe', 1, 7)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Proveedo__60695A19318D91AD]    Script Date: 29/04/2025 12:58:45 ******/
ALTER TABLE [dbo].[Proveedor] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tienda__60695A19E652ABB3]    Script Date: 29/04/2025 12:58:45 ******/
ALTER TABLE [dbo].[Tienda] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__60695A19E4907C25]    Script Date: 29/04/2025 12:58:45 ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Estado]
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
