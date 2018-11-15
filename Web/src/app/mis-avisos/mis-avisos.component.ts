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

}
