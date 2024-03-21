public class SongLyrics {
    @AuraEnabled(cacheable=true)
    public static String getLyrics(String artist, String title)
    {
        artist = EncodingUtil.urlEncode(artist,'UTF-8');
        
        title = EncodingUtil.urlEncode(title,'UTF-8');
        String endpoint = 'https://api.lyrics.ovh/v1/'+artist+'/'+title;
        String responseData;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        if (response.getStatusCode() == 200) {
            Map<String, Object> metadata_Map = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            responseData = (String)metadata_Map.get('lyrics');
        }
        else if(response.getStatusCode() == 404)
            responseData = response.getStatus();
        return responseData;
    }
    
    
    
}