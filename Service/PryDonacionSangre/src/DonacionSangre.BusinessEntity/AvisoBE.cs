using System;

namespace DonacionSangre.BusinessEntity
{
    public class AvisoBE
    {
        public int IdAviso { get; set; }
        public int IdUsuarioSolicitante { get; set; }
        public string Nombre { get; set; }
        public int IdSangre { get; set; }
        public Nullable<int> idRequerimiento { get; set; }
        public string Critico { get; set; }
        public decimal Cantidad { get; set; }
        public string Descripcion { get; set; }
        public byte[] Imagen { get; set; }
    }
}
