public with sharing class TestPracticeClass {
     static list<Account> lstAccount = new list<Account>(); //parent
    static list<Contact> lstContact = new list<Contact>(); // child
    static list<Movie__c> lstMovie = new list<Movie__c>(); //custom parent
    static list<Movie_Theater__c> lstMovieTheater = new list<Movie_Theater__c>(); //custom child
    static List<List<Sobject>> lstSosl = new List<List<Sobject>>();
    static list<Account> lstSOSLAccount = new list<Account>();
    static list<Contact> lstSOSLContact = new list<Contact>();
    static list<Movie__c> lstSOSLMovie = new list<Movie__c>(); 
    
    public TestPracticeClass()
    {
        
    }
    static void main(){
        
        //standard object
        lstAccount=[select id, name,(select id,name from contacts) from account];
        lstContact=[select id,AccountId, Account.Name, name from Contact];
        
        // custom object
        lstMovie=[select id, name,(select id,Movie_Timings__c from Movie_Theaters__r) from Movie__c];
        lstMovieTheater=[select id,Movie__r.Name, Movie__r.Movie_Description__c, name from Movie_Theater__c];
        
        //SOSL
        lstSosl=[FIND 'Sandra Eberhard' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName,Department),Movie__c(Name)];
        lstSOSLAccount=lstSosl[0];
        lstSOSLContact=lstSosl[1];
        lstSOSLMovie=lstSosl[2];
        System.debug(lstAccount);
        seciondtestpractice.main();
    }

}