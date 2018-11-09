using DonacionSangre.DataModel.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.BusinessServices
{
    public interface IPostulacionBL
    {

    }

    public class PostulacionBL : IPostulacionBL
    {
        private readonly IUnitOfWork unitOfWork;

        public PostulacionBL()
        {
            unitOfWork = new UnitOfWork();
        }
    }
}
