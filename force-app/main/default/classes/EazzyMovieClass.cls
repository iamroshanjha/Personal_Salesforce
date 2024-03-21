public with sharing class EazzyMovieClass {
    
    @AuraEnabled(cacheable=true)
    public static EazzyMovieResponse getMovieList(String title)
    {
        EazzyMovieResponse responseData = new EazzyMovieResponse();
        try
        {
            EazzyMovieApiKey__c eazzyApi = EazzyMovieApiKey__c.getValues('EazzyMovie');
            String apiKey = eazzyApi.API_Key__c;
            title = EncodingUtil.urlEncode(title,'UTF-8');
            String endpoint = 'callout:EazzyMovie/?apikey='+apiKey+'&s='+title;
            //String endpoint = 'callout:EazzyMovie/?s='+title;
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            //request.setHeader('APIKEY', '{!$Credential.Password}');
            //request.setHeader('Authorization', 'apikey={!$Credential.Password}');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            responseData = EazzyMovieResponse.parse(response.getBody());
            if(responseData.Search!=null)
                for(EazzyMovieResponse.Search sc :responseData.Search)
                	sc.radio=false;
            return responseData;
        }
        catch(Exception ex)
        {
            System.debug(ex.getLineNumber()+ex.getStackTraceString()+ex.getMessage());
            return null;
        }
    }
    
    @AuraEnabled
    public static Boolean SubmitFeedback(String feedData)
    {
        try
        {
            Map<String, Object> requestData = (Map<String, Object>) JSON.deserializeUntyped(feedData);
            MovieFeedback__c movieFeedback = new MovieFeedback__c();
            movieFeedback.Movie_Overall_Feedback__c=(String)requestData.get('Feedback');
            movieFeedback.Movie_Would_You_Recommend__c=Boolean.valueOf(requestData.get('Recommend'));
            movieFeedback.Movie_Part_You_Liked__c=(String)requestData.get('PartYouLiked');
            movieFeedback.Movie_Rating__c=Integer.valueOf(requestData.get('Rating'));
            String movieDate = String.valueOf(requestData.get('Date'));
            movieFeedback.Movie_Watch_Date__c=Date.valueOf(movieDate);
            movieFeedback.User_Mobile_Number__c=(String)requestData.get('Mobile');
            movieFeedback.User_Email__c=(String)requestData.get('Email');
            movieFeedback.User_Name__c=(String)requestData.get('Name');
            movieFeedback.Movie_Name__c=(String)requestData.get('MovieName');
            Database.SaveResult saveResult=Database.insert(movieFeedback);
            return saveResult.isSuccess();
        }
        catch(Exception ex)
        {
            return false;
        }
        
    }
    
    
}