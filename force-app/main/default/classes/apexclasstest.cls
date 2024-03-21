public class apexclasstest {
    
    public static void data()
    {
        /*
        //system.debug([select id from account where name=:System.Label.GreetName]);
        //using get all
        Map<string,test__c> test1 = test__c.getAll();
        for(String key : test1.keySet())
        {
            System.debug(test1.get(key).Name);
            System.debug(test1.get(key).country__c);
            System.debug(test1.get(key).code__c);
        }
        //using getinstance or getvalue
        test__c test = test__c.getValues('IND');
        System.debug(test.Name);
        System.debug(test.country__c);
        System.debug(test.code__c);
        test.code__c='84';
        update test;
        
        //Using soql
        List<test__c> data = [select id, name, country__c,code__c from test__c];
        for(test__c key : data)
        {
            System.debug(key.Name);
            System.debug(key.country__c);
            System.debug(key.code__c);
        }
        
        test__c tc = new test__c(Name='UB', country__c='Pak', code__c='92');
        insert tc;
        */
        
        List<abcd__mdt> mdt = [select id, MasterLabel, data__c,DeveloperName from abcd__mdt];
        for(abcd__mdt key : mdt)
        {
            System.debug(key.MasterLabel);
            System.debug(key.data__c);
            System.debug(key.DeveloperName);
        }
        
            
    }

}