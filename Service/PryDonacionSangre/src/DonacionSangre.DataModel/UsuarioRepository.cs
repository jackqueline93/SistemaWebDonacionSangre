using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
