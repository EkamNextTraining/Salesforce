import { LightningElement, api,wire, track } from 'lwc';

export default class ChildCmp extends LightningElement {
    @api fullName;
    @api age;
    @api city;
    @api rec;
    constructor(){
        super();
        this.name = 'Kushal';
        console.log('Constructor called in ChildCmp');
    }
    connectedCallback(){
        console.log('connectedCallback called in ChildCmp');
    }
    renderedCallback(){
        console.log('renderedCallback called in ChildCmp');
    }
    disconnectedCallback(){
        console.log('disconnectedCallback called in ChildCmp');
    }
    errorCallback(error, stack){
        console.log('errorCallback called in ChildCmp');
    }
    sendDataAction(){
        const event = new CustomEvent('childdata',{
            detail:{ 'message' : this.fullName+' '+this.age+' '+this.city}
        })
        this.dispatchEvent(event);
    }
}




/**
 *  
    Parent Component                Child LWC                    Child Child LWC 

    1. constructor                  3. constructor               5.constructor

    2. connectedCallback            4. connectedCallback         6.connectedCallback

    9. renderedCallback             8. renderedCallback          7.renderedCallback

    disconnectedCallback            disconnectedCallback         disconnectedCallback

    errorCallback                   errorCallback                 errorCallback
    
 */