using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;

namespace DonacionSangre.DataModel.UnitOfWork
{
    public interface IUnitOfWork
    {
        Repository<usuario> UsuarioRepository { get; }
        Repository<aviso> AvisoRepository { get; }
        Repository<postulacion> PostulacionRepository { get; }
        GeneralRepository GeneralRepository { get; }

        void Save();
    }
}
