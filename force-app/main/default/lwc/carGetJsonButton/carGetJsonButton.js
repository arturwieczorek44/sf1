// apexImperativeMethod.js
import { LightningElement, track } from 'lwc';
import getJsonHandler from '@salesforce/apex/carGetJsonHandler.getJsonHandler';

export default class ApexImperativeMethod extends LightningElement {
    @track cars;
    @track error;
    
   
    handleLoad() {
        getJsonHandler()
        .then(result => {
            this.cars = result;
        })
        .catch(error => {
            this.cars = error;
        });
    }
}
