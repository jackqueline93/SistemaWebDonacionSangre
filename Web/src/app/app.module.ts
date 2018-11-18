import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import {MatButtonModule, MatCheckboxModule, MatSidenavModule, MatIconModule, MatFormFieldModule, MatCardModule } from '@angular/material';
import { HomeComponent } from './home/home.component';
import { BuscarAvisosComponent } from './buscar-avisos/buscar-avisos.component';
import { LoginComponent } from './login/login.component';
import { RouterModule, Routes } from '@angular/router';
import { RegisterAccountComponent } from './register-account/register-account.component';
import { UserService } from 'src/app/shared/user.service';
import { HttpClientModule } from '@angular/common/http';
import { AuthGuard } from './auth/auth.guard';
import {appRoutes} from './routes';
import { MisAvisosComponent } from './mis-avisos/mis-avisos.component';
import { AddAvisoComponent } from './mis-avisos/add-aviso/add-aviso.component';
import {MatSelectModule} from '@angular/material/select';




@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegisterAccountComponent,
    BuscarAvisosComponent,
    MisAvisosComponent,
    AddAvisoComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatCheckboxModule,
    MatSidenavModule,
    MatFormFieldModule,
    MatIconModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    MatCardModule,
    MatSelectModule,
    RouterModule.forRoot(
      appRoutes,
      {enableTracing: true}
    )
  ],
  providers: [UserService, AuthGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }
