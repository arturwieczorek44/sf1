@isTest
public with sharing class ACTA_TriggerTest {
    @isTest
    public static void  ACTA_TriggerTest1() {
       //setup
Account acct = new Account(Name='test');
insert acct;


System.assert(!acct.Contacts.isEmpty());
 }
}