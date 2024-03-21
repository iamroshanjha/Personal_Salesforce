public class NoOfContact implements Schedulable {
    
    //public static void getNoOfContact()
    //{
        //List<Account> account = [Select Id, No_Of_Contacts__c, (Select Id from Contacts) from Account];
        //List<Account> updateAccountList = new List<Account>();
        
        //for(Account acc : account)
        //{
          //  List<Contact> contactList = acc.Contacts;
          //  acc.No_Of_Contacts__c=contactList.size();
          //  updateAccountList.Add(acc);
        //}
        
        //update updateAccountList;
    //}
    
    public void execute(SchedulableContext ctx) 
    {
        List<Account> account = [Select Id, No_Of_Contacts__c, (Select Id from Contacts) from Account];
        List<Account> updateAccountList = new List<Account>();
        
        for(Account acc : account)
        {
            List<Contact> contactList = acc.Contacts;
            acc.No_Of_Contacts__c=contactList.size();
            updateAccountList.Add(acc);
        }
        
        update updateAccountList;
        
        //System.schedule('Hourly', '0 0 * * * ?', new NoOfContact()); 
    }

}