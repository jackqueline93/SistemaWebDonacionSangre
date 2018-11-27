USE [Donacion]
GO
/****** Object:  ForeignKey [FK_aviso_Requerimiento]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_Requerimiento]
GO
/****** Object:  ForeignKey [FK_aviso_tipo_sangre]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_tipo_sangre]
GO
/****** Object:  ForeignKey [FK_aviso_usuario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_usuario]
GO
/****** Object:  ForeignKey [FK_departamento_ciudad]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[departamento] DROP CONSTRAINT [FK_departamento_ciudad]
GO
/****** Object:  ForeignKey [FK_formulario_usuario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[formulario] DROP CONSTRAINT [FK_formulario_usuario]
GO
/****** Object:  ForeignKey [FK_postulacion_aviso1]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_aviso1]
GO
/****** Object:  ForeignKey [FK_postulacion_usuario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_usuario]
GO
/****** Object:  ForeignKey [FK_usuario_departamento]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [FK_usuario_departamento]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_perfil1]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_usuario1]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
/****** Object:  Table [dbo].[postulacion]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_aviso1]
GO
ALTER TABLE [dbo].[postulacion] DROP CONSTRAINT [FK_postulacion_usuario]
GO
DROP TABLE [dbo].[postulacion]
GO
/****** Object:  Table [dbo].[aviso]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_Requerimiento]
GO
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_tipo_sangre]
GO
ALTER TABLE [dbo].[aviso] DROP CONSTRAINT [FK_aviso_usuario]
GO
DROP TABLE [dbo].[aviso]
GO
/****** Object:  Table [dbo].[formulario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[formulario] DROP CONSTRAINT [FK_formulario_usuario]
GO
DROP TABLE [dbo].[formulario]
GO
/****** Object:  Table [dbo].[usuarioPerfil]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
ALTER TABLE [dbo].[usuarioPerfil] DROP CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
DROP TABLE [dbo].[usuarioPerfil]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [FK_usuario_departamento]
GO
DROP TABLE [dbo].[usuario]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[departamento] DROP CONSTRAINT [FK_departamento_ciudad]
GO
DROP TABLE [dbo].[departamento]
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 11/27/2018 12:40:33 ******/
DROP TABLE [dbo].[perfil]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 11/27/2018 12:40:33 ******/
DROP TABLE [dbo].[ciudad]
GO
/****** Object:  Table [dbo].[requerimiento]    Script Date: 11/27/2018 12:40:33 ******/
DROP TABLE [dbo].[requerimiento]
GO
/****** Object:  Table [dbo].[tipoSangre]    Script Date: 11/27/2018 12:40:34 ******/
DROP TABLE [dbo].[tipoSangre]
GO
/****** Object:  Table [dbo].[tipoSangre]    Script Date: 11/27/2018 12:40:34 ******/
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
/****** Object:  Table [dbo].[requerimiento]    Script Date: 11/27/2018 12:40:33 ******/
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
/****** Object:  Table [dbo].[ciudad]    Script Date: 11/27/2018 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciudad](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ciudad] ON
INSERT [dbo].[ciudad] ([idCiudad], [nombre]) VALUES (1, N'LIMA')
SET IDENTITY_INSERT [dbo].[ciudad] OFF
/****** Object:  Table [dbo].[perfil]    Script Date: 11/27/2018 12:40:33 ******/
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
/****** Object:  Table [dbo].[departamento]    Script Date: 11/27/2018 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[departamento] ON
INSERT [dbo].[departamento] ([idDepartamento], [nombre], [idCiudad]) VALUES (3, N'Lima', 1)
SET IDENTITY_INSERT [dbo].[departamento] OFF
/****** Object:  Table [dbo].[usuario]    Script Date: 11/27/2018 12:40:34 ******/
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
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad]) VALUES (1, N'carlos@gmail.com', N'123', N'carlos', N'sjm', N'sánchez', CAST(0xE20F0B00 AS Date), N'M', N'43251977', N'949333732', 3, 1)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad]) VALUES (2, N'donante1@gmail.com', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad]) VALUES (3, N'donante2@gmail.com', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad]) VALUES (4, N'donante3@gmail.com', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad]) VALUES (5, N'donante4@gmail.com', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento], [idCiudad]) VALUES (6, N'donante5@gmail.com', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  Table [dbo].[usuarioPerfil]    Script Date: 11/27/2018 12:40:34 ******/
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
/****** Object:  Table [dbo].[formulario]    Script Date: 11/27/2018 12:40:33 ******/
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

/****** Object:  Table [dbo].[aviso]    Script Date: 11/27/2018 12:40:33 ******/
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
 CONSTRAINT [PK_aviso] PRIMARY KEY CLUSTERED 
(
	[idAviso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[aviso] ON
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia]) VALUES (2, 1, N'solicito sangre', 3, NULL, NULL, CAST(5 AS Decimal(5, 0)), N'Necesito urgente sangre para mi amigo', 0x, CAST(0x0000A994015CCE68 AS DateTime))
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia]) VALUES (4, 1, N'urgente sangre 2!!', 7, NULL, NULL, CAST(7 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9C100000000 AS DateTime))
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia]) VALUES (6, 1, N'urgente sangre 2!!', 5, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9A900000000 AS DateTime))
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia]) VALUES (7, 1, N'urgente sangre 2!!', 5, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9A900000000 AS DateTime))
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia]) VALUES (8, 1, N'urgente sangre x3!!', 5, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A99E00000000 AS DateTime))
INSERT [dbo].[aviso] ([idAviso], [idUsuarioSolicitante], [nombre], [idSangre], [idRequerimiento], [critico], [cantidad], [descripcion], [imagen], [fechaVigencia]) VALUES (9, 1, N'urgente sangre x5!!', 4, NULL, NULL, CAST(6 AS Decimal(5, 0)), N'Necesito urgente sangre para un familiar 2', 0x, CAST(0x0000A9B700000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[aviso] OFF
/****** Object:  Table [dbo].[postulacion]    Script Date: 11/27/2018 12:40:33 ******/
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
SET IDENTITY_INSERT [dbo].[postulacion] OFF
/****** Object:  ForeignKey [FK_aviso_Requerimiento]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_Requerimiento] FOREIGN KEY([idRequerimiento])
REFERENCES [dbo].[requerimiento] ([idRequerimiento])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_Requerimiento]
GO
/****** Object:  ForeignKey [FK_aviso_tipo_sangre]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_tipo_sangre] FOREIGN KEY([idSangre])
REFERENCES [dbo].[tipoSangre] ([idSangre])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_tipo_sangre]
GO
/****** Object:  ForeignKey [FK_aviso_usuario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_usuario] FOREIGN KEY([idUsuarioSolicitante])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_usuario]
GO
/****** Object:  ForeignKey [FK_departamento_ciudad]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[departamento]  WITH CHECK ADD  CONSTRAINT [FK_departamento_ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[departamento] CHECK CONSTRAINT [FK_departamento_ciudad]
GO
/****** Object:  ForeignKey [FK_formulario_usuario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[formulario]  WITH CHECK ADD  CONSTRAINT [FK_formulario_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[formulario] CHECK CONSTRAINT [FK_formulario_usuario]
GO
/****** Object:  ForeignKey [FK_postulacion_aviso1]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[postulacion]  WITH CHECK ADD  CONSTRAINT [FK_postulacion_aviso1] FOREIGN KEY([idAviso])
REFERENCES [dbo].[aviso] ([idAviso])
GO
ALTER TABLE [dbo].[postulacion] CHECK CONSTRAINT [FK_postulacion_aviso1]
GO
/****** Object:  ForeignKey [FK_postulacion_usuario]    Script Date: 11/27/2018 12:40:33 ******/
ALTER TABLE [dbo].[postulacion]  WITH CHECK ADD  CONSTRAINT [FK_postulacion_usuario] FOREIGN KEY([idUsuarioDonante])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[postulacion] CHECK CONSTRAINT [FK_postulacion_usuario]
GO
/****** Object:  ForeignKey [FK_usuario_departamento]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_departamento]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_perfil1]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPerfil_perfil1] FOREIGN KEY([idPerfil])
REFERENCES [dbo].[perfil] ([idPerfil])
GO
ALTER TABLE [dbo].[usuarioPerfil] CHECK CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_usuario1]    Script Date: 11/27/2018 12:40:34 ******/
ALTER TABLE [dbo].[usuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPerfil_usuario1] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuarioPerfil] CHECK CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
