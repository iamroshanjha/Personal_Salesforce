public inherited sharing class LWCtoApexClass {
    @AuraEnabled(cacheable=true)
    public static List<Object> operationMethod(String data){
        try 
        {
            Map<String,Object> mapData = (Map<String,Object>)JSON.deserializeUntyped(data);
            return new List<Object>{mapData.get('Name'),mapData.get('Company'),mapData.get('Age')};
        } 
        catch (Exception e) 
        {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}