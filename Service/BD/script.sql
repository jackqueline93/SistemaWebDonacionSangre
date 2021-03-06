USE [Donacion]
GO
/****** Object:  Table [dbo].[tipoSangre]    Script Date: 10/30/2018 10:41:47 ******/
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
/****** Object:  Table [dbo].[requerimiento]    Script Date: 10/30/2018 10:41:47 ******/
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
/****** Object:  Table [dbo].[ciudad]    Script Date: 10/30/2018 10:41:47 ******/
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
/****** Object:  Table [dbo].[perfil]    Script Date: 10/30/2018 10:41:47 ******/
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
/****** Object:  Table [dbo].[departamento]    Script Date: 10/30/2018 10:41:47 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 10/30/2018 10:41:47 ******/
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
	[idPerfil] [int] NULL,
	[direccion] [varchar](200) NULL,
	[apellido] [varchar](100) NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [varchar](10) NULL,
	[dni] [varchar](8) NULL,
	[celular] [int] NULL,
	[idDepartamento] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
INSERT [dbo].[usuario] ([idUsuario], [correo], [password], [nombre], [idPerfil], [direccion], [apellido], [fecha_nacimiento], [genero], [dni], [celular], [idDepartamento]) VALUES (1, N'carlos@multiplica.com', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  Table [dbo].[usuarioPerfil]    Script Date: 10/30/2018 10:41:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarioPerfil](
	[idUsuario] [int] NOT NULL,
	[idPerfil] [int] NOT NULL,
 CONSTRAINT [PK_usuarioPerfil_1] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formulario]    Script Date: 10/30/2018 10:41:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[formulario](
	[idFormulario] [int] IDENTITY(1,1) NOT NULL,
	[pregunta1] [char](2) NOT NULL,
	[pregunta2] [char](2) NOT NULL,
	[pregunta3] [char](2) NOT NULL,
	[pregunta4] [char](2) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[idFormulario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aviso]    Script Date: 10/30/2018 10:41:47 ******/
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
	[idRequerimiento] [int] NOT NULL,
	[critico] [char](2) NOT NULL,
	[cantidad] [decimal](5, 0) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[imagen] [image] NULL,
 CONSTRAINT [PK_aviso] PRIMARY KEY CLUSTERED 
(
	[idAviso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[postulacion]    Script Date: 10/30/2018 10:41:47 ******/
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
/****** Object:  ForeignKey [FK_aviso_Requerimiento]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_Requerimiento] FOREIGN KEY([idRequerimiento])
REFERENCES [dbo].[requerimiento] ([idRequerimiento])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_Requerimiento]
GO
/****** Object:  ForeignKey [FK_aviso_tipo_sangre]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_tipo_sangre] FOREIGN KEY([idSangre])
REFERENCES [dbo].[tipoSangre] ([idSangre])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_tipo_sangre]
GO
/****** Object:  ForeignKey [FK_aviso_usuario]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[aviso]  WITH CHECK ADD  CONSTRAINT [FK_aviso_usuario] FOREIGN KEY([idUsuarioSolicitante])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[aviso] CHECK CONSTRAINT [FK_aviso_usuario]
GO
/****** Object:  ForeignKey [FK_departamento_ciudad]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[departamento]  WITH CHECK ADD  CONSTRAINT [FK_departamento_ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[departamento] CHECK CONSTRAINT [FK_departamento_ciudad]
GO
/****** Object:  ForeignKey [FK_formulario_usuario]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[formulario]  WITH CHECK ADD  CONSTRAINT [FK_formulario_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[formulario] CHECK CONSTRAINT [FK_formulario_usuario]
GO
/****** Object:  ForeignKey [FK_postulacion_aviso1]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[postulacion]  WITH CHECK ADD  CONSTRAINT [FK_postulacion_aviso1] FOREIGN KEY([idAviso])
REFERENCES [dbo].[aviso] ([idAviso])
GO
ALTER TABLE [dbo].[postulacion] CHECK CONSTRAINT [FK_postulacion_aviso1]
GO
/****** Object:  ForeignKey [FK_postulacion_usuario]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[postulacion]  WITH CHECK ADD  CONSTRAINT [FK_postulacion_usuario] FOREIGN KEY([idUsuarioDonante])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[postulacion] CHECK CONSTRAINT [FK_postulacion_usuario]
GO
/****** Object:  ForeignKey [FK_usuario_departamento]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_departamento]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_perfil1]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[usuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPerfil_perfil1] FOREIGN KEY([idPerfil])
REFERENCES [dbo].[perfil] ([idPerfil])
GO
ALTER TABLE [dbo].[usuarioPerfil] CHECK CONSTRAINT [FK_usuarioPerfil_perfil1]
GO
/****** Object:  ForeignKey [FK_usuarioPerfil_usuario1]    Script Date: 10/30/2018 10:41:47 ******/
ALTER TABLE [dbo].[usuarioPerfil]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPerfil_usuario1] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuarioPerfil] CHECK CONSTRAINT [FK_usuarioPerfil_usuario1]
GO
