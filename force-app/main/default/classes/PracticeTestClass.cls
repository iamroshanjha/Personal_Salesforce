public class PracticeTestClass {
    static string data;
    public PracticeTestClass()
    {
        data='kumar';
    }
    
    public static string main()
    {
        Account acc =new Account(Name='Kumar',Fax='1234567890');
      	insert acc;
        List<Account> lstAcc = [Select id from account];
        if(!lstAcc.isEmpty())
        {
            data='hyderabad';
            System.debug(data);
        }
        else{
            data='pune';
            System.debug(data);
        }
        
        //SchedukleClass sc = new SchedukleClass();
        //String schedmon5am = '0 00 05 ? * 2';
        //System.schedule('Create Account', schedmon5am, sc);
        return data;
    }
    @testvisible
    private static void dos()
    {
        //Account acc =new Account(Name='Kumar',Fax='1234567890');
      	///insert acc;
        data ='do';
        //quebale qc = new quebale(acc);
        //Id jobid = System.enqueueJob(qc);
        //batchclass bc = new batchclass('select id,name from account','Account','Name','KumarReddy');
        //database.executeBatch(bc, 100);
    }
    
    //furture
    @future
    public static void dosomethinginfuture(Id ids)
    {
        Account acc = [select id from Account where id =:ids];
        data ='do';
    }
    
}