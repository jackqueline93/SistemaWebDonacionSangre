import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import {MatButtonModule, MatCheckboxModule, MatSidenavModule, MatIconModule, MatFormFieldModule} from '@angular/material';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RouterModule, Routes } from '@angular/router';
import { RegisterAccountComponent } from './register-account/register-account.component';
import { UserService } from 'src/app/shared/user.service';
import { HttpClientModule } from '@angular/common/http';

const appRoutes: Routes=[
  { path: 'home', component: HomeComponent },
  { path: 'register-account', component: RegisterAccountComponent },
  { path: 'login', component: LoginComponent}
]


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegisterAccountComponent
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
    RouterModule.forRoot(
      appRoutes,
      {enableTracing: true}
    )
  ],
  providers: [UserService],
  bootstrap: [AppComponent]
})
export class AppModule { }
