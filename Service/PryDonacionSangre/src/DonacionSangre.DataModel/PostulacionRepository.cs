using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel
{
    public interface IPostulacionRepository : IRepository<postulacion>
    {
    }

    public class PostulacionRepository : Repository<postulacion>, IPostulacionRepository
    {
        public PostulacionRepository(IDatabaseFactory databaseFactory) : base(databaseFactory)
        {
        }
    }
}
