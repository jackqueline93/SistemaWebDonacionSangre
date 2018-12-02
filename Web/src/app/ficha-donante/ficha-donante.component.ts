import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { Donante } from 'src/app/model/donante.model';
import { Departamento } from 'src/app/model/departamento.model';
import { Ciudad } from 'src/app/model/ciudad.model';
import { UserService } from 'src/app/shared/user.service';
import { Cuestionario } from 'src/app/model/cuestionario.model';

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
  constructor( private _formBuilder: FormBuilder, private userService : UserService) { }

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
    console.log(this.firstFormGroup.value);
    console.log(this.firstFormGroup);
    localStorage.setItem('form123',this.firstFormGroup.value);
    console.log('Mi localstorage :::  '+localStorage.getItem('form123'));
  }

  form2(){
    console.log(this.secondFormGroup.value.secondCtrl);
  }


  guardar(){
    console.log(this.secondFormGroup.value.secondCtrl);
  }



}
