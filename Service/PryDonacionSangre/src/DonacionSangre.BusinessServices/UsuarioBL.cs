using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;

namespace DonacionSangre.BusinessServices
{
    public interface IUsuarioBL
    {
        bool ValidarLogin(string correo, string password);
        UsuarioBE ObtenerPorCorreo(string correo);
        UsuarioBE ObtenerPorId(int idUsuario);
    }

    public class UsuarioBL : IUsuarioBL
    {
        private readonly IUnitOfWork unitOfWork;

        public UsuarioBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public bool ValidarLogin(string correo, string password)
        {
            var token = unitOfWork.UsuarioRepository.Get(t => t.correo == correo && t.password == password);
            return token != null ? true : false;
        }

        public UsuarioBE ObtenerPorCorreo(string correo)
        {
            var entidad = unitOfWork.UsuarioRepository.Get(t => t.correo == correo);
            var usuario = Mapper.Map<usuario, UsuarioBE>(entidad);
            return usuario;
        }

        public UsuarioBE ObtenerPorId(int idUsuario)
        {
            var entidad = unitOfWork.UsuarioRepository.GetByID(idUsuario);
            var usuario = Mapper.Map<usuario, UsuarioBE>(entidad);
            return usuario;
        }
    }
}
