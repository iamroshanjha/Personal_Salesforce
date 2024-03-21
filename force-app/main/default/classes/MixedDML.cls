public class MixedDML {
    public static void createUser(){
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        
        User usr = new User(LastName = 'LIVESTON',
                            FirstName='JASON',
                            Alias = 'jliv',
                            Email = 'roshanjha2095@gmail.com',
                            Username = 'jason.liveston@asdf.com.mixeddml',
                            ProfileId = profileId.id,
                            TimeZoneSidKey = 'GMT',
                            LanguageLocaleKey = 'en_US',
                            EmailEncodingKey = 'UTF-8',
                            LocaleSidKey = 'en_US',
                            isActive=false
                           );
        Database.saveResult dbs = Database.insert(usr);
        if(dbs.isSuccess()){
            Account ac = new Account(Name='MixedDML');
            insert ac;
        }
            
    }
}