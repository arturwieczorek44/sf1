@isTest
public with sharing class CGWCC_TriggerTest {
    @isTest
    public static void CGWCC_TriggerTest() {
        

        Contact cct = new Contact(FirstName='testName', LastName='testLastName');
 insert cct;
 

 System.assertEquals(cct.Gender__c,'male');

    }
}
