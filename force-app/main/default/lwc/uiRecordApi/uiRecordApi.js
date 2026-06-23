import { LightningElement, api, wire, track } from 'lwc';
import { getRecord, getFieldValue, updateRecord ,createRecord } from "lightning/uiRecordApi";
import createAccount from '@salesforce/apex/AuraController.createAccount';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class UiRecordApi extends LightningElement {
    @api recordId;
    @track record = {"Name":"","Industry":""}
    changeHandler(event) {
        this.record[event.target.name] = event.target.value;
    }


    @wire(getRecord, {recordId: '$recordId',fields: [NAME_FIELD, INDUSTRY_FIELD]})
    account({data,error}){
        if(data){
            this.record['Id'] = data?.id;
            this.record['Name'] = data?.fields?.Name?.value;
            this.record['Industry'] = data?.fields?.Industry?.value;
            console.log('data',data);
        } else {
            console.log(error);
        }
    }

    /*async handleCreate() {

        const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields:this.record };

        try {
        // Invoke createRecord
        const account = await createRecord(recordInput);
        console.log('');
        } catch (error) {
        // Handle error
        }
    }*/

    
    handleCreate() {
        if(this.recordId!=null){
            this.updateAccount();
        } else {
            this.createAccount();
        }
    }


    createAccount(){
        createAccount({acc:this.record})
        .then(result=>{
             console.log('result',result);
             this.showToast('Success',"Account created"+result.Id,'success');
        })
        .catch(error=>{
            
        })
    }
    updateAccount() {

      updateRecord({fields:this.record})
        .then(() => {
            this.showToast('Success','Account updated','success');
        })
        .catch((error) => {
          this.showToast('','','error');
        });
    } 
    showToast(title,message,variant){
        this.dispatchEvent(new ShowToastEvent({title,message,variant}));   
    }
}