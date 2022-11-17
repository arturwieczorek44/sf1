public with sharing class ContactTriggerUtility {
 



    public static void afterUpdate(List<Contact> newTrigger,List<Contact> oldTrigger){
        System.debug('ContactTriggerUtility main class reached');
        
        List<Account> allAccounts = [SELECT Id,Budget__c,Wallet__c,NumberOfBoughtCars__c FROM Account];
        List<Account> accountsForUpdate=ContactTriggerExpensesService.CheckingIsTheirExpensesChange(newTrigger,oldTrigger,allAccounts);
        accountsForUpdate.addAll(ContactTriggerProfitService.CheckingIsTheirProfitChange(newTrigger,oldTrigger,allAccounts));
        update accountsForUpdate;

    }
        public static void beforeInsert(List<Contact> contacts){
            ContactTriggerGenderCheckService.detectGender(contacts);
    
    
        }



}     
