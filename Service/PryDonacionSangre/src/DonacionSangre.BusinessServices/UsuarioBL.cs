using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using DonacionSangre.Infrastructure.Core.ExceptionHandling;

namespace DonacionSangre.BusinessServices
{
    public interface IUsuarioBL
    {
        UsuarioBE ValidarLogin(string correo, string password);
        UsuarioBE ObtenerPorCorreo(string correo);
        UsuarioBE ObtenerPorId(int idUsuario);
        void Registrar(UsuarioBE entidad);
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

            unitOfWork.UsuarioRepository.Insert(usuario);
            unitOfWork.Save();
        }

    }
}
