import { LightningElement , wire, track} from 'lwc';
import { getObjectInfo , getObjectInfos , getPicklistValues , getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";


export default class GetObjectInfo extends LightningElement {
    @track objData;
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    getObjectInfo({data, error}){
        if(data){
            this.objData = data;
            console.log('getObjectInfo',data);
        }else{
            console.log(error);
        }
    }
    @wire(getObjectInfos, { objectApiNames: [ACCOUNT_OBJECT,OPP_OBJECT,CONTACT_OBJECT] })
    getObjectInfos({data, error}){
        if(data){
            console.log('getObjectInfos',data);
        }else{
            console.log(error);
        }
    }
    @wire(getPicklistValues, { recordTypeId:  '$objData.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD })
    getPicklistValues({data, error}){
        if(data){
            console.log('getPicklistValues',data);
        }else{
            console.log(error);
        }
    };
    @wire(getPicklistValuesByRecordType, { objectApiName: ACCOUNT_OBJECT , recordTypeId: '$objData.defaultRecordTypeId' })
    getPicklistValuesByRecordType({data, error}){
        if(data){
            console.log('getPicklistValuesByRecordType',data);
        }else{
            console.log(error);
        }
    };
}