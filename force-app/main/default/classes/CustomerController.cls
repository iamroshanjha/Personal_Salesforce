public class CustomerController {
    public APEX_Customer__c Customer{get; private set;}
    
    public CustomerController()
    {
        Id id = ApexPages.CurrentPage().getParameters().get('id');
        Customer = id==null ? new APEX_Customer__c() : [Select id, Name, APEX_Customer_Status__c, APEX_Customer_Description__c from APEX_Customer__c where id=:id]; 
    }
    
    public PageReference Save()
    {
        try
        {
            Upsert(Customer);
        }
        catch(System.DMLException e)
        {
            ApexPages.addMessages(e);
            return null;
        }
        PageReference pr=new ApexPages.StandardController(Customer).View();
        return pr;
    
    }
}