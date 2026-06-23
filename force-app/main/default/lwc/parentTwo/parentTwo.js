import { LightningElement, wire } from 'lwc';
import {registerListener,unregisterListener} from 'c/pubsub';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import SIMPLEMESSAGE from '@salesforce/messageChannel/simpleMessage__c';
export default class Receiver extends LightningElement {

    message = 'No Message Received';
    city = '';
    subscription = null;
    message1 = 'No message Received';
    connectedCallback() {
        registerListener('messageevent',this.handleMessage,this);
        if(!this.subscription){
            this.subscription = subscribe(this.messageContext,SIMPLEMESSAGE, (message)=>this.handleMessage1(message));
        }
    }

    @wire(MessageContext)
    messageContext;
    
    disconnectedCallback() {
        unregisterListener('messageevent',this.handleMessage,this);
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    handleMessage(payload) {
        this.message = payload.message;
        this.city = payload.city;
    }
    handleMessage1(message){
        this.message1 = message.message;
    }
}