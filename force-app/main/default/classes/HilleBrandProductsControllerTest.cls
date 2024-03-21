@isTest
public class HilleBrandProductsControllerTest {
    /*
 	@testsetup
    static void setupMethod(){
        Products__c products = new Products__c(Name='Food', Description__c='Food for eating', Price__c=200, Active__c=true);
        insert products;
    }
    @isTest
    public static void getProductsHappyScenario()
    {
        test.startTest();
        List<List<String>> reponseData = HilleBrandProductsController.getProducts('Products__c', 'Table');
        test.stopTest();
        system.assert(!reponseData.isEmpty());
    }
    @isTest
    public static void getProductsNoFieldsetScenario()
    {
        test.startTest();
        List<List<String>> reponseData = HilleBrandProductsController.getProducts('Products__c', '');
        test.stopTest();
        system.assert(reponseData.isEmpty());
    }
    @isTest
    public static void getProductsNoRecordsScenario()
    {
        List<Products__c> products=[SELECT Id, Active__c, Description__c, Price__c, Name FROM Products__c];
        if(!products.isEmpty())
            Database.Delete(products);
        test.startTest();
        List<List<String>> reponseData = HilleBrandProductsController.getProducts('Products__c', 'Table');
        test.stopTest();
        system.assert(reponseData.isEmpty());
    }
    */
    
    
    @isTest (seealldata=true)
    public static void getDataTest()
    {
        test.startTest();
        User u = [select id from user where Name ='Sales Person' LIMIT 1];
        List<Account_Salary__c> data2;
        List<Account_Salary__c> data;
        
        List<TestData__c> data3;
        List<TestData__c> data4;
        system.runAs(u)
        {
            //system.debug('1 '+FeatureManagement.checkPermission('datacheck'));
            data2 =[SELECT Id, Max_Salary__c, Total_Salary__c, Salary__c, Account__c, Name 
			FROM Account_Salary__c];
            data2[0].salary__c =400;
            update data2;
             //system.debug(data2);
            
            
            data3 =[SELECT Id, Description__c, Name 
			FROM TestData__c];
            system.debug(data3);
        }
        data =[SELECT Id, Max_Salary__c, Total_Salary__c, Salary__c, Account__c, Name 
			FROM Account_Salary__c];
        
        data[0].salary__c =500;
            update data;
        
        
         data4 =[SELECT Id, Description__c, Name 
			FROM TestData__c];
        
        system.debug(data4);
                         //system.debug('2 '+FeatureManagement.checkPermission('datacheck'));
                                            
                                            //system.debug(data);
                                           
        
        test.stopTest();
        
    }
}