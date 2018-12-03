import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { Donante } from 'src/app/model/donante.model';
import { Departamento } from 'src/app/model/departamento.model';
import { Ciudad } from 'src/app/model/ciudad.model';
import { UserService } from 'src/app/shared/user.service';
import { Cuestionario } from 'src/app/model/cuestionario.model';
import {ToasterService} from 'src/app/toaster-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-ficha-donante',
  templateUrl: './ficha-donante.component.html',
  styleUrls: ['./ficha-donante.component.css']
})
export class FichaDonanteComponent implements OnInit {
  departamentos: Departamento[];
  ciudades: Ciudad[];
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  thirdFormGroup: FormGroup;
  donante = new Donante('','','','','','',0,0,'');
  constructor( private _formBuilder: FormBuilder, private userService : UserService, private toasterService: ToasterService, private router : Router) { }

  ngOnInit() {
    this.firstFormGroup = this._formBuilder.group({
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      fecha_nacimiento: ['', Validators.required],
      genero: ['', Validators.required],
      dni: ['', Validators.required],
      celular: ['', Validators.required],
      idDepartamento: ['', Validators.required],
      idCiudad: ['', Validators.required],
      direccion: ['', Validators.required],
    });
    this.secondFormGroup = this._formBuilder.group({
      tipoSangre: ['', Validators.required]
        });
    this.thirdFormGroup = this._formBuilder.group({
      firstQuestion: ['', Validators.required],
      secondQuestion: ['', Validators.required],
      tercerQuestion: ['', Validators.required],
      cuartoQuestion: ['', Validators.required],
      quintoQuestion: ['', Validators.required]
    });
    this.departamentos=[];
    this.getDepartamentos();
    this.ciudades=[];
  }

  getDepartamentos(){

    this.userService.getDepartamentos().subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.departamentos= result;
          }
      });

  }

  doCiudad(event){

    console.log(event.value);
    this.userService.getCiudades(event.value).subscribe(result => {
          if(result.OperationCode != 200){
              console.log(result);
          }else{  
            this.ciudades= result;
          }
    });


  }

  form1(){
   /*  console.log(this.firstFormGroup.value);
    console.log(this.firstFormGroup);
    localStorage.setItem('form123',this.firstFormGroup.value);
    console.log('Mi localstorage :::  '+localStorage.getItem('form123'));
    nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      fecha_nacimiento: ['', Validators.required],
      genero: ['', Validators.required],
      dni: ['', Validators.required],
      celular: ['', Validators.required],
      idDepartamento: ['', Validators.required],
      idCiudad: ['', Validators.required],
      direccion: ['', Validators.required], */

    /*var myObjform1 = {
      nombre: this.firstFormGroup.value.nombre,
      apellido: this.firstFormGroup.value.apellido,
      fecha_nacimiento: this.firstFormGroup.value.fecha_nacimiento,
      genero: this.firstFormGroup.value.genero,
      dni: this.firstFormGroup.value.dni,
      celular: this.firstFormGroup.value.celular,
      idDepartamento: this.firstFormGroup.value.idDepartamento,
      idCiudad: this.firstFormGroup.value.idCiudad,
      direccion: this.firstFormGroup.value.direccion
    };

    localStorage.setItem('form1', JSON.stringify(myObjform1));*/
  }

  form2(){
    var myObjform1 = {
      nombre: this.firstFormGroup.value.nombre,
      apellido: this.firstFormGroup.value.apellido,
      fecha_nacimiento: this.firstFormGroup.value.fecha_nacimiento,
      genero: this.firstFormGroup.value.genero,
      dni: this.firstFormGroup.value.dni,
      celular: this.firstFormGroup.value.celular,
      idDepartamento: this.firstFormGroup.value.idDepartamento,
      idCiudad: this.firstFormGroup.value.idCiudad,
      direccion: this.firstFormGroup.value.direccion,
      idSangre: this.secondFormGroup.value.tipoSangre
    };
    //console.log(myObjform1);
    localStorage.setItem('form1',JSON.stringify(myObjform1));
  }

  form3(){
    console.log('q1  '+this.thirdFormGroup.value.firstQuestion);
  }


  guardar(){
    
   
    if(this.thirdFormGroup.value.firstQuestion != "" &&
      this.thirdFormGroup.value.secondQuestion != "" &&
      this.thirdFormGroup.value.tercerQuestion != "" &&
      this.thirdFormGroup.value.cuartoQuestion != "" &&
      this.thirdFormGroup.value.quintoQuestion != "" 
    )
    {
          var myObjform2 = [
            {
              idPregunta: "1",
              Respuesta: this.thirdFormGroup.value.firstQuestion
            },
            {
              idPregunta: "2",
              Respuesta: this.thirdFormGroup.value.secondQuestion
            },
            {
              idPregunta: "3",
              Respuesta: this.thirdFormGroup.value.tercerQuestion
            },
            {
              idPregunta: "4",
              Respuesta: this.thirdFormGroup.value.cuartoQuestion
            },
            {
              idPregunta: "5",
              Respuesta: this.thirdFormGroup.value.quintoQuestion
            }
          ];
          localStorage.setItem('form2',JSON.stringify(myObjform2));


          this.userService.registrarDonante().subscribe((data: any)=>{
            if(data.OperationCode== 200){
               this.guardarCuestionario();
               
            }
            else{
              //console.log('Hubo un problema');
                this.toasterService.Error(data.Message);
            }
          });



    }else
    {
      this.toasterService.Warning("Por favor de completar el cuestionario")
    }


  
  }

  guardarCuestionario(){
    this.userService.registrarCuestionario().subscribe((data: any)=>{
      if(data.OperationCode== 200){

            this.toasterService.Success('Guardado de postulante exitoso');
            this.router.navigate(['home']);

        }
        else{
          //console.log('Hubo un problema');
            this.toasterService.Error(data);
        }
    });

  }



}
