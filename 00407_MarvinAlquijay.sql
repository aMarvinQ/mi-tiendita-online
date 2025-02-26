USE [master]
GO
/****** Object:  Database [GDA00407_OT_MarvinAlquijay]    Script Date: 22/12/2024 11:19:59 p. m. ******/
CREATE DATABASE [GDA00407_OT_MarvinAlquijay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDA00407_OT_MarvinAlquijay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00407_OT_MarvinAlquijay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GDA00407_OT_MarvinAlquijay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00407_OT_MarvinAlquijay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDA00407_OT_MarvinAlquijay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ARITHABORT OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET RECOVERY FULL 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET  MULTI_USER 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GDA00407_OT_MarvinAlquijay', N'ON'
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET QUERY_STORE = ON
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GDA00407_OT_MarvinAlquijay]
GO
/****** Object:  User [marvindb]    Script Date: 22/12/2024 11:20:00 p. m. ******/
CREATE USER [marvindb] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [adminMarvin]    Script Date: 22/12/2024 11:20:00 p. m. ******/
CREATE USER [adminMarvin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin_db_marvin]    Script Date: 22/12/2024 11:20:00 p. m. ******/
CREATE USER [admin_db_marvin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [marvindb]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [marvindb]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [marvindb]
GO
ALTER ROLE [db_datareader] ADD MEMBER [marvindb]
GO
/****** Object:  UserDefinedTableType [dbo].[DETALLES_ORDEN_TABLE_TYPE]    Script Date: 22/12/2024 11:20:00 p. m. ******/
CREATE TYPE [dbo].[DETALLES_ORDEN_TABLE_TYPE] AS TABLE(
	[productos_idProductos] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
	[subtotal] [float] NULL
)
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstados] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[idEstados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProductos] [int] IDENTITY(1,1) NOT NULL,
	[categoriaProductos_idCategoriaProductos] [int] NOT NULL,
	[usuarios_idUsuarios] [int] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[marca] [varchar](45) NOT NULL,
	[codigo] [varchar](45) NULL,
	[stock] [float] NULL,
	[estados_idEstados] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[foto] [binary](1) NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[cantidadProductosActivos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cantidadProductosActivos]
as
select e.nombre as Estado, count(p.idproductos) as cantidadProductos from Estados e
right join productos p on p.estados_idEstados = e.idEstados
where stock > 0 and e.nombre = 'activo'
group by e.nombre;
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[idOrden] [int] IDENTITY(1,1) NOT NULL,
	[usuarios_idUsuarios] [int] NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[nombre_completo] [varchar](60) NOT NULL,
	[direccion] [varchar](545) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[correo_electronico] [varchar](45) NOT NULL,
	[fecha_entrega] [date] NOT NULL,
	[total_orden] [float] NOT NULL,
 CONSTRAINT [PK_orden] PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[totalAgosto]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[totalAgosto]
as
  select 'Agosto' as mes, count(idOrden) as total_Ordenes, sum(total_orden) as total_Quetzales from orden 
	where fecha_creacion between '2024-08-01' and '2024-08-31';
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idClientes] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](245) NULL,
	[nombre_comercial] [varchar](34) NULL,
	[direccion_entrega] [varchar](45) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[correo_electronico] [varchar](45) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuarios] [int] IDENTITY(1,1) NOT NULL,
	[rol_idRol] [int] NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[correo_electronico] [varchar](45) NOT NULL,
	[nombre_completo] [varchar](45) NOT NULL,
	[password] [varchar](45) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[clientes_idClientes] [int] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TopClientes]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TopClientes]
