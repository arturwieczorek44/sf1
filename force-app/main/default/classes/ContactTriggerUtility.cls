public with sharing class ContactTriggerUtility {
 



    public static void afterUpdate(List<Contact> newTrigger, Map<ID, Contact> oldTrigger){
        System.debug('ContactTriggerUtility main class reached');
        List<Account> allAccounts = [SELECT Id,Budget__c,Wallet__c,NumberOfBoughtCars__c FROM Account];
        Map<ID, Account> allAccountsMap = new Map<ID, Account>();

        for(Account account:allAccounts){
                allAccountsMap.put(account.id, account);
            }
            
        List<Account> accountsForUpdate=ContactTriggerExpensesService.CheckingIsTheirExpensesChange(newTrigger,oldTrigger,allAccountsMap);
        accountsForUpdate.addAll(ContactTriggerProfitService.CheckingIsTheirProfitChange(newTrigger,oldTrigger,allAccountsMap));
        update accountsForUpdate;
    }

        public static void beforeInsert(List<Contact> contacts){
            ContactTriggerGenderCheckService.detectGender(contacts);
        }



}     
