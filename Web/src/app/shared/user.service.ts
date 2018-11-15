import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { User } from 'src/app/shared/user.model';
import { Observable } from 'rxjs';

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
      Correo: user.Correo,
      Password: user.Password
    }
    return this.http.post('/api/usuarios', body, httpOptions);


  }


  userAuthentication(userName, password) {
    var data = "username=" + userName + "&password=" + password + "&grant_type=password";
    var reqHeader = new HttpHeaders({ 'Content-Type': 'application/x-www-urlencoded','No-Auth':'True','Access-Control-Allow-Origin':'*' });
    return this.http.post('/api/login', data, { headers: reqHeader });
  }

  getDatosUser(token): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+token,'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/seguridad/claims',  { headers: reqHeader });

  }

  getAvisos(token): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+token,'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/avisos',  { headers: reqHeader });

  }
}
