import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VerPostulanteComponent } from './ver-postulante.component';

describe('VerPostulanteComponent', () => {
  let component: VerPostulanteComponent;
  let fixture: ComponentFixture<VerPostulanteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VerPostulanteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VerPostulanteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
