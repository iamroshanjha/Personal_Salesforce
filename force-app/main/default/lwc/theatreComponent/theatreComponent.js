import { LightningElement,api,wire} from 'lwc';
import getTheatres from '@salesforce/apex/MovieTheatreClass.getTheatres';

export default class TheatreComponent extends LightningElement {
    @api movieId;
    @api movieName;
    @api theatreId;
    @api theatreName;
    showMovie;
    showTheatre=true;
    showTheatreMovieTimings;
    theatres;
    error;

    @wire(getTheatres, {movieId:'$movieId'})
    wiredUser({error,data}) 
    {
        if (data)
            this.theatres = data;
        else if (error) 
            this.error = error;
    }

    selectTimingsSlots(event)
    {
        this.showTheatre=false;
        this.theatreId=event.target.value;
        this.theatreName=event.target.dataset.name;
        this.showTheatreMovieTimings=true;
    }
    goToMovie()
    {
        const showMovieEvent=new CustomEvent('showmovies',{
            detail: {
                showMovie: true,
                showTheatre:false
            } 
        });
        this.dispatchEvent(showMovieEvent);
    }
    showTheatreSection(event)
    {
        this.showMovie=event.detail.showMovie;
        this.showTheatre=event.detail.showTheatre;
        this.showTheatreMovieTimings=event.detail.showTheatreMovieTimings;
    }

}