@isTest
public with sharing class CGWCC_TriggerTest {
    @isTest
    public static void CGWCC_TriggerTest1(){
       //setup
       String gender  = 'Male';
       Account acct = new Account(Name = 'test');
       insert acct;

       Contact cct = [Select firstName, lastName, Gender__c FROM Contact WHERE AccountId =: acct.id];

       System.assertEquals(gender, cct.Gender__c);
    }

    @isTest
    public static void CGWCC_TriggerTest2(){
        //setup
        String gender  = 'Female';
        Account acct = new Account(Name='testa');
        insert acct;
 
        Contact cct = [Select firstName, lastName, Gender__c FROM Contact WHERE AccountId =: acct.id];
 
        System.assertEquals(gender, cct.Gender__c);
     }
}
