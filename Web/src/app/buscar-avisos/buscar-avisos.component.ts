import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { TipoSangre } from 'src/app/model/tiposangre.model';
import { Aviso } from 'src/app/model/aviso.model';
import { NgForm } from '@angular/forms';
import { Observable } from 'rxjs';
import {MatDialog} from '@angular/material';
import { Inject } from '@angular/core';
import { DetailAvisoComponent } from 'src/app/buscar-avisos/detail-aviso/detail-aviso.component';
import { Departamento } from 'src/app/model/departamento.model';
import { Ciudad } from 'src/app/model/ciudad.model';
export interface DialogData {
  animal: string;
  name: string;
}


@Component({
  selector: 'app-buscar-avisos',
  templateUrl: './buscar-avisos.component.html',
  styleUrls: ['./buscar-avisos.component.css']
})
export class BuscarAvisosComponent implements OnInit {
  [x: string]: any;
  tiposSangre: TipoSangre[];
  departamentos: Departamento[];
  ciudades: Ciudad[];
  avisos: Aviso[]=[];
  aviso = new Aviso(0,0,'',0,null,'','','');
  constructor(private userService : UserService,
    private router : Router,public  dialog: MatDialog) { }
  searchText1: string;
  searchText2: string;
  searchText3: string;

  ngOnInit() {
    this.tiposSangre=[];
    this.avisos=[];
    this.ciudades=[];
    this.departamentos=[];
    this.getTiposSangre();
    this.getMisAvisos();
    this.getDepartamentos();
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

  getDepartamentos(){

    this.userService.getDepartamentos().subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.departamentos= result;
          }
      });

  }

  doCiudad(event){

    this.userService.getCiudades(event.value).subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.ciudades= result;

            localStorage.setItem('codDepartamento', event.value);
            this.getBuquedaAvanzada(localStorage.getItem('codtiposangre'), localStorage.getItem('codDepartamento'), localStorage.getItem('codCiudad'));
    
          }
    });


  }

  getMisAvisos(){
    
    this.userService.getAvisos( localStorage.getItem('api/login')).subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{
              
            this.avisos= result;


             
          }
    });
  
}


  /*buscarAviso(IdSangre){
    this.userService.getBuscarAviso(IdSangre).subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.avisos= result;
          }
    });
  }*/
  Search(event){
    localStorage.setItem('codtiposangre',event.value)
    this.getBuquedaAvanzada(localStorage.getItem('codtiposangre'), localStorage.getItem('codDepartamento'), localStorage.getItem('codCiudad'));
       
  }
  getBuquedaAvanzada(cod1,cod2,cod3){
    this.userService.getBuscarAviso(cod1,cod2, cod3).subscribe(result => {
      if(result.OperationCode != 200){
          console.log(result);
      }else{  
       return this.avisos= result;
      }
    });

  }

  SearchCiudad(event){
    localStorage.setItem('codCiudad',event.value);
    this.getBuquedaAvanzada(localStorage.getItem('codtiposangre'), localStorage.getItem('codDepartamento'), localStorage.getItem('codCiudad'));
    
  }

  verAviso(idAviso): void {
    this.getDetails(idAviso);

  }

  getDetails(idAviso){
    this.userService.getDetailAviso(idAviso).subscribe(result => {
      if(result.OperationCode != 200){
          console.log(result);
      }else{  
        const dialogRef = this.dialog.open(DetailAvisoComponent, {
          width: '250px',
          data: result
        });
    
        dialogRef.afterClosed().subscribe(result => {
          console.log('The dialog was closed');
        
        });
      }
    });
  }

}

