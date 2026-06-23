import { LightningElement, wire} from 'lwc';
import getAccounts from '@salesforce/apex/AuraController.getAccounts';

const actions = [
    { label: 'Show details', name: 'show_details' },
    { label: 'Delete', name: 'delete' },
];

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class DataTable extends LightningElement {
    data = [];
    columns = columns;
    record = {};
    isFlag = false;

    //Wire as a function
        @wire(getAccounts) 
        dataFunction({ error, data }){
            if(data){
                this.data = data;
                console.log(data);
            }
            if(error){
                console.error(error);
            }
        }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        this.record = event.detail.row;
        this.isFlag = true;
        alert(actionName);
        alert(JSON.stringify(row));
    }
    closeModal(){
        this.isFlag = false;
    }
}