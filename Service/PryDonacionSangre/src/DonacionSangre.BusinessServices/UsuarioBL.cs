using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using DonacionSangre.Infrastructure.Core.Constant;
using DonacionSangre.Infrastructure.Core.ExceptionHandling;
using DonacionSangre.Infrastructure.Core.Function;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DonacionSangre.BusinessServices
{
    public interface IUsuarioBL
    {
        UsuarioBE ValidarLogin(string correo, string password);
        UsuarioBE ObtenerPorCorreo(string correo);
        UsuarioBE ObtenerPorId(int idUsuario);
        void Registrar(UsuarioBE entidad);
        bool RegistrarDonante(int id, UsuarioBE entidad);
        void RegistrarCuestionarioDonante(IEnumerable<FormularioBE> _formulario, int idUsuario);
    }

    public class UsuarioBL : IUsuarioBL
    {
        private readonly IUnitOfWork unitOfWork;

        public UsuarioBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public UsuarioBE ValidarLogin(string correo, string password)
        {
            var entidad = unitOfWork.UsuarioRepository.Get(t => t.correo == correo && t.password == password);
            var usuario = Mapper.Map<usuario, UsuarioBE>(entidad);
            return usuario;
        }

        public UsuarioBE ObtenerPorCorreo(string correo)
        {
            var entidad = unitOfWork.UsuarioRepository.Get(t => t.correo == correo);
            var usuario = Mapper.Map<usuario, UsuarioBE>(entidad);
            usuario.Password = string.Empty;
            return usuario;
        }

        public UsuarioBE ObtenerPorId(int idUsuario)
        {
            var entidad = unitOfWork.UsuarioRepository.GetByID(idUsuario);
            var usuario = Mapper.Map<usuario, UsuarioBE>(entidad);
            return usuario;
        }

        public void Registrar(UsuarioBE entidad)
        {
            var usuario = Mapper.Map<UsuarioBE, usuario>(entidad);

            if (unitOfWork.UsuarioRepository.Exists(t => t.correo == usuario.correo))
            {
                throw new ApiBusinessException("Correo {0} ya esta registrado.", usuario.correo);
            }

            usuario.usuarioPerfil.Add(new usuarioPerfil() { idPerfil = GeneralConstant.PERFIL_SOLICITANTE, fechaRegistro = DateTime.Now });
            unitOfWork.UsuarioRepository.Insert(usuario);
            unitOfWork.Save();
        }
        public bool RegistrarDonante(int id, UsuarioBE entidad)
        {
            var resultado = false;

            if (id <= 0)
                throw new ApiBusinessException("No existe id de usuario.");

            if (entidad == null)
                throw new ApiBusinessException("No hay datos a modificar.");

            var entidadBd = unitOfWork.UsuarioRepository.GetByID(id);
            if (entidadBd != null)
            {
                entidadBd.nombre = entidad.Nombre;
                entidadBd.apellido = entidad.Apellido;
                entidadBd.fecha_nacimiento = ComunUtil.ConvertirFecha(entidad.Fecha_nacimiento);
                entidadBd.genero = entidad.Genero;
                entidadBd.dni = entidad.Dni;
                entidadBd.celular = entidad.Celular;
                entidadBd.idDepartamento = entidad.IdDepartamento;
                entidadBd.idCiudad = entidad.IdCiudad;
                entidadBd.direccion = entidad.Direccion;

                var perfilDonante = entidadBd.usuarioPerfil.Any(x => x.idPerfil.Equals(GeneralConstant.PERFIL_DONANTE));
                if (!perfilDonante)
                    entidadBd.usuarioPerfil.Add(new usuarioPerfil() { idPerfil = GeneralConstant.PERFIL_DONANTE, fechaRegistro = DateTime.Now });

                unitOfWork.UsuarioRepository.Update(entidadBd);
                unitOfWork.Save();
                resultado = true;
            }
            else
            {
                throw new ApiBusinessException("Usuario {0} no existe.", id);
            }

            return resultado;
        }

        public void RegistrarCuestionarioDonante(IEnumerable<FormularioBE> _formulario, int idUsuario)
        {
            foreach (var item in _formulario)
                item.IdUsuario = idUsuario;

            var formulario = Mapper.Map<IEnumerable<FormularioBE>, IEnumerable<formulario>>(_formulario);
            unitOfWork.FormularioRepository.InsertRange(formulario);
            unitOfWork.Save();
        }
    }
}
