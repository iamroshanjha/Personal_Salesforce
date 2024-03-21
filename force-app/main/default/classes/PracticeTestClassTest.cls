@isTest
public class PracticeTestClassTest {
    @testsetup public static void setup(){
        Account acc =new Account(Name='Kumar',Fax='1234567890');
      	insert acc;
    }
    
    @isTest public static void mainTest(){
        Test.startTest();
        string data = PracticeTestClass.main();
        Test.stopTest();
        System.assertEquals('hyderabad', data);
    }
    @isTest public static void mainTest1(){
        Test.startTest();
        PracticeTestClass pct = new PracticeTestClass();
        string data = PracticeTestClass.main();
        Test.stopTest();
         System.assertEquals('hyderabad', data);
    }
    @isTest public static void dosTest1(){
        Account acc = [select id from Account limit 1];
        Test.startTest();
        
        //schedule
        SchedukleClass sc = new SchedukleClass();
        String schedmon5am = '0 00 05 ? * 2';
        System.schedule('Create Account', schedmon5am, sc);
        
        //synchronius 
        PracticeTestClass.dos();
        
        //future
        PracticeTestClass.dosomethinginfuture(acc.Id);
        
        //queable
        quebale qc = new quebale(acc);
        Id jobid = System.enqueueJob(qc);
        
        //batch
        batchclass bc = new batchclass('select id,name from account','Account','Name','KumarReddy');
        database.executeBatch(bc, 100);
        
        Test.stopTest();
        System.assertEquals('hyderabad', 'hyderabad');
    }
}