as
  select top 10 c.nombre_comercial AS Cliente, SUM(o.total_orden) AS TotalConsumo
	from Orden o
		inner JOIN usuarios u ON o.usuarios_idusuarios = u.idUsuarios
		inner join Clientes c ON u.Clientes_idClientes = c.idClientes
	  group by c.nombre_comercial
	  order by TotalConsumo DESC;
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDetalles](
	[idOrdenDetalles] [int] IDENTITY(1,1) NOT NULL,
	[orden_idOrden] [int] NOT NULL,
	[productos_idProductos] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[subtotal] [float] NOT NULL,
 CONSTRAINT [PK_ordenDetalles] PRIMARY KEY CLUSTERED 
(
	[idOrdenDetalles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[topProductosVendidos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[topProductosVendidos]
as
  select top 10 
	sum(od.cantidad) as cantidadVendido, p.nombre as nombreProducto 
	  from ordenDetalles od
		inner join productos p on od.productos_idProductos=p.idProductos 
	  group by p.nombre
	  order by cantidadVendido asc;
GO
/****** Object:  Table [dbo].[CategoriaProductos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaProductos](
	[idCategoriaProductos] [int] IDENTITY(1,1) NOT NULL,
	[usuarios_idUsuarios] [int] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_categoriaProductos] PRIMARY KEY CLUSTERED 
(
	[idCategoriaProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoriaProductos] ON 

INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (1, 12, N'Categoria actualizada', 2, CAST(N'2023-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (2, 3, N'Categoría B', 2, CAST(N'2023-08-19T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (3, 1, N'Categoría C', 2, CAST(N'2024-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (4, 7, N'Categoría D', 2, CAST(N'2023-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (5, 9, N'Categoría E', 1, CAST(N'2024-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (6, 4, N'Categoría F', 2, CAST(N'2023-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (7, 10, N'Categoría G', 1, CAST(N'2024-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (8, 2, N'Categoría H', 2, CAST(N'2023-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (9, 8, N'Categoría I', 1, CAST(N'2023-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (10, 5, N'Categoría J', 2, CAST(N'2024-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[CategoriaProductos] ([idCategoriaProductos], [usuarios_idUsuarios], [nombre], [estados_idEstados], [fecha_creacion]) VALUES (11, 13, N'Categoría nueva', 1, CAST(N'2024-12-19T22:57:21.213' AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoriaProductos] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (1, N'Cliente SA 1', N'Cliente Comercial 1', N'Calle 1', N'555-1010', N'cliente1@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (2, N'Cliente SA 2', N'Cliente Comercial 2', N'Calle 2', N'555-2020', N'cliente2@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (3, N'Cliente SA 3', N'Cliente Comercial 3', N'Calle 3', N'555-3030', N'cliente3@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (4, N'Cliente SA 4', N'Cliente Comercial 4', N'Calle 4', N'555-4040', N'cliente4@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (5, N'Cliente SA 5', N'Cliente Comercial 5', N'Calle 5', N'555-5050', N'cliente5@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (6, N'Cliente SA 6', N'Cliente Comercial 6', N'Calle 6', N'555-6060', N'cliente6@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (7, N'Cliente SA 7', N'Cliente Comercial 7', N'Calle 7', N'555-7070', N'cliente7@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (8, N'Cliente SA 8', N'Cliente Comercial 8', N'Calle 8', N'555-8080', N'cliente8@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (9, N'Cliente SA 9', N'Cliente Comercial 9', N'Calle 9', N'555-9090', N'cliente9@example.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (10, N'crud company updated', N'nombre cualquiera updated', N'calle cualquiera updates', N'12345678', N'crud@prueba.com')
INSERT [dbo].[Clientes] ([idClientes], [razon_social], [nombre_comercial], [direccion_entrega], [telefono], [correo_electronico]) VALUES (11, N'crud company updated', N'nombre cualquiera updated', N'calle cualquiera updates', N'12345678', N'crud@prueba.com')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (1, N'Activo')
INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (2, N'Inactivo')
INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (3, N'Pendiente')
INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (4, N'Rechazado')
INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (5, N'Aprobado')
INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (6, N'En proceso')
INSERT [dbo].[Estados] ([idEstados], [nombre]) VALUES (10, N'Completado')
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Orden] ON 

INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (1, 1, 3, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'Juan Pérez', N'Calle Ficticia 123, Ciudad', N'555-1234', N'juan.perez@email.com', CAST(N'2024-06-20' AS Date), 249.99)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (2, 2, 4, CAST(N'2024-07-02T00:00:00.000' AS DateTime), N'Ana Gómez', N'Avenida Siempre Viva 456, Ciudad', N'555-5678', N'ana.gomez@email.com', CAST(N'2024-07-07' AS Date), 189.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (3, 1, 2, CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'John Doe', N'123 Main St', N'123-456-7890', N'johndoe@example.com', CAST(N'2024-12-21' AS Date), 100.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (4, 4, 6, CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'María López', N'Calle del Mar 101, Ciudad', N'555-4321', N'maria.lopez@email.com', CAST(N'2024-07-05' AS Date), 499.99)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (5, 5, 3, CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'Pedro Sánchez', N'Avenida de la Paz 222, Ciudad', N'555-8765', N'pedro.sanchez@email.com', CAST(N'2024-08-06' AS Date), 159.45)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (6, 6, 4, CAST(N'2024-08-10T00:00:00.000' AS DateTime), N'Laura Martínez', N'Calle de la Luna 333, Ciudad', N'555-1234', N'laura.martinez@email.com', CAST(N'2024-08-15' AS Date), 275.8)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (7, 7, 5, CAST(N'2024-08-21T00:00:00.000' AS DateTime), N'Luis Fernández', N'Calle del Viento 444, Ciudad', N'555-5678', N'luis.fernandez@email.com', CAST(N'2024-08-26' AS Date), 199.99)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (8, 8, 6, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'Elena Ruiz', N'Avenida del Río 555, Ciudad', N'555-8765', N'elena.ruiz@email.com', CAST(N'2024-09-06' AS Date), 379.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (9, 9, 3, CAST(N'2024-09-05T00:00:00.000' AS DateTime), N'Ricardo Gómez', N'Calle de los Olivos 666, Ciudad', N'555-4321', N'ricardo.gomez@email.com', CAST(N'2024-09-10' AS Date), 215.4)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (10, 10, 4, CAST(N'2024-09-10T00:00:00.000' AS DateTime), N'Sofía Jiménez', N'Avenida del Sol 777, Ciudad', N'555-9876', N'sofia.jimenez@email.com', CAST(N'2024-09-15' AS Date), 415)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (11, 1, 5, CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'Gabriel Martínez', N'Calle del Lago 888, Ciudad', N'555-3456', N'gabriel.martinez@email.com', CAST(N'2024-09-20' AS Date), 299.99)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (12, 2, 6, CAST(N'2024-09-20T00:00:00.000' AS DateTime), N'Marta López', N'Calle del Bosque 999, Ciudad', N'555-6543', N'marta.lopez@email.com', CAST(N'2024-09-25' AS Date), 159.8)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (13, 3, 3, CAST(N'2024-09-25T00:00:00.000' AS DateTime), N'Jorge Pérez', N'Calle Mayor 1010, Ciudad', N'555-1111', N'jorge.perez@email.com', CAST(N'2024-09-30' AS Date), 479.4)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (14, 4, 4, CAST(N'2024-10-01T00:00:00.000' AS DateTime), N'Fernando Ruiz', N'Avenida Libertad 1111, Ciudad', N'555-2222', N'fernando.ruiz@email.com', CAST(N'2024-10-06' AS Date), 550)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (15, 5, 5, CAST(N'2024-10-05T00:00:00.000' AS DateTime), N'Raquel González', N'Calle de la Estrella 1212, Ciudad', N'555-3333', N'raquel.gonzalez@email.com', CAST(N'2024-10-10' AS Date), 379.25)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (16, 6, 6, CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'Andrés García', N'Avenida de los Árboles 1313, Ciudad', N'555-4444', N'andres.garcia@email.com', CAST(N'2024-10-15' AS Date), 499.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (17, 7, 3, CAST(N'2024-10-15T00:00:00.000' AS DateTime), N'Patricia López', N'Calle de la Miel 1414, Ciudad', N'555-5555', N'patricia.lopez@email.com', CAST(N'2024-10-20' AS Date), 189.99)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (18, 8, 4, CAST(N'2024-10-20T00:00:00.000' AS DateTime), N'Luis Castillo', N'Calle del Rio 1515, Ciudad', N'555-6666', N'luis.castillo@email.com', CAST(N'2024-10-25' AS Date), 329.75)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (19, 9, 5, CAST(N'2024-10-25T00:00:00.000' AS DateTime), N'Ana Romero', N'Calle de la Tarde 1616, Ciudad', N'555-7777', N'ana.romero@email.com', CAST(N'2024-10-30' AS Date), 219.99)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (20, 10, 6, CAST(N'2024-10-30T00:00:00.000' AS DateTime), N'José Díaz', N'Avenida del Sol 1717, Ciudad', N'555-8888', N'jose.diaz@email.com', CAST(N'2024-11-04' AS Date), 399.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (21, 1, 1, CAST(N'2024-12-20T12:46:04.167' AS DateTime), N'Juan Pérez', N'Calle Falsa 123, Guatemala', N'555-1234', N'juan.perez@example.com', CAST(N'2024-12-15' AS Date), 100.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (22, 2, 1, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'María López', N'Avenida Siempre Viva 456, Guatemala', N'555-5678', N'maria.lopez@example.com', CAST(N'2024-12-16' AS Date), 250.75)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (23, 3, 2, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Carlos Gómez', N'Boulevard de los Próceres 789, Guatemala', N'555-9101', N'carlos.gomez@example.com', CAST(N'2024-12-17' AS Date), 300)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (24, 4, 3, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Ana Martínez', N'Callejón del Beso 321, Guatemala', N'555-1121', N'ana.martinez@example.com', CAST(N'2024-12-18' AS Date), 400.25)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (25, 5, 2, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'José Rodríguez', N'Calle de las Flores 654, Guatemala', N'555-3141', N'jose.rodriguez@example.com', CAST(N'2024-12-19' AS Date), 150.75)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (26, 6, 1, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Laura Fernández', N'Paseo de la Reforma 987, Guatemala', N'555-5161', N'laura.fernandez@example.com', CAST(N'2024-12-20' AS Date), 350.6)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (27, 7, 3, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Luis Hernández', N'Avenida de los Insurgentes 135, Guatemala', N'555-7181', N'luis.hernandez@example.com', CAST(N'2024-12-21' AS Date), 275.4)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (28, 8, 2, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Elena García', N'Carretera Interamericana 246, Guatemala', N'555-9202', N'elena.garcia@example.com', CAST(N'2024-12-22' AS Date), 500.3)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (29, 9, 1, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Fernando González', N'Calle Real 357, Guatemala', N'555-1222', N'fernando.gonzalez@example.com', CAST(N'2024-12-23' AS Date), 220.55)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (30, 10, 3, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Isabel Sánchez', N'Camino Viejo 468, Guatemala', N'555-3242', N'isabel.sanchez@example.com', CAST(N'2024-12-24' AS Date), 310.8)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (31, 11, 2, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Miguel Torres', N'Plaza Central 579, Guatemala', N'555-5262', N'miguel.torres@example.com', CAST(N'2024-12-25' AS Date), 290.6)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (32, 12, 1, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'Rosa Morales', N'Vía Láctea 681, Guatemala', N'555-7282', N'rosa.morales@example.com', CAST(N'2024-12-26' AS Date), 180.75)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (33, 13, 3, CAST(N'2024-12-20T12:46:04.170' AS DateTime), N'David Cruz', N'Callejón de la Luz 792, Guatemala', N'555-9303', N'david.cruz@example.com', CAST(N'2024-12-27' AS Date), 405.9)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (41, 10, 2, CAST(N'2024-12-21T00:33:11.050' AS DateTime), N'orden test', N'calle de prueba 123', N'21345678', N'email@prueba.xd', CAST(N'2025-02-01' AS Date), 200.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (42, 10, 3, CAST(N'2024-12-21T00:52:40.447' AS DateTime), N'orden test', N'calle de prueba 123', N'21345678', N'email@prueba.xd', CAST(N'2025-02-01' AS Date), 200.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (43, 1, 2, CAST(N'2024-12-21T01:10:35.057' AS DateTime), N'John Doe', N'123 Main St', N'123-456-7890', N'johndoe@example.com', CAST(N'2024-12-21' AS Date), 100.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (44, 1, 2, CAST(N'2024-12-21T14:05:02.577' AS DateTime), N'John Doe', N'123 Main St', N'123-456-7890', N'johndoe@example.com', CAST(N'2024-12-21' AS Date), 100.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (45, 1, 2, CAST(N'2024-12-22T20:38:21.900' AS DateTime), N'John Doe', N'123 Main St', N'123-456-7890', N'johndoe@example.com', CAST(N'2024-12-21' AS Date), 100.5)
INSERT [dbo].[Orden] ([idOrden], [usuarios_idUsuarios], [estados_idEstados], [fecha_creacion], [nombre_completo], [direccion], [telefono], [correo_electronico], [fecha_entrega], [total_orden]) VALUES (46, 1, 2, CAST(N'2024-12-22T20:42:27.070' AS DateTime), N'John Doe', N'123 Main St', N'123-456-7890', N'johndoe@example.com', CAST(N'2024-12-21' AS Date), 100.5)
SET IDENTITY_INSERT [dbo].[Orden] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenDetalles] ON 

INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (1, 1, 12, 2, 149.99, 299.98)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (2, 2, 5, 1, 199.5, 199.5)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (4, 4, 20, 4, 89.99, 359.96)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (5, 5, 15, 2, 159.75, 319.5)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (6, 6, 18, 1, 249.99, 249.99)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (7, 7, 25, 5, 99.99, 499.95)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (8, 8, 30, 3, 279.99, 839.97)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (9, 9, 2, 4, 139.99, 559.96)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (10, 10, 9, 2, 249.5, 499)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (11, 11, 7, 3, 189.99, 569.97)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (12, 12, 11, 1, 299.99, 299.99)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (13, 13, 14, 4, 129.99, 519.96)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (14, 14, 19, 2, 179, 358)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (15, 15, 16, 1, 249.5, 249.5)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (16, 16, 22, 3, 119.99, 359.97)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (17, 17, 13, 4, 219.99, 879.96)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (18, 18, 28, 2, 159.99, 319.98)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (19, 19, 17, 1, 199.75, 199.75)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (20, 20, 6, 3, 249, 747)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (21, 1, 30, 2, 10.5, 21)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (22, 1, 1, 3, 10, 30)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (23, 1, 2, 2, 15, 30)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (24, 1, 3, 1, 50, 50)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (25, 2, 1, 5, 10, 50)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (26, 2, 3, 2, 50, 100)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (29, 4, 5, 2, 30, 60)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (30, 4, 6, 1, 75, 75)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (31, 5, 7, 4, 5, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (32, 5, 8, 2, 10, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (33, 6, 9, 3, 25, 75)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (34, 6, 10, 1, 100, 100)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (35, 7, 11, 5, 7, 35)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (36, 7, 12, 2, 50, 100)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (37, 8, 13, 3, 30, 90)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (38, 8, 14, 1, 200, 200)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (39, 9, 15, 2, 150, 300)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (40, 9, 16, 1, 50, 50)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (41, 10, 17, 4, 25, 100)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (42, 10, 18, 2, 75, 150)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (43, 11, 19, 3, 20, 60)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (44, 11, 20, 1, 150, 150)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (45, 12, 21, 2, 125, 250)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (46, 12, 22, 1, 50, 50)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (47, 41, 30, 2, 10.5, 21)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (48, 42, 30, 2, 10.5, 21)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (49, 43, 1, 2, 10, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (50, 43, 2, 1, 15, 15)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (53, 3, 1, 2, 10, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (54, 3, 2, 1, 15, 15)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (55, 44, 1, 2, 10, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (56, 44, 2, 1, 15, 15)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (57, 45, 1, 2, 10, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (58, 45, 2, 1, 15, 15)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (59, 46, 1, 2, 10, 20)
INSERT [dbo].[OrdenDetalles] ([idOrdenDetalles], [orden_idOrden], [productos_idProductos], [cantidad], [precio], [subtotal]) VALUES (60, 46, 2, 1, 15, 15)
SET IDENTITY_INSERT [dbo].[OrdenDetalles] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (1, 2, 1, N'producto actualizado', N'marca actualizada', N'1321465454', 50, 2, 20.5, CAST(N'2024-03-05T00:00:00.000' AS DateTime), 0x89)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (2, 3, 7, N'Producto B', N'Marca Y', N'XYZ456', 0, 2, 299.99, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 0x02)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (3, 2, 3, N'Producto C', N'Marca Z', N'LMN789', 30, 1, 149.49, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 0x03)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (4, 5, 9, N'Producto D', N'Marca W', N'OPQ101', 0, 1, 79.99, CAST(N'2023-10-04T00:00:00.000' AS DateTime), 0x04)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (5, 1, 4, N'Producto E', N'Marca V', N'RST202', 75.2, 2, 120, CAST(N'2023-08-17T00:00:00.000' AS DateTime), 0x05)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (6, 8, 6, N'Producto F', N'Marca U', N'UVW303', 15.8, 1, 249.5, CAST(N'2024-02-08T00:00:00.000' AS DateTime), 0x06)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (7, 10, 2, N'Producto G', N'Marca T', N'EFG404', 45, 2, 399.99, CAST(N'2024-04-14T00:00:00.000' AS DateTime), 0x07)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (8, 7, 8, N'Producto H', N'Marca S', N'HIJ505', 0, 1, 189.99, CAST(N'2023-11-22T00:00:00.000' AS DateTime), 0x08)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (9, 6, 10, N'Producto I', N'Marca R', N'KLM606', 25.3, 2, 99.99, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 0x09)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (10, 9, 5, N'Producto J', N'Marca Q', N'NOP707', 60.7, 1, 159.99, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 0x0A)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (11, 4, 2, N'Producto K', N'Marca P', N'LMN808', 0, 1, 199.99, CAST(N'2024-03-11T00:00:00.000' AS DateTime), 0x01)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (12, 9, 1, N'Producto L', N'Marca O', N'XYZ909', 12.5, 2, 249.99, CAST(N'2023-06-30T00:00:00.000' AS DateTime), 0x02)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (13, 7, 5, N'Producto M', N'Marca N', N'PQR010', 50, 1, 129.99, CAST(N'2023-11-17T00:00:00.000' AS DateTime), 0x03)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (14, 6, 3, N'Producto N', N'Marca M', N'STU111', 25, 2, 89.99, CAST(N'2024-02-21T00:00:00.000' AS DateTime), 0x04)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (15, 10, 8, N'Producto O', N'Marca L', N'VWX222', 0, 1, 159.99, CAST(N'2024-01-08T00:00:00.000' AS DateTime), 0x05)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (16, 8, 6, N'Producto P', N'Marca K', N'YZA333', 33, 2, 179.99, CAST(N'2023-09-27T00:00:00.000' AS DateTime), 0x06)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (17, 5, 9, N'Producto Q', N'Marca J', N'BCD444', 70.5, 1, 99.99, CAST(N'2023-08-15T00:00:00.000' AS DateTime), 0x07)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (18, 3, 7, N'Producto R', N'Marca I', N'EFG555', 0, 2, 249.99, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 0x08)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (19, 2, 4, N'Producto S', N'Marca H', N'HIJ666', 40, 1, 179.49, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 0x09)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (20, 1, 10, N'Producto T', N'Marca G', N'KLM777', 0, 1, 219.99, CAST(N'2023-05-10T00:00:00.000' AS DateTime), 0x0A)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (21, 9, 6, N'Producto U', N'Marca F', N'NOP888', 85, 2, 89.99, CAST(N'2023-07-21T00:00:00.000' AS DateTime), 0x0B)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (22, 4, 3, N'Producto V', N'Marca E', N'QRS999', 12.3, 1, 299.99, CAST(N'2023-11-05T00:00:00.000' AS DateTime), 0x0C)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (23, 2, 8, N'Producto W', N'Marca D', N'TUV000', 55, 2, 149.99, CAST(N'2024-01-15T00:00:00.000' AS DateTime), 0x0D)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (24, 7, 5, N'Producto X', N'Marca C', N'WXY111', 0, 1, 199.99, CAST(N'2023-10-04T00:00:00.000' AS DateTime), 0x0E)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (25, 6, 2, N'Producto Y', N'Marca B', N'ZAB222', 65.5, 2, 249.99, CAST(N'2023-12-23T00:00:00.000' AS DateTime), 0x0F)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (26, 3, 4, N'Producto Z', N'Marca A', N'CDE333', 0, 2, 189.99, CAST(N'2024-02-10T00:00:00.000' AS DateTime), 0x01)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (27, 8, 9, N'Producto AA', N'Marca B', N'FGH444', 40, 1, 129.99, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 0x02)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (28, 2, 7, N'Producto AB', N'Marca C', N'IJK555', 60, 2, 249.99, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 0x03)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (29, 9, 1, N'Producto AC', N'Marca D', N'LMN666', 20.5, 1, 149.99, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 0x04)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (30, 4, 6, N'Producto AD', N'Marca E', N'OPQ777', 0, 2, 199.99, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 0x05)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (31, 1, 1, N'Producto prueba', N'marca 1', N'556540', 10.6, 1, 10.5, CAST(N'2024-08-12T00:00:00.000' AS DateTime), 0x36)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (32, 1, 1, N'Producto Prueba', N'marca cualquiera', N'13245654', 12, 1, 12.5, CAST(N'2024-12-20T00:34:09.387' AS DateTime), 0xFF)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (33, 1, 1, N'Producto Prueba', N'marca cualquiera', N'13245654', 12, 1, 12.5, CAST(N'2024-12-20T00:42:25.517' AS DateTime), 0xFF)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (34, 1, 1, N'Producto Prueba', N'marca cualquiera', N'13245654', 12, 1, 12.5, CAST(N'2024-12-20T01:40:55.433' AS DateTime), 0xFF)
INSERT [dbo].[Productos] ([idProductos], [categoriaProductos_idCategoriaProductos], [usuarios_idUsuarios], [nombre], [marca], [codigo], [stock], [estados_idEstados], [precio], [fecha_creacion], [foto]) VALUES (35, 1, 1, N'Producto Prueba', N'marca cualquiera', N'13245654', 12, 1, 12.5, CAST(N'2024-12-20T01:41:17.010' AS DateTime), 0xFF)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (1, N'Admin')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (1, 1, 1, N'usuario1@example.com', N'Usuario Uno', N'password1', N'555-1001', CAST(N'1991-07-18' AS Date), CAST(N'2024-01-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (2, 2, 2, N'usuario2@example.com', N'Usuario Dos', N'password2', N'555-1002', CAST(N'1997-02-22' AS Date), CAST(N'2023-12-08T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (3, 2, 1, N'usuario3@example.com', N'Usuario Tres', N'password3', N'555-1003', CAST(N'1989-11-09' AS Date), CAST(N'2023-11-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (4, 2, 1, N'usuario4@example.com', N'Usuario Cuatro', N'password4', N'555-1004', CAST(N'1989-11-09' AS Date), CAST(N'2024-12-06T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (5, 1, 1, N'usuario5@example.com', N'Usuario Cinco', N'password5', N'555-1005', CAST(N'1993-04-11' AS Date), CAST(N'2023-12-09T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (6, 2, 2, N'usuario6@example.com', N'Usuario Seis', N'password6', N'555-1006', CAST(N'1990-06-01' AS Date), CAST(N'2024-08-16T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (7, 2, 1, N'usuario7@example.com', N'Usuario Siete', N'password7', N'555-1007', CAST(N'1993-04-11' AS Date), CAST(N'2024-06-26T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (8, 2, 1, N'usuario8@example.com', N'Usuario Ocho', N'password8', N'555-1008', CAST(N'1990-08-01' AS Date), CAST(N'2024-06-16T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (9, 2, 1, N'usuario9@example.com', N'Usuario Nueve', N'password9', N'555-1009', CAST(N'1993-04-11' AS Date), CAST(N'2024-07-06T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (10, 2, 1, N'usuario10@example.com', N'Usuario Diez', N'password10', N'555-1010', CAST(N'1993-04-11' AS Date), CAST(N'2024-05-10T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (11, 2, 1, N'correo@cualquiera.com', N'user test', N'123456789', N'12345678', CAST(N'2000-05-12' AS Date), CAST(N'2024-12-19T11:01:39.450' AS DateTime), 11)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (12, 2, 2, N'correo@cualquiera.com', N'user test', N'123456789', N'12345678', CAST(N'2000-05-12' AS Date), CAST(N'2024-12-19T11:05:08.777' AS DateTime), 11)
INSERT [dbo].[Usuarios] ([idUsuarios], [rol_idRol], [estados_idEstados], [correo_electronico], [nombre_completo], [password], [telefono], [fecha_nac], [fecha_creacion], [clientes_idClientes]) VALUES (13, 2, 2, N'correo@cualquiera.com', N'user test', N'123456789', N'12345678', CAST(N'2000-05-12' AS Date), CAST(N'2024-12-19T11:06:07.347' AS DateTime), 11)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD  CONSTRAINT [FK_estados_catProductos] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[CategoriaProductos] CHECK CONSTRAINT [FK_estados_catProductos]
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_catProductos] FOREIGN KEY([usuarios_idUsuarios])
REFERENCES [dbo].[Usuarios] ([idUsuarios])
GO
ALTER TABLE [dbo].[CategoriaProductos] CHECK CONSTRAINT [FK_usuarios_catProductos]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_estados_orden] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_estados_orden]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_orden] FOREIGN KEY([usuarios_idUsuarios])
REFERENCES [dbo].[Usuarios] ([idUsuarios])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_usuarios_orden]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_orden_ordenDetalles] FOREIGN KEY([orden_idOrden])
REFERENCES [dbo].[Orden] ([idOrden])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_orden_ordenDetalles]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_productos_ordenDetalles] FOREIGN KEY([productos_idProductos])
REFERENCES [dbo].[Productos] ([idProductos])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_productos_ordenDetalles]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_catProductos_productos] FOREIGN KEY([categoriaProductos_idCategoriaProductos])
REFERENCES [dbo].[CategoriaProductos] ([idCategoriaProductos])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_catProductos_productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_estados_productos] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_estados_productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_productos] FOREIGN KEY([usuarios_idUsuarios])
REFERENCES [dbo].[Usuarios] ([idUsuarios])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_usuarios_productos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_clientes_usuarios] FOREIGN KEY([clientes_idClientes])
REFERENCES [dbo].[Clientes] ([idClientes])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_clientes_usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_estados_usuarios] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_estados_usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_rol_usuarios] FOREIGN KEY([rol_idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_rol_usuarios]
GO
/****** Object:  StoredProcedure [dbo].[deleteOrder]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[deleteOrder]
  @idOrden INT,
  @idEstado INT -- Este parámetro representa el estado de eliminado
AS
BEGIN
  -- Actualizar el estado de la orden a 'eliminado' (por ejemplo, idEstadoEliminado = 3)
  UPDATE Orden
  SET estados_idEstados = @idEstado
  WHERE idOrden = @idOrden;
END;

exec sp_columns orden;
GO
/****** Object:  StoredProcedure [dbo].[getAllOrders]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[getAllOrders]
AS
BEGIN
  SELECT 
    o.*, 
    od.productos_idProductos, 
    od.cantidad, 
    od.precio, 
    od.subtotal 
  FROM Orden o
  LEFT JOIN OrdenDetalles od ON o.idOrden = od.orden_idOrden;
END;
GO
/****** Object:  StoredProcedure [dbo].[getOrderById]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[getOrderById]
  @idOrden integer
AS
BEGIN
  SELECT 
    o.*, 
    od.productos_idProductos, 
    od.cantidad, 
    od.precio, 
    od.subtotal 
  FROM Orden o
  LEFT JOIN OrdenDetalles od ON o.idOrden = od.orden_idOrden
  WHERE o.idOrden = @idOrden;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertOrden]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[insertOrden]
@idUsuarios int,
@idEstados int,
@nombre varchar(60),
@direccion varchar(545),
@telefono varchar(45),
@email varchar(45),
@fecha_entrega date,
@total_orden float,
@ordenDetalles nvarchar(max)
as
  begin
	declare @idOrden int;

	insert into Orden
	    (usuarios_idUsuarios, estados_idEstados, fecha_creacion, nombre_completo, 
		direccion, telefono, correo_electronico, fecha_entrega, total_orden)
	  values
		(@idUsuarios, @idEstados, GETDATE(), @nombre, @direccion, @telefono, @email, @fecha_entrega, @total_orden);

	SET @idOrden = SCOPE_IDENTITY();

	insert into OrdenDetalles
		(orden_idOrden, productos_idProductos, cantidad, precio, subtotal)
	select 
	@idOrden, 
	productos_idProductos, 
	cantidad, 
	precio, 
	cantidad * precio as subtotal 
	from OPENJSON(@ordenDetalles)
	with (
	productos_idProductos int,
	cantidad int,
	precio float,
	subtotal float
	);
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_crear_usuario]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[p_crear_usuario]
  @correo_electronico NVARCHAR(45),
  @nombre_completo NVARCHAR(45),
  @password NVARCHAR(256), -- Debería ser un hash
  @telefono NVARCHAR(45),
  @fecha_nac DATE
AS
BEGIN
    BEGIN TRY
        INSERT INTO Usuarios (
            rol_idRol,
            estados_idEstados,
            correo_electronico,
            nombre_completo,
            password,
            telefono,
            fecha_nac,
            fecha_creacion
        ) VALUES (
			2,
			2,
            @correo_electronico,
            @nombre_completo,
            @password,
            @telefono,
            @fecha_nac,
            CONVERT(VARCHAR, GETDATE(), 120) -- fecha_creacion actual
        );
        PRINT 'Usuario creado con éxito';
    END TRY
    BEGIN CATCH
        PRINT 'Error al crear usuario';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[p_delete_catProductos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[p_delete_catProductos]
  @idCategoriaProductos int,
  @estados_idEstados int
as
  begin 
	begin try
	  update CategoriaProductos set estados_idEstados=@estados_idEstados
		where idCategoriaProductos=@idCategoriaProductos;
	  print 'Categoría eliminada con exito';
	end try
	begin catch 
	  print 'Error al actualizar Categoría';
	  print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_delete_producto]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[p_delete_producto]
  @idProductos int,
  @estados_idEstados int
as
  begin
	begin try
		update Productos set estados_idEstados=@estados_idEstados
		where idProductos=@idProductos;
		print 'Campo eliminado con exito';
	end try
	begin catch
		print 'Error al eliminar campo';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_delete_usuario]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_delete_usuario]
  @idUsuarios int,
  @estados_idEstado int
as
  begin
	begin try
		update Usuarios 
		set 
			estados_idEstados=@estados_idEstado
		where idUsuarios = @idUsuarios;
		
	end try
	begin catch
		print 'Error al eliminar campo';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_catProductos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[p_insert_catProductos]
  @usuarios_idUsuarios int,
  @nombre varchar(45),
  @estados_idEstados int
as
  begin
	begin try
		insert into CategoriaProductos(usuarios_idUsuarios, nombre, estados_idEstados, fecha_creacion) 
			values(@usuarios_idUsuarios, @nombre, @estados_idEstados, GETDATE());
		print 'Categoría de productos ingresada con exito';
	end try
	begin catch
		print 'Error al ingresar categoría de productos';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_clientes]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_insert_clientes]
  @razon_social varchar(245),
  @nombre_comercial varchar(34),
  @direccion_entrega varchar(45),
  @telefono varchar(45),
  @email varchar(45)
as
  begin
	begin try
		insert into Clientes values(@razon_social, @nombre_comercial, @direccion_entrega, @telefono, @email);
		print 'Cliente ingresado con exito';
	end try
	begin catch
		print 'Error al ingresar Cliente';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_estados]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_insert_estados]
  @nombre varchar(45)
as
  begin
	begin try
		insert into estados values(@nombre);
		print 'Estado ingresado con exito';
	end try
	begin catch
		print 'Error al insertar Estado';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_orden]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_insert_orden]
  @usuarios_idUsuarios int,
  @estados_idEstados int,
  @nombre_completo varchar(60),
  @direccion varchar(545),
  @telefono varchar(45),
  @correo_electronico varchar(45),
  @fecha_entrega date,
  @total_orden float
as
  begin
	begin try
		insert into Orden values(@usuarios_idUsuarios, @estados_idEstados, GETDATE(), @nombre_completo, 
		@direccion, @telefono, @correo_electronico, @fecha_entrega, @total_orden);
		print 'Orden ingresada con exito';
	end try
	begin catch
		print 'Error al ingresar Orden';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_ordenDetalles]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_insert_ordenDetalles]
  @orden_idOrden int,
  @productos_idProductos int,
  @cantidad int,
  @precio float,
  @subtotal float
as
  begin
	begin try
		insert into OrdenDetalles values(@orden_idOrden, @productos_idProductos, @cantidad, @precio, @subtotal);
		print 'Detalle de orden ingresada con exito';
	end try
	begin catch
		print 'Error al ingresar detalle de orden';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_productos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[p_insert_productos]
  @categoriaProductos_idCategoriaProductos int,
  @usuarios_idUsuarios int,
  @nombre varchar(45),
  @marca varchar(45),
  @codigo varchar(45),
  @stock float,
  @estados_idEstados int,
  @precio float,
  @foto binary
as
  begin
	begin try
		insert into productos values(@categoriaProductos_idCategoriaProductos, @usuarios_idUsuarios, @nombre, @marca, @codigo,
				@stock, @estados_idEstados, @precio, GETDATE(), @foto);
		print 'Producto ingresado con exito';
	end try
	begin catch
		print 'Error al ingresar Producto';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_rol]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_insert_rol]
  @nombre varchar(45)
as
  begin
	begin try
		insert into rol values(@nombre);
		print 'Rol ingresado con exito';
	end try
	begin catch
		print 'Error al insertar Rol';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_insert_usuarios]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_insert_usuarios]
  @rol_idRol int,
  @estados_idEstados int,
  @email varchar(45),
  @nombre_completo varchar(45),
  @password varchar(45),
  @telefono varchar(45),
  @fecha_nac date,
  @clientes_idClientes int
as
  begin
	begin try
		insert into Usuarios(rol_idRol, estados_idEstados, correo_electronico, nombre_completo, password, telefono, fecha_nac, fecha_creacion, clientes_idClientes) 
			values(@rol_idRol, @estados_idEstados, @email, @nombre_completo, @password, @telefono, @fecha_nac, GETDATE(), @clientes_idClientes);
		print 'Usuario ingresado con exito';
	end try
	begin catch
		print 'Error al ingresar Usuario';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_catProductos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[p_update_catProductos]
  @idCategoriaProductos int,
  @usuarios_idUsuarios int,
  @nombre varchar(45),
  @estados_idEstados int
as
  begin
	begin try
		update CategoriaProductos set usuarios_idUsuarios=@usuarios_idUsuarios, nombre=@nombre, 
					estados_idEstados=@estados_idEstados
			where idCategoriaProductos = @idCategoriaProductos;
		print 'Categoría actualizada con exito';
	end try
	begin catch
		print 'Error al actualizar Categoría';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_clientes]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_update_clientes]
  @idClientes int,
  @razon_social varchar(245),
  @nombre_comercial varchar(34),
  @direccion_entrega varchar(45),
  @telefono varchar(45),
  @email varchar(45)
as
  begin
	begin try
		update Clientes set razon_social = @razon_social, nombre_comercial = @nombre_comercial, 
			direccion_entrega = @direccion_entrega, telefono = @telefono, correo_electronico = @email 
			where idClientes = @idClientes;
		print 'Cliente actualizado con exito';
	end try
	begin catch
		print 'Error al actualizar Cliente';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_estado]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_update_estado]
  @idEstados int,
  @nombre varchar(45)
as
  begin
	begin try
		update Estados set nombre = @nombre where idEstados = @idEstados;
		print 'Estado actualizado con exito';
	end try
	begin catch
		print 'Error al actualizar Estado';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_orden]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_update_orden]
  @idOrden int,
  @usuarios_idUsuarios int,
  @estados_idEstados int,
  @fecha_creacion datetime,
  @nombre_completo varchar(60),
  @direccion varchar(545),
  @telefono varchar(45),
  @correo_electronico varchar(45),
  @fecha_entrega date,
  @total_orden float
as
  begin
	begin try
		update Orden set usuarios_idUsuarios = @usuarios_idUsuarios, estados_idEstados = @estados_idEstados, 
		fecha_creacion = @fecha_creacion, nombre_completo = @nombre_completo, direccion = @direccion, telefono = @telefono, 
		correo_electronico = @correo_electronico, fecha_entrega = @fecha_entrega, total_orden = @total_orden 
			where idOrden=@idOrden;
		print 'Orden actualizada con exito';
	end try
	begin catch
		print 'Error al actualizar Orden';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_ordenDetalles]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_update_ordenDetalles]
  @idOrdenDetalles int,
  @orden_idOrden int,
  @productos_idProductos int,
  @cantidad int,
  @precio float,
  @subtotal float
as
  begin
	begin try
		update OrdenDetalles set orden_idOrden = @orden_idOrden, productos_idProductos = @productos_idProductos, 
					cantidad = @cantidad, precio = @precio, subtotal = @subtotal 
			where idOrdenDetalles = @idOrdenDetalles;
		print 'Detalle actualizado con exito';
	end try
	begin catch
		print 'Error al actualizar detalle';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_productos]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[p_update_productos]
  @idProductos int,
  @categoriaProductos_idCategoriaProductos int,
  @usuarios_idUsuarios int,
  @nombre varchar(45),
  @marca varchar(45),
  @codigo varchar(45),
  @stock float,
  @estados_idEstados int,
  @precio float,
  @foto binary
as
  begin
	begin try
		update Productos set categoriaProductos_idCategoriaProductos=@categoriaProductos_idCategoriaProductos, usuarios_idUsuarios=usuarios_idUsuarios,
			nombre=@nombre, marca=@marca, codigo=@codigo, stock=@stock, estados_idEstados=@estados_idEstados, precio=@precio, foto=@foto
		where idProductos=@idProductos;
		print 'Producto actualizado con exito';
	end try
	begin catch
		print 'Error al actualizar Producto';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_rol]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[p_update_rol]
  @idRol int,
  @nombre varchar(45)
as
  begin
	begin try
		update rol set nombre = @nombre where idRol = @idRol;
		print 'Rol actualizado con exito';
	end try
	begin catch
		print 'Error al actualizar Rol';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[p_update_usuarios]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[p_update_usuarios]
  @idUsuarios int,
  @rol_idRol int = null,
  @estados_idEstados int = null,
  @nombre_completo varchar(45) = null,
  @password varchar(45) = null,
  @telefono varchar(45) = null
as
  begin
	begin try
		update Usuarios 
		set 
			rol_idRol=coalesce(@rol_idRol, rol_idRol), 
			estados_idEstados=COALESCE(@estados_idEstados, estados_idEstados), 
			nombre_completo=COALESCE(@nombre_completo, nombre_completo),
			password=COALESCE(@password, password), 
			telefono=COALESCE(@telefono, telefono)
			where idUsuarios=@idUsuarios;
		print 'Usuario actualizado con exito';
	end try
	begin catch
		print 'Error al actualizar Usuario';
		print error_message();
	end catch
  end;
GO
/****** Object:  StoredProcedure [dbo].[updateOrder]    Script Date: 22/12/2024 11:20:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[updateOrder]
  @idOrden INT,
  @idUsuarios INT,
  @idEstados INT,
  @nombre VARCHAR(60),
  @direccion VARCHAR(545),
  @telefono VARCHAR(45),
  @email VARCHAR(45),
  @fecha_entrega DATE,
  @total_orden FLOAT,
  @ordenDetalles NVARCHAR(MAX)
AS
BEGIN
  UPDATE Orden
  SET 
    usuarios_idUsuarios = @idUsuarios, 
    estados_idEstados = @idEstados, 
    nombre_completo = @nombre, 
    direccion = @direccion, 
    telefono = @telefono, 
    correo_electronico = @email, 
    fecha_entrega = @fecha_entrega, 
    total_orden = @total_orden
  WHERE idOrden = @idOrden;

  DELETE FROM OrdenDetalles
  WHERE orden_idOrden = @idOrden;

  INSERT INTO OrdenDetalles
    (orden_idOrden, productos_idProductos, cantidad, precio, subtotal)
  SELECT 
    @idOrden, 
    productos_idProductos, 
    cantidad, 
    precio, 
    cantidad * precio AS subtotal
  FROM OPENJSON(@ordenDetalles)
  WITH (
    productos_idProductos INT,
    cantidad INT,
    precio FLOAT,
    subtotal FLOAT
  );
END;
GO
USE [master]
GO
ALTER DATABASE [GDA00407_OT_MarvinAlquijay] SET  READ_WRITE 
GO
