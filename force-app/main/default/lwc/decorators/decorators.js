import { LightningElement, api, track, wire} from 'lwc';
import getAccounts from '@salesforce/apex/AuraController.getAccounts';

export default class Decorators extends LightningElement {
    //track
    //It is used to track the reactivity of the property.
    //It is used track changes in objects, arrays and boolean variable.
    @track name;
    @track age;
    @track city;
    @track data;

    //api
    //It makes property or a method public.
    //Parent component can access the properties and methods.
    //Data communication

    @api country;

    //Wire
    //It is used to read data from Salesforce database or external systems.

    //Wire as a property
    @wire(getAccounts) 
    accounts;

    //Wire as a function
    @wire(getAccounts) 
    dataFunction({ error, data }){
        if(data){
            this.data = data;
            console.log(data);
        }
        if(error){
            console.error(error);
        }
    }

    //wire as a reactive service
    /*@wire(getAccounts, { city: '$name' })
    reactiveAccounts;*/

}