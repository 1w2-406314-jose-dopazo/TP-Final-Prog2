USE [master]
GO
/****** Object:  Database [cine]    Script Date: 24/11/2023 21:14:22 ******/
CREATE DATABASE [cine]

GO
USE [cine]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] NOT NULL,
	[nom_cliente] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[ape_cliente] [varchar](50) NULL,
	[contraseña] [varchar](50) NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[id_factura] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[importe_total] [float] NULL,
 CONSTRAINT [pk_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] NOT NULL,
	[id_tipo_prod] [int] NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_facturas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_facturas](
	[id_detalle_factura] [int] NOT NULL,
	[id_factura] [int] NULL,
	[id_boleto] [int] NULL,
	[id_producto] [int] NULL,
	[id_forma_pago] [int] NULL,
	[Producto_Cant] [int] NULL,
 CONSTRAINT [pk_detalle_factura] PRIMARY KEY CLUSTERED 
(
	[id_detalle_factura] ASC
)
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Cliente_Productos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Cliente_Productos]
as
select p.descripcion 'Producto', (c.nom_cliente)  'Nombre',ape_cliente  'Apellido',
importe_total 'Importe'
from detalles_facturas df join facturas f on df.id_factura= f.id_factura
join clientes c on c.id_cliente = f.id_cliente
join productos p on p.id_producto = df.id_producto
where c.id_cliente not in (select id_cliente
 from facturas
 where importe_total <= 1500)
