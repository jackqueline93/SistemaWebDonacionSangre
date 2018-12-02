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
  
  avisos: Aviso[]=[];
  aviso = new Aviso(0,0,'',0,null,'','','');
  constructor(private userService : UserService,
    private router : Router,public  dialog: MatDialog) { }
  searchText: string;

  ngOnInit() {
    this.tiposSangre=[];
    this.avisos=[];
    this.getTiposSangre();
    this.getMisAvisos();
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

  getMisAvisos(){
    
    this.userService.getAvisos( localStorage.getItem('api/login')).subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{
              
            this.avisos= result;
             
          }
    });
  
}


  buscarAviso(IdSangre){
    this.userService.getBuscarAviso(IdSangre).subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.avisos= result;
          }
    });
  }
  Search(){
    this.userService.getBuscarAviso(this.searchText).subscribe(result => {
      if(result.OperationCode != 200){
          console.log(result);
      }else{  
       return this.avisos= result;
      }
    });
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

