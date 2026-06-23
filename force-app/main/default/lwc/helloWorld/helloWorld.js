import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    name;
    age;
    city;

    printDetails(){
        this.name = 'Kushal';
        this.age = 25;
        this.city = 'Hyderabad';
        console.log(this.name+' '+this.age+' '+this.city);
        console.log(` printDetails  : ${this.name} ${this.age} ${this.city}`);
    }
    printDetails1(name,age, city){
        this.name = name;
        this.age = age;
        this.city = city;
        console.log(`printDetails1: ${this.name} ${this.age} ${this.city}`);
    }
    arrowFun = () => {
        this.name = 'Kushal';
        this.age = 25;
        this.city = 'Hyderabad';
        console.log(this.name+' '+this.age+' '+this.city);
        console.log(`arrowFun : ${this.name} ${this.age} ${this.city}`);
    }
    arrowFun1 = (name,age, city) => {
        this.name = name;
        this.age = age;
        this.city = city;
        console.log(`arrowFun1: ${this.name} ${this.age} ${this.city}`);
    }

    variableFunction(){
        //var 
        //function scoped
        //It can be redeclared and reassigned
        var a = 10, b = 20;
        console.log(a + b);


        //let
        //block scoped
        //It can be reassigned but not redeclared
        let x = 5, y = 15;
        console.log(x + y);

        //const
        //block scoped
        //It cannot be redeclared or reassigned
        const p = 2, q = 3;
        console.log(p + q);
    }


    connectedCallback(){
        this.printDetails();
        this.printDetails1('Uma', 30, 'Bangalore');
        this.arrowFun();
        this.arrowFun1('Mahesh', 28, 'Chennai');
        this.variableFunction();
    }

}