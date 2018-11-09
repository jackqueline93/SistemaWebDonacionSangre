using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.GenericRepository;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DonacionSangre.DataModel
{
    public interface IGeneralRepository
    {
        IEnumerable<tipoSangre> GetTipoSangre();
        IEnumerable<departamento> GetDepartamento();
    }

    public class GeneralRepository : IGeneralRepository
    {
        private DonacionEntities _ctx;
        private readonly IDbSet<tipoSangre> _dbTipoSangre;
        private readonly IDbSet<departamento> _dbDepartamento;

        public GeneralRepository(IDatabaseFactory databaseFactory)
        {
            _dbTipoSangre = databaseFactory.Get().Set<tipoSangre>();
            _dbDepartamento = databaseFactory.Get().Set<departamento>();
        }

        public IEnumerable<tipoSangre> GetTipoSangre()
        {
            return _dbTipoSangre.ToList();
        }
        public IEnumerable<departamento> GetDepartamento()
        {
            return _dbDepartamento.ToList();
        }
    }
}
