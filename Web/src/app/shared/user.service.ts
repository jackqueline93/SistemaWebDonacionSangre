import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { User } from 'src/app/shared/user.model';

const httpOptions = {
  headers: new HttpHeaders({ 
    'Access-Control-Allow-Origin':'*'
  })
};

/*@Injectable({
  providedIn: 'root'
})*/
@Injectable()
export class UserService {
  readonly rootUrl = 'http://localhost:57962';
  constructor(private http: HttpClient){}

  registerUser(user : User)
  {
    const body: User = {
      Email: user.Email,
      Password: user.Password
    }
    return this.http.post(this.rootUrl+'/api/User/Register', body, httpOptions);


  }
}
