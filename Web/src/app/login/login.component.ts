import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  isLoginError : boolean = false;
  constructor(private userService : UserService,private router : Router) { }
  
  ngOnInit() {

  }
  
  OnSubmit(userName,password){
      this.userService.userAuthentication(userName,password).subscribe((data : any)=>{
        localStorage.setItem('api/login',data.access_token);
        this.router.navigate(['/home']);
      },
      (err : HttpErrorResponse)=>{
        this.isLoginError = true;
      });
  }

}
