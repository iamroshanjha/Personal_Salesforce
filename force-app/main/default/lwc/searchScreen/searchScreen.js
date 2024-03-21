import { LightningElement,track,api } from 'lwc';
import getMovieList from '@salesforce/apex/EazzyMovieClass.getMovieList';

export default class SearchScreen extends LightningElement {

    isLoaded;
    result;
    resultValue;
    error;
    noShowNextButton=true;
    requestData={MovieName:'',Name:'',Email:'',Mobile:'', Date:'', Rating:'', Feedback:'', 
                                                            PartYouLiked:'', Recommend:''};
    showUserScreen=false;

    constructor() {
        super();  
        this.template.addEventListener('SearchScreen', this.handleCustomEvent.bind(this));
    }

    handleCustomEvent(event) {
        this.showUserScreen = event.detail.showUserScreen;
        this.result=null;
        this.resultValue=false;
        this.noShowNextButton=true; 
    }

    
    search(){
        this.noShowNextButton=true;
        this.isLoaded=true;
        let name = this.template.querySelector(".data");
        console.log(JSON.stringify(name));
        let namevalue = name.value;
        if(namevalue==='')
        {
            name.setCustomValidity("Please Enter Search Criteria");
            this.isLoaded=false;
        }
        else
        {
            name.setCustomValidity('');
            getMovieList({title:namevalue}).then(data => {
                this.isLoaded=false;
                this.result = data;
                this.resultValue=this.result.Response==='True'?true:false;
            }).catch(error=>{
                this.isLoaded=false;
                this.error = error;
            })
        }
        name.reportValidity();
        
    }
    handleChangeEvent(event)
    {
        this.noShowNextButton=false;
        let data = JSON.parse(JSON.stringify(this.result));
        data.Search.forEach(opt => {
            if (opt.imdbID === event.target.dataset.value) {
                this.requestData.MovieName=event.target.dataset.value;
                opt.radio = true;
            } else {
                opt.radio = false;
            }
        });
        this.result=data;
        

    }
    goNext(event){
        this.showUserScreen=true;
    }
}