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

    public static void  checkGender(List<Contact> contacts){

        For(Contact contact:contacts){

            if(checkLastChar(contact.FirstName)==true){
                contact.Gender__c='female';
            }else{
                contact.Gender__c='male';
                }
            System.Debug(contact.Gender__c);
        }
    }
    
        public static Boolean checkLastChar(String firstName){
            String toCheck = firstName;
            if(toCheck.substring(toCheck.length() - 1)=='a')
                {
                return true;
                }else{
                return false;
                }
        }



}     
