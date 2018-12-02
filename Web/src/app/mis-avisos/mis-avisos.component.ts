import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { Aviso } from 'src/app/model/aviso.model';

@Component({
  selector: 'app-mis-avisos',
  templateUrl: './mis-avisos.component.html',
  styleUrls: ['./mis-avisos.component.css']
})
export class MisAvisosComponent implements OnInit {
  avisos: Aviso[];
  constructor(private userService : UserService,private router : Router) { }

  ngOnInit() {
    this.getMisAvisos();
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

  deleteAviso(aviso: Aviso): void {
    this.userService.deleteAviso(aviso.IdAviso)
      .subscribe( result => {
        if(result.OperationCode != 200){
            console.log(result);
        }else{
          this.getMisAvisos();
        }
      })
  };

  addAviso(): void {
    this.router.navigate(['add-aviso']);
  };

  editAviso(aviso: Aviso): void {
    localStorage.removeItem("editAvisoId");
    localStorage.setItem("editAvisoId", aviso.IdAviso.toString());
    this.router.navigate(['edit-aviso']);
  };
  verPostulantes(id){
    localStorage.removeItem("verAvisoId");
    localStorage.setItem("verAvisoId", id.toString());
    this.router.navigate(['ver-postulante']);
  }

}
