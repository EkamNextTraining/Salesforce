import { LightningElement, wire, track} from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import SIMPLEMESSAGE from '@salesforce/messageChannel/simpleMessage__c';
export default class LmsCmpOne extends LightningElement {
    @track value;
    @wire(MessageContext)
    messageContext;

    sendMessage(event){
        this.value = event.target.value;
        const payload = {
            'message' : this.value
        }
        publish(this.messageContext, SIMPLEMESSAGE, payload);
    }
}