import { LightningElement,api,wire} from 'lwc';
import getAvailableSeats from '@salesforce/apex/MovieTheatreClass.getAvailableSeats';

export default class TheatreSeatSelection extends LightningElement {
    @api movieId;
    @api movieTheatreId;
    @api movieName;
    @api theatreId;
    @api theatreName;
    @api screenId;
    @api screenName;
    @api screenTime;
    showSeatsAvailable=true;
    seatsAvailable;
    error;

    @wire(getAvailableSeats, {movieTheatreId:'$movieTheatreId'})
    wiredUser({error,data}) 
    {
        if (data)
            this.seatsAvailable = data;
        else if (error) 
            this.error = error;
    }

    goToScreensTimings(){
        const showScreenTimeEvent=new CustomEvent('showscreentime',{
            detail: {
                showMovie: false,
                showTheatre:false,
                showTheatreMovieTimings:true,
                showScreenSeats:false
            } 
        });
        this.dispatchEvent(showScreenTimeEvent);
    }
}