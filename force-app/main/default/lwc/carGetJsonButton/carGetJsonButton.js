// apexImperativeMethod.js
import { LightningElement, track } from 'lwc';
import getJsonHandler from '@salesforce/apex/carGetJsonHandler.getJsonHandler';
const COLUMNS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'car', fieldName: 'car', type: 'text' },
    { label: 'car model', fieldName: 'car model', type: 'text' },
    { label: 'car_color', fieldName: 'car_color', type: 'text' },
    { label: 'car_model_year', fieldName: 'car_model_year', type: 'text' },
    { label: 'car_vin', fieldName: 'car_vin', type: 'text' },
    { label: 'price', fieldName: 'price', type: 'text' },
    { label: 'availability', fieldName: 'availability', type: 'text' },
];

export default class ApexImperativeMethod extends LightningElement {
   
    @track data;
    @track error;
    @track columns =COLUMNS;
    
    
   
    handleLoad() {
        getJsonHandler()
        .then(result => {
            console.log('122345');
            this.data = result;
        })
        .catch(error => {
            this.data = error;
        });
    }

}
