USE [Donacion]
GO
/****** Object:  ForeignKey [FK_aviso_Requerimiento]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_Requerimiento]
GO
/****** Object:  ForeignKey [FK_aviso_tipo_sangre]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_tipo_sangre]
GO
/****** Object:  ForeignKey [FK_aviso_usuario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_usuario]
GO
/****** Object:  ForeignKey [FK_ciudad_departamento]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[ciudad] DROP CONSTRAINT [FK_ciudad_departamento]
GO
/****** Object:  ForeignKey [FK_formulario_usuario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[formulario] DROP CONSTRAINT [FK_formulario_usuario]
GO
/****** Object:  ForeignKey [FK_postulacion_aviso1]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_aviso1]
GO
/****** Object:  ForeignKey [FK_postulacion_usuario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_usuario]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_perfil1]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_usuario1]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
/****** Object:  Table [dbo].[postulacion]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_aviso1]
GO
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_usuario]
GO
DROP TABLE [dbo].[postulacion]
GO
/****** Object:  Table [dbo].[aviso]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_Requerimiento]
GO
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_tipo_sangre]
GO
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_usuario]
GO
DROP TABLE [dbo].[aviso]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[ciudad] DROP CONSTRAINT [FK_ciudad_departamento]
GO
DROP TABLE [dbo].[ciudad]
GO
/****** Object:  Table [dbo].[formulario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[formulario] DROP CONSTRAINT [FK_formulario_usuario]
GO
DROP TABLE [dbo].[formulario]
GO
/****** Object:  Table [dbo].[usuarioPerfil]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
DROP TABLE [dbo].[usuarioPerfil]
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 12/01/2018 22:29:28 ******/
DROP TABLE [dbo].[perfil]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 12/01/2018 22:29:28 ******/
DROP TABLE [dbo].[departamento]
GO
/****** Object:  Table [dbo].[requerimiento]    Script Date: 12/01/2018 22:29:28 ******/
DROP TABLE [dbo].[requerimiento]
GO
/****** Object:  Table [dbo].[tipoSangre]    Script Date: 12/01/2018 22:29:28 ******/
DROP TABLE [dbo].[tipoSangre]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 12/01/2018 22:29:28 ******/
DROP TABLE [dbo].[usuario]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](200) NULL,
	[apellido] [varchar](100) NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [varchar](10) NULL,
	[dni] [varchar](8) NULL,
	[celular] [varchar](15) NULL,
	[idDepartamento] [int] NULL,
	[idCiudad] [int] NULL,
	[idSangre] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad], [idSangre]) VALUES (1, N'cfsanchez.a@outlook.com', N'123', N'carlos', N'sjm', N'sánchez', CAST(0xE20F0B00 AS Date), N'M', N'43251977', N'949333732', 15, 33, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad], [idSangre]) VALUES (2, N'U201602969@upc.edu.pe', N'123456', N'Irene', N'X B', N'Reyes', CAST(0xD5220B00 AS Date), N'F', N'12346578', N'99988666', 15, 42, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad], [idSangre]) VALUES (3, N'u201414976@upc.edu.pe', N'123456', N'Ricardo', N'X B', N'Hernandez', CAST(0xD5220B00 AS Date), N'M', N'12346578', N'99988666', 15, 42, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad], [idSangre]) VALUES (4, N'donante3@gmail.com', N'123456', N'Donante 3', N'av', N'prueba', CAST(0x201D0B00 AS Date), N'M', N'74185296', N'99988666', 15, 1, 1)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad], [idSangre]) VALUES (5, N'donante4@gmail.com', N'123456', N'Donante 4', N'av', N'prueba', CAST(0xD5220B00 AS Date), N'M', N'98765412', N'99988666', 15, 1, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad], [idSangre]) VALUES (6, N'donante5@gmail.com', N'123456', N'Donante 5', N'av', N'prueba', CAST(0x201D0B00 AS Date), N'M', N'78912345', N'99988666', 15, 1, NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  Table [dbo].[tipoSangre]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoSangre](
	[idSangre] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_sangre] PRIMARY KEY CLUSTERED 
