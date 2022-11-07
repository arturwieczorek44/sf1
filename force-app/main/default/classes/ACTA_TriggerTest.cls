@isTest
public with sharing class ACTA_TriggerTest {
    @isTest
    public static void  ACTA_TriggerTest1() {
       //setup
       String gender  ='Male';
Account acct = new Account(Name='test');
insert acct;
Contact cct=[Select firstName, lastName, Gender__c FROM Contact WHERE AccountId=: acct.id];


System.assertEquals(gender, cct.Gender__c);
 }
}