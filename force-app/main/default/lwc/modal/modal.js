import { LightningElement,api } from 'lwc';

export default class Modal extends LightningElement {
    @api modalData;
    closeModal(event) {
        event.preventDefault();
        this.dispatchEvent(new CustomEvent('SearchScreen', 
        {
            bubbles: true, 
            composed:true, 
            detail :
            { 
                showModal: false,
                showUserScreen:false,
                showFeedbackScreen:false

            }
        }
        ));
    }
}