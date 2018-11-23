import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailAvisoComponent } from './detail-aviso.component';

describe('DetailAvisoComponent', () => {
  let component: DetailAvisoComponent;
  let fixture: ComponentFixture<DetailAvisoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DetailAvisoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailAvisoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
