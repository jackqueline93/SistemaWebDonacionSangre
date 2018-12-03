import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/shared/user.model';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/shared/user.service';
import { FormGroup } from '@angular/forms/src/model';

@Component({
  selector: 'app-register-account',
  templateUrl: './register-account.component.html',
  styleUrls: ['./register-account.component.css']
})
export class RegisterAccountComponent implements OnInit  {
  user = new User('','');
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
  constructor(private userService: UserService){

  }

  ngOnInit(){
    this.resetForm();

  }
  resetForm(form? : NgForm){
    if(form !=null){
    form.reset();
    this.user = {
      Correo: '',
      Password: ''
    }
   }
  }

  OnSubmit(form?:NgForm) { 
    //this.submitted = true; 
        this.userService.registerUser(form.value).subscribe((data: any)=>{
          if(data.OperationCode== 200)
              this.resetForm(form);
        });

    
  }


  /*showFormControls(form: any) {
    return form && form.controls['name'] &&
    form.controls['name'].value; // Dr. IQ
  }*/

}
