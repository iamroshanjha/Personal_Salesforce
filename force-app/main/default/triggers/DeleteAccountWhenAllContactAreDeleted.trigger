trigger DeleteAccountWhenAllContactAreDeleted on Contact (after delete) {
    Set<Id> accounts = new Set<Id>();
    for(Contact con: Trigger.old)
        if(con.AccountId != null)
            accounts.add(con.AccountId);
    
    list<Account> acclist = [select Id,(Select id from contacts) name from Account where Id In: accounts];
    list<Account> acclistDel = new List<Account>();
        for(Account ac : acclist)
            if(ac.contacts.Size()==0)
                acclistDel.add(ac);
     delete acclistDel;
}