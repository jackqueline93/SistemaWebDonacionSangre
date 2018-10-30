using DonacionSangre.DataModel.BDContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.DataModel.GenericRepository
{
    public class DatabaseFactory : Disposable, IDatabaseFactory
    {
        private DonacionEntities ctx;

        public DonacionEntities Get()
        {
            return ctx ?? (ctx = new DonacionEntities());
        }

        protected override void DisposeCore()
        {
            if (ctx != null)
                ctx.Dispose();
        }
    }
}
