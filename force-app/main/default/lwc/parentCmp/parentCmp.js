import { LightningElement, track, api, wire} from 'lwc';
import getAccounts from '@salesforce/apex/AuraController.getAccounts';

export default class ParentCmp extends LightningElement {
    @track name;
    @track age;
    @track city;
    @track showChild = false;
    @track message;
    @track data;
    //Lifecycle Hooks
    //Lifecycle hooks are auto called methods. It is going to be component specific stage.
    
    //Constructor: Called when the component instance is created.
    // to set default values
    //Only called one time.
    //to subscribe events
    constructor(){
        super();
        this.name = 'Kushal';
        console.log('Constructor called in ParentCmp');
    }

    //ConnectedCallback: Called when the component is inserted into the DOM.
    //To call apex methods
    //to fetch data
    //perform some operations like navigation
    //Only called one time.
    connectedCallback(){
        this.getAccounts();
        console.log('connectedCallback called in ParentCmp');
    }

    //renderedCallback: Called when the component properties are updated.
    //called multiple times.
    //To prevent the multiple times calling where we need to use flag.

    //DOM manipulation.
    //to load the third party libraries.
    renderedCallback(){
        console.log('renderedCallback called in ParentCmp');
    }

    //disconnectedCallback: Called when the component is removed into the DOM.
    //to cleanup the data
    //to unsubscribe events
    disconnectedCallback(){
        console.log('disconnectedCallback called in ParentCmp');
    }
    //errorCallback : It is called when the errors occur in the child component.
    errorCallback(error, stack){
        console.log('errorCallback called in ParentCmp');
    }


    showChildAction(){
        this.showChild = true;
    }
    hideChildAction(){
        this.showChild = false;
    }


    inputHandler(event){
        if(event.target.name == 'name'){
            this.name = event.target.value;
        }
        if(event.target.name == 'age'){
            this.age = event.target.value;
        }
        if(event.target.name == 'city'){
            this.city = event.target.value;
        }
    }
    childEventDataAction(event){
        this.message = event.detail.message;
    }


    //Imperative Apex
    getAccounts(){
        getAccounts({})
        .then(result=>{
            this.data = result;
            console.log('result',result);
        })
        .catch(error=>{
            console.log(error);
        })
    }
}