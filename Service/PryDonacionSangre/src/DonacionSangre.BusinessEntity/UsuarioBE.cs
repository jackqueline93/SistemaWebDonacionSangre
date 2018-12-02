using System;
using System.Collections.Generic;

namespace DonacionSangre.BusinessEntity
{
    public class UsuarioBE
    {
        public int IdUsuario { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }

        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Apellido { get; set; }
        public string Fecha_nacimiento { get; set; }
        public string Genero { get; set; }
        public string Dni { get; set; }
        public string Celular { get; set; }
        public Nullable<int> IdDepartamento { get; set; }
        public Nullable<int> IdCiudad { get; set; }
        public Nullable<int> idSangre { get; set; }
        public ICollection<UsuarioPerfilBE> UsuarioPerfil { get; set; }
    }
}
