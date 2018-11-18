export class Aviso {
    constructor(
        public IdAviso: number,
        public IdUsuarioSolicitante: number,
        public Nombre: string,
        public IdSangre: number,
        public Cantidad: number,
        public Descripcion: string,
        public Imagen: string,
        public FechaVigencia: string 
        ){}


}
