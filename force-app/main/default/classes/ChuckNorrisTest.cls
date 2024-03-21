@isTest
private class ChuckNorrisTest {
    @isTest static void getRandomJokesCallout1() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new ChuckNorrisHttpCallOutMock1());
        ChuckNorrisWrapper result = ChuckNorris.getRandomJokes();
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    }  
    @isTest static void getRandomJokesCallout2() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new ChuckNorrisHttpCallOutMock2());
        ChuckNorrisWrapper result = ChuckNorris.getRandomJokes();
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    }
    @isTest static void getRandomJokesCategoryWiseCallou1() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new ChuckNorrisHttpCallOutMock1());
        ChuckNorrisWrapper result = ChuckNorris.getRandomJokesCategoryWise('dev');
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    }  
    @isTest static void getRandomJokesCategoryWiseCallout2() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new ChuckNorrisHttpCallOutMock2());
        ChuckNorrisWrapper result = ChuckNorris.getRandomJokesCategoryWise('food');
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    }
    @isTest static void getJokesCategoriesCallout1() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new ChuckNorrisHttpCallOutMock3());
        ChuckNorrisWrapper result = ChuckNorris.getJokesCategories();
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    }  
    @isTest static void getJokesCategoriesCallout2() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new ChuckNorrisHttpCallOutMock4());
        ChuckNorrisWrapper result = ChuckNorris.getJokesCategories();
        System.assertNotEquals(null, result);  
       	System.Test.stopTest();
    }
}