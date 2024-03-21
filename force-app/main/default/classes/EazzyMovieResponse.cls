public class EazzyMovieResponse {
    
    @AuraEnabled public List<Search> Search;
    @AuraEnabled public String totalResults;
    @AuraEnabled public String Response;
    @AuraEnabled public String Error;
    
    public class Search {
        @AuraEnabled public String Title;
        @AuraEnabled public String Year;
        @AuraEnabled public String imdbID;
        @AuraEnabled public String Type;
        @AuraEnabled public String Poster;
        @AuraEnabled public Boolean radio=false;
    }
    
    
    public static EazzyMovieResponse parse(String json) {
        return (EazzyMovieResponse) System.JSON.deserialize(json, EazzyMovieResponse.class);
    }
}