@isTest
private class CustomerTriggerTestClass
{
    static TestMethod void MyUnitTest()
    {
        //Create Object to test
        APEX_Customer__c custObject = new APEX_Customer__c();
        custObject.APEX_Customer_Status__c = 'Inactive';
        custObject.Name = 'Unit Test Customer';
        Insert custObject;
        
        //Start Testing 
        Test.StartTest();
        custObject.APEX_Customer_Status__c = 'Active';
        Update custObject;
        Test.StopTest();
        //Stop testing
        
        //Check the result or Assert
        List<APEX_Invoice__c> invObject = [select id, APEX_Customer__c from APEX_Invoice__c where APEX_Customer__c =:custObject.Id];
        System.AssertEquals(1,invObject.Size());
        
    }
    
    static TestMethod  void MyUnitTest1()
    {
        //Create Object to test
        APEX_Customer__c custObject = new APEX_Customer__c();
        custObject.APEX_Customer_Status__c = 'Inactive';
        custObject.Name = 'Unit Test Customer';
        Insert custObject;
        
        //Start Testing 
        Test.StartTest();
        custObject.APEX_Customer_Status__c = 'Pending';
        Update custObject;
        Test.StopTest();
        //Stop testing
        
        //Check the result or Assert
        List<APEX_Invoice__c> invObject = [select id, APEX_Customer__c from APEX_Invoice__c where APEX_Customer__c =:custObject.Id];
        System.AssertEquals(0,invObject.Size());
        
    }
}