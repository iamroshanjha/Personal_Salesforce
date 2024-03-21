import { LightningElement, track,wire} from 'lwc';
import getUserDetails from '@salesforce/apex/ApexClassLWCSupport.getUserDetails';
import Id from '@salesforce/user/Id';

export default class MyComponent extends LightningElement {
    userId = Id;
    user;
    error;
    @wire(getUserDetails, {userId: '$userId'})
    wiredUser({error,data}) 
    {
        window.console.log('data '+JSON.stringify(data));
        window.console.log('error '+JSON.stringify(error));
        if (data)
            this.user = data;
        else if (error) 
            this.error = error;
    }

}