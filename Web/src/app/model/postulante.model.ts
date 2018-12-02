export class Postulante {
    constructor(
        public IdUsuario: number,
        public Correo: string,
        public Password: string,
        public Nombre: string,
        public Direccion: string,
        public Apellido: string,
        public FechaNacimiento: string,
        public Genero: string,
        public Dni: string,
        public Celular: string,
        public IdDepartamento: number,
        public IdCiudad: number,
        ){}
}
