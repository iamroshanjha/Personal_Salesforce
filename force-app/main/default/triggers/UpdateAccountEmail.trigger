trigger UpdateAccountEmail on Contact (after insert) {
    List<Account> lstAcc = new List<Account>();
    for(Contact cc : Trigger.New)
    	if(cc.Email != null)
           	lstAcc.add(new Account(Id=cc.AccountId, Site=cc.Email));
    update lstAcc;
}