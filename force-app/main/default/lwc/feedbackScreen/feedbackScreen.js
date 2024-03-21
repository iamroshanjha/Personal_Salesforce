import { LightningElement,api } from 'lwc';
import SubmitFeedback from '@salesforce/apex/EazzyMovieClass.SubmitFeedback';

 

export default class FeedbackScreen extends LightningElement {
    @api requestData;
    requestDataFeedbak;
    isLoaded;
    openModal;
    modalData;
    noShowSubmitButton=true;

    constructor() {
        super();
        this.requestDataFeedbak=null;    
        this.template.addEventListener('SearchScreen', this.handleCustomEvent.bind(this));
    }

    handleCustomEvent(event) {
        this.openModal = event.detail.showModal;
    }

    connectedCallback(){
        this.requestDataFeedbak=JSON.parse(JSON.stringify(this.requestData));
    }
    get options() {
        return [
            { label: 'Yes', value: true },
            { label: 'No', value: false },
        ];
    }
    getFeedData(event)
    {
        switch(event.target.name)
        {
            case 'Recommend':
                this.requestDataFeedbak.Recommend=event.target.value;
            break;
            case 'Part':
                this.requestDataFeedbak.PartYouLiked=event.target.value;
            break;
            case 'Rating':
                this.requestDataFeedbak.Rating=event.target.value;
            break;
            case 'Feedback':
                this.requestDataFeedbak.Feedback=event.target.value;
            break; 

        }
        if(this.requestDataFeedbak.Rating!='' && 
        this.requestDataFeedbak.Feedback!='')
        {
            this.noShowSubmitButton=false; 
        }
    }
    goSubmit()
    {
        this.isLoaded=true;
        var request = JSON.stringify(this.requestDataFeedbak);
        SubmitFeedback({feedData:request}).then(data => {
            this.isLoaded=false;
            if(data)
            {
                this.openModal=true;
                this.modalData='Booking was made succesfully and Feedback captured...!!!';
            }
        }).catch(error=>{
            this.isLoaded=false;
        })
    }
}