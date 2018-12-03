import {Routes} from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RegisterAccountComponent } from './register-account/register-account.component';
import { BuscarAvisosComponent } from './buscar-avisos/buscar-avisos.component';
import { MisAvisosComponent } from './mis-avisos/mis-avisos.component';
import { AddAvisoComponent } from 'src/app/mis-avisos/add-aviso/add-aviso.component';
import { EditAvisoComponent } from 'src/app/mis-avisos/edit-aviso/edit-aviso.component';
import { VerPostulanteComponent } from 'src/app/mis-avisos/ver-postulante/ver-postulante.component';
import { FichaDonanteComponent } from './ficha-donante/ficha-donante.component';
import { AppComponent } from './app.component';

export const appRoutes: Routes=[
    { path: 'home', component: HomeComponent  },
    { path: 'register-account', component: RegisterAccountComponent },
    { path: 'login', component: LoginComponent},
    { path: 'buscar', component: BuscarAvisosComponent},
    { path: 'mis-avisos', component: MisAvisosComponent},
    { path: 'add-aviso', component: AddAvisoComponent},
    { path: 'edit-aviso', component: EditAvisoComponent},
    { path: 'ver-postulante', component: VerPostulanteComponent},
    { path: 'ficha-donante', component: FichaDonanteComponent},
    { path: 'app', component: AppComponent}
  ]