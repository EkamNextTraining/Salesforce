import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    name;
    age;
    city;
    nameHandler(event){
        this.name = event.target.value;
        console.log(this.name);
    }
    ageHandler(event){
        this.age = event.target.value;
        console.log(this.age);
    }
    cityHandler(event){
        this.city = event.target.value;
        console.log(this.city);
    }
}