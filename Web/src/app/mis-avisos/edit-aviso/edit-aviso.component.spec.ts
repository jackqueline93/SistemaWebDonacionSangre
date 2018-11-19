import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EditAvisoComponent } from './edit-aviso.component';

describe('EditAvisoComponent', () => {
  let component: EditAvisoComponent;
  let fixture: ComponentFixture<EditAvisoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EditAvisoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EditAvisoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
