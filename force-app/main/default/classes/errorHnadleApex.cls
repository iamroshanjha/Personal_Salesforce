public class errorHnadleApex {
    public static boolean firsttime=false;
    public static void beforeInsert(List<Account> newAccounts)
    {
        for(Account acc : newAccounts)
        {
            if(acc.Fax==null)
            {
                acc.Fax.addError('Please Insert Fax for '+acc.Name);
            }
        }
    }
    
    public static void afterInsert(List<Account> newAccounts)
    {
        List<Contact> lstCon = new List<Contact>();
        for(Account acc : newAccounts)
        {
            Contact con = new Contact();
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            lstCon.add(con);
        }
        Insert lstCon;
        List<Database.SaveResult> lstResult = Database.Insert(lstCon,false);
        for(DataBase.SaveResult res :lstResult)
        {
            if(res.isSuccess())
            {
                String succesId = res.getId();
            }
            else
            {
                
            }
        }
        //Database.Insert(lstCon,false);
    }

}