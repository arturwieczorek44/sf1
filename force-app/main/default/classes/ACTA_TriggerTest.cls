@isTest
public with sharing class ACTA_TriggerTest {
    @isTest
    public static void  ACTA_TriggerTest1(){
        Account acct = new Account(Name='test');
  
        Contact cct=[Select firstName, lastName, Gender__c FROM Contact WHERE AccountId=:acct.id];

        System.assertEquals(cct.AccountId, acct.Id);
    }
}