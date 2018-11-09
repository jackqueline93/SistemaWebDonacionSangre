using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel.UnitOfWork
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private readonly IDatabaseFactory _databaseFactory;
        //private readonly DonacionEntities _context = null;
        private Repository<usuario> _usuarioRepository;
        private Repository<aviso> _avisoRepository;
        private Repository<postulacion> _postulacionRepository;
        private GeneralRepository _generalRepository;

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
        public Repository<aviso> AvispRepository
        {
            get
            {
                if (this._avisoRepository == null)
                    this._avisoRepository = new Repository<aviso>(_databaseFactory);
                return _avisoRepository;
            }
        }
        public Repository<postulacion> PostulacionRepository
        {
            get
            {
                if (this._postulacionRepository == null)
                    this._postulacionRepository = new Repository<postulacion>(_databaseFactory);
                return _postulacionRepository;
            }
        }

        public GeneralRepository GeneralRepository
        {
            get
            {
                if (this._generalRepository == null)
                    this._generalRepository = new GeneralRepository(_databaseFactory);
                return _generalRepository;
            }
        }

        #region Public member methods...
        /// <summary>
        /// Save method.
        /// </summary>
        public void Save()
        {
            try
            {
                _databaseFactory.Get().SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format("{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now, eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                //System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw e;
            }
        }

        #endregion

        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _databaseFactory.Get().Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}
