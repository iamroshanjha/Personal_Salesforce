import { LightningElement,api} from 'lwc';

export default class GenericComponent extends LightningElement {
    @api Name;
    @api Age;
    @api Gender;
}