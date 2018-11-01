using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel.UnitOfWork
{
    public interface IUnitOfWork
    {
        Repository<usuario> UsuarioRepository { get; }
    }
}
