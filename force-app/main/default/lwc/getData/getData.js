import { LightningElement,track,wire } from 'lwc';
import submitTestDataApex from "@salesforce/apex/submitTestData.submitTestDataApex";
import msgService from '@salesforce/messageChannel/communication__c';
import {publish,subscribe,unsubscribe,APPLICATION_SCOPE,MessageContext} from 'lightning/messageService';


export default class GetData extends LightningElement {
@track name;
@track description;

@wire(MessageContext)messageContext  

    getname(event){

        this.name=event.target.value;

    }

    getDesc(event){

        this.description=event.target.value;

    }

    submitdata()
    {
        submitTestDataApex({'name':this.name,'description':this.description})
        .then((result)=>{
            console.log('data '+JSON.stringify(result));

            

            this.publishHandler();
            let cmp1 = this.template.querySelectorAll("lightning-input");
            cmp1.forEach(cmp=>cmp.value="");
            
        })
        .catch((error)=>{
            console.log('error '+JSON.stringify(error));
        });
        
    }

    publishHandler()
    {
        
    try{
        let message = {
            
            Name:this.name,
            Description:this.description
        };
        publish(this.messageContext,msgService,message);
    }
    catch(ex)
    {
        console.log(ex);
    }
    }




}