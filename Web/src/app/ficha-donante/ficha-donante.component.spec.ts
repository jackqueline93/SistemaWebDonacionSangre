import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FichaDonanteComponent } from './ficha-donante.component';

describe('FichaDonanteComponent', () => {
  let component: FichaDonanteComponent;
  let fixture: ComponentFixture<FichaDonanteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FichaDonanteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FichaDonanteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