(
	[idSangre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tipoSangre] ON
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (1, N'0-')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (2, N'0+')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (3, N'A-')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (4, N'A+')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (5, N'B-')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (6, N'B+')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (7, N'AB')
INSERT [dbo].[tipoSangre] ([idSangre], [nombre]) VALUES (8, N'AB+')
SET IDENTITY_INSERT [dbo].[tipoSangre] OFF
/****** Object:  Table [dbo].[requerimiento]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[requerimiento](
	[idRequerimiento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Requerimiento] PRIMARY KEY CLUSTERED 
(
	[idRequerimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[departamento] ON
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (1, N'AMAZONAS')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (2, N'ANCASH')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (3, N'APURIMAC')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (4, N'AREQUIPA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (5, N'AYACUCHO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (6, N'CAJAMARCA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (7, N'CALLAO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (8, N'CUSCO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (9, N'HUANCAVELICA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (10, N'HUANUCO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (11, N'ICA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (12, N'JUNIN')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (13, N'LA LIBERTAD')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (14, N'LAMBAYEQUE')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (15, N'LIMA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (16, N'LORETO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (17, N'MADRE DE DIOS')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (18, N'MOQUEGUA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (19, N'PASCO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (20, N'PIURA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (21, N'PUNO')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (22, N'SAN MARTIN')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (23, N'TACNA')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (24, N'TUMBES')
INSERT [dbo].[departamento] ([idDepartamento], [nombre]) VALUES (25, N'UCAYALI')
SET IDENTITY_INSERT [dbo].[departamento] OFF
/****** Object:  Table [dbo].[perfil]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[perfil](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_perfil] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[perfil] ON
INSERT [dbo].[perfil] ([idPerfil], [nombre]) VALUES (1, N'Solicitante')
INSERT [dbo].[perfil] ([idPerfil], [nombre]) VALUES (2, N'Donante')
SET IDENTITY_INSERT [dbo].[perfil] OFF
/****** Object:  Table [dbo].[usuarioPerfil]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarioPerfil](
	[idUsuario] [int] NOT NULL,
	[idPerfil] [int] NOT NULL,
	[fechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_usuarioPerfil_1] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (1, 1, CAST(0x0000A9A4011F5C83 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (1, 2, CAST(0x0000A9A4011F5C83 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (2, 1, CAST(0x0000A9A900C11CF0 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (2, 2, CAST(0x0000A9A9000968C6 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (3, 1, CAST(0x0000A9A900C11CF0 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (3, 2, CAST(0x0000A9A900C11CF0 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (4, 1, CAST(0x0000A9A900C11CF0 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (4, 2, CAST(0x0000A9A900CDB857 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (5, 1, CAST(0x0000A9A900C11CF0 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (5, 2, CAST(0x0000A9A900CD241C AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (6, 1, CAST(0x0000A9A900C11CF0 AS DateTime))
INSERT [dbo].[usuarioPerfil] ([idUsuario], [idPerfil], [fechaRegistro]) VALUES (6, 2, CAST(0x0000A9A900CD6040 AS DateTime))
/****** Object:  Table [dbo].[formulario]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[formulario](
	[idFormulario] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[respuesta] [char](1) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[idFormulario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciudad](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idDepartamento] [int] NOT NULL,
 CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ciudad] ON
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (1, N'LIMA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (2, N'ANCON', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (3, N'ATE', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (4, N'BARRANCO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (5, N'BREÑA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (6, N'CARABAYLLO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (7, N'CHACLACAYO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (8, N'CHORRILLOS', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (9, N'CIENEGUILLA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (10, N'COMAS', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (11, N'EL AGUSTINO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (12, N'INDEPENDENCIA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (13, N'JESUS MARIA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (14, N'LA MOLINA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (15, N'LA VICTORIA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (16, N'LINCE', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (17, N'LOS OLIVOS', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (18, N'LURIGANCHO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (19, N'LURIN', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (20, N'MAGDALENA DEL MAR', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (21, N'MAGDALENA VIEJA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (22, N'MIRAFLORES', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (23, N'PACHACAMAC', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (24, N'PUCUSANA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (25, N'PUENTE PIEDRA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (26, N'PUNTA HERMOSA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (27, N'PUNTA NEGRA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (28, N'RIMAC', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (29, N'SAN BARTOLO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (30, N'SAN BORJA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (31, N'SAN ISIDRO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (32, N'SAN JUAN DE LURIGANCHO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (33, N'SAN JUAN DE MIRAFLORES', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (34, N'SAN LUIS', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (35, N'SAN MARTIN DE PORRES', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (36, N'SAN MIGUEL', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (37, N'SANTA ANITA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (38, N'SANTA MARIA DEL MAR', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (39, N'SANTA ROSA', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (40, N'SANTIAGO DE SURCO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (41, N'SURQUILLO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (42, N'VILLA EL SALVADOR', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (43, N'VILLA MARIA DEL TRIUNFO', 15)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (44, N'CHACHAPOYAS', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (45, N'ASUNCION', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (46, N'BALSAS', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (47, N'CHETO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (48, N'CHILIQUIN', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (49, N'CHUQUIBAMBA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (50, N'GRANADA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (51, N'HUANCAS', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (52, N'LA JALCA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (53, N'LEIMEBAMBA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (54, N'LEVANTO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (55, N'MAGDALENA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (56, N'MARISCAL CASTILLA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (57, N'MOLINOPAMPA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (58, N'MONTEVIDEO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (59, N'OLLEROS', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (60, N'QUINJALCA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (61, N'SAN FRANCISCO DE DAGUAS', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (62, N'SAN ISIDRO DE MAINO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (63, N'SOLOCO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (64, N'SONCHE', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (65, N'LA PECA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (66, N'ARAMANGO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (67, N'COPALLIN', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (68, N'EL PARCO', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (69, N'IMAZA', 1)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (70, N'HUARAZ', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (71, N'COCHABAMBA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (72, N'COLCABAMBA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (73, N'HUANCHAY', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (74, N'INDEPENDENCIA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (75, N'JANGAS', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (76, N'LA LIBERTAD', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (77, N'OLLEROS', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (78, N'PAMPAS', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (79, N'PARIACOTO', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (80, N'PIRA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (81, N'TARICA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (82, N'CASMA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (83, N'BUENA VISTA ALTA', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (84, N'COMANDANTE NOEL', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (85, N'YAUTAN', 2)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (86, N'ANDAHUAYLAS', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (87, N'ANDARAPA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (88, N'CHIARA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (89, N'HUANCARAMA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (90, N'HUANCARAY', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (91, N'HUAYANA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (92, N'KISHUARA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (93, N'PACOBAMBA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (94, N'PACUCHA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (95, N'PAMPACHIRI', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (96, N'POMACOCHA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (97, N'SAN ANTONIO DE CACHI', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (98, N'SAN JERONIMO', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (99, N'SAN MIGUEL DE CHACCRAMPA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (100, N'SANTA MARIA DE CHICMO', 3)
GO
print 'Processed 100 total records'
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (101, N'TALAVERA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (102, N'TUMAY HUARACA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (103, N'TURPO', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (104, N'KAQUIABAMBA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (105, N'ANTABAMBA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (106, N'EL ORO', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (107, N'HUAQUIRCA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (108, N'JUAN ESPINOZA MEDRANO', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (109, N'OROPESA', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (110, N'PACHACONAS', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (111, N'SABAINO', 3)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (112, N'AREQUIPA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (113, N'ALTO SELVA ALEGRE', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (114, N'CAYMA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (115, N'CERRO COLORADO', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (116, N'CHARACATO', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (117, N'CHIGUATA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (118, N'JACOBO HUNTER', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (119, N'LA JOYA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (120, N'MARIANO MELGAR', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (121, N'MIRAFLORES', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (122, N'MOLLEBAYA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (123, N'PAUCARPATA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (124, N'POCSI', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (125, N'POLOBAYA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (126, N'SABANDIA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (127, N'SACHACA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (128, N'SAN JUAN DE SIGUAS', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (129, N'SAN JUAN DE TARUCANI', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (130, N'SANTA ISABEL DE SIGUAS', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (131, N'SANTA RITA DE SIGUAS', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (132, N'SOCABAYA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (133, N'TIABAYA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (134, N'UCHUMAYO', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (135, N'VITOR', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (136, N'YANAHUARA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (137, N'YARABAMBA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (138, N'YURA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (139, N'JOSE LUIS BUSTAMANTE Y RIVERO', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (140, N'CAMANA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (141, N'JOSE MARIA QUIMPER', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (142, N'MARIANO NICOLAS VALCARCEL', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (143, N'MARISCAL CACERES', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (144, N'NICOLAS DE PIEROLA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (145, N'OCOÑA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (146, N'QUILCA', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (147, N'SAMUEL PASTOR', 4)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (148, N'AYACUCHO', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (149, N'ACOCRO', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (150, N'ACOS VINCHOS', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (151, N'CARMEN ALTO', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (152, N'CHIARA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (153, N'OCROS', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (154, N'PACAYCASA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (155, N'QUINUA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (156, N'SAN JOSE DE TICLLAS', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (157, N'SAN JUAN BAUTISTA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (158, N'SANTIAGO DE PISCHA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (159, N'SOCOS', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (160, N'TAMBILLO', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (161, N'VINCHOS', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (162, N'JESUS NAZARENO', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (163, N'HUANTA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (164, N'AYAHUANCO', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (165, N'HUAMANGUILLA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (166, N'IGUAIN', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (167, N'LURICOCHA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (168, N'SANTILLANA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (169, N'SIVIA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (170, N'LLOCHEGUA', 5)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (171, N'CAJAMARCA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (172, N'CAJAMARCA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (173, N'ASUNCION', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (174, N'CHETILLA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (175, N'COSPAN', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (176, N'JESUS', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (177, N'LLACANORA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (178, N'MAGDALENA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (179, N'MATARA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (180, N'NAMORA', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (181, N'SAN JUAN', 6)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (182, N'CALLAO', 7)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (183, N'BELLAVISTA', 7)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (184, N'CARMEN DE LA LEGUA REYNOSO', 7)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (185, N'LA PERLA', 7)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (186, N'LA PUNTA', 7)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (187, N'VENTANILLA', 7)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (188, N'CUSCO', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (189, N'CCORCA', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (190, N'POROY', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (191, N'SAN JERONIMO', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (192, N'SAN SEBASTIAN', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (193, N'SANTIAGO', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (194, N'SAYLLA', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (195, N'WANCHAQ', 8)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (196, N'HUANCAVELICA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (197, N'ACOBAMBILLA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (198, N'ACORIA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (199, N'CONAYCA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (200, N'CUENCA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (201, N'HUACHOCOLPA', 9)
GO
print 'Processed 200 total records'
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (202, N'HUAYLLAHUARA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (203, N'IZCUCHACA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (204, N'LARIA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (205, N'MANTA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (206, N'MARISCAL CACERES', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (207, N'MOYA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (208, N'NUEVO OCCORO', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (209, N'PALCA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (210, N'PILCHACA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (211, N'VILCA', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (212, N'YAULI', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (213, N'ASCENSION', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (214, N'HUANDO', 9)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (215, N'HUANUCO', 10)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (216, N'AMARILIS', 10)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (217, N'CHINCHAO', 10)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (218, N'CHURUBAMBA', 10)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (219, N'MARGOS', 10)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (220, N'QUISQUI', 10)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (221, N'ICA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (222, N'LOS AQUIJES', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (223, N'OCUCAJE', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (224, N'PACHACUTEC', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (225, N'PARCONA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (226, N'PUEBLO NUEVO', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (227, N'SALAS', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (228, N'SAN JOSE DE LOS MOLINOS', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (229, N'SAN JUAN BAUTISTA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (230, N'SANTIAGO', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (231, N'SUBTANJALLA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (232, N'TATE', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (233, N'YAUCA DEL ROSARIO', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (234, N'CHINCHA ALTA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (235, N'ALTO LARAN', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (236, N'CHAVIN', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (237, N'CHINCHA BAJA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (238, N'EL CARMEN', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (239, N'GROCIO PRADO', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (240, N'PUEBLO NUEVO', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (241, N'SAN JUAN DE YANAC', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (242, N'SAN PEDRO DE HUACARPANA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (243, N'SUNAMPE', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (244, N'TAMBO DE MORA', 11)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (245, N'JUNIN', 12)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (246, N'CARHUAMAYO', 12)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (247, N'ONDORES', 12)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (248, N'ULCUMAYO', 12)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (249, N'TRUJILLO', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (250, N'EL PORVENIR', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (251, N'FLORENCIA DE MORA', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (252, N'HUANCHACO', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (253, N'LA ESPERANZA', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (254, N'LAREDO', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (255, N'MOCHE', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (256, N'POROTO', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (257, N'SALAVERRY', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (258, N'SIMBAL', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (259, N'VICTOR LARCO HERRERA', 13)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (260, N'LAMBAYEQUE', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (261, N'CHOCHOPE', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (262, N'ILLIMO', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (263, N'JAYANCA', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (264, N'MOCHUMI', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (265, N'MORROPE', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (266, N'MOTUPE', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (267, N'OLMOS', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (268, N'PACORA', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (269, N'SALAS', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (270, N'SAN JOSE', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (271, N'TUCUME', 14)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (272, N'NAUTA', 16)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (273, N'PARINARI', 16)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (274, N'TIGRE', 16)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (275, N'TROMPETEROS', 16)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (276, N'URARINAS', 16)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (277, N'TAMBOPATA', 17)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (278, N'INAMBARI', 17)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (279, N'LAS PIEDRAS', 17)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (280, N'LABERINTO', 17)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (281, N'ILO', 18)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (282, N'EL ALGARROBAL', 18)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (283, N'PACOCHA', 18)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (284, N'CHAUPIMARCA', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (285, N'HUACHON', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (286, N'HUARIACA', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (287, N'HUAYLLAY', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (288, N'NINACACA', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (289, N'PALLANCHACRA', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (290, N'PAUCARTAMBO', 19)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (291, N'PIURA', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (292, N'CASTILLA', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (293, N'CATACAOS', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (294, N'CURA MORI', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (295, N'EL TALLAN', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (296, N'LA ARENA', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (297, N'LA UNION', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (298, N'LAS LOMAS', 20)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (299, N'YUNGUYO', 21)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (300, N'ANAPIA', 21)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (301, N'COPANI', 21)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (302, N'CUTURAPI', 21)
GO
print 'Processed 300 total records'
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (303, N'OLLARAYA', 21)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (304, N'TINICACHI', 21)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (305, N'UNICACHI', 21)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (306, N'TARAPOTO', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (307, N'ALBERTO LEVEAU', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (308, N'CACATACHI', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (309, N'CHAZUTA', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (310, N'CHIPURANA', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (311, N'EL PORVENIR', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (312, N'HUIMBAYOC', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (313, N'JUAN GUERRA', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (314, N'LA BANDA DE SHILCAYO', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (315, N'MORALES', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (316, N'PAPAPLAYA', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (317, N'SAN ANTONIO', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (318, N'SAUCE', 22)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (319, N'TACNA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (320, N'ALTO DE LA ALIANZA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (321, N'CALANA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (322, N'CIUDAD NUEVA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (323, N'INCLAN', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (324, N'PACHIA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (325, N'PALCA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (326, N'POCOLLAY', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (327, N'SAMA', 23)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (328, N'TUMBES', 24)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (329, N'CORRALES', 24)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (330, N'LA CRUZ', 24)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (331, N'PAMPAS DE HOSPITAL', 24)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (332, N'SAN JACINTO', 24)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (333, N'SAN JUAN DE LA VIRGEN', 24)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (334, N'CALLERIA', 25)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (335, N'CAMPOVERDE', 25)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (336, N'IPARIA', 25)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (337, N'MASISEA', 25)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (338, N'YARINACOCHA', 25)
INSERT [dbo].[ciudad] ([idCiudad], [nombre], [idDepartamento]) VALUES (339, N'NUEVA REQUENA', 25)
SET IDENTITY_INSERT [dbo].[ciudad] OFF
/****** Object:  Table [dbo].[aviso]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aviso](
	[idAviso] [int] IDENTITY(1,1) NOT NULL,
	[idUsuarioSolicitante] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idSangre] [int] NOT NULL,
	[idRequerimiento] [int] NULL,
	[critico] [char](2) NULL,
	[cantidad] [decimal](5, 0) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[imagen] [image] NULL,
	[fechaVigencia] [datetime] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [PK_aviso] PRIMARY KEY CLUSTERED 
(
	[idAviso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[aviso] ON
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (2, 1, N'solicito sangre', 3, NULL, NULL, CAST(5 AS Decimal(5, 0)), N'Necesito urgente sangre para mi amigo', 0x, CAST(0x0000A994015CCE68 AS DateTime), 15, 1)
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (4, 1, N'familia necesita sangre', 7, NULL, NULL, CAST(7 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9C100000000 AS DateTime), 15, 1)
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (6, 1, N'urgente sangre 2!!', 5, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9A900000000 AS DateTime), 15, 1)
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (7, 1, N'Ayuda urgente', 5, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9A900000000 AS DateTime), 15, 1)
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (8, 1, N'urgente sangre x3!!', 5, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A99E00000000 AS DateTime), 15, 1)
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (9, 1, N'familia necesita sangre', 4, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9B700000000 AS DateTime), 15, 1)
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia], [idDepartamento], [idCiudad]) VALUES (10, 1, N'amigo necesita sangre', 4, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar', NULL, CAST(0x0000A9B700000000 AS DateTime), 15, 33)
SET IDENTITY_INSERT [dbo].[aviso] OFF
/****** Object:  Table [dbo].[postulacion]    Script Date: 12/01/2018 22:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postulacion](
	[idPostulacion] [int] IDENTITY(1,1) NOT NULL,
	[idAviso] [int] NOT NULL,
	[idUsuarioDonante] [int] NOT NULL,
 CONSTRAINT [PK_Postulacion] PRIMARY KEY CLUSTERED 
(
	[idPostulacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[postulacion] ON
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (1, 2, 1)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (2, 2, 2)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (3, 2, 2)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (4, 2, 2)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (5, 2, 3)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (6, 4, 3)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (7, 6, 3)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (9, 9, 3)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (15, 9, 4)
INSERT [dbo].[postulacion] ([idPostulacion], [idAviso], [idUsuarioDonante]) VALUES (16, 9, 2)
SET IDENTITY_INSERT [dbo].[postulacion] OFF
/****** Object:  ForeignKey [FK_aviso_Requerimiento]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_Requerimiento] FOREIGN KEY([idRequerimiento])
REFERENCES [dbo].[requerimiento] ([idRequerimiento])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_Requerimiento]
GO
/****** Object:  ForeignKey [FK_aviso_tipo_sangre]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_tipo_sangre] FOREIGN KEY([idSangre])
REFERENCES [dbo].[tipoSangre] ([idSangre])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_tipo_sangre]
GO
/****** Object:  ForeignKey [FK_aviso_usuario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_usuario] FOREIGN KEY([idUsuarioSolicitante])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_usuario]
GO
/****** Object:  ForeignKey [FK_ciudad_departamento]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[ciudad]  WITH CHECK ADD  CONSTRAINT [FK_ciudad_departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[ciudad] CHECK CONSTRAINT [FK_ciudad_departamento]
GO
/****** Object:  ForeignKey [FK_formulario_usuario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[formulario]  WITH CHECK ADD  CONSTRAINT [FK_formulario_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[formulario] CHECK CONSTRAINT [FK_formulario_usuario]
GO
/****** Object:  ForeignKey [FK_postulacion_aviso1]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[postulacion]  WITH CHECK ADD  CONSTRAINT [FK_postulacion_aviso1] FOREIGN KEY([idAviso])
REFERENCES [dbo].[aviso] ([idAviso])
GO
ALTER TABLE [dbo].[postulacion] CHECK CONSTRAINT [FK_postulacion_aviso1]
GO
/****** Object:  ForeignKey [FK_postulacion_usuario]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[postulacion]  WITH CHECK ADD  CONSTRAINT [FK_postulacion_usuario] FOREIGN KEY([idUsuarioDonante])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[postulacion] CHECK CONSTRAINT [FK_postulacion_usuario]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_perfil1]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[usuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPerfil_perfil1] FOREIGN KEY([idPerfil])
REFERENCES [dbo].[perfil] ([idPerfil])
GO
ALTER TABLE [dbo].[usuarioPerfil] CHECK CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_usuario1]    Script Date: 12/01/2018 22:29:28 ******/
ALTER TABLE [dbo].[usuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPerfil_usuario1] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuarioPerfil] CHECK CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
