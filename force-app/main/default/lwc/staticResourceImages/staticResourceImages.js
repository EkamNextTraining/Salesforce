import { LightningElement ,track} from 'lwc';
import IMAGES  from '@salesforce/resourceUrl/images';
import one from './imageone.html';
import two from './imagetwo.html';
import main from './staticResourceImages.html';
import formFactor from "@salesforce/client/formFactor";

export default class StaticResourceImages extends LightningElement {
    imageOne = IMAGES+'/salesforce.jpg';
    imageTwo = IMAGES+'/salesforcebw.jpg';

    @track value = 'main';
    connectedCallback(){
        console.log('formFactor', formFactor);
    }
    imageClickHandler(event){
        this.value = event.target.value;
    }
    render(){
        return this.value=='one' ? one : this.value=='two' ? two : main;
    }
}