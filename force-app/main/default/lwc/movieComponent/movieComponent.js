import { LightningElement, wire, api} from 'lwc';
import getMovies from '@salesforce/apex/MovieTheatreClass.getMovies';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";

import NAME_FIELD from "@salesforce/schema/Lead.Name";
import ID_FIELD from "@salesforce/schema/Lead.Id";
import SOURCE_FIELD from "@salesforce/schema/Lead.LeadSource";

const fields = [NAME_FIELD, ID_FIELD, SOURCE_FIELD];

export default class MovieComponent extends LightningElement {
    movies;
    @api movieId;
    @api movieName;
    showTheatre;
    showMovie=true;
    lead;

    //Extra
    @wire(getRecord, {
        recordId: '00Q6F00001FlxMqUAJ',
        fields
      })
      lead;

      get name() {
        console.log('name getter');
        return getFieldValue(this.lead.data, NAME_FIELD);
      }
    
      get id() {
        console.log('id getter');
        return getFieldValue(this.lead.data, ID_FIELD);
      }
    
      get source() {
        console.log('source getter');
        return getFieldValue(this.lead.data, SOURCE_FIELD);
      }

    

    @wire(getMovies)
    wiredUser({error,data}) 
    {
        if (data)
            this.movies = data;
        else if (error) 
            this.error = error;
    }

    bookMovie(event){
        this.movieId=event.target.value;
        this.movieName=event.target.dataset.name;
        this.showTheatre=true;
        this.showMovie=false;
    }

    showMovieSection(event){
        this.showTheatre=event.detail.showTheatre;
        this.showMovie=event.detail.showMovie;
    }

    renderedCallback()
    {
      console.log('render');
    }
}