USE [Sistema de Inscripcion]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[ID_Estado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[ID_Estado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estados] ON
INSERT [dbo].[Estados] ([ID_Estado], [Nombre]) VALUES (1, N'Pre-Inscripto')
INSERT [dbo].[Estados] ([ID_Estado], [Nombre]) VALUES (2, N'Inscripto')
INSERT [dbo].[Estados] ([ID_Estado], [Nombre]) VALUES (3, N'Cancelado')
SET IDENTITY_INSERT [dbo].[Estados] OFF
/****** Object:  Table [dbo].[Condiciom]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condiciom](
	[ID_Condicion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Condiciom] PRIMARY KEY CLUSTERED 
(
	[ID_Condicion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Condiciom] ON
INSERT [dbo].[Condiciom] ([ID_Condicion], [Descripcion]) VALUES (1, N'Regular')
INSERT [dbo].[Condiciom] ([ID_Condicion], [Descripcion]) VALUES (2, N'Libre')
SET IDENTITY_INSERT [dbo].[Condiciom] OFF
/****** Object:  Table [dbo].[Carrera]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrera](
	[ID_Carrera] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Fija] [char](10) NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[ID_Carrera] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Carrera] ON
INSERT [dbo].[Carrera] ([ID_Carrera], [Nombre], [Fija]) VALUES (1, N'Desarrollo de Software', N'1         ')
INSERT [dbo].[Carrera] ([ID_Carrera], [Nombre], [Fija]) VALUES (2, N'Tecnico en Turismo', N'1         ')
INSERT [dbo].[Carrera] ([ID_Carrera], [Nombre], [Fija]) VALUES (3, N'Guia de Trecking', N'0         ')
INSERT [dbo].[Carrera] ([ID_Carrera], [Nombre], [Fija]) VALUES (4, N'Medicinaaa', NULL)
SET IDENTITY_INSERT [dbo].[Carrera] OFF
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[ID_Tipo_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tipo_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Tipo_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] ON
INSERT [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario], [Nombre]) VALUES (1, N'Secretaria')
INSERT [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario], [Nombre]) VALUES (2, N'Profesor')
INSERT [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario], [Nombre]) VALUES (3, N'Alumno')
INSERT [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario], [Nombre]) VALUES (4, N'Preceptor')
INSERT [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario], [Nombre]) VALUES (5, N'Director')
INSERT [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario], [Nombre]) VALUES (6, N'Administrador')
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] OFF
/****** Object:  Table [dbo].[Usuarios]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[ID_Tipo_Usuario] [int] NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Contraseña] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (1, 6, N'Javier', N'diaz123456', N'javiediaz201581@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (2, 6, N'Maxi', N'Rossano123', N'maxi@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (3, 3, N'Javier', N'42051037', N'javiediaz201581@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (4, 3, N'', N'', N'sebacorrea@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (5, 3, N'Pablo', N'30123123', N'pablo@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (6, 3, N'Carlos', N'30456456', N'carlos@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (7, 3, N'Alguien', N'40200300', N'nadie.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (9, 3, N'Alguien', N'40200300', N'nadie.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (10, 3, N'Alguien', N'40200300', N'nadie.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (11, 3, N'Nadie', N'10203040', N'alguien@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (12, 3, N'hola', N'42023021', N'hola@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (13, 2, N'Paco', N'12345678', N'paco@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (14, 1, N'Pepe', N'1234567', N'pepe@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (15, 1, N'Pepa', N'111', N'pepe@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (16, 1, N'pepe1', N'111', N'pepe@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (17, 3, N'', N'', N'')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (18, 3, N'', N'', N'')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (19, 3, N'', N'', N'')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (20, 3, N'', N'', N'')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (22, 2, N'jorgito', N'456789', N'jorge@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (23, 2, N'El Jorge', N'12457889', N'jorge@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (24, 2, N'Jorgee', N'12457889', N'jorge@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (25, 2, N'Le Joege', N'12457889', N'jorge@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (26, 2, N'pepito', N'45123456', N'pepe@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (27, 2, N'pepee', N'45123456', N'pepe@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (28, 2, N'pep', N'45123456', N'pepe@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (29, 3, N'Juan', N'11122233', N'juan@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (30, 3, N'pedrito', N'1234156', N'pedro@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (31, 3, N'pedriii', N'11122233', N'pedrooo@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (32, 2, N'Lucas', N'111', N'lucas@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (33, 2, N'Lucasss', N'111', N'lucas@gmail.com')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (34, 3, N'', N'', N'')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (39, 2, N'a', N'122', N'a')
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Tipo_Usuario], [Usuario], [Contraseña], [Mail]) VALUES (40, 6, N'Admin', N'admin', N'Admin@gmail.com')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  StoredProcedure [dbo].[InseetTipoUsuario]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InseetTipoUsuario] @Nombre nvarchar(50)
as
insert into Tipo_Usuario (Nombre) values (@Nombre)
GO
/****** Object:  StoredProcedure [dbo].[InsertEstado]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertEstado] @Nombre nvarchar(50)
as
insert into Estados (Nombre) values (@Nombre)
GO
/****** Object:  StoredProcedure [dbo].[InsertCondicion]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertCondicion] @Descripcion nvarchar(50)
as
insert into Condiciom (Descripcion) values (@Descripcion)
GO
/****** Object:  StoredProcedure [dbo].[InsertCarrera]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	procedure [dbo].[InsertCarrera] @Nombre nvarchar(50), @Fija nvarchar(10)
as	
insert into Carrera(Nombre ,Fija) values (@Nombre , @Fija);
GO
/****** Object:  Table [dbo].[MesMesa]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesMesa](
	[ID_MesMesa] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[ID_Carrera] [int] NOT NULL,
	[Fecha_Inscripcion_Desde] [date] NULL,
	[Fecha_Iscripcion_Hasta] [date] NULL,
	[Fecha_Confirm_incrip_Desde] [date] NULL,
	[Fecha_Confirm_incrip_Hasta] [date] NULL,
	[Fecha_Inicio_Mesa_Desde] [date] NULL,
	[Fecha_Inicio_Mesa_Hasta] [date] NULL,
 CONSTRAINT [PK_MesMesa] PRIMARY KEY CLUSTERED 
(
	[ID_MesMesa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MesMesa] ON
INSERT [dbo].[MesMesa] ([ID_MesMesa], [Descripcion], [ID_Carrera], [Fecha_Inscripcion_Desde], [Fecha_Iscripcion_Hasta], [Fecha_Confirm_incrip_Desde], [Fecha_Confirm_incrip_Hasta], [Fecha_Inicio_Mesa_Desde], [Fecha_Inicio_Mesa_Hasta]) VALUES (7, N'Examenes Regulares y Libres JULIO 2019', 1, CAST(0xD83F0B00 AS Date), CAST(0xDD3F0B00 AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[MesMesa] ([ID_MesMesa], [Descripcion], [ID_Carrera], [Fecha_Inscripcion_Desde], [Fecha_Iscripcion_Hasta], [Fecha_Confirm_incrip_Desde], [Fecha_Confirm_incrip_Hasta], [Fecha_Inicio_Mesa_Desde], [Fecha_Inicio_Mesa_Hasta]) VALUES (8, N'Examenes Regulares y Libres JULIO 2019', 2, CAST(0xD83F0B00 AS Date), CAST(0xDD3F0B00 AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[MesMesa] ([ID_MesMesa], [Descripcion], [ID_Carrera], [Fecha_Inscripcion_Desde], [Fecha_Iscripcion_Hasta], [Fecha_Confirm_incrip_Desde], [Fecha_Confirm_incrip_Hasta], [Fecha_Inicio_Mesa_Desde], [Fecha_Inicio_Mesa_Hasta]) VALUES (19, N'Examenes Regulares y Libres Noviembre y Diciembre ', 1, CAST(0x6E400B00 AS Date), CAST(0x75400B00 AS Date), CAST(0x75400B00 AS Date), CAST(0x7A400B00 AS Date), CAST(0x89400B00 AS Date), CAST(0x8F400B00 AS Date))
INSERT [dbo].[MesMesa] ([ID_MesMesa], [Descripcion], [ID_Carrera], [Fecha_Inscripcion_Desde], [Fecha_Iscripcion_Hasta], [Fecha_Confirm_incrip_Desde], [Fecha_Confirm_incrip_Hasta], [Fecha_Inicio_Mesa_Desde], [Fecha_Inicio_Mesa_Hasta]) VALUES (20, N'Fecha Febrero', 1, CAST(0xCE400B00 AS Date), CAST(0xDA400B00 AS Date), CAST(0xD3400B00 AS Date), CAST(0xD5400B00 AS Date), CAST(0xDB400B00 AS Date), CAST(0xE3400B00 AS Date))
SET IDENTITY_INSERT [dbo].[MesMesa] OFF
/****** Object:  StoredProcedure [dbo].[InsertMesMesa]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	procedure [dbo].[InsertMesMesa] @Descripcion nvarchar(50), @ID_Carrera int, @Fecha_Inscripcion_Desde date, @Fecha_Inscripcion_Hasta date, @Fecha_Confirm_incrip_Desde date, @Fecha_Confirm_incrip_Hasta date, @Fecha_Inicio_Mesa_Desde date, @Fecha_Inicio_Mesa_Hasta date
as	
insert into MesMesa (Descripcion, ID_Carrera, Fecha_Inscripcion_Desde, Fecha_Iscripcion_Hasta, Fecha_Confirm_incrip_Desde, Fecha_Confirm_incrip_Hasta, Fecha_Inicio_Mesa_Desde, Fecha_Inicio_Mesa_Hasta) values (@Descripcion , @ID_Carrera, @Fecha_Inscripcion_Desde, @Fecha_Inscripcion_Hasta, @Fecha_Confirm_incrip_Desde, @Fecha_Confirm_incrip_Hasta, @Fecha_Inicio_Mesa_Desde, @Fecha_Inicio_Mesa_Hasta);
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[ID_Alumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[DNI] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Celular] [nvarchar](50) NULL,
	[ID_Usuario] [int] NULL,
	[Aprobado] [bit] NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (1, N'Javier', N'Diaz', N'42051037', N'javierdiaz201581@gmail.com', N'3546435666', 1, 1)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (2, N'Javier', N'Diaz', N'42051037', N'javierdiaz201581@gmail.com', N'3546435666', 3, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (3, N'Maximiliano', N'Rossano', N'31070706', N'xpcmax@hotmail.com', N'3546478234', 2, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (4, N'Sebastian', N'Correa', N'11223344', N'sebacorrea@gmail.com', N'3546123444', NULL, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (5, N'Hola', N'Chau', N'42023021', N'hola.com', N'4', 12, 1)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (6, N'Juan', N'Perez', N'11122233', N'juan@gmail.com', N'12345678', 29, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (7, N'Pedro', N'lopez', N'1231213', N'pedro@gmail.com', N'12345678', 30, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (8, N'Pedro', N'lopez', N'11122233', N'pedrooo@gmail.com', N'12345678', 31, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario], [Aprobado]) VALUES (9, N'', N'', N'', N'', N'', 34, NULL)
SET IDENTITY_INSERT [dbo].[Alumno] OFF
/****** Object:  Table [dbo].[Profesor]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[ID_Profesor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[DNI] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[ID_Usuario] [int] NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[ID_Profesor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Profesor] ON
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (1, N'Juan', N'Garcia', N'13', N'juan@gmail.com', N'12', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (2, N'Cecilia', N'Piombo', N'213', N'cecilia@gmail.com', N'123', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (3, NULL, N'Farias', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (4, NULL, N'Zavala', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (5, NULL, N'Benoit', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (6, NULL, N'Bozzo', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (7, NULL, N'Kufer', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (8, NULL, N'D´Andrea', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (9, NULL, N'Correa', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (10, NULL, N'Aronna', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (11, NULL, N'Gonzalez', NULL, NULL, NULL, NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (13, N'Lis Silvana', N'Maldonado', N'34414149', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (14, N'Maricruz', N'Marinelich', N'13688831', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (15, N'Diego', N'Caliari', N'22785971', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (16, N'Maria Belen', N'Cismondi', N'20531252', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (17, N'Nora', N'Benoit', N'13498176', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (18, N'Luis', N'Garcia', N'20621352', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (19, N'Ivana', N'Tabares', N'25381344', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (20, N'Juan Sebastian', N'Cantarero', N'27959536', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (21, N'Maria de las Mercedes', N'Jaureguialzo', N'', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (22, N'Braian', N'Solis', N'', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (23, N'Leandro', N'Bienaime', N'', N'', N'0', NULL)
INSERT [dbo].[Profesor] ([ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (24, N'jorge', N'lopez', N'12', N'a', N'12', 39)
SET IDENTITY_INSERT [dbo].[Profesor] OFF
/****** Object:  StoredProcedure [dbo].[InsertUsuario]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertUsuario] @Usuario nvarchar(50), @Contraseña nvarchar(50), @Mail nvarchar(50), @ID_Tipo_Usuario int,
@idcrear int = null output
as
insert into Usuarios (Usuario, Contraseña, Mail, ID_Tipo_Usuario) values (@Usuario, @Contraseña, @Mail,@ID_Tipo_Usuario);
set @idcrear = SCOPE_IDENTITY();
return @idcrear
GO
/****** Object:  View [dbo].[UsuAlumnosConfirm]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UsuAlumnosConfirm] as
(select Usuario, Contraseña, Aprobado from Usuarios join Alumno on Usuarios.ID_Usuario = Alumno.ID_Usuario)
GO
/****** Object:  View [dbo].[Tribunal_Apellidos]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Tribunal_Apellidos] as
(select p.Apellido as Titular, pp.Apellido as Vocal1, ppp.Apellido as Vocal2
from ((Tribunal t join Profesor p on p.ID_Profesor = t.ID_Profesor_Titular) join Profesor pp on pp.ID_Profesor = t.ID_Profesor_Vocal1) join Profesor ppp on ppp.ID_Profesor = t.ID_Profesor_Vocal2)
GO
/****** Object:  UserDefinedFunction [dbo].[ProfesorXCarrera]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ProfesorXCarrera] (@idcarrera int)
returns table
as
return (select Profesor.Apellido, Carrera.Nombre 
from Profesor join Carrera on Profesor.ID_Profesor != Carrera.ID_Carrera
where ID_Carrera = @idcarrera)
GO
/****** Object:  View [dbo].[Alumnos_Regulares]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Alumnos_Regulares] as
(select Carrera.Nombre as Carrera, Alumno.Nombre as Alumno, Condiciom.Descripcion
from Carrera, Alumno, Condiciom
where Condiciom.Descripcion like '%Regular%')
GO
/****** Object:  StoredProcedure [dbo].[InsertProfesor]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	procedure [dbo].[InsertProfesor] @Nombre nvarchar(50), @Apellido nvarchar(50), @DNI nvarchar (50), @Mail nvarchar (50), @Telefono nvarchar(50), @ID_Usuario int,
@idcrear int = null output
as	
insert into Profesor (Nombre ,Apellido, DNI, Mail, Telefono, ID_Usuario) values (@Nombre , @Apellido, @DNI, @Mail, @Telefono, @ID_Usuario);
set @idcrear = SCOPE_IDENTITY();
return @idcrear
GO
/****** Object:  StoredProcedure [dbo].[InsertAlumno]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	procedure [dbo].[InsertAlumno]
@Nombre nvarchar(50), @Aoellido nvarchar(50), @DNI nvarchar(50), @Mail nvarchar(50), @Celular nvarchar(50), @ID_Usuario int,
@idcrear int = null output
as	
insert into Alumno(Nombre, Apellido, DNI, Mail, Celular, ID_Usuario) values (@Nombre , @Aoellido, @DNI, @Mail, @Celular, @ID_Usuario);
set @idcrear = SCOPE_IDENTITY();
return @idcrear
GO
/****** Object:  Table [dbo].[AlumnoXCarrera]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoXCarrera](
	[ID_AlumnoxCarrera] [int] IDENTITY(1,1) NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[ID_Carrera] [int] NOT NULL,
 CONSTRAINT [PK_AlumnoXCarrera] PRIMARY KEY CLUSTERED 
(
	[ID_AlumnoxCarrera] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlumnoXCarrera] ON
INSERT [dbo].[AlumnoXCarrera] ([ID_AlumnoxCarrera], [ID_Alumno], [ID_Carrera]) VALUES (1, 8, 1)
INSERT [dbo].[AlumnoXCarrera] ([ID_AlumnoxCarrera], [ID_Alumno], [ID_Carrera]) VALUES (2, 9, 1)
SET IDENTITY_INSERT [dbo].[AlumnoXCarrera] OFF
/****** Object:  Table [dbo].[Materia]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[ID_Materia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[ID_Carrera] [int] NOT NULL,
	[Curso] [nchar](10) NULL,
	[ID_Profesor] [int] NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[ID_Materia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Materia] ON
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (1, N'Matematica y Logica', 1, N'1         ', 1)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (2, N'Sistema y Organizaciones', 1, N'1         ', 2)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (3, N'Ingles', 1, N'1         ', 4)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (4, N'Programacion I', 1, N'1         ', 6)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (5, N'Lengua y Comunicacion', 1, N'1         ', 7)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (6, N'Arquitectura de Computadoras', 1, N'1         ', 11)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (7, N'Sistemas Operativos', 1, N'2         ', 11)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (8, N'Modelado de Sistemas', 1, N'2         ', 9)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (9, N'Bases de Datos', 1, N'2         ', 2)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (10, N'Matematica Aplicada', 1, N'2         ', 3)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (11, N'Practica Profecionalizante I', 1, N'2         ', 2)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (12, N'Programacion II', 1, N'2         ', 10)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (13, N'Practica Profecionalizante II', 1, N'3         ', 2)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (14, N'Ingenieria de Software', 1, N'3         ', 6)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (15, N'Validacion y Verificacion de Programas', 1, N'Tercero   ', 6)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (16, N'Etica y Deontologia Profecional', 1, N'3         ', 9)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (17, N'Redes', 1, N'3         ', 11)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (18, N'Interfaz de Usuario', 1, N'3         ', 11)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (19, N'Programacion III', 1, N'3         ', 10)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (20, N'Ingles I', 2, N'1         ', 17)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (21, N'Portugues I', 2, N'1         ', 19)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (22, N'Introduccion al Turismo', 2, N'1         ', 16)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (23, N'Contexto Sociocultural del Turismo', 2, N'1         ', 21)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (24, N'Comunicacion Organizacion y Gestion de Empresas', 2, N'1         ', 18)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (25, N'Informacion Turistica I', 2, N'1         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (26, N'Practica Profecionalizante I', 2, N'1         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (27, N'Ingles II', 2, N'2         ', 17)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (28, N'Portugues II', 2, N'2         ', 19)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (29, N'Planificacion Turistica 1', 2, N'2         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (31, N'Organizacion y Gestion de Empresas de Turismo', 2, N'2         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (32, N'Informacion Turistica II', 2, N'2         ', 13)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (33, N'Servicios de Viaje', 2, N'2         ', 16)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (34, N'Servicios de Alojamiento', 2, N'2         ', 20)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (35, N'Servicios de Gastronomia', 2, N'2         ', 14)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (36, N'Practica Profecionalizante II', 2, N'2         ', 20)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (37, N'Turismo y Sustentabilidad', 2, N'2         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (38, N'Ingles III', 2, N'3         ', 17)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (39, N'Planificacion Turistica II', 2, N'3         ', 23)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (40, N'Servicios de Viaje II', 2, N'3         ', 13)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (41, N'Servicios de Alojamiento II', 2, N'3         ', 16)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (42, N'Servicios de Gastronomia II', 2, N'3         ', 14)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (43, N'Organizacion de Eventos', 2, N'3         ', 16)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (44, N'Sistemas Informaticos', 2, N'3         ', 22)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (45, N'Comercializacion de Productos y Servicios Turistic', 2, N'3         ', 18)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (46, N'Practica Profecionalizante III', 2, N'3         ', 16)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (47, N'Trabajo Final', 2, N'3         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (49, N'Materia 1', 3, N'1         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (52, N'Materia 2 ', 3, N'2         ', 15)
INSERT [dbo].[Materia] ([ID_Materia], [Nombre], [ID_Carrera], [Curso], [ID_Profesor]) VALUES (53, N'Materia Prueba', 1, N'2         ', 24)
SET IDENTITY_INSERT [dbo].[Materia] OFF
/****** Object:  UserDefinedFunction [dbo].[MAteriasDeCarrera]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[MAteriasDeCarrera](@NombreCarrera nvarchar(50))
Returns Table
AS
       Return (Select Materia.Curso as Curso, Materia.Nombre as Materia
       From Materia join Carrera on Materia.ID_Carrera = Carrera.ID_Carrera
       WHERE Carrera.Nombre like '%' + @NombreCarrera + '%' );
GO
/****** Object:  View [dbo].[Materias_Completas]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Materias_Completas] as 
(select c.Nombre as Carrera, m.Curso, m.Nombre as Materia, p.Apellido as Profesor, c.ID_Carrera, ID_Materia, p.ID_Profesor
from (carrera c join Materia m on c.ID_Carrera = m.ID_Carrera) join Profesor p on p.ID_Profesor = m.ID_Profesor)
GO
/****** Object:  StoredProcedure [dbo].[InsertMaterias]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	procedure [dbo].[InsertMaterias] @Nombre nvarchar(50), @ID_Carrera int, @Curso nvarchar(10), @ID_Profesor int
as	
insert into Materia (Nombre ,ID_Carrera, Curso, ID_Profesor) values (@Nombre ,@ID_Carrera, @Curso, @ID_Profesor);
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[ID_Mesa] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[ID_Materia] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Hora] [nchar](10) NULL,
	[ID_MesMesa] [int] NOT NULL,
	[ID_ProfesorTitular] [int] NULL,
	[ID_ProfesorVocal1] [int] NULL,
	[ID_ProfesorVocal2] [int] NULL,
 CONSTRAINT [PK_Mesa] PRIMARY KEY CLUSTERED 
(
	[ID_Mesa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mesa] ON
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (1, N'Matematica y Logica', 1, CAST(0xD93F0B00 AS Date), N'17:00     ', 7, 1, 2, 3)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (2, N'Ingles I', 2, CAST(0xF13F0B00 AS Date), N'17:00     ', 7, 4, 5, 6)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (3, N'Lengua', 5, CAST(0xF43F0B00 AS Date), N'17:00     ', 8, 7, 8, 9)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (4, N'Software', 1, CAST(0x73400B00 AS Date), N'18:00     ', 19, 1, 9, 10)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (5, N'Software', 4, CAST(0x7C400B00 AS Date), N'18:00     ', 7, 6, 10, 2)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (6, N'Software', 7, CAST(0x76400B00 AS Date), N'18:00     ', 19, 11, 9, 6)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (7, N'Software', 36, CAST(0x7A400B00 AS Date), N'18:00     ', 19, 2, 6, 10)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (8, N'', 6, CAST(0xDA400B00 AS Date), N'18:00     ', 20, 11, 1, 19)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (9, N'', 9, CAST(0xDB400B00 AS Date), N'18:00     ', 20, 2, 1, 16)
INSERT [dbo].[Mesa] ([ID_Mesa], [Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (10, N'', 53, CAST(0x67410B00 AS Date), N'18:00     ', 20, 24, 1, 14)
SET IDENTITY_INSERT [dbo].[Mesa] OFF
/****** Object:  UserDefinedFunction [dbo].[BuscarMateria]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[BuscarMateria](@ID_Materia int)
Returns Table
AS
       Return (Select Materia.Nombre as Materia, Curso, Carrera.Nombre as Carrera, Profesor.Apellido as Profesor
       From (Materia join Carrera on Materia.ID_Carrera = Carrera.ID_Carrera) join Profesor on Materia.ID_Profesor = Profesor.ID_Profesor
       WHERE Materia.ID_Materia = @ID_Materia )
GO
/****** Object:  UserDefinedFunction [dbo].[BuscarIDMateria]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[BuscarIDMateria](@Nombre nvarchar(50))
Returns int
as
       Begin
       declare @idmateria int;
       Select @idmateria = ID_Materia
       From Materia 
         WHERE Materia.Nombre like '%' + @Nombre + '%'
         return @idmateria
         end
GO
/****** Object:  Table [dbo].[AlumnoXMateria]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoXMateria](
	[ID_AlumnoXMateria] [int] NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[ID_Materia] [int] NOT NULL,
	[Año] [int] NULL,
	[Condicion] [nchar](10) NULL,
 CONSTRAINT [PK_AlumnoXMateria] PRIMARY KEY CLUSTERED 
(
	[ID_AlumnoXMateria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ProfesorXCursoyCarrera]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ProfesorXCursoyCarrera](@Curso nvarchar(10), @Carrera nvarchar(10))
returns table
as
return (select Profesor.Apellido as Profesor, Materia.Curso as Curso, Carrera.Nombre as Carrera
from (Materia join Profesor on Materia.ID_Profesor = Profesor.ID_Profesor) join Carrera on Carrera.ID_Carrera = Materia.ID_Carrera
where Materia.Curso = @Curso and Materia.ID_Carrera = @Carrera)
GO
/****** Object:  StoredProcedure [dbo].[MostrarCarreras]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostrarCarreras] 
as
select * from Carrera
select distinct ID_Carrera, Curso from Materia order by ID_Carrera, Curso
GO
/****** Object:  StoredProcedure [dbo].[VerMateriasxid]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VerMateriasxid]  @id int
as 
select * from Materias_Completas
where ID_Materia = @id
GO
/****** Object:  StoredProcedure [dbo].[VerMateriasxcursoycarrera]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VerMateriasxcursoycarrera]  @idcarrera int, @curso int
as 
select * from Materias_Completas
where Curso = @curso and ID_Carrera = @idcarrera
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 04/05/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[ID_Inscripcion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[Fecha] [nchar](10) NULL,
	[Hora] [nchar](10) NULL,
	[ID_Mesa] [int] NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[ID_Estado] [int] NOT NULL,
	[Obsevaciones] [nvarchar](max) NULL,
	[ID_Condicion] [int] NOT NULL,
	[Confirmado] [bit] NULL,
	[Cancelado] [bit] NULL,
 CONSTRAINT [PK_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[ID_Inscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] ON
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (37, 1, N'2019-07-03', N'17:20     ', 1, 1, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (38, 1, N'2019-07-03', N'17:20     ', 1, 1, 2, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (39, 1, N'2019-07-04', N'1:45      ', 1, 3, 1, N' ', 2, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (40, 1, N'14/11/2019', N'5:55      ', 6, 1, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (42, 3, N'20/11/2019', N'5:35 p. m.', 7, 1, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (43, 3, N'20/11/2019', N'5:36 p. m.', 7, 1, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (44, 3, N'20/11/2019', N'5:38 p. m.', 7, 1, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (52, 3, N'20/11/2019', N'1:11 p. m.', 7, 1, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (62, 3, N'02/12/2019', N'9:19 p. m.', 7, 2, 1, N' ', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (69, 3, N'01/12/2019', N'14:29     ', 6, 2, 1, N'', 2, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (71, 3, N'02/12/2019', N'09:14     ', 4, 2, 1, N'', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (72, 3, N'05/07/2019', N'09:43     ', 3, 2, 1, N'', 2, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (73, 3, N'05/07/2019', N'09:51     ', 2, 2, 1, N'', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (74, 3, N'05/07/2019', N'09:53     ', 1, 2, 1, N'', 2, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (75, 3, N'05/07/2019', N'12:05     ', 5, 2, 1, N'', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (76, 3, N'04/03/2020', N'12:43     ', 8, 2, 1, N'', 1, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (77, 3, N'04/03/2020', N'12:55     ', 9, 2, 1, N'', 2, NULL, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (78, 3, N'8/3/2020  ', N'21:14     ', 10, 2, 1, N'', 2, 1, NULL)
INSERT [dbo].[Inscripcion] ([ID_Inscripcion], [ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (81, 12, N'15/3/2020 ', N'15:08     ', 8, 5, 1, N'', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Inscripcion] OFF
/****** Object:  View [dbo].[AlumnosXMesas]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AlumnosXMesas] as 
(select Mesa.Descripcion as Mesa, Alumno.Nombre as Alumno, COUNT(Alumno.Nombre) as Cantidad_de_Alumnos
from Mesa join Alumno on Mesa.ID_Mesa = Alumno.ID_Alumno
group by Mesa.Descripcion, Alumno.Nombre)
GO
/****** Object:  UserDefinedFunction [dbo].[Mesas]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Mesas](@ID_MesMesa int)
Returns Table
AS
       Return (Select MesMesa.Descripcion as Mesa, Materia.Nombre as Materia, Mesa.Fecha, Mesa.Hora, p.Apellido as Titular, pp.Apellido as Vocal1, ppp.Apellido as Vocal2 
       From ((((Mesa  join MesMesa on Mesa.ID_MesMesa = MesMesa.ID_MesMesa) join Materia on Mesa.ID_Materia = Materia.ID_Materia) join  Profesor p on p.ID_Profesor = Mesa.ID_ProfesorTitular) join Profesor pp on pp.ID_Profesor = Mesa.ID_ProfesorVocal1) join Profesor ppp on ppp.ID_Profesor = Mesa.ID_ProfesorVocal2
       WHERE MesMesa.ID_MesMesa = @ID_MesMesa) ;
GO
/****** Object:  View [dbo].[Mesa_Examen]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Mesa_Examen]
AS
SELECT     dbo.MesMesa.Descripcion AS Mesa, dbo.Materia.Nombre AS Materia, dbo.Mesa.Fecha, dbo.Mesa.Hora, p.Apellido AS Titular, pp.Apellido AS Vocal1, ppp.Apellido AS Vocal2, 
                      dbo.Mesa.ID_Mesa
FROM         dbo.Mesa INNER JOIN
                      dbo.MesMesa ON dbo.Mesa.ID_MesMesa = dbo.MesMesa.ID_MesMesa INNER JOIN
                      dbo.Materia ON dbo.Mesa.ID_Materia = dbo.Materia.ID_Materia INNER JOIN
                      dbo.Profesor AS p ON p.ID_Profesor = dbo.Mesa.ID_ProfesorTitular INNER JOIN
                      dbo.Profesor AS pp ON pp.ID_Profesor = dbo.Mesa.ID_ProfesorVocal1 INNER JOIN
                      dbo.Profesor AS ppp ON ppp.ID_Profesor = dbo.Mesa.ID_ProfesorVocal2
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mesa"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MesMesa"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 246
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Materia"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 126
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 366
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pp"
            Begin Extent = 
               Top = 246
               Left = 274
               Bottom = 366
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ppp"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 486
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Tab' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Mesa_Examen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'le = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Mesa_Examen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Mesa_Examen'
GO
/****** Object:  UserDefinedFunction [dbo].[MateriasXidcarrera]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[MateriasXidcarrera] (@id int)
returns table
as
return (select * from Materias_Completas
where ID_Carrera = @id)
GO
/****** Object:  UserDefinedFunction [dbo].[Materiasxcursoycarrera]    Script Date: 04/05/2020 16:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Materiasxcursoycarrera]  (@idcarrera int, @curso int)
returns table 
as
return (select * from Materias_Completas
where Curso = @curso and ID_Carrera = @idcarrera)
GO
/****** Object:  StoredProcedure [dbo].[InsertMesa]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	procedure [dbo].[InsertMesa] @Descripcion nvarchar(50), @ID_Materia int, @Fecha date, @Hora nchar(10), @ID_MesMesa int, @ID_ProfesorTitular int, @ID_ProfesorVocal1 int, @ID_ProfesorVocal2 int
as	
insert into Mesa (Descripcion, ID_Materia, Fecha, Hora, ID_MesMesa, ID_ProfesorTitular, ID_ProfesorVocal1, ID_ProfesorVocal2) values (@Descripcion, @ID_Materia , @Fecha, @Hora, @ID_MesMesa, @ID_ProfesorTitular, @ID_ProfesorVocal1, @ID_ProfesorVocal2);
GO
/****** Object:  StoredProcedure [dbo].[InsertInscripcion]    Script Date: 04/05/2020 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertInscripcion] @Fecha nchar(10), @Hora nchar(10), @IDMesa int, @IDAlumno int, @IDEstado int, @Obsevaciones nvarchar(max), @IDCondicion int, @ID_Usuario int
as
insert into Inscripcion (Fecha, Hora, ID_Mesa, ID_Alumno, ID_Estado, Obsevaciones, ID_Condicion, ID_Usuario) values (@Fecha, @Hora, @IDMesa, @IDAlumno, @IDEstado, @Obsevaciones, @IDCondicion, @ID_Usuario)
GO
/****** Object:  ForeignKey [FK_Alumno_Usuarios]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Usuarios]
GO
/****** Object:  ForeignKey [FK_AlumnoXCarrera_Alumno]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[AlumnoXCarrera]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoXCarrera_Alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[Alumno] ([ID_Alumno])
GO
ALTER TABLE [dbo].[AlumnoXCarrera] CHECK CONSTRAINT [FK_AlumnoXCarrera_Alumno]
GO
/****** Object:  ForeignKey [FK_AlumnoXCarrera_Carrera]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[AlumnoXCarrera]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoXCarrera_Carrera] FOREIGN KEY([ID_Carrera])
REFERENCES [dbo].[Carrera] ([ID_Carrera])
GO
ALTER TABLE [dbo].[AlumnoXCarrera] CHECK CONSTRAINT [FK_AlumnoXCarrera_Carrera]
GO
/****** Object:  ForeignKey [FK_AlumnoXMateria_Alumno]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[AlumnoXMateria]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoXMateria_Alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[Alumno] ([ID_Alumno])
GO
ALTER TABLE [dbo].[AlumnoXMateria] CHECK CONSTRAINT [FK_AlumnoXMateria_Alumno]
GO
/****** Object:  ForeignKey [FK_AlumnoXMateria_Materia]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[AlumnoXMateria]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoXMateria_Materia] FOREIGN KEY([ID_Materia])
REFERENCES [dbo].[Materia] ([ID_Materia])
GO
ALTER TABLE [dbo].[AlumnoXMateria] CHECK CONSTRAINT [FK_AlumnoXMateria_Materia]
GO
/****** Object:  ForeignKey [FK_Inscripcion_Alumno]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[Alumno] ([ID_Alumno])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Alumno]
GO
/****** Object:  ForeignKey [FK_Inscripcion_Condiciom]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Condiciom] FOREIGN KEY([ID_Condicion])
REFERENCES [dbo].[Condiciom] ([ID_Condicion])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Condiciom]
GO
/****** Object:  ForeignKey [FK_Inscripcion_Estados]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Estados] FOREIGN KEY([ID_Estado])
REFERENCES [dbo].[Estados] ([ID_Estado])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Estados]
GO
/****** Object:  ForeignKey [FK_Inscripcion_Mesa]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Mesa] FOREIGN KEY([ID_Mesa])
REFERENCES [dbo].[Mesa] ([ID_Mesa])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Mesa]
GO
/****** Object:  ForeignKey [FK_Inscripcion_Usuarios]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Usuarios]
GO
/****** Object:  ForeignKey [FK_Materia_Carrera]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Carrera] FOREIGN KEY([ID_Carrera])
REFERENCES [dbo].[Carrera] ([ID_Carrera])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Carrera]
GO
/****** Object:  ForeignKey [FK_Materia_Profesor]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Profesor] FOREIGN KEY([ID_Profesor])
REFERENCES [dbo].[Profesor] ([ID_Profesor])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Profesor]
GO
/****** Object:  ForeignKey [FK_Mesa_Materia]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_Mesa_Materia] FOREIGN KEY([ID_Materia])
REFERENCES [dbo].[Materia] ([ID_Materia])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_Mesa_Materia]
GO
/****** Object:  ForeignKey [FK_Mesa_MesMesa]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_Mesa_MesMesa] FOREIGN KEY([ID_MesMesa])
REFERENCES [dbo].[MesMesa] ([ID_MesMesa])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_Mesa_MesMesa]
GO
/****** Object:  ForeignKey [FK_Mesa_Profesor]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_Mesa_Profesor] FOREIGN KEY([ID_ProfesorTitular])
REFERENCES [dbo].[Profesor] ([ID_Profesor])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_Mesa_Profesor]
GO
/****** Object:  ForeignKey [FK_Mesa_Profesor1]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_Mesa_Profesor1] FOREIGN KEY([ID_ProfesorVocal1])
REFERENCES [dbo].[Profesor] ([ID_Profesor])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_Mesa_Profesor1]
GO
/****** Object:  ForeignKey [FK_Mesa_Profesor2]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_Mesa_Profesor2] FOREIGN KEY([ID_ProfesorVocal2])
REFERENCES [dbo].[Profesor] ([ID_Profesor])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_Mesa_Profesor2]
GO
/****** Object:  ForeignKey [FK_MesMesa_Carrera]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[MesMesa]  WITH CHECK ADD  CONSTRAINT [FK_MesMesa_Carrera] FOREIGN KEY([ID_Carrera])
REFERENCES [dbo].[Carrera] ([ID_Carrera])
GO
ALTER TABLE [dbo].[MesMesa] CHECK CONSTRAINT [FK_MesMesa_Carrera]
GO
/****** Object:  ForeignKey [FK_Profesor_Usuarios]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Profesor_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [FK_Profesor_Usuarios]
GO
/****** Object:  ForeignKey [FK_Usuarios_Tipo_Usuario]    Script Date: 04/05/2020 16:56:04 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_Usuario] FOREIGN KEY([ID_Tipo_Usuario])
REFERENCES [dbo].[Tipo_Usuario] ([ID_Tipo_Usuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_Usuario]
GO
