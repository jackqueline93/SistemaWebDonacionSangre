using System;
using System.Collections.Generic;

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
        public int CantidadPostulante => Postulacion != null ? Postulacion.Count : 0;
        public string Descripcion { get; set; }
        //public byte[] Imagen { get; set; }
        public string FechaVigencia { get; set; }
        public int IdDepartamento { get; set; }
        public int IdCiudad { get; set; }

        public ICollection<PostulacionBE> Postulacion { get; set; }
    }
}
