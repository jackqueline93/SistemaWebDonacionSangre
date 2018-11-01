using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel.GenericRepository
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> Get();
        T GetByID(object id);

    }
}
