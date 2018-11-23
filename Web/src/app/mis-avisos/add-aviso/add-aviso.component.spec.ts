import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddAvisoComponent } from './add-aviso.component';

describe('AddAvisoComponent', () => {
  let component: AddAvisoComponent;
  let fixture: ComponentFixture<AddAvisoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddAvisoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddAvisoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
