public with sharing class ContactTriggerUtility {
 



    public static void updateAccountWhenContactChanged(Map<ID, Contact> newTrigger, Map<ID, Contact> oldTrigger){
        System.debug('ContactTriggerUtility main class reached');
      Set<Id> accountIds = new Set<Id>();
            for(Contact contact: newTrigger.values()){
                accountIds.add(contact.AccountId);
             }

        
             Map<Id, Account> accountsMap = new Map<Id,Account>([SELECT Id FROM account  WHERE Id IN: accountIds]);
             //Map<Id, Account> accountsMap = new Map<Id,Account>([select id from account where ...]);

        List<Account> accountsForUpdate=ContactTriggerExpensesService.CheckingIsTheirExpensesChange(newTrigger,oldTrigger,accountsMap);
       // accountsForUpdate.addAll(ContactTriggerProfitService.CheckingIsTheirProfitChange(newTrigger,oldTrigger,accountsMap));
        update accountsForUpdate;
    }

        public static void CheckGender(List<Contact> contacts){
            ContactTriggerGenderCheckService.detectGender(contacts);
        }



}     
