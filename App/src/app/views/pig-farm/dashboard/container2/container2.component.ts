import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-container2',
  templateUrl: './container2.component.html',
  styleUrls: ['./container2.component.scss']
})
export class Container2Component implements OnInit {
  yearMonth = new Date();
  constructor() { }

  ngOnInit() {
  }

}
