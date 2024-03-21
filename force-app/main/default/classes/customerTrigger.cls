public class customerTrigger
{
    public static boolean firstRun =true;
    public static void AccountTriggertest(List<Account> lstAcc)
    {
        if(firstRun)
        {
            firstRun=false;
            for(Account acc:lstAcc)
            {
                System.Debug(acc.Name+' '+firstRun);
            }
        }
        //if(firstRun)
        //{
         //   firstRun=false;
        //}
    }
    
    public static void CreateInvoices(List<APEX_Customer__c> customerList, Map<id,APEX_Customer__c> oldcustomerList)
    {
        List<APEX_Invoice__c> invoiceList = new List<APEX_Invoice__c>();
        for(APEX_Customer__c customers : customerList)
        {
            if(customers.APEX_Customer_Status__c == 'Active' && oldcustomerList.Get(customers.Id).APEX_Customer_Status__c =='Inactive')
            {
                APEX_Invoice__c objInvoice=new APEX_Invoice__c();
                objInvoice.APEX_Customer__c= customers.Id;
                objInvoice.APEX_Status__c='Pending';
                objInvoice.APEX_Description__c = 'Created through after update trigger';
                invoiceList.Add(objInvoice);
            }
        }
        Insert invoiceList;
    }
    
    public static void CreateInvoicesifStatusActive(List<APEX_Customer__c> customerList)
    {
        List<APEX_Invoice__c> invoiceList = new List<APEX_Invoice__c>();
        for(APEX_Customer__c customers : customerList)
        {
            if(customers.APEX_Customer_Status__c == 'Active')
            {
                APEX_Invoice__c objInvoice=new APEX_Invoice__c();
                objInvoice.APEX_Customer__c= customers.Id;
                objInvoice.APEX_Status__c='Pending';
                objInvoice.APEX_Description__c = 'Created through after insert trigger';
                invoiceList.Add(objInvoice);
            }
        }
        Insert invoiceList;
    }
    
    //Method to update the invoice records
    public static void updateCustomerDescription (List<apex_customer__c> customerList,Map<id, apex_customer__c> newMapVariable) {
        List<apex_customer__c> customerListWithInvoice = [SELECT id, Name,(SELECT Id, Name, APEX_Description__c FROM Invoices__r) FROM APEX_Customer__c WHERE Id IN :newMapVariable.keySet()];//Query will be for only one time and fetches all the records
        List<apex_invoice__c> invoiceToUpdate = new List<apex_invoice__c>();
        List<Apex_invoice__c>invList=new List<apex_invoice__c>();
        invList=customerListWithInvoice[0].Invoices__r; 
        for (APEX_Customer__c objCust: customerList) {
           
            for (APEX_Invoice__c objInv: invList) {
                objInv.APEX_Description__c = 'OK To Pay';
               invoiceToUpdate.add(objInv);
            }
        }
        update invoiceToUpdate;
    }
}