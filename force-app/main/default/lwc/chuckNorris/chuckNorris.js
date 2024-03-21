import { LightningElement,wire} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getRandomJokes from '@salesforce/apex/ChuckNorris.getRandomJokes';
import getRandomJokesCategoryWise from '@salesforce/apex/ChuckNorris.getRandomJokesCategoryWise';
import getJokesCategories from '@salesforce/apex/ChuckNorris.getJokesCategories';
export default class ChuckNorris extends LightningElement {
    randomJokes;
    allRandomJokes;
    error;
    isLoaded;
    showCategoryModal;
    jokesCategories;

    @wire(getRandomJokes)
    wiredJokes(value) {
        this.isLoaded=false;
        this.allRandomJokes = value;
        const {error,data} = value;
        if (data)
            this.randomJokes = data;
        else if (error)
            this.error = error;
    }
    nextJoke(){
        this.isLoaded=true;
        return refreshApex(this.allRandomJokes);
    }
    categoryJokes(){
        this.isLoaded=true;
        getJokesCategories().then(data => {
            this.isLoaded=false;
            this.jokesCategories = data.categories;
            this.showCategoryModal = true;
        }).catch(error=>{
            this.isLoaded=false;
            this.error = error;
        })
        
    }
    closeModal(){
        this.showCategoryModal = false; 
    }
    selectCategory(event){
        window.console.log(event.target.value);
    }


}