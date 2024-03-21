import { LightningElement, wire, api } from "lwc";
import getProducts from "@salesforce/apex/HilleBrandProductsController.getProducts";
import getFieldsAndRecords from "@salesforce/apex/HilleBrandProductsController.getFieldsAndRecords";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class HillebrandCmp extends LightningElement {
    products;
    error;
    @api sobjectName;
    @api fieldSetName;
    rowdata;
    columdata;

    /* @wire(getProducts, { sobjectName: "$sobjectName", fieldSetName: "$fieldSetName" })
    wiredContacts({ error, data }) {
        if (data) {
            if (data.length > 1) {
                this.products = data;
                console.log(JSON.stringify('p ' + this.products));
                this.error = undefined;
            } else {
                this.products = undefined;
                const toastEvnt = new ShowToastEvent({
                    title: 'Response',
                    message: 'No Records To Display',
                    variant: 'info'
                });
                dispatchEvent(toastEvnt);
            }
        } else if (error) {
            this.error = JSON.stringify(error);
            this.products = undefined;
        }
    } */

    @wire(getFieldsAndRecords, { strObjectApiName: "$sobjectName", strfieldSetName: "$fieldSetName" })
    wiredContacts({ error, data }) {
        if (data) {
            this.rowdata = JSON.parse(data).row;
            this.columdata = JSON.parse(data).column;
            console.log(JSON.stringify('r ' + JSON.stringify(this.rowdata)));
            console.log(JSON.stringify('c ' + JSON.stringify(this.columdata)));
            this.error = undefined;
            /* this.columdata = [
                { label: 'Products Name', fieldName: 'Name', editable: true },
                { label: 'Description', fieldName: 'Description__c', editable: true },
                { label: 'Price', fieldName: 'Price__c' },
                { label: 'Active', fieldName: 'Active__c', type: 'boolean' }
            ]; */

        } else if (error) {
            this.error = JSON.stringify(error);
            this.products = undefined;
        }
    }
}