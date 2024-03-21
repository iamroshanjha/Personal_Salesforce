public  class TestClass {
    
    public static void main(){
        try{
            
            List<Account> lstAc = [select id,name from account];//integer a = 10/0;
            update lstAc;
            System.debug(Limits.getDmlRows());
            System.debug(Limits.getDmlRows());
           }
        catch(exception ex){}
        
        
    }
    
    public static void test()
    {
        List<TestData__c> td =[select id, name, description__c from TestData__c];
        system.debug(td);
    }

}