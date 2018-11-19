import { PipeTransform } from "@angular/core";
import { Aviso } from "src/app/model/aviso.model";
import { Pipe } from "@angular/core";

@Pipe(
    {name: 'avisoFilter'}
)

export class AvisoFilterPipe implements PipeTransform{

    transform(avisos: Aviso[],searchText:string): Aviso[]{
        if(!avisos || !searchText){
            return avisos;
        }
        return avisos.filter(aviso=> aviso.IdSangre.toString().toLowerCase().indexOf(searchText.toLowerCase()) !==-1);

    }
}