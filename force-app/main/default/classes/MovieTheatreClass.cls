public class MovieTheatreClass {
    
    @AuraEnabled(cacheable=true)
    public static List<Movie__c> getMovies()
    {
        List<Movie__c> lstMovies = [SELECT Id, Movie_Image__c, Movie_Description__c, isMovieFinished__c, 
                                    Name FROM Movie__c WHERE isMovieFinished__c=false];
        if(!lstMovies.isEmpty())
            return lstMovies;
        else
            return null;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<MovieTheatreClass.MovieTheatreWrapper> getTheatres(Id movieId)
    {
        List<Movie_Theater__c> lstMovieTheatres = [SELECT Id, Name, Movie_Timings__c, Movie__c, Screen__c, Screen__r.Theater__c,
                                                   Screen__r.Name, Seat_A_1__c, Seat_A_2__c, Seat_A_3__c, Seat_A_4__c, 
                                                   Seat_A_5__c, Seat_B_1__c, Seat_B_2__c, Seat_B_3__c, Seat_B_4__c, 
                                                   Seat_B_5__c, Seat_C_1__c, Seat_C_2__c, Seat_C_3__c, Seat_C_4__c, 
                                                   Seat_C_5__c, Seat_D_1__c, Seat_D_2__c, Seat_D_3__c, Seat_D_4__c, 
                                                   Seat_D_5__c, Screen__r.Theater__r.Name,
                                                   Screen__r.Theater__r.Theater_Address__c, 
                                                   Screen__r.Theater__r.No_of_Seats__c FROM 
                                                   Movie_Theater__c  WHERE Movie__c =:movieId AND 
                                                   Movie__r.isMovieFinished__c = false];
        if(!lstMovieTheatres.isEmpty())
        {
            List<MovieTheatreClass.MovieTheatreWrapper> lstMovieTheatreWrap = new List<MovieTheatreClass.MovieTheatreWrapper>();
            for(Movie_Theater__c mt : lstMovieTheatres)
                lstMovieTheatreWrap.add(new MovieTheatreClass.MovieTheatreWrapper(mt));
            return lstMovieTheatreWrap;
            
        }
        else
            return null;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<MovieTheatreClass.MovieTheatreWrapper> getTheatresScreensandTimings(Id movieId, Id theatreId)
    {
        List<Movie_Theater__c> lstMovieTheatres = [SELECT Id, Name, Movie_Timings__c, Movie__c, Screen__c, Screen__r.Theater__c,
                                                   Screen__r.Name, Seat_A_1__c, Seat_A_2__c, Seat_A_3__c, Seat_A_4__c, 
                                                   Seat_A_5__c, Seat_B_1__c, Seat_B_2__c, Seat_B_3__c, Seat_B_4__c, 
                                                   Seat_B_5__c, Seat_C_1__c, Seat_C_2__c, Seat_C_3__c, Seat_C_4__c, 
                                                   Seat_C_5__c, Seat_D_1__c, Seat_D_2__c, Seat_D_3__c, Seat_D_4__c, 
                                                   Seat_D_5__c, Screen__r.Theater__r.Name,
                                                   Screen__r.Theater__r.Theater_Address__c, 
                                                   Screen__r.Theater__r.No_of_Seats__c FROM 
                                                   Movie_Theater__c WHERE Movie__c =:movieId AND 
                                                   Movie__r.isMovieFinished__c = false AND
                                                   Screen__r.Theater__c=:theatreId];
        if(!lstMovieTheatres.isEmpty())
        {
            List<MovieTheatreClass.MovieTheatreWrapper> lstMovieTheatreWrap = new List<MovieTheatreClass.MovieTheatreWrapper>();
            for(Movie_Theater__c mt : lstMovieTheatres)
                lstMovieTheatreWrap.add(new MovieTheatreClass.MovieTheatreWrapper(mt));
            return lstMovieTheatreWrap;
            
        }
        else
            return null;
    }
    
    
    @AuraEnabled(cacheable=true)
    public static MovieTheatreClass.MovieTheatreWrapper getAvailableSeats(Id movieTheatreId)
    {
        List<Movie_Theater__c> lstMovieTheatres = [SELECT Id, Name, Movie_Timings__c, Movie__c, Screen__c, Screen__r.Theater__c,
                                                   Screen__r.Name, Seat_A_1__c, Seat_A_2__c, Seat_A_3__c, Seat_A_4__c, 
                                                   Seat_A_5__c, Seat_B_1__c, Seat_B_2__c, Seat_B_3__c, Seat_B_4__c, 
                                                   Seat_B_5__c, Seat_C_1__c, Seat_C_2__c, Seat_C_3__c, Seat_C_4__c, 
                                                   Seat_C_5__c, Seat_D_1__c, Seat_D_2__c, Seat_D_3__c, Seat_D_4__c, 
                                                   Seat_D_5__c, Screen__r.Theater__r.Name,
                                                   Screen__r.Theater__r.Theater_Address__c, 
                                                   Screen__r.Theater__r.No_of_Seats__c FROM 
                                                   Movie_Theater__c WHERE Id =:movieTheatreId];
        if(!lstMovieTheatres.isEmpty())
        	return new MovieTheatreClass.MovieTheatreWrapper(lstMovieTheatres[0]);
        else
            return null;
    }
    
    public class MovieTheatreWrapper {
        @AuraEnabled public Object Name;
        @AuraEnabled public Object MovieTheatreId;
        @AuraEnabled public Object Movie_Timings;
        @AuraEnabled public Object Movie;
        @AuraEnabled public Object Theater;
        @AuraEnabled public Object Screen;
        @AuraEnabled public Object Screen_Name;
        @AuraEnabled public Object Theater_Name;
        @AuraEnabled public Object Theater_Address;
        @AuraEnabled public Object Theater_No_of_Seats;
        @AuraEnabled public Object Seat_A_1;
        @AuraEnabled public Object Seat_A_2;
        @AuraEnabled public Object Seat_A_3;
        @AuraEnabled public Object Seat_A_4;
        @AuraEnabled public Object Seat_A_5;
        @AuraEnabled public Object Seat_B_1;
        @AuraEnabled public Object Seat_B_2;
        @AuraEnabled public Object Seat_B_3;
        @AuraEnabled public Object Seat_B_4;
        @AuraEnabled public Object Seat_B_5;
        @AuraEnabled public Object Seat_C_1;
        @AuraEnabled public Object Seat_C_2;
        @AuraEnabled public Object Seat_C_3;
        @AuraEnabled public Object Seat_C_4;
        @AuraEnabled public Object Seat_C_5;
        @AuraEnabled public Object Seat_D_1;
        @AuraEnabled public Object Seat_D_2;
        @AuraEnabled public Object Seat_D_3;
        @AuraEnabled public Object Seat_D_4;
        @AuraEnabled public Object Seat_D_5;
        
        public MovieTheatreWrapper(Movie_Theater__c movieTheatre)
        {
            this.Name = movieTheatre.Name;
            this.MovieTheatreId = movieTheatre.Id;
            this.Movie_Timings = movieTheatre.Movie_Timings__c;
            this.Movie = movieTheatre.Movie__c;
            this.Screen = movieTheatre.Screen__c;
            this.Screen_Name = movieTheatre.Screen__r.Name;
            this.Theater = movieTheatre.Screen__r.Theater__c;
            this.Theater_Name = movieTheatre.Screen__r.Theater__r.Name;
            this.Theater_Address = movieTheatre.Screen__r.Theater__r.Theater_Address__c;
            this.Theater_No_of_Seats = movieTheatre.Screen__r.Theater__r.No_of_Seats__c;
            this.Seat_A_1 = movieTheatre.Seat_A_1__c;
            this.Seat_A_2 = movieTheatre.Seat_A_2__c;
            this.Seat_A_3 = movieTheatre.Seat_A_3__c;
            this.Seat_A_4 = movieTheatre.Seat_A_4__c;
            this.Seat_A_5 = movieTheatre.Seat_A_5__c;
            this.Seat_B_1 = movieTheatre.Seat_B_1__c;
            this.Seat_B_2 = movieTheatre.Seat_B_2__c;
            this.Seat_B_3 = movieTheatre.Seat_B_3__c;
            this.Seat_B_4 = movieTheatre.Seat_B_4__c;
            this.Seat_B_5 = movieTheatre.Seat_B_5__c;
            this.Seat_C_1 = movieTheatre.Seat_C_1__c;
            this.Seat_C_2 = movieTheatre.Seat_C_2__c;
            this.Seat_C_3 = movieTheatre.Seat_C_3__c;
            this.Seat_C_4 = movieTheatre.Seat_C_4__c;
            this.Seat_C_5 = movieTheatre.Seat_C_5__c;
            this.Seat_D_1 = movieTheatre.Seat_D_1__c;
            this.Seat_D_2 = movieTheatre.Seat_D_2__c;
            this.Seat_D_3 = movieTheatre.Seat_D_3__c;
            this.Seat_D_4 = movieTheatre.Seat_D_4__c;
            this.Seat_D_5 = movieTheatre.Seat_D_5__c;
        }
    }
    
    
    
}