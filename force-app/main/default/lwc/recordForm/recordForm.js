import { LightningElement, api } from "lwc";
export default class RecordForm extends LightningElement {
  @api recordId;
  @api objectApiName;
  fields = ["AccountId", "Name", "Title", "Phone", "Email"];
  connectedCallback(){
    alert(this.recordId+' '+this.objectApiName);
  }
}