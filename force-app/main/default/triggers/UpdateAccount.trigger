trigger UpdateAccount on Account (after update) {
    
    /*Map<Id, String> idVsPhone = new Map<Id,String>();
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        for(Account acc : Trigger.New)
        {
            //if(!Trigger.OldMap.get(acc.id).Phone.EqualsIgnoreCase(acc.Phone))
                idVsPhone.put(acc.id, acc.Phone);
        }
    }
    System.Debug(idVsPhone);
    List<Case> lstCase = [SELECT Id, AccountId, Description from Case where AccountId in : idVsPhone.keySet() ];
    System.Debug(lstCase);
    for(Case cs : lstCase)
    {
        cs.Description   = idVsPhone.get(cs.AccountId);
        System.Debug(cs.Description);
    }
    List<Database.saveresult> dbs = Database.update(lstCase,false);
    for(Database.saveresult db : dbs)
    {
        System.debug(db.isSuccess());
    }*/
    Contact cc = new Contact(Lastname='triggcon', AccountId=Trigger.New[0].Id);
    Insert cc;
    System.Debug('trigg');
    Account ac = new Account(Id=Trigger.New[0].Id, YearStarted='2021');
    update ac;
    
}