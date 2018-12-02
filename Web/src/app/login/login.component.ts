import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';
import {ToasterService} from 'src/app/toaster-service.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  isLoginError : boolean = false;
  idUSER : number;
  constructor(private userService : UserService,private router : Router,private toasterService: ToasterService ) { }
  ngOnInit() {

  }
  
  OnSubmit(userName,password){
      this.userService.userAuthentication(userName,password).subscribe((data : any)=>{
       this.toasterService.Success("Ingreso Exitoso");
        localStorage.setItem('api/login',data.access_token);

         this.userService.getDatosUser(data.access_token).subscribe(result => {
                if(result.OperationCode != 200){
                 
                 
                  console.log(result);
              }else{
              
                  this.idUSER = result.Data.IdUsuario;
                  localStorage.setItem('idUsuario',this.idUSER.toString());
              }
         });

        this.router.navigate(['/home']);
      },
      (err : HttpErrorResponse)=>{
        this.isLoginError = true;
        this.toasterService.Error(err.message);
      });
  }

}
