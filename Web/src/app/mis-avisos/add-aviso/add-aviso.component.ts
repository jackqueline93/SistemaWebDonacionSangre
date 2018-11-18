import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { TipoSangre } from 'src/app/model/tiposangre.model';
import { Aviso } from 'src/app/model/aviso.model';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-add-aviso',
  templateUrl: './add-aviso.component.html',
  styleUrls: ['./add-aviso.component.css']
})
export class AddAvisoComponent implements OnInit {
  tiposSangre: TipoSangre[];
  aviso = new Aviso(0,0,'',0,null,'','','');
  constructor(private userService : UserService,private router : Router) { }

  ngOnInit() {
    this.getTiposSangre();
  }
  

  getTiposSangre(){
      
    this.userService.getTiposSangre().subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.tiposSangre= result;
          }
    });
  }

  resetForm(form? : NgForm){
    if(form !=null){
    form.reset();
      this.aviso = {
        IdAviso: 0,
        IdUsuarioSolicitante: 0,
        Nombre: '',
        IdSangre: 0,
        Cantidad: null,
        Descripcion: '',
        Imagen: '',
        FechaVigencia: ''
    }
   }
  }

  OnSubmit(form?:NgForm) { 
   
        this.userService.registerAviso(form.value).subscribe((data: any)=>{
          if(data.OperationCode== 200){
              this.resetForm(form);
          }
          else{
            console.log('Hubo un problema');
          }
        });
  }

  

}
