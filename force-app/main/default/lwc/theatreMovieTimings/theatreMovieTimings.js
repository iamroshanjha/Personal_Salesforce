import { LightningElement,api,wire} from 'lwc';
import getTheatresScreensandTimings from '@salesforce/apex/MovieTheatreClass.getTheatresScreensandTimings';

export default class TheatreMovieTimings extends LightningElement {
    @api movieId;
    @api movieTheatreId;
    @api movieName;
    @api theatreId;
    @api theatreName;
    @api screenId;
    @api screenName;
    @api screenTime;
    showScreenSeats;
    showTheatreMovieTimings=true;
    theatresScreenTimings;
    error;

    @wire(getTheatresScreensandTimings, {movieId:'$movieId', theatreId:'$theatreId'})
    wiredUser({error,data}) 
    {
        if (data)
            this.theatresScreenTimings = data;
        else if (error) 
            this.error = error;
    }

    goToTheatre()
    {
        const showTheatreEvent=new CustomEvent('showtheatre',{
            detail: {
                showMovie: false,
                showTheatre:true,
                showTheatreMovieTimings:false
            } 
        });
        this.dispatchEvent(showTheatreEvent);
    }

    selectSeats(event){
        this.screenId=event.target.value;
        this.screenName=event.target.dataset.name;
        this.screenTime=event.target.dataset.screenTime;
        this.movieTheatreId=event.target.dataset.movieTheatre;
        this.showTheatreMovieTimings=false;
        this.showScreenSeats=true;
    }

    showScreenTime(event){
        this.showMovie=event.detail.showMovie;
        this.showTheatre=event.detail.showTheatre;
        this.showTheatreMovieTimings=event.detail.showTheatreMovieTimings;
        this.showScreenSeats=event.detail.showScreenSeats;
    }

}