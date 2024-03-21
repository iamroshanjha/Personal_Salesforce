import { LightningElement,wire } from 'lwc';
import getOpp from '@salesforce/apex/OpportunityACcess.getOpp';

export default class OpportunitySearch extends LightningElement {
    columns = [
        { label: 'Name', fieldName: 'name' }
        
    ];
    dataOpp=[];
    @wire(getOpp)
    wireData({ error, data }) {
        if (data) {
            this.dataOpp = [...data];
            console.log('data '+JSON.stringify(this.dataOpp));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.dataOpp = undefined;
        }
    }
}