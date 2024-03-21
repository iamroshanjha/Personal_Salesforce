import { LightningElement } from 'lwc';
import getLyrics from '@salesforce/apex/SongLyrics.getLyrics';

export default class SongsLyrics extends LightningElement {
artist;
title;
result;
error;
isLoaded;

getArtist(event){
    this.artist=event.target.value;
    window.console.log('artist '+JSON.stringify(this.artist));
}
getTitle(event){
    this.title=event.target.value;
    window.console.log('title '+JSON.stringify(this.title));
}

findLyrics()
{
    this.isLoaded=true;
    window.console.log('method');
    getLyrics({artist:this.artist , title:this.title}).then(data => {
        this.isLoaded=false;
        this.result = data; 
    }).catch(error=>{
        this.isLoaded=false;
        this.error = error;
    })
}

}