@isTest
public class EazzyMovieClassTest {
    @TestSetup
    static void TestSetup()
    {
        EazzyMovieApiKey__c eazzyApi = new EazzyMovieApiKey__c(Name='EazzyMovie',API_Key__c='1234567890');
        insert eazzyApi;
    }
	@isTest 
    static void getMovieListTest() 
    {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new EazzyMovieHttpCallOutMock());
        EazzyMovieResponse result = EazzyMovieClass.getMovieList('man');
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    } 
    
    @isTest 
    static void SubmitFeedbackTest() 
    {
        System.Test.startTest();
        Boolean result = EazzyMovieClass.SubmitFeedback('{"MovieName":"The Dark Avenger","Name":"roshanjha2095@gmail.com","Email":"roshanjha2095@gmail.com","Mobile":"1234567890","Date":"2021-09-03","Rating":"4","Feedback":"g","PartYouLiked":"g","Recommend":"true"}');
        System.assertEquals(true, result);  
       	System.Test.stopTest();
    } 
}