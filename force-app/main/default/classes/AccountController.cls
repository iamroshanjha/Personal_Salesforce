public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    List<Account> lstAccount = [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    return lstAccount;
  }
}