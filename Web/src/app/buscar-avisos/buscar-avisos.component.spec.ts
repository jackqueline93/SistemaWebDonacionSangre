import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BuscarAvisosComponent } from './buscar-avisos.component';

describe('BuscarAvisosComponent', () => {
  let component: BuscarAvisosComponent;
  let fixture: ComponentFixture<BuscarAvisosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BuscarAvisosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BuscarAvisosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
