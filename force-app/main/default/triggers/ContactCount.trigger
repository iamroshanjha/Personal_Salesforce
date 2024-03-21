trigger ContactCount on Contact (after insert, after delete, after update, after undelete) {
    /*
    Set<Id> accId = new Set<Id>();
    if(Trigger.IsInsert ||Trigger.IsUndelete)
    {
        for(Contact con : Trigger.New)
        {accId.add(con.AccountId);
         System.debug('con name '+con.Account.Name);}
    }
    else if(Trigger.IsUpdate){
        for(Contact con : Trigger.New)
        {
            if(Trigger.oldMap.get(con.Id).AccountId!=con.AccountId)
            {
                accId.add(con.AccountId);
                accId.add(Trigger.oldMap.get(con.Id).AccountId);
            }
            System.debug('con name '+con.Account.Name);
        }
    }
    else if(Trigger.IsDelete)
    {
        for(Contact con : Trigger.Old)
        {accId.add(con.AccountId);
         System.debug('con del name '+con.Account.Name);}
    }
    List<Account> lstAcc = [SELECT ID, NumberOfContact__c, (SELECT ID FROM Contacts) FROM Account WHERE ID IN :accId];
    for(Account acc : lstAcc)
    {
        Integer size = acc.Contacts.Size();
        acc.NumberOfContact__c = size;
    }
    Update lstAcc;
    */
    
    Set<Id> accountIds = new Set<Id>();
    
    
    if(Trigger.isInsert || Trigger.isUndelete)
    {
        for(Contact con : Trigger.new)
        {
            accountIds.add(con.accountId);
        }
    }
	
    if(Trigger.isUpdate)
    {
        for(Contact con : Trigger.new)
        {
            if(con.AccountId != Trigger.oldMap.get(con.Id).AccountId)
            {
                accountIds.add(con.accountId);
                accountIds.add(Trigger.oldMap.get(con.Id).AccountId);
            }
        }
    }
    
    /*
    if(Trigger.isInsert || Trigger.isUndelete || Trigger.isUpdate)
	{	
		for(Contact con : Trigger.new)
		{

			if(Trigger.isUpdate)
			{	
				if(con.AccountId != Trigger.OldMap.get(Con.id).AccountId)
				{
					accountIds.add(con.AccountId);
					accountIds.add(Trigger.OldMap.get(Con.id).AccountId);
				}
			}
			else
			{
				accountIds.add(con.AccountId);
			}
		}
	}
    */
    
    if(Trigger.isDelete)
    {
        for(Contact con : Trigger.old)
        {
            accountIds.add(con.accountId);
        }
    }
    
    
    
    List<AggregateResult> aggre = [SELECT count(ID), AccountId from Contact where AccountId IN :accountIds  group by AccountId];
    List<Account> lacc = new List<Account>();
    for(AggregateResult agg : aggre)
    {
        lacc.add(new Account(Id=(ID)agg.get('AccountId'), NumberOfContact__c = (Integer)agg.get('expr0')));
        
    }
    
    update lacc;
}