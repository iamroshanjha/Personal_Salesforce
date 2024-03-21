import { LightningElement,track,wire,api } from 'lwc';
import getOpp from '@salesforce/apex/OpportunityACcess.getOpp';

export default class FirstLWC extends LightningElement {
name='Buddy';
dataOpp;
error;
/* @wire(getOpp) wiredData
({ error, data }) {
    if (data) {
        
        this.dataOpp = data;
        console.log('getOppp '+JSON.stringify(this.dataOpp));
        this.error = undefined;
    } else if (error) {
        this.error = error;
        this.dataOpp = undefined;
    }
}; */
@api recordId;

changeName(event)
{
    this.name=event.target.value;
}
handleClick(event){
    getOpp()
        .then(result =>{
            this.dataOpp = result;
        })
        .catch(error =>{
            this.error = error;
        })
}
}