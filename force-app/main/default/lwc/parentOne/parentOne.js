import { LightningElement , track, wire} from 'lwc';
import { fireEvent } from 'c/pubsub';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import SIMPLEMESSAGE from '@salesforce/messageChannel/simpleMessage__c';
export default class Sender extends LightningElement {
    @track text;
    @track city;
    inputHandler(event){
        this.text = event.target.value;
    }
    cityHandler(event){
        this.city = event.target.value;
    }
    sendMessage() {
        fireEvent('messageevent', {
            message: this.text,
            city: this.city
        });
    }



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