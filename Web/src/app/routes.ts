import {Routes} from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RegisterAccountComponent } from './register-account/register-account.component';
import { AuthGuard } from './auth/auth.guard';

export const appRoutes: Routes=[
    { path: 'home', component: HomeComponent  },
    { path: 'register-account', component: RegisterAccountComponent },
    { path: 'login', component: LoginComponent}
  ]