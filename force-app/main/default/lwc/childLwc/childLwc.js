import { LightningElement, api, track } from 'lwc';

export default class ChildLwc extends LightningElement {
    @api fullName;
    @api cityName;
    @track address;
    addressHandler(event){
        const evt = new CustomEvent('sendaddress',{ 
            detail : { "address" : event.target.value },
            bubbles : true,//to send evennt to parent components
            composed : true// to send event to child components
        });
        this.dispatchEvent(evt);
    }
}