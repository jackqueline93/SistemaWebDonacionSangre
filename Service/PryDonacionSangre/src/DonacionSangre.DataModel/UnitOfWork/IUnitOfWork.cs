using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;

namespace DonacionSangre.DataModel.UnitOfWork
{
    public interface IUnitOfWork
    {
        Repository<usuario> UsuarioRepository { get; }

        void Save();
    }
}
