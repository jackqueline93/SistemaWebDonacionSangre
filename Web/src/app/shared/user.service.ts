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
  constructor(private http: HttpClient){}

  registerUser(user : User)
  {
    const body: User = {
      Email: user.Email,
      Password: user.Password
    }
    return this.http.post('/api/User/Register', body, httpOptions);


  }


  userAuthentication(userName, password) {
    var data = "username=" + userName + "&password=" + password + "&grant_type=password";
    var reqHeader = new HttpHeaders({ 'Content-Type': 'application/x-www-urlencoded','No-Auth':'True','Access-Control-Allow-Origin':'*' });
    return this.http.post('/api/login', data, { headers: reqHeader });
  }
}
