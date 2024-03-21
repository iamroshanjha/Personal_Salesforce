public with sharing class submitTestData {
    @AuraEnabled
    public static String submitTestDataApex(String name, String description) {
        TestData__c newTestData = new TestData__c(Name=name, Description__c=description);
        insert newTestData;
        return newTestData.id;
    }


}