import { LightningElement ,api, wire, track} from 'lwc';
import getCarList from '@salesforce/apex/CarController.getCarList';
export default class LightningDatatableLWCExample extends LightningElement {
    @track columns = [{
            label: 'Car name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        },
        {
            label: 'Value',
            fieldName: 'Value',
            type: 'Currency',
            sortable: true
        },
        {
            label: 'Bought price',
            fieldName: 'Price__c',
            type: 'Currency',
            sortable: true
        }
    ];
    @api recordId;
    @track cars;

    connectedCallback(){
        this.loadCars();
    }
     
    loadCars(){
        getCarList({recordId : this.recordId})
            .then(result => { console.log('record:'+ this.recordId)
            this.cars = result;
            })
            .catch(error => {
                this.cars = error;
            });
    }
}
    
