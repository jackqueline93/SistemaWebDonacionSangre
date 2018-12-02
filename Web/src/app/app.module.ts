import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import {MatButtonModule, MatCheckboxModule, MatSidenavModule, MatIconModule,MatNativeDateModule,  MatFormFieldModule, MatCardModule, MatInputModule, MatDialogModule, MatDividerModule} from '@angular/material';
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
import { AvisoFilterPipe } from 'src/app/buscar-avisos/aviso-filter.pipe';
import { DetailAvisoComponent } from 'src/app/buscar-avisos/detail-aviso/detail-aviso.component';
import { EditAvisoComponent } from './mis-avisos/edit-aviso/edit-aviso.component';
import {ToasterService} from './toaster-service.service';
import {MatExpansionModule} from '@angular/material/expansion';
import { VerPostulanteComponent } from 'src/app/mis-avisos/ver-postulante/ver-postulante.component';
import { FichaDonanteComponent } from './ficha-donante/ficha-donante.component';
import {MatStepperModule} from '@angular/material/stepper';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatRadioModule} from '@angular/material/radio';



@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegisterAccountComponent,
    BuscarAvisosComponent,
    MisAvisosComponent,
    AddAvisoComponent,
    AvisoFilterPipe,
    DetailAvisoComponent,
    EditAvisoComponent,
    VerPostulanteComponent,
    FichaDonanteComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatCheckboxModule,
    MatRadioModule,
    MatSidenavModule,
    MatFormFieldModule,
    MatIconModule,
    HttpClientModule,
    ReactiveFormsModule,
    MatInputModule,
    MatExpansionModule,
    FormsModule,
    MatCardModule,
    MatStepperModule,
    MatDialogModule,
    MatSelectModule,
    MatDividerModule,
    MatDatepickerModule,
    RouterModule.forRoot(
      appRoutes,
      {enableTracing: true}
    )
  ],
  entryComponents:[
   DetailAvisoComponent
  ],
  providers: [UserService, AuthGuard, ToasterService],
  bootstrap: [AppComponent]
})
export class AppModule { }
