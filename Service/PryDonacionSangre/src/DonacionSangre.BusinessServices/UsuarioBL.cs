using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.BusinessServices
{
    public interface IUsuarioBL
    {
        bool ValidarLogin(string correo, string password);
        UsuarioBE Obtener(int idUsuario);
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

        public UsuarioBE Obtener(int idUsuario)
        {
            var entidad = unitOfWork.UsuarioRepository.GetByID(idUsuario);
            var usuario = Mapper.Map<usuario, UsuarioBE>(entidad);
            return usuario;
        }
    }
}
