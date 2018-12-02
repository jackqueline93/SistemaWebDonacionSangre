import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Aviso } from 'src/app/model/aviso.model';
import { UserService } from 'src/app/shared/user.service';
import {Postulante} from 'src/app/model/postulante.model';
import {ToasterService} from 'src/app/toaster-service.service';

@Component({
  selector: 'app-ver-postulante',
  templateUrl: './ver-postulante.component.html',
  styleUrls: ['./ver-postulante.component.css']
  /*animations:[
    trigger('myfirstanimation',[
      state('small',style({height :'0px'})),
      state('large',style({height :'100px'})),
      transition('small <=> large',animate('400ms ease-in'))
    ])
  ]*/
})
export class VerPostulanteComponent implements OnInit {
  /*state: string='small';*/
  panelOpenState = false;
  postulantes: Postulante[];
  constructor(private userService : UserService,private router : Router, private toasterService: ToasterService) { }

  ngOnInit() {
    this.getMisPostulantes();
  }
  getMisPostulantes(){     
        this.userService.getPostulantes( localStorage.getItem('api/login'),localStorage.getItem("verAvisoId") ).subscribe(result => {
              if(result.OperationCode != 200){
                this.toasterService.Error(result);
              }else{
                
                this.postulantes= result;
                if( this.postulantes.length>0){
                  this.toasterService.Info("Usted no tiene postulante para este aviso");

                }
              }
        });
  }
    /*animateMe(){
      this.state =(this.state === 'small'? 'large' : 'small');
    }*/




}
