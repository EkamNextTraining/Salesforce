import { LightningElement, api, wire } from "lwc";

import { getRecord, getFieldValue } from "lightning/uiRecordApi";

import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import RATING_FIELD from "@salesforce/schema/Account.Rating";
import OWNER_EMAIL_FIELD from "@salesforce/schema/Account.Owner.Email";

export default class GetRecord extends LightningElement {
  objectApiName = ACCOUNT_OBJECT;
  nameField = NAME_FIELD;
  ratingField = RATING_FIELD;

  @api recordId;
  @api objectApiName;

  @wire(getRecord, {recordId: "$recordId",fields: [OWNER_EMAIL_FIELD,NAME_FIELD, RATING_FIELD]})
  record;


  get ownerField() {
    return this.record.data ? getFieldValue(this.record.data, OWNER_EMAIL_FIELD) : "";
  }
  get nameField() {
    return this.record.data ? getFieldValue(this.record.data, NAME_FIELD) : "";
  }
  get ratingValue() {
    return this.record.data ? getFieldValue(this.record.data, RATING_FIELD) : "";
  }
}