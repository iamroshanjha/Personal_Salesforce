import { LightningElement,track,wire } from 'lwc';
import msgService from '@salesforce/messageChannel/communication__c';
import {publish,subscribe,unsubscribe,APPLICATION_SCOPE,MessageContext} from 'lightning/messageService';


export default class ShowData extends LightningElement {
    @track data=[];
    @track columns = [ { label: 'Name', fieldName: 'Name' }, { label: 'Description', fieldName: 'Description' }];

    messageReceived;
    subscription

    // Define the Scope of the Message Service  
    @wire (MessageContext)
    messageContext

    // message listener function`   
    handleMessage (message)
    {
        this.data.push(message);
        console.log(JSON.stringify(this.data));
        //this.showData=false;
    }
       
    connectedCallback()
    {
        // subscibe(messageContext, messageChannel, listener, subscriberOption)
        this.subscription = subscribe(this.messageContext, msgService, (message)=>{this.handleMessage(message)}, { scope: APPLICATION_SCOPE})
        //this.data.push({'Name':'this.messageReceived.name','Description':'this.messageReceived.description'});
    }


    // Handle subscription through button
    subscribeHandler()
    {
        // subscibe (messageContext, messageChannel, listener, subscriberOption)
        this.subscription = subscribe(this.messageContext, msgService, (message) =>{this.handleMessage(message)}, { scope: APPLICATION_SCOPE})
    }

    

    // Handle un-subscription through button
    unsuncribeHandler()
    {
        unsubscribe (this.subscription)
        this.subscription = null
    } 
}