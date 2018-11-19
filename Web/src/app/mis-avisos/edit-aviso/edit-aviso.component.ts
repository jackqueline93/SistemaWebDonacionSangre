import { Component, OnInit } from '@angular/core';
import { TipoSangre } from 'src/app/model/tiposangre.model';
import { Aviso } from 'src/app/model/aviso.model';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-edit-aviso',
  templateUrl: './edit-aviso.component.html',
  styleUrls: ['./edit-aviso.component.css']
})
export class EditAvisoComponent implements OnInit {
  dt : null;
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

  OnSubmit(form?:NgForm) { 
   
    this.userService.actualizarAviso(form.value).subscribe((data: any)=>{
      if(data.OperationCode== 200){
        this.router.navigate(['mis-avisos']);
      }
      else{
        console.log('Hubo un problema');
        alert('Mensaje '+ data);
      }
    });
}

}
