using DonacionSangre.DataModel.BDContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel.GenericRepository
{
    public interface IDatabaseFactory : IDisposable
    {
        DonacionEntities Get();
    }
}
