trigger upDateCityOnOpps on Account (after update) {
    List<Opportunity> lstOpp = new List<Opportunity>();
    for(Opportunity opps : [SELECT Id, Name, AccountId, City__c FROM Opportunity where AccountId IN : Trigger.NewMap.KeySet()])
        if(Trigger.OldMap.get(opps.AccountId).BillingCity==null || 
           (Trigger.OldMap.get(opps.AccountId).BillingCity!=null && 
            Trigger.NewMap.get(opps.AccountId).BillingCity!=null && 
            !Trigger.OldMap.get(opps.AccountId).BillingCity.EqualsIgnoreCase(Trigger.NewMap.get(opps.AccountId).BillingCity)))
        {
            opps.City__c = Trigger.NewMap.get(opps.AccountId).BillingCity;
            lstOpp.add(opps);
        }
    Update lstOpp;
                
}