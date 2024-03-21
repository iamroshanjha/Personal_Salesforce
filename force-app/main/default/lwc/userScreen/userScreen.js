import { LightningElement ,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
export default class UserScreen extends LightningElement {
    @api requestData;
    showFeedbackScreen=false;
    today;
    requestDataUser;
    noShowNextButton=true;

    constructor() {
        super();
        this.requestDataUser=null;   
        this.template.addEventListener('SearchScreen', this.handleCustomEvent.bind(this));
    }

    handleCustomEvent(event) {
        this.showFeedbackScreen = event.detail.showFeedbackScreen;
    }

    connectedCallback(){
        this.requestDataUser=JSON.parse(JSON.stringify(this.requestData));
        var today = new Date();
        this.today=today.toISOString().slice(0,10); 
        this.requestDataUser.Date=this.today;
    }

    getUserData(event){
        switch(event.target.name)
        {
            case 'Name':
                this.requestDataUser.Name=event.target.value;
            break;
            case 'Email':
                var format = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if(format.test(event.target.value))
                {
                    this.requestDataUser.Email=event.target.value;
                }
                break;
            case 'Mobile':
                let mobile = this.template.querySelector(".number");
                let mobilevalue = mobile.value;
                var format = /[ A-Za-z`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
                if(format.test(mobilevalue) && mobilevalue.length<10)
                {
                    mobile.setCustomValidity("Only Numbers Allowed");
                }
                else
                {
                    mobile.setCustomValidity('');
                    this.requestDataUser.Mobile=mobilevalue;
                }
                mobile.reportValidity();
            break;
            case 'Date':
                if(Date.parse(event.target.value)!='NaN')
                {
                    this.requestDataUser.Date=event.target.value;
                }
            break; 
        }
        if(this.requestDataUser.Name!='' && 
        this.requestDataUser.Email!='' && 
        this.requestDataUser.Mobile!='' && 
        this.requestDataUser.Date!='')
        {
            this.noShowNextButton=false; 
        }
    }
    goNext(event){
        this.showFeedbackScreen=true; 
    }
}