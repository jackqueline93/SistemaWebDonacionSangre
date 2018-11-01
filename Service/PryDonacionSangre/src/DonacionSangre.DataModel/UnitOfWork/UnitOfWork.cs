using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IDatabaseFactory _databaseFactory;
        //private readonly DonacionEntities _context = null;
        private Repository<usuario> _usuarioRepository;

        public UnitOfWork()
        {
            //_context = new DonacionEntities();
            this._databaseFactory = new DatabaseFactory();
        }

        public Repository<usuario> UsuarioRepository
        {
            get
            {
                if (this._usuarioRepository == null)
                    this._usuarioRepository = new Repository<usuario>(_databaseFactory);
                return _usuarioRepository;
            }
        }
    }
}
