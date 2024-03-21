public class ChuckNorris {
    @AuraEnabled(cacheable=true)
    public static ChuckNorrisWrapper getRandomJokes()
    {
        String endpoint = 'https://api.chucknorris.io/jokes/random';
        ChuckNorrisWrapper responseData = new ChuckNorrisWrapper();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.Debug(response.getBody());
        if (response.getStatusCode() == 200)
            responseData = ChuckNorrisWrapper.parse(response.getBody());
        else if(response.getStatusCode() == 404)
            responseData.errorMessage = response.getStatus();
        System.Debug(responseData);
        return responseData;
    }
    @AuraEnabled(cacheable=true)
    public static ChuckNorrisWrapper getRandomJokesCategoryWise(String category)
    {
        String endpoint = 'https://api.chucknorris.io/jokes/random?category='+category;
        ChuckNorrisWrapper responseData = new ChuckNorrisWrapper();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.Debug(response.getBody());
        if (response.getStatusCode() == 200)
            responseData = ChuckNorrisWrapper.parse(response.getBody());
        else if(response.getStatusCode() == 404)
            responseData.errorMessage = response.getStatus();
        System.Debug(responseData);
        return responseData;
    }
    @AuraEnabled(cacheable=true)
    public static ChuckNorrisWrapper getJokesCategories()
    {
        String endpoint = 'https://api.chucknorris.io/jokes/categories';
        ChuckNorrisWrapper responseData = new ChuckNorrisWrapper();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.Debug(response.getBody());
        if (response.getStatusCode() == 200)
        {
            String result = response.getBody().replace('[','');
            result = result.replace(']','');
            result = result.replace('\"','');
            responseData.categories = (List<String>)result.Split(',');
        }
        else if(response.getStatusCode() == 404)
            responseData.errorMessage = response.getStatus();
        return responseData;
    }
}