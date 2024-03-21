import { LightningElement,api,wire,track } from 'lwc';

export default class LWCtoAPex extends LightningElement {

    @api recordId;
    @track apidatalwc1='Buddy';
    changeName(event){
        this.apidatalwc1=event.target.value;
        
    }
    

}