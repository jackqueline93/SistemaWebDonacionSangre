using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel
{
    public interface IAvisoRepository : IRepository<aviso>
    {
    }
    public class AvisoRepository : Repository<aviso>, IAvisoRepository
    {
        public AvisoRepository(IDatabaseFactory databaseFactory) : base(databaseFactory)
        {
        }
    }
}
