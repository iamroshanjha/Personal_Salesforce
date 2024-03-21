public class ChuckNorrisWrapper 
{
    @AuraEnabled public List<String> categories;
    @AuraEnabled public String created_at;
    @AuraEnabled public String icon_url;
    @AuraEnabled public String id;
    @AuraEnabled public String updated_at;
    @AuraEnabled public String url;
    @AuraEnabled public String value;
    @AuraEnabled public String errorMessage;
           
    @AuraEnabled(cacheable=true)
    public static ChuckNorrisWrapper parse(String json) 
    {
        return (ChuckNorrisWrapper) System.JSON.deserialize(json, ChuckNorrisWrapper.class);
    }
}