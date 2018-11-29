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
        IEnumerable<ciudad> GetCiudad(int idDepartamento);
    }

    public class GeneralRepository : IGeneralRepository
    {
        private DonacionEntities _ctx;
        private readonly IDbSet<tipoSangre> _dbTipoSangre;
        private readonly IDbSet<departamento> _dbDepartamento;
        private readonly IDbSet<ciudad> _dbCiudad;

        public GeneralRepository(IDatabaseFactory databaseFactory)
        {
            _dbTipoSangre = databaseFactory.Get().Set<tipoSangre>();
            _dbDepartamento = databaseFactory.Get().Set<departamento>();
            _dbCiudad = databaseFactory.Get().Set<ciudad>();
        }

        public IEnumerable<tipoSangre> GetTipoSangre()
        {
            return _dbTipoSangre.ToList();
        }
        public IEnumerable<departamento> GetDepartamento()
        {
            return _dbDepartamento.ToList();
        }
        public IEnumerable<ciudad> GetCiudad(int idDepartamento)
        {
            return _dbCiudad.Where(x => x.idDepartamento.Equals(idDepartamento))?.ToList();
        }
    }
}
