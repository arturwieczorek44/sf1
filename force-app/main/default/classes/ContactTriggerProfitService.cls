public with sharing class ContactTriggerProfitService {
    public static List<Account> CheckingIsTheirProfitChange(Map<ID, Contact> newTrigger,Map<ID, Contact> oldTrigger,Map<ID, Account> allAccounts){
        Map<ID, Contact>contactForNextStep=new Map<ID, Contact>();
        for(Contact contactNew:newTrigger.values()){
            if(contactNew.Profit__c!=oldTrigger.get(contactNew.id).Profit__c){
                System.debug('CheckingIsTheirExpensesChange if reached');
                contactForNextStep.put(contactNew.id, contactNew);   
        }
    }
   return preparingAccountsForUpdateAfterProfitChange(allAccounts, contactForNextStep);
}

 public static List<Account> preparingAccountsForUpdateAfterProfitChange(Map<ID, Account>allAccounts,Map<ID, Contact> contactForNextStep){
        System.debug('preparingAccountsForUpdate');
        List<Account> accountsForUpdate=new List<Account>();
        for(Contact contact:contactForNextStep.values()){
         
        
        }
        return accountsForUpdate;    
    }
}
