using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;

namespace DonacionSangre.DataModel
{
    public interface IUsuarioRepository : IRepository<usuario>
    {
    }

    public class UsuarioRepository : Repository<usuario>, IUsuarioRepository
    {
        public UsuarioRepository(IDatabaseFactory databaseFactory) : base(databaseFactory)
        {
        }
    }
}
