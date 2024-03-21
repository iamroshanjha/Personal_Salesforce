public without sharing class batchclass implements Database.Batchable<sObject>, Database.Stateful{
    Set<id> successids = new set<id>();
    Set<id> failureids = new set<id>();
    public final String Query;
    public final String Entity;
    public final String Field;
    public final String Value;
    
    public batchclass(String q, String e, String f, String v){
        
        Query=q; Entity=e; Field=f;Value=v;
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<sObject> scope){
        for(sobject s : scope){
            s.put(Field,Value); 
        }
        List<database.saveresult> sv = database.update(scope, false);
        for(database.saveresult s : sv)
        {
            if(s.isSuccess())
            {
                successids.add(s.getId());	
            }
            else
            {
                failureids.add(s.getId());	
            }
        }
    }
    
    public void finish(Database.BatchableContext BC){
        System.debug('these are success' +successids);
        System.debug('these are faliuse' +failureids);
    }
}