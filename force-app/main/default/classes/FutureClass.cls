public class FutureClass {
    @future
    public static void futuremethod(Set<Id> lsttoupdate)
    {
        System.Debug('infuture');
        List<Account> acc = [select id, AccountNumber from account where id in :lsttoupdate all rows];
                System.Debug('infutureacc '+acc);
		
        for(Account ac:acc)
            ac.AccountNumber='12345';
        update acc;
    }

}