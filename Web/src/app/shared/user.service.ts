import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { User } from 'src/app/shared/user.model';
import { Observable } from 'rxjs';
import { Aviso } from 'src/app/model/aviso.model';

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

  deleteAviso(id: number): Observable<any> {
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),'Access-Control-Allow-Origin':'*' });
    return this.http.delete('/api/avisos'+ '/' + id,  { headers: reqHeader });
  }

  getTiposSangre(): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/general/tipoSangre',  { headers: reqHeader });

  }
  getPostulantes(token, idAviso): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+token,'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/avisos/'+idAviso+'/postulante',  { headers: reqHeader });

  }
 
  registerAviso(aviso : Aviso): Observable<any>{

    const bodyAviso = {
      Nombre: aviso.Nombre,
      IdSangre: aviso.IdSangre,
      Cantidad: aviso.Cantidad,
      Descripcion: aviso.Descripcion,
      FechaVigencia: aviso.FechaVigencia
    }
    const reqHeader = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),
                              'Access-Control-Allow-Origin':'*',
                              'Content-Type': 'application/json' })};
    
    return this.http.post('/api/avisos', bodyAviso, reqHeader);
  }

  getBuscarAviso(codigo: string): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/postulaciones'+'/'+codigo.toString(),  { headers: reqHeader });
  }
  getDetailAviso(codigo: string): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/avisos'+'/'+codigo.toString(),  { headers: reqHeader });
  }

  PostularAviso(idAviso: number){
    const reqHeader = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),
                              'Access-Control-Allow-Origin':'*',
                              'Content-Type': 'application/json' })};
      const bodyPostulacion = {
        idAviso: idAviso
      }
      return this.http.post('/api/postulaciones', bodyPostulacion, reqHeader);


  }
  getAvisosAll(token): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+token,'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/avisos/all',  { headers: reqHeader });

  }

  actualizarAviso(aviso : Aviso):  Observable<any>{
    const bodyAviso = {
      Nombre: aviso.Nombre,
      IdSangre: aviso.IdSangre,
      Cantidad: aviso.Cantidad,
      Descripcion: aviso.Descripcion,
      FechaVigencia: aviso.FechaVigencia
    }
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),'Access-Control-Allow-Origin':'*' });
    return this.http.put('/api/avisos/'+ localStorage.getItem("editAvisoId"), bodyAviso,  { headers: reqHeader });

  }

  logout(){
    var reqHeader = new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),'Access-Control-Allow-Origin':'*' });
    return this.http.put('/api/seguridad/logout',   { headers: reqHeader });

  }

  getDepartamentos(): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/general/departamento',  { headers: reqHeader });

  }

  getCiudades(idDepartamento : string): Observable<any>{
    var reqHeader = new HttpHeaders({ 'Access-Control-Allow-Origin':'*' });
    return this.http.get('/api/general/ciudad/'+idDepartamento,  { headers: reqHeader });

  }

  registrarDonante(): Observable<any>{
    const reqHeader = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),
                              'Access-Control-Allow-Origin':'*',
                              'Content-Type': 'application/json' })};
                           
    return this.http.post('/api/usuarios/donante', JSON.parse(localStorage.getItem('form1')), reqHeader);
  }

  registrarCuestionario(): Observable<any>{
    const reqHeader = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer '+localStorage.getItem('api/login'),
                              'Access-Control-Allow-Origin':'*',
                              'Content-Type': 'application/json' })};
    
    return this.http.post('/api/usuarios/donante/cuestionario',JSON.parse(localStorage.getItem('form2')), reqHeader);
  }



}
