import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateThemeComponent } from './update-theme.component';

describe('UpdateThemeComponent', () => {
  let component: UpdateThemeComponent;
  let fixture: ComponentFixture<UpdateThemeComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UpdateThemeComponent]
    });
    fixture = TestBed.createComponent(UpdateThemeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
