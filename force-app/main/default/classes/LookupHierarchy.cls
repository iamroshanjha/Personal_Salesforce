public with sharing class LookupHierarchy {

    public List<account> Account { get; set; }
    
    public List<contact> child { get; set; }

    
    public LookupHierarchy (){
       account =new List<account>();
       account=[select name,(select Lastname,phone from Contacts) from account];
       
       
    }
}