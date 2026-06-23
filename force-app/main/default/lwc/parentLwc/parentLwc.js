import { LightningElement , track, wire} from 'lwc';
import {registerListener,unregisterListener} from 'c/pubsub';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import SIMPLEMESSAGE from '@salesforce/messageChannel/simpleMessage__c';
export default class ParentLwc extends LightningElement {
    @track name;
    @track city;
    @track address;
    message = 'No Message Received';
    city1 = '';


    subscription = null;
    message1 = 'No message Received';

    inputHandler(event){
        this.name = event.target.value;
        console.log(this.name);
    }
    cityHandler(event){
        this.city = event.target.value;
        console.log(this.city);
    }
    addressEventAction(event){
        this.address = event.detail.address;
        this.city = event.detail.address;
    }
    callAction(event){
        alert( event.detail.address);
    }

    @wire(MessageContext)
    messageContext;
    handleMessage1(message){
        this.message = message.message;
    }


    

    connectedCallback() {
        registerListener('messageevent',this.handleMessage,this);
        if(!this.subscription){
            this.subscription = subscribe(this.messageContext,SIMPLEMESSAGE, (message)=>this.handleMessage1(message));
        }
    }

    disconnectedCallback() {
        unregisterListener('messageevent',this.handleMessage,this);
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    handleMessage(payload) {
        this.message = payload.message;
        this.city1 = payload.city;
    }



    
    
}