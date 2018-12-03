import { Component, OnInit } from '@angular/core';
import { TipoSangre } from 'src/app/model/tiposangre.model';
import { Aviso } from 'src/app/model/aviso.model';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {ToasterService} from 'src/app/toaster-service.service';



@Component({
  selector: 'app-edit-aviso',
  templateUrl: './edit-aviso.component.html',
  styleUrls: ['./edit-aviso.component.css']
})
export class EditAvisoComponent implements OnInit {
  editForm: FormGroup;
  dt : null;
  tiposSangre: TipoSangre[];
  aviso = new Aviso(0,0,'',0,null,'','','');
  constructor(private formBuilder: FormBuilder,private userService : UserService,private router : Router, private toasterService: ToasterService ) { }

  ngOnInit() {
    this.tiposSangre=[];
    var avisoID=  localStorage.getItem("editAvisoId");
    if(!avisoID){
      this.toasterService.Warning('Acción inválida');
      this.router.navigate(['mis-avisos']);
      return;
    }
    this.editForm = this.formBuilder.group({
        IdAviso: [],
        IdUsuarioSolicitante: [],
        Nombre : ['', Validators.required],
        IdSangre : ['', Validators.required],
        Cantidad : ['', Validators.required],
        Descripcion : ['', Validators.required],
        FechaVigencia: ['', Validators.required]
    });
   
    this.getAviso(avisoID);

  }

  getAviso(idAviso){
    this.userService.getDetailAviso(idAviso).subscribe(result => {
      if(result.OperationCode != 200){
          this.toasterService.Error(result.Message);
          this.router.navigate(['buscar']);
      }else{  
        this.aviso.Cantidad=result.Data.Cantidad;
        this.aviso.IdAviso=result.Data.IdAviso;
        this.aviso.IdUsuarioSolicitante = result.Data.IdUsuarioSolicitante;
        this.aviso.Nombre=result.Data.Nombre;
        //this.aviso.IdSangre=result.Data.IdSangre;
        this.getTiposSangre(result.Data.IdSangre);
        this.aviso.Descripcion = result.Data.Descripcion;
        this.aviso.FechaVigencia=result.Data.FechaVigencia;
        this.editForm.setValue(this.aviso); 
      }
    });

  }

  getTiposSangre(idSangre){     
    this.userService.getTiposSangre().subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.tiposSangre= result;
            this.tiposSangre.findIndex(idSangre);
            
          }
    });
  }

  OnSubmit(form?:NgForm) { 
   
    this.userService.actualizarAviso(form.value).subscribe((data: any)=>{
      if(data.OperationCode== 200){
        this.toasterService.Success('Actualización exitosa');
        this.router.navigate(['mis-avisos']);
      }
      else{
        console.log('Hubo un problema');
        alert('Mensaje '+ data);
        this.toasterService.Error(data.Message);
      }
    });
}

}
