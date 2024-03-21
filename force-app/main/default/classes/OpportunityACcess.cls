public inherited sharing class OpportunityACcess {
    
    @Auraenabled(Cacheable=true)
    public static List<Opportunity> getOpp()
    {
        //if(SChema.SObjectType.
        List<Opportunity> lstOpp =  [select id, name from Opportunity];
        System.debug(lstOpp);
        return lstOpp;
    }

}