import { LightningElement , wire} from 'lwc';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import SIMPLEMESSAGE from '@salesforce/messageChannel/simpleMessage__c';
export default class LmsCmpTwo extends LightningElement {

    subscription = null;
    message = 'No message Received';
    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        if(!this.subscription){
            this.subscription = subscribe(this.messageContext,SIMPLEMESSAGE, (message)=>this.handleMessage(message));
        }
    }
    disconnectedCallback(){
        unsubscribe(this.subscription);
        this.subscription = null;
    }
    handleMessage(message){
        this.message = message.message;
    }
    
}