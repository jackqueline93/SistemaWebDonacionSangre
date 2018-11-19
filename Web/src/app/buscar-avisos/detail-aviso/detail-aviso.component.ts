import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { UserService } from 'src/app/shared/user.service';

@Component({
  selector: 'app-detail-aviso',
  templateUrl: './detail-aviso.component.html',
  styleUrls: ['./detail-aviso.component.css']
})
export class DetailAvisoComponent implements OnInit {

  constructor(private userService : UserService,
    public dialogRef: MatDialogRef<DetailAvisoComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any) {}
  
    ngOnInit(){
      
    }

    Postular(idAviso){
      this.userService.PostularAviso(idAviso).subscribe((data: any)=>{
        if(data.OperationCode== 200)
        {
           alert('Su registro fue exitosa')
        }
      });
    }

}