GO
/****** Object:  Table [dbo].[boletos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boletos](
	[id_boleto] [int] NOT NULL,
	[id_funcion] [int] NULL,
	[id_butaca] [int] NULL,
	[id_reserva] [int] NULL,
	[precio] [decimal](18, 1) NULL,
 CONSTRAINT [pk_boletos] PRIMARY KEY CLUSTERED 
(
	[id_boleto] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[butacas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[butacas](
	[id_butaca] [int] NOT NULL,
	[id_estado_butaca] [int] NULL,
	[id_sala] [int] NULL,
 CONSTRAINT [pk_butaca] PRIMARY KEY CLUSTERED 
(
	[id_butaca] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[id_ciudad] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [pk_ciudad] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasificaciones]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasificaciones](
	[id_clasificacion] [int] NOT NULL,
	[clasificacion] [varchar](50) NULL,
 CONSTRAINT [pk_clasificaciones] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_funcion]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_funcion](
	[id_detalle_funcion] [int] NOT NULL,
	[id_funcion] [int] NULL,
	[id_sala] [int] NULL,
	[horario] [datetime] NULL,
	[id_tipo_funcion] [int] NULL,
 CONSTRAINT [pk_detalles_funcion] PRIMARY KEY CLUSTERED 
(
	[id_detalle_funcion] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_pelicula]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_pelicula](
	[id_detalle_pelicula] [int] NOT NULL,
	[id_pelicula] [int] NULL,
	[id_genero] [int] NULL,
	[id_idioma] [int] NULL,
 CONSTRAINT [pk_detalle_pelicula] PRIMARY KEY CLUSTERED 
(
	[id_detalle_pelicula] ASC
) 
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_productos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_productos](
	[id_detalle_prod] [int] NOT NULL,
	[id_producto] [int] NULL,
	[id_tamaño] [int] NULL,
 CONSTRAINT [pk_detalles_productos] PRIMARY KEY CLUSTERED 
(
	[id_detalle_prod] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id_empleado] [int] NOT NULL,
	[id_sucursal] [int] NULL,
	[nom_empleado] [varchar](1) NULL,
	[ape_empleado] [varchar](50) NULL,
 CONSTRAINT [pk_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados_butacas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados_butacas](
	[id_estado_butaca] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_estado_butaca] PRIMARY KEY CLUSTERED 
(
	[id_estado_butaca] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formas_pagos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formas_pagos](
	[id_forma_pago] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funciones]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funciones](
	[id_funcion] [int] NOT NULL,
	[id_pelicula] [int] NULL,
	[id_tipo_funcion] [int] NULL,
 CONSTRAINT [pk_funcion] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generos](
	[id_genero] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_genero] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomas](
	[id_idioma] [int] NOT NULL,
	[idioma] [varchar](50) NULL,
 CONSTRAINT [pk_idioma] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peliculas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculas](
	[id_pelicula] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[duracion] [int] NULL,
	[id_clasificacion] [int] NULL,
	[descripcion] [varchar](200) NULL,
	[id_genero] [int] NULL,
	[valoracion] [decimal](18, 1) NULL,
 CONSTRAINT [pk_pelicula] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas](
	[id_reserva] [int] NOT NULL,
	[fecha_reserva] [datetime] NULL,
 CONSTRAINT [pk_reserva] PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salas](
	[id_sala] [int] NOT NULL,
	[id_tipo_sala] [int] NULL,
	[id_sucursal] [int] NULL,
 CONSTRAINT [pk_salas] PRIMARY KEY CLUSTERED 
(
	[id_sala] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[id_sucursal] [int] NOT NULL,
	[direccion] [varchar](50) NULL,
	[id_ciudad] [int] NULL,
 CONSTRAINT [pk_sucursal] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tamaños]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tamaños](
	[id_tamaño] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tamaño] PRIMARY KEY CLUSTERED 
(
	[id_tamaño] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_funciones]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_funciones](
	[id_tipo_funcion] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_funcion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_funcion] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_productos]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_productos](
	[id_tipo_producto] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_producto] PRIMARY KEY CLUSTERED 
(
	[id_tipo_producto] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_salas]    Script Date: 24/11/2023 21:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_salas](
	[id_tipo_sala] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_salas] PRIMARY KEY CLUSTERED 
(
	[id_tipo_sala] ASC
)
) ON [PRIMARY]
GO
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (1, 1, 1, 1, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (2, 2, 2, 2, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (3, 2, 3, 2, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (4, 2, 4, 2, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (5, 2, 5, 2, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (6, 3, 1, 3, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (7, 3, 2, 4, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (8, 5, 1, 4, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (9, 5, 2, 4, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (10, 5, 3, 5, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (11, 5, 4, 5, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (12, 1, 3, NULL, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (13, 2, 15, NULL, NULL)
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (14, 7, 1, 1, CAST(1900.0 AS Decimal(18, 1)))
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (15, 8, 1, 2, CAST(1900.0 AS Decimal(18, 1)))
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (16, 9, 61, 1, CAST(1900.0 AS Decimal(18, 1)))
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (17, 10, 61, 1, CAST(1900.0 AS Decimal(18, 1)))
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (18, 11, 1, 1, CAST(1900.0 AS Decimal(18, 1)))
INSERT [dbo].[boletos] ([id_boleto], [id_funcion], [id_butaca], [id_reserva], [precio]) VALUES (19, 12, 1, 1, CAST(1900.0 AS Decimal(18, 1)))
GO
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (1, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (2, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (3, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (4, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (5, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (6, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (7, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (8, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (9, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (10, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (11, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (12, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (13, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (14, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (15, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (16, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (17, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (18, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (19, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (20, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (21, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (22, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (23, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (24, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (25, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (26, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (27, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (28, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (29, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (30, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (31, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (32, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (33, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (34, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (35, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (36, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (37, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (38, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (39, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (40, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (41, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (42, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (43, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (44, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (45, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (46, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (47, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (48, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (49, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (50, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (51, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (52, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (53, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (54, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (55, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (56, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (57, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (58, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (59, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (60, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (61, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (62, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (63, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (64, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (65, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (66, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (67, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (68, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (69, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (70, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (71, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (72, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (73, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (74, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (75, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (76, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (77, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (78, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (79, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (80, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (81, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (82, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (83, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (84, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (85, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (86, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (87, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (88, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (89, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (90, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (91, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (92, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (93, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (94, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (95, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (96, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (97, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (98, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (99, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (100, 1, 1)
GO
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (101, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (102, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (103, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (104, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (105, 1, 1)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (106, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (107, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (108, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (109, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (110, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (111, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (112, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (113, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (114, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (115, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (116, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (117, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (118, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (119, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (120, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (121, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (122, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (123, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (124, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (125, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (126, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (127, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (128, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (129, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (130, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (131, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (132, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (133, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (134, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (135, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (136, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (137, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (138, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (139, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (140, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (141, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (142, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (143, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (144, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (145, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (146, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (147, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (148, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (149, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (150, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (151, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (152, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (153, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (154, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (155, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (156, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (157, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (158, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (159, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (160, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (161, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (162, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (163, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (164, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (165, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (166, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (167, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (168, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (169, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (170, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (171, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (172, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (173, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (174, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (175, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (176, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (177, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (178, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (179, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (180, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (181, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (182, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (183, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (184, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (185, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (186, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (187, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (188, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (189, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (190, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (191, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (192, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (193, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (194, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (195, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (196, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (197, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (198, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (199, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (200, 1, 2)
GO
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (201, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (202, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (203, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (204, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (205, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (206, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (207, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (208, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (209, 1, 2)
INSERT [dbo].[butacas] ([id_butaca], [id_estado_butaca], [id_sala]) VALUES (210, 1, 2)
GO
INSERT [dbo].[ciudades] ([id_ciudad], [nombre]) VALUES (1, N'Cordoba')
INSERT [dbo].[ciudades] ([id_ciudad], [nombre]) VALUES (2, N'La Falda')
INSERT [dbo].[ciudades] ([id_ciudad], [nombre]) VALUES (3, N'Carlos Paz')
INSERT [dbo].[ciudades] ([id_ciudad], [nombre]) VALUES (4, N'Unquillo')
INSERT [dbo].[ciudades] ([id_ciudad], [nombre]) VALUES (5, N'Rio Ceballos')
GO
INSERT [dbo].[clasificaciones] ([id_clasificacion], [clasificacion]) VALUES (1, N'Atp')
INSERT [dbo].[clasificaciones] ([id_clasificacion], [clasificacion]) VALUES (2, N'+12')
INSERT [dbo].[clasificaciones] ([id_clasificacion], [clasificacion]) VALUES (3, N'+16')
INSERT [dbo].[clasificaciones] ([id_clasificacion], [clasificacion]) VALUES (4, N'+21')
INSERT [dbo].[clasificaciones] ([id_clasificacion], [clasificacion]) VALUES (5, NULL)
GO
INSERT [dbo].[clientes] ([id_cliente], [nom_cliente], [correo_electronico], [ape_cliente], [contraseña]) VALUES (1, N'Marco', N'Marco@gmail.com', N'Zarate', N'Marquitos')
INSERT [dbo].[clientes] ([id_cliente], [nom_cliente], [correo_electronico], [ape_cliente], [contraseña]) VALUES (2, N'Luciano', N'Chucho@gmail.com', N'Arguello', N'ElChucho')
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_boleto], [id_producto], [id_forma_pago], [Producto_Cant]) VALUES (1, 1, 1, 1, 1, 3)
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_boleto], [id_producto], [id_forma_pago], [Producto_Cant]) VALUES (2, 2, 2, 3, 2, 4)
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_boleto], [id_producto], [id_forma_pago], [Producto_Cant]) VALUES (3, 3, 12, NULL, 1, 0)
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_boleto], [id_producto], [id_forma_pago], [Producto_Cant]) VALUES (4, 4, 13, NULL, 2, 0)
GO
INSERT [dbo].[estados_butacas] ([id_estado_butaca], [descripcion]) VALUES (1, N'libre')
INSERT [dbo].[estados_butacas] ([id_estado_butaca], [descripcion]) VALUES (2, N'Reservada')
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [importe_total]) VALUES (1, 1, 6500)
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [importe_total]) VALUES (2, 2, 8750)
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [importe_total]) VALUES (3, 1, 7500)
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [importe_total]) VALUES (4, 2, 7250)
GO
INSERT [dbo].[formas_pagos] ([id_forma_pago], [descripcion]) VALUES (1, N'Efectivo')
INSERT [dbo].[formas_pagos] ([id_forma_pago], [descripcion]) VALUES (2, N'Debito')
INSERT [dbo].[formas_pagos] ([id_forma_pago], [descripcion]) VALUES (3, N'Transferencia')
GO
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (1, 1, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (2, 2, 3)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (3, 2, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (4, 3, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (5, 3, 2)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (6, 3, 3)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (7, 3, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (8, 3, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (9, 3, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (10, 3, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (11, 3, 1)
INSERT [dbo].[funciones] ([id_funcion], [id_pelicula], [id_tipo_funcion]) VALUES (12, 3, 1)
GO
INSERT [dbo].[generos] ([id_genero], [descripcion]) VALUES (1, N'Accion')
INSERT [dbo].[generos] ([id_genero], [descripcion]) VALUES (2, N'Comedia')
INSERT [dbo].[generos] ([id_genero], [descripcion]) VALUES (3, N'Romance')
GO
INSERT [dbo].[peliculas] ([id_pelicula], [nombre], [duracion], [id_clasificacion], [descripcion], [id_genero], [valoracion]) VALUES (1, N'John Wick', 195, 4, N'Un asesino retirado vuelve a la accion Despues de que matan a Su perro', 1, CAST(4.5 AS Decimal(18, 1)))
INSERT [dbo].[peliculas] ([id_pelicula], [nombre], [duracion], [id_clasificacion], [descripcion], [id_genero], [valoracion]) VALUES (2, N'Titanes del Pacifico 2', 172, 3, N'Finalmente la Verdadera secuela de los mechas contra kaijus', 1, CAST(4.5 AS Decimal(18, 1)))
INSERT [dbo].[peliculas] ([id_pelicula], [nombre], [duracion], [id_clasificacion], [descripcion], [id_genero], [valoracion]) VALUES (3, N'Avatar 3', 243, 3, N'La Familia Sully Se topa con una tribu Na-Vi no muy amigable', 1, CAST(4.5 AS Decimal(18, 1)))
GO
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (1, 1, N'CocaCola Original 1/4L')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (2, 1, N'Sprite 1/4L')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (3, 2, N'Pancho')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (4, 2, N'Sandwich Miga JyQ')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (5, 3, N'Doritos 300gr')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (6, 3, N'Lays 300gr')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (7, 4, N'Chocolate Block 70gr')
INSERT [dbo].[productos] ([id_producto], [id_tipo_prod], [descripcion]) VALUES (8, 4, N'Osos Gominola 20gr')
GO
INSERT [dbo].[reservas] ([id_reserva], [fecha_reserva]) VALUES (1, CAST(N'2023-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[reservas] ([id_reserva], [fecha_reserva]) VALUES (2, CAST(N'2024-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[reservas] ([id_reserva], [fecha_reserva]) VALUES (3, CAST(N'2024-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[reservas] ([id_reserva], [fecha_reserva]) VALUES (4, CAST(N'2024-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[reservas] ([id_reserva], [fecha_reserva]) VALUES (5, CAST(N'2023-12-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (1, 1, 1)
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (2, 2, 1)
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (3, 4, 1)
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (4, 1, 2)
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (5, 2, 2)
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (6, 1, 3)
INSERT [dbo].[salas] ([id_sala], [id_tipo_sala], [id_sucursal]) VALUES (7, 2, 3)
GO
INSERT [dbo].[sucursales] ([id_sucursal], [direccion], [id_ciudad]) VALUES (1, N'Gral Paz 207', 1)
INSERT [dbo].[sucursales] ([id_sucursal], [direccion], [id_ciudad]) VALUES (2, N'Martin Fierro 86', 2)
INSERT [dbo].[sucursales] ([id_sucursal], [direccion], [id_ciudad]) VALUES (3, N'Cardozo Peña 91', 3)
GO
INSERT [dbo].[tipos_funciones] ([id_tipo_funcion], [descripcion]) VALUES (1, N'Subtitulada')
INSERT [dbo].[tipos_funciones] ([id_tipo_funcion], [descripcion]) VALUES (2, N'Doblada')
INSERT [dbo].[tipos_funciones] ([id_tipo_funcion], [descripcion]) VALUES (3, N'3D')
INSERT [dbo].[tipos_funciones] ([id_tipo_funcion], [descripcion]) VALUES (4, N'4D')
GO
INSERT [dbo].[tipos_productos] ([id_tipo_producto], [descripcion]) VALUES (1, N'Bebida')
INSERT [dbo].[tipos_productos] ([id_tipo_producto], [descripcion]) VALUES (2, N'Comida')
INSERT [dbo].[tipos_productos] ([id_tipo_producto], [descripcion]) VALUES (3, N'Snack')
INSERT [dbo].[tipos_productos] ([id_tipo_producto], [descripcion]) VALUES (4, N'Dulce')
GO
INSERT [dbo].[tipos_salas] ([id_tipo_sala], [descripcion]) VALUES (1, N'Estandar')
INSERT [dbo].[tipos_salas] ([id_tipo_sala], [descripcion]) VALUES (2, N'3D')
INSERT [dbo].[tipos_salas] ([id_tipo_sala], [descripcion]) VALUES (3, N'Confort')
INSERT [dbo].[tipos_salas] ([id_tipo_sala], [descripcion]) VALUES (4, N'4D')
INSERT [dbo].[tipos_salas] ([id_tipo_sala], [descripcion]) VALUES (5, N'Imax')
GO
ALTER TABLE [dbo].[boletos]  WITH CHECK ADD  CONSTRAINT [fk_butaca] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[boletos] CHECK CONSTRAINT [fk_butaca]
GO
ALTER TABLE [dbo].[boletos]  WITH CHECK ADD  CONSTRAINT [fk_funcion] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[boletos] CHECK CONSTRAINT [fk_funcion]
GO
ALTER TABLE [dbo].[boletos]  WITH CHECK ADD  CONSTRAINT [fk_reserva] FOREIGN KEY([id_reserva])
REFERENCES [dbo].[reservas] ([id_reserva])
GO
ALTER TABLE [dbo].[boletos] CHECK CONSTRAINT [fk_reserva]
GO
ALTER TABLE [dbo].[butacas]  WITH CHECK ADD  CONSTRAINT [fk_estado_butaca] FOREIGN KEY([id_estado_butaca])
REFERENCES [dbo].[estados_butacas] ([id_estado_butaca])
GO
ALTER TABLE [dbo].[butacas] CHECK CONSTRAINT [fk_estado_butaca]
GO
ALTER TABLE [dbo].[butacas]  WITH CHECK ADD  CONSTRAINT [fk_salas_butacas] FOREIGN KEY([id_sala])
REFERENCES [dbo].[salas] ([id_sala])
GO
ALTER TABLE [dbo].[butacas] CHECK CONSTRAINT [fk_salas_butacas]
GO
ALTER TABLE [dbo].[detalles_facturas]  WITH CHECK ADD  CONSTRAINT [fk_boleto] FOREIGN KEY([id_boleto])
REFERENCES [dbo].[boletos] ([id_boleto])
GO
ALTER TABLE [dbo].[detalles_facturas] CHECK CONSTRAINT [fk_boleto]
GO
ALTER TABLE [dbo].[detalles_facturas]  WITH CHECK ADD  CONSTRAINT [fk_factura] FOREIGN KEY([id_factura])
REFERENCES [dbo].[facturas] ([id_factura])
GO
ALTER TABLE [dbo].[detalles_facturas] CHECK CONSTRAINT [fk_factura]
GO
ALTER TABLE [dbo].[detalles_facturas]  WITH CHECK ADD  CONSTRAINT [fk_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[formas_pagos] ([id_forma_pago])
GO
ALTER TABLE [dbo].[detalles_facturas] CHECK CONSTRAINT [fk_forma_pago]
GO
ALTER TABLE [dbo].[detalles_facturas]  WITH CHECK ADD  CONSTRAINT [fk_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[detalles_facturas] CHECK CONSTRAINT [fk_producto]
GO
ALTER TABLE [dbo].[detalles_funcion]  WITH CHECK ADD  CONSTRAINT [fk_funcion_detalles] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[detalles_funcion] CHECK CONSTRAINT [fk_funcion_detalles]
GO
ALTER TABLE [dbo].[detalles_funcion]  WITH CHECK ADD  CONSTRAINT [fk_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[salas] ([id_sala])
GO
ALTER TABLE [dbo].[detalles_funcion] CHECK CONSTRAINT [fk_sala]
GO
ALTER TABLE [dbo].[detalles_funcion]  WITH CHECK ADD  CONSTRAINT [fk_tipo_funcion] FOREIGN KEY([id_tipo_funcion])
REFERENCES [dbo].[tipos_funciones] ([id_tipo_funcion])
GO
ALTER TABLE [dbo].[detalles_funcion] CHECK CONSTRAINT [fk_tipo_funcion]
GO
ALTER TABLE [dbo].[detalles_pelicula]  WITH CHECK ADD  CONSTRAINT [fk_genero] FOREIGN KEY([id_genero])
REFERENCES [dbo].[generos] ([id_genero])
GO
ALTER TABLE [dbo].[detalles_pelicula] CHECK CONSTRAINT [fk_genero]
GO
ALTER TABLE [dbo].[detalles_pelicula]  WITH CHECK ADD  CONSTRAINT [fk_idiomas] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[idiomas] ([id_idioma])
GO
ALTER TABLE [dbo].[detalles_pelicula] CHECK CONSTRAINT [fk_idiomas]
GO
ALTER TABLE [dbo].[detalles_pelicula]  WITH CHECK ADD  CONSTRAINT [fk_pelicula] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[detalles_pelicula] CHECK CONSTRAINT [fk_pelicula]
GO
ALTER TABLE [dbo].[detalles_productos]  WITH CHECK ADD  CONSTRAINT [fk_producto_detalles_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[detalles_productos] CHECK CONSTRAINT [fk_producto_detalles_productos]
GO
ALTER TABLE [dbo].[detalles_productos]  WITH CHECK ADD  CONSTRAINT [fk_tamaño] FOREIGN KEY([id_tamaño])
REFERENCES [dbo].[tamaños] ([id_tamaño])
GO
ALTER TABLE [dbo].[detalles_productos] CHECK CONSTRAINT [fk_tamaño]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [fk_sucursal_empleado] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursales] ([id_sucursal])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [fk_sucursal_empleado]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [fk_cliente_factura] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_cliente_factura]
GO
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [fk_pelicula_funciones] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [fk_pelicula_funciones]
GO
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [fk_tipo_funcion_funcion] FOREIGN KEY([id_tipo_funcion])
REFERENCES [dbo].[tipos_funciones] ([id_tipo_funcion])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [fk_tipo_funcion_funcion]
GO
ALTER TABLE [dbo].[peliculas]  WITH CHECK ADD  CONSTRAINT [fk_clasificacion] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[clasificaciones] ([id_clasificacion])
GO
ALTER TABLE [dbo].[peliculas] CHECK CONSTRAINT [fk_clasificacion]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [fk_tipo_prod] FOREIGN KEY([id_tipo_prod])
REFERENCES [dbo].[tipos_productos] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [fk_tipo_prod]
GO
ALTER TABLE [dbo].[salas]  WITH CHECK ADD  CONSTRAINT [fk_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursales] ([id_sucursal])
GO
ALTER TABLE [dbo].[salas] CHECK CONSTRAINT [fk_sucursal]
GO
ALTER TABLE [dbo].[salas]  WITH CHECK ADD  CONSTRAINT [fk_tipo_salas] FOREIGN KEY([id_tipo_sala])
REFERENCES [dbo].[tipos_salas] ([id_tipo_sala])
GO
ALTER TABLE [dbo].[salas] CHECK CONSTRAINT [fk_tipo_salas]
GO
ALTER TABLE [dbo].[sucursales]  WITH CHECK ADD  CONSTRAINT [fk_ciudad] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[ciudades] ([id_ciudad])
GO
ALTER TABLE [dbo].[sucursales] CHECK CONSTRAINT [fk_ciudad]
GO
/****** Object:  StoredProcedure [dbo].[Clasificacion]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Clasificacion]
as
begin
select id_clasificacion,clasificacion
from clasificaciones
end
GO
/****** Object:  StoredProcedure [dbo].[InsertBoleto]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertBoleto]
@id_boleto int,
@id_funcion int,	
@id_butaca int,
@precio money,
@id_reserva int
as
begin
insert into boletos(id_boleto,id_funcion,id_butaca,precio,id_reserva)
values (@id_boleto,@id_funcion,@id_butaca,@precio,@id_reserva)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertFuncion]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertFuncion]
@id_funcion int,
@id_pelicula int,
@id_tipo_funcion int
as
begin
insert into funciones(id_funcion,id_pelicula,id_tipo_funcion)
values (@id_funcion,@id_pelicula,@id_tipo_funcion)
end
GO
/****** Object:  StoredProcedure [dbo].[Logins]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Logins]
@usuario varchar(50),
@contraseña varchar(50)
as
begin
select correo_electronico,contraseña from clientes 
where correo_electronico=@usuario and contraseña = @contraseña
end




GO
/****** Object:  StoredProcedure [dbo].[ObtenerButacas]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ObtenerButacas]
@sala int
as
begin

select id_butaca,id_estado_butaca,id_sala from butacas where id_sala = @sala
end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerFunciones]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerFunciones]
as
begin
select * from funciones
end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProximoIdPelicula]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProximoIdPelicula]
AS
BEGIN
    BEGIN TRANSACTION; -- Iniciar una transacción para establecer un ámbito de bloqueo
    DECLARE @ProximoId INT;
    -- Obtener el máximo ID de películas existente
    SELECT @ProximoId = ISNULL(MAX(id_pelicula), 0) + 1
    FROM Peliculas;
    -- Devolver el próximo ID
    SELECT @ProximoId AS ProximoIdPelicula;
    COMMIT; -- Confirmar la transacción
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerReservas]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerReservas]
as
begin
select * from reservas
end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTiposFunciones]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerTiposFunciones]
as 
begin
select * from tipos_funciones
end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimaFuncion]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerUltimaFuncion]
as
begin
select max( id_funcion)+1 as 'Ultima' from funciones
end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimoBoleto]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerUltimoBoleto]
as
begin
select max( id_boleto)+1 as 'Ultimo' from boletos
end

GO
/****** Object:  StoredProcedure [dbo].[PeliculasPopulares]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PeliculasPopulares]
as
begin
select top 20 nombre,count(id_boleto) compras from peliculas p join funciones f
on p.id_pelicula = f.id_pelicula
join boletos b on b.id_funcion = f.id_funcion
group by nombre
order by compras desc
end
GO
/****** Object:  StoredProcedure [dbo].[PeliculasPopulares2]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PeliculasPopulares2]
as
begin
select top 20 nombre,count(id_boleto)*100/(select count(id_boleto) from peliculas p join funciones f
on p.id_pelicula = f.id_pelicula
join boletos b on b.id_funcion = f.id_funcion) porcentajeCompras from peliculas p join funciones f
on p.id_pelicula = f.id_pelicula
join boletos b on b.id_funcion = f.id_funcion
group by nombre
order by porcentajeCompras desc
end
GO
/****** Object:  StoredProcedure [dbo].[Pelis]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Pelis]
as
begin
select id_pelicula,nombre,descripcion,duracion, valoracion, clasificacion, p.id_clasificacion
 from peliculas p join clasificaciones c on  p.id_clasificacion =c.id_clasificacion
 end
GO
/****** Object:  StoredProcedure [dbo].[PelisBusqueda]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[PelisBusqueda]
@nom varchar(100)
as
begin
select id_pelicula,nombre,descripcion,duracion,p.id_clasificacion,clasificacion,valoracion
 from peliculas p left join clasificaciones c on p.id_clasificacion = c.id_clasificacion
Where nombre  like '%'+@nom+'%'
 end
GO
/****** Object:  StoredProcedure [dbo].[ProductosPopulares]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProductosPopulares]
as
begin
select top 10 descripcion,sum(Producto_Cant)*100/(select sum(Producto_Cant) from detalles_facturas) as 'Porcentaje en compras'  from productos p
join detalles_facturas d on d.id_producto = p.id_producto
group by descripcion
end
GO
/****** Object:  StoredProcedure [dbo].[SP_clientesButacas]    Script Date: 24/11/2023 21:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_clientesButacas] (@butaca1 int,@butaca2 int)
as
select f.id_cliente ID,nom_cliente Nombre,bo.id_butaca 'NroButaca' from facturas f
join clientes c on c.id_cliente = f.id_cliente
join detalles_facturas d on d.id_factura = f.id_factura
join boletos bo on bo.id_boleto = d.id_boleto
join butacas bu on bu.id_butaca = bo.id_butaca
where bo.id_butaca in (select id_butaca from butacas
where id_butaca between @butaca1 and @butaca2)

GO
USE [master]
GO
ALTER DATABASE [cine] SET  READ_WRITE 
GO
