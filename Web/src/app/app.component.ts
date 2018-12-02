import { Component } from '@angular/core';
import {ToasterService} from './toaster-service.service';
import { UserService } from 'src/app/shared/user.service';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'mydonacionsangre';
  opened =true;
  events: string[] = [];
  constructor(private toasterService: ToasterService, private userService : UserService) {
  {

  }
 }
   
 
  Logout(){
    
    this.userService.logout().subscribe((data: any)=>{
      if(data.OperationCode== 200){
   

      }
      else{
        console.log('Hubo un problema');
      }
    });
  }


}
