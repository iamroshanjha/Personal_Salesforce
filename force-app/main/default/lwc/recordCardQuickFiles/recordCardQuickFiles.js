import { LightningElement,api } from 'lwc';
import LightningConfirm from 'lightning/confirm';

export default class RecordCardQuickFiles extends LightningElement {
    @api
    recordId;
    onDeleteAllFilesButtonClick() {
        const result = LightningConfirm.open({
            message: 'Are you sure you want to delete all files?',
            variant: 'headerless',
            label: 'Are you sure you want to delete all files?'
        });
    }
